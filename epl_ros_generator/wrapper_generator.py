import glob
import os
import re
import shutil
import stat
from os.path import exists, abspath, basename, dirname

import simplejson as simplejson
from pycparser import c_parser

from globals import create_directories, output_directories, fill_header


class WrapperGenerator:
    def __init__(self, launch_args):
        self.xap_path = launch_args.xap_path
        self.ros_mapping_path = launch_args.ros_mapping_path
        self.node_mapping_path = launch_args.node_mapping_path
        self.generate_cn = launch_args.generate_cn

        create_directories()

        if self.generate_cn:
            if not exists(self.node_mapping_path):
                print("CN mapping file not found: {}".format(self.node_mapping_path))
                exit(1)
            with open(self.node_mapping_path, 'r') as node_mapping_file:
                self.mapping = simplejson.load(node_mapping_file)
            self.generate_xap()
            exit(0)

        if not exists(self.ros_mapping_path):
            self.mapping = {
                'ros_project': 'epl_wrapper',
                'xap_path': abspath(self.xap_path),
                'epl_launcher': 'PATH_TO_EPL_LAUNCHER',
                'in': [],
                'out': []
            }
            self.generate_ros_mapping()
            print("Done!")
        else:
            print("Reading existing mapping file: {}".format(self.ros_mapping_path))
            with open(self.ros_mapping_path, 'r') as ros_mapping_file:
                self.mapping = simplejson.load(ros_mapping_file)
            print("Generating messages... ", end='')
            self.generate_msg_file('in')
            self.generate_msg_file('out')
            print("Done!")
            print("Generating structure header... ", end='')
            self.create_struct_header_file('in')
            self.create_struct_header_file('out')
            print("Done!")
            print("Generating ROS include files for {}...".format(self.mapping['ros_project']))
            self.generate_ros_files()
            # self.generate_mn_mapping()
            self.generate_project()

    def generate_ros_mapping(self):
        if not exists(self.xap_path):
            print("Input file not found: {}".format(abspath(self.xap_path)))
            exit(1)
        with open(self.xap_path, 'r') as f:
            xap_lines = f.readlines()[4:-2]

        for line in xap_lines:
            if line.startswith('# define COMPUTED'):
                size = int(line.split(' ')[-1])
                if '_IN_' in line:
                    self.mapping['in_size'] = size
                else:
                    self.mapping['out_size'] = size
        cleaned_text = ''.join([line for line in xap_lines if not line.startswith('#')])
        parser = c_parser.CParser()
        ast = parser.parse(cleaned_text, filename='<none>')

        for item in ast.ext:
            print("Found structure typedef: {}".format(item.name))
            structure_type = None
            if 'IN' in item.name:
                structure_type = 'in'
            if 'OUT' in item.name:
                structure_type = 'out'
            if not structure_type:
                print("Structure type is unknown, ignoring")
                continue

            fields = [x[1] for x in item.children()[0][1].children()[0][1].children()]
            for field in fields:
                field_name = field.name
                if 'PADDING_VAR' in field_name or 'Unused' in field_name:
                    continue
                field_attributes = field.children()[0][1].type.names
                field_type = field.children()[1][1].type
                field_size = int(field.children()[1][1].value)

                self.mapping[structure_type].append({
                    'name': field_name,
                    'alias': field_name,
                    'size': field_size,
                    'type': field_type,
                    'attributes': field_attributes,
                    'messages': ['PowerlinkIn' if structure_type == 'in' else 'PowerlinkOut']
                })

        with open(self.ros_mapping_path, 'w') as ros_mapping_file:
            ros_mapping_file.write(simplejson.dumps(self.mapping, indent=2))

    @staticmethod
    def create_type_template(var):
        type_template = ''
        if var['size'] == 1:
            type_template = 'bool'
            return type_template
        if 'unsigned' in var['attributes']:
            type_template = 'u'
        type_template += var['type']
        sizes = [8, 16, 32]
        size_fit = False
        for size in sizes:
            if size >= var['size']:
                type_template += str(size)
                size_fit = True
                break
        if not size_fit:
            print("Variable size is out of allowed range: {}".format(var))
            exit(1)
        return type_template

    @staticmethod
    def generate_msg_header(message_path):
        with open(message_path, 'w') as message_file:
            message_file.write('# Generated with epl_ros_generator.py\n')
            message_file.write('\n')
            message_file.write('# openPOWERLINK variables:\n')
            message_file.write('string shm_name\n')
            message_file.write('uint16 pid\n')
            message_file.write('\n')
            message_file.write('# xap.h variables:\n')

    def generate_msg_file(self, group):
        created_messages = []
        for var in self.mapping[group]:
            for message in var['messages']:
                message_path = '{}/{}.msg'.format(output_directories['messages'], message)
                if message not in created_messages:
                    self.generate_msg_header(message_path)
                created_messages.append(message)
                with open(message_path, 'a') as message_file:
                    type_template = self.create_type_template(var)
                    message_file.write('{} {}\n'.format(type_template, var['name']))

    @staticmethod
    def to_underscore(name):
        tmp = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', tmp).upper()

    def generate_xap(self):
        with open('templates/xap.h.template', 'r') as header_template_file:
            header_template = header_template_file.read()

        input_vars = []
        for var in self.mapping['in']:
            var_line = ('\t{} {}:{};'.format(
                ' '.join(var['attributes']), var['alias'], var['size'])
            )
            input_vars.append(var_line)
        header_template = header_template.replace('$PI_IN_FIELDS', '\n'.join(input_vars))

        output_vars = []
        for var in self.mapping['out']:
            var_line = ('\t{} {}:{};'.format(
                ' '.join(var['attributes']), var['alias'], var['size'])
            )
            output_vars.append(var_line)
        header_template = header_template.replace('$PI_OUT_FIELDS', '\n'.join(output_vars))

        with open(self.mapping['xap_path'], 'w') as header_file:
            header_file.write(header_template)
        print("xap.h file generated")

    def create_struct_header_file(self, group):
        created_headers = []
        for var in self.mapping[group]:
            for message in var['messages']:
                header_path = '{}/{}Struct.h'.format(output_directories['headers'], message)
                if message in created_headers:
                    continue
                created_headers.append(message)
                with open(header_path, 'w') as header_file:
                    header_file.write('// Generated with epl_ros_generator.py\n')
                    header_file.write('\n')
                    header_guard = self.to_underscore(message)
                    header_file.write('#ifndef {}_H\n'.format(header_guard))
                    header_file.write('#define {}_H\n'.format(header_guard))
                    header_file.write('\n')
                    header_file.write('typedef struct {}\n'.format(header_guard))
                    header_file.write('{\n')
                    header_file.write('\tint pid;\n')
                    header_file.write("$HEADER_BODY\n")
                    header_file.write('}} {};\n'.format(header_guard))
                    header_file.write('\n')
                    header_file.write('#endif\n')
        for var in self.mapping[group]:
            for message in var['messages']:
                header_path = '{}/{}Struct.h'.format(output_directories['headers'], message)
                with open(header_path, 'r') as header_file:
                    header_template = header_file.read()
                var_line = ('\t{} {} {}:{};\n'.format(
                    ' '.join(var['attributes']), var['type'], var['name'], var['size'])
                )
                var_line += '$HEADER_BODY\n'
                header_template = header_template.replace('$HEADER_BODY\n', var_line)
                with open(header_path, 'w') as header_file:
                    header_file.write(header_template)
        for var in self.mapping[group]:
            for message in var['messages']:
                header_path = '{}/{}Struct.h'.format(output_directories['headers'], message)
                with open(header_path, 'r') as header_file:
                    header_template = header_file.read()
                header_template = header_template.replace('$HEADER_BODY\n', '')
                with open(header_path, 'w') as header_file:
                    header_file.write(header_template)

    def generate_ros_header(self):
        with open('templates/ros.h.template', 'r') as header_template_file:
            header_template = header_template_file.read()

        messages = self.get_messages()

        header_template = header_template.replace('$INCLUDE_FILES', self.generate_ros_include(messages))
        header_template = header_template.replace('$ROS_STRUCTS', self.generate_ros_struct_declaration(messages))
        header_template = header_template.replace('$ROS_EXCHANGE_FUNC',
                                                  self.generate_ros_exchange_declaration(messages))

        header_template = header_template.replace('$ROS_PROJECT', self.mapping['ros_project'])

        with open('{}/generated_wrapper.h'.format(output_directories['headers']), 'w') as header_file:
            header_file.write(header_template)

    def get_messages(self):
        messages = []
        for var in self.mapping['in'] + self.mapping['out']:
            for message in var['messages']:
                if message not in messages:
                    messages.append(message)
        return messages

    def generate_ros_exchange_declaration(self, messages):
        ros_exchange_code = []
        for message in messages:
            underscored = self.to_underscore(message)
            if self.find_message_type(message) == 'in':
                ros_exchange_code.append('void set_{}({}::{} msg);'.format(
                    underscored.lower(), self.mapping['ros_project'], message
                ))
                ros_exchange_code.append('void set_{}_struct({} *msg);'.format(
                    underscored.lower(), underscored
                ))
            else:
                ros_exchange_code.append('void get_{}({}::{} *msg);'.format(
                    underscored.lower(), self.mapping['ros_project'], message
                ))
                ros_exchange_code.append('void get_{}_struct({} *data);'.format(
                    underscored.lower(), underscored
                ))
        return '\n'.join(ros_exchange_code)

    def generate_ros_struct_declaration(self, messages):
        structs_declaration = []
        for message in messages:
            c_message = self.to_underscore(message)
            structs_declaration.append('extern IPC_DATA<{}> {};'.format(c_message, c_message.lower()))
        return '\n'.join(structs_declaration)

    def generate_ros_include(self, messages):
        include_files = []
        for message in messages:
            include_files.append('#include <{}/{}.h>'.format(self.mapping['ros_project'], message))
            include_files.append('#include <{}/{}Struct.h>'.format(self.mapping['ros_project'], message))
        return '\n'.join(include_files)

    def generate_ros_cpp(self):
        with open('templates/ros.cpp.template', 'r') as cpp_template_file:
            cpp_template = cpp_template_file.read()

        messages = self.get_messages()

        cpp_template = cpp_template.replace('$ROS_STRUCTS', self.generate_ros_struct(messages))
        cpp_template = cpp_template.replace('$INIT_ROS_CODE', self.generate_ros_init(messages))
        cpp_template = cpp_template.replace('$ROS_UNLINK_CODE', self.generate_ros_unlink(messages))
        cpp_template = cpp_template.replace('$ROS_EXCHANGE_CODE', self.generate_ros_msg_exchange(messages))
        cpp_template = cpp_template.replace('$ROS_PROJECT', self.mapping['ros_project'])

        with open('{}/generated_wrapper.cpp'.format(output_directories['sources']), 'w') as cpp_file:
            cpp_file.write(cpp_template)

    def generate_ros_struct(self, messages):
        structs_declaration = []
        for message in messages:
            c_message = self.to_underscore(message)
            structs_declaration.append('IPC_DATA<{}> {};'.format(c_message, c_message.lower()))
        return '\n'.join(structs_declaration)

    def generate_ros_unlink(self, messages):
        ros_unlink_code = []
        for message in messages:
            underscored = self.to_underscore(message)
            ros_unlink_code.append('    munmap({0}.address, {0}.length * 2);'.format(underscored.lower()))
            ros_unlink_code.append('    shm_unlink({}.shm_name.c_str());'.format(underscored.lower()))
        ros_unlink_code.append('    ROS_INFO("Shared memory unlinking: OK");')
        return '\n'.join(ros_unlink_code)

    def generate_ros_init(self, messages):
        ros_init_code = []
        for message in messages:
            underscored = self.to_underscore(message)
            ros_init_code.append('    {0}.shm_name = "{0}";'.format(underscored.lower()))
            ros_init_code.append('    {0}.address = init_shared_memory({0}.shm_name.c_str(), {0}.length);'.format(
                underscored.lower())
            )
            ros_init_code.append('    if (map_shared_memory<{}>(&{}, pid))'.format(underscored, underscored.lower()))
            ros_init_code.append('    {')
            ros_init_code.append('        return 1;')
            ros_init_code.append('    }')
        ros_init_code.append('    return 0;')
        return '\n'.join(ros_init_code)

    def generate_ros_msg_exchange(self, messages):
        ros_exchange_code = []
        for message in messages:
            underscored = self.to_underscore(message)
            message_vars = self.find_variables(message)
            if self.find_message_type(message) == 'in':
                ros_exchange_code.append('void set_{}({}::{} msg)'.format(
                    underscored.lower(), self.mapping['ros_project'], message
                ))
                ros_exchange_code.append('{')
                for var in message_vars:
                    ros_exchange_code.append('    oplk_pi_in->{0} = msg.{0};'.format(var['name']))
                ros_exchange_code.append('}\n')

                ros_exchange_code.append('void set_{}_struct({} *data)'.format(
                    underscored.lower(), underscored
                ))
                ros_exchange_code.append('{')
                for var in message_vars:
                    ros_exchange_code.append('    oplk_pi_in->{0} = data->{0};'.format(var['name']))
                ros_exchange_code.append('}\n')
            else:
                ros_exchange_code.append('void get_{}({}::{} *msg)'.format(
                    underscored.lower(), self.mapping['ros_project'], message
                ))
                ros_exchange_code.append('{')
                for var in message_vars:
                    ros_exchange_code.append('    msg->{0} = oplk_pi_out->{0};'.format(var['name']))
                ros_exchange_code.append('}\n')

                ros_exchange_code.append('void get_{}_struct({} *data)'.format(
                    underscored.lower(), underscored
                ))
                ros_exchange_code.append('{')
                for var in message_vars:
                    ros_exchange_code.append('    data->{0} = oplk_pi_out->{0};'.format(var['name']))
                ros_exchange_code.append('}\n')
        return '\n'.join(ros_exchange_code)

    def generate_ros_files(self):
        self.generate_ros_header()
        self.generate_ros_cpp()

    def find_variables(self, message):
        found_vars = []
        for var in self.mapping['in']:
            if message in var['messages']:
                found_vars.append(var)
        for var in self.mapping['out']:
            if message in var['messages']:
                found_vars.append(var)
        return found_vars

    def find_message_type(self, message):
        for var in self.mapping['in']:
            if message in var['messages']:
                return 'in'
        for var in self.mapping['out']:
            if message in var['messages']:
                return 'out'

    def generate_mn_mapping(self):
        with open('{}/mn.map'.format(output_directories['mappings']), 'w') as mn_mapping_file:
            mn_mapping_file.write("--MN_MAPPING--\n")
            mn_mapping_file.write("{} {}\n".format(self.mapping['in_size'], self.mapping['out_size']))
        print('MN mapping generated')

    def generate_project(self):
        self.copy_project_files()
        self.generate_cmake()
        self.generate_package()
        self.generate_wrapper_cpp()
        self.generate_epl_script()

    def copy_project_files(self):
        shutil.copytree('templates/epl_wrapper', output_directories['wrapper'])
        shutil.copy(self.xap_path, '{}/include/epl_wrapper/xap.h'.format(output_directories['wrapper']))
        for file in glob.glob('{}/*.h'.format(output_directories['headers'])):
            shutil.copy(file, '{}/include/epl_wrapper/'.format(output_directories['wrapper']))
        for file in glob.glob('{}/*.cpp'.format(output_directories['sources'])):
            shutil.copy(file, '{}/src/'.format(output_directories['wrapper']))
        for file in glob.glob('{}/*.msg'.format(output_directories['messages'])):
            shutil.copy(file, '{}/msg/'.format(output_directories['wrapper']))
        os.remove('{}/msg/.dummy'.format(output_directories['wrapper']))

    def generate_cmake(self):
        with open('{}/CMakeLists.txt'.format(output_directories['wrapper']), 'r') as cmake_file:
            cmake_template = cmake_file.read()
        messages_files = ['    {}.msg'.format(x) for x in self.get_messages()]
        cmake_template = cmake_template.replace('$MESSAGES', '\n'.join(messages_files))

        service_files = ['    {}'.format(basename(x)) for x in
                         glob.glob('{}/srv/*.srv'.format(output_directories['wrapper']))]
        cmake_template = cmake_template.replace('$SERVICES', '\n'.join(service_files))

        cmake_template = fill_header(cmake_template)

        with open('{}/CMakeLists.txt'.format(output_directories['wrapper']), 'w') as cmake_file:
            cmake_file.write(cmake_template)

    @staticmethod
    def generate_package():
        with open('{}/package.xml'.format(output_directories['wrapper']), 'r') as package_file:
            package_template = package_file.read()
        package_template = fill_header(package_template)
        with open('{}/package.xml'.format(output_directories['wrapper']), 'w') as package_file:
            package_file.write(package_template)

    def generate_wrapper_cpp(self):
        with open('{}/src/wrapper.cpp'.format(output_directories['wrapper']), 'r') as wrapper_file:
            cpp_template = wrapper_file.read()

        messages = self.get_messages()

        cpp_template = cpp_template.replace('$MESSAGES_CALLBACKS_DECLARATIONS',
                                            self.generate_messages_callbacks_declarations(messages))
        cpp_template = cpp_template.replace('$MESSAGES_CALLBACKS', self.generate_messages_callbacks(messages))
        cpp_template = cpp_template.replace('$PUBLISHERS', self.generate_publishers(messages))
        cpp_template = cpp_template.replace('$SUBSCRIBERS', self.generate_subscribers(messages))
        cpp_template = cpp_template.replace('$MESSAGES', self.generate_wrapper_messages(messages))
        cpp_template = cpp_template.replace('$ROS_LOOP', self.generate_ros_loop(messages))
        cpp_template = cpp_template.replace('$TICK_A', self.generate_tick(messages, 'a'))
        cpp_template = cpp_template.replace('$TICK_B', self.generate_tick(messages, 'b'))

        with open('{}/src/wrapper.cpp'.format(output_directories['wrapper']), 'w') as wrapper_file:
            wrapper_file.write(cpp_template)

    def generate_messages_callbacks_declarations(self, messages):
        declarations = []
        for message in messages:
            if self.find_message_type(message) == 'out':
                continue
            declarations.append('void {}_callback(const epl_wrapper::{}::ConstPtr& msg);'.format(
                self.to_underscore(message).lower(),
                message
            ))
        return '\n'.join(declarations)

    def generate_messages_callbacks(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'out':
                continue
            line = []
            line.append('void {}_callback(const epl_wrapper::{}::ConstPtr& msg)'.format(
                self.to_underscore(message).lower(),
                message
            ))
            line.append('{')
            line.append('    set_{}(*msg);'.format(self.to_underscore(message).lower()))
            line.append('}')
            line.append('')
            lines.append('\n'.join(line))
        return '\n'.join(lines)

    def generate_publishers(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            line = '    ros::Publisher {}_pub = node.advertise<epl_wrapper::{}>("{}", 1);'
            lines.append(line.format(self.to_underscore(message).lower(), message, message))
        return '\n'.join(lines)

    def generate_wrapper_messages(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            line = '\n'.join([
                '    epl_wrapper::{0} {1}_msg;',
                '    {1}_msg.pid = pid;',
                '    {1}_msg.shm_name = {1}.shm_name;',
                ''
            ]).format(message, self.to_underscore(message).lower())
            lines.append(line)
        return '\n'.join(lines)

    def generate_ros_loop(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            lines.append('        get_{0}(&{0}_msg);'.format(self.to_underscore(message).lower()))
        lines.append('')
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            lines.append('        {0}_pub.publish({0}_msg);'.format(self.to_underscore(message).lower()))
        lines.append('')
        return '\n'.join(lines)

    def generate_tick(self, messages, tick):
        reverse_tick = 'b' if tick == 'a' else 'a'
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            lines.append('        get_{0}_struct({0}.buffer_{1});'.format(self.to_underscore(message).lower(), tick))
        for message in messages:
            if self.find_message_type(message) == 'out':
                continue
            lines.append('        set_{0}_struct({0}.buffer_{1});'.format(
                self.to_underscore(message).lower(), reverse_tick))
        return '\n'.join(lines)

    def generate_epl_script(self):
        epl_dir = dirname(self.mapping['epl_launcher'])
        epl_file = basename(self.mapping['epl_launcher'])
        script = '\n'.join([
            '#!/usr/bin/env bash',
            'sleep 1',
            'cd {}',
            'sudo ./{}'
        ]).format(epl_dir, epl_file)
        script_path = '{}/epl_launch.sh'.format(output_directories['wrapper'])
        with open(script_path, 'w') as script_file:
            script_file.write(script)
        st = os.stat(script_path)
        os.chmod(script_path, st.st_mode | stat.S_IEXEC)

    def generate_subscribers(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'out':
                continue
            line = '    ros::Subscriber {0}_sub = node.subscribe("{1}", 1, {0}_callback);'
            lines.append(line.format(self.to_underscore(message).lower(), message))
        return '\n'.join(lines)
