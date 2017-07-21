import glob
import re
import shutil
from os.path import exists, basename

import simplejson as simplejson

from globals import output_directories, fill_header, output_root


class ProjectGenerator:
    def __init__(self, launch_args):
        self.project_config_path = launch_args.project_config_path
        self.ros_mapping_path = launch_args.ros_mapping_path

        if not exists(self.ros_mapping_path):
            print("ROS mapping not found: {}".format(self.ros_mapping_path))
            exit(1)

        with open(self.ros_mapping_path, 'r') as ros_mapping_file:
            self.mapping = simplejson.load(ros_mapping_file)

        if not exists(self.project_config_path):
            self.project_config = {
                'ros_project': 'ROS_PROJECT',
                'exec_name': 'EXEC_NAME',
                'in': [],
                'out': [],
                'transport': 'shm',
                'time_scale': 1
            }
            self.generate_project_config()
            print("Done!")
        else:
            print("Reading project config file: {}".format(self.project_config_path))
            with open(self.project_config_path, 'r') as project_config_file:
                self.project_config = simplejson.load(project_config_file)
            self.ros_project = self.project_config['ros_project']
            self.project_root = '{}/{}'.format(output_root, self.ros_project)
            self.generate_project()
            if self.project_config['transport'] == 'shm':
                self.generate_project_shm()
                exit(0)
            if self.project_config['transport'] == 'ros':
                self.generate_project_ros()
                exit(0)
            print("Project transport is invalid: {}".format(self.project_config['transport']))
            exit(1)

    def get_messages(self):
        return self.project_config['in'] + self.project_config['out']

    def get_all_messages(self):
        messages = []
        for var in self.mapping['in'] + self.mapping['out']:
            for message in var['messages']:
                if message not in messages:
                    messages.append(message)
        return messages

    def find_message_type(self, message):
        for var in self.mapping['in']:
            if message in var['messages']:
                return 'in'
        for var in self.mapping['out']:
            if message in var['messages']:
                return 'out'

    def generate_project(self):
        self.copy_project_files()
        self.generate_cmake()
        self.generate_package()
        self.fill_vars()

    def generate_project_shm(self):
        self.generate_header_shm()
        self.generate_cpp_shm()
        print("Done!")

    def copy_project_files(self):
        shutil.copytree('templates/project_{}'.format(self.project_config['transport']), self.project_root)

        shutil.move('{}/include/project'.format(self.project_root),
                    '{}/include/{}'.format(self.project_root, self.ros_project))
        shutil.move('{}/src/runner.cpp'.format(self.project_root),
                    '{}/src/{}.cpp'.format(self.project_root, self.project_config['exec_name']))
        shutil.move('{}/include/{}/runner.h'.format(self.project_root, self.ros_project),
                    '{}/include/{}/{}.h'.format(self.project_root, self.ros_project, self.project_config['exec_name']))

        if self.project_config['transport'] == 'ros':
            return

        shutil.copy(self.mapping['xap_path'],
                    '{}/include/{}/xap.h'.format(self.project_root, self.ros_project))

        for file in glob.glob('{}/*.h'.format(output_directories['headers'])):
            shutil.copy(file, '{}/include/{}/'.format(self.project_root, self.ros_project))
        for file in glob.glob('{}/*.cpp'.format(output_directories['sources'])):
            shutil.copy(file, '{}/src/'.format(self.project_root))

        header_path = '{}/include/{}/generated_wrapper.h'.format(self.project_root, self.ros_project)
        with open(header_path, 'r') as header_file:
            header = header_file.read()
        header = header.replace('epl_wrapper', self.ros_project)
        for message in self.get_all_messages():
            header = header.replace('{}/{}.h'.format(self.ros_project, message), 'epl_wrapper/{}.h'.format(message))
            header = header.replace('{}::{}'.format(self.ros_project, message), 'epl_wrapper::{}'.format(message))
        with open(header_path, 'w') as header_file:
            header_file.write(header)

        cpp_path = '{}/src/generated_wrapper.cpp'.format(self.project_root)
        with open(cpp_path, 'r') as cpp_file:
            cpp = cpp_file.read()
        cpp = cpp.replace('epl_wrapper', self.ros_project)
        for message in self.get_all_messages():
            cpp = cpp.replace('{}::{}'.format(self.ros_project, message), 'epl_wrapper::{}'.format(message))
        with open(cpp_path, 'w') as cpp_file:
            cpp_file.write(cpp)

    def generate_cmake(self):
        with open('{}/CMakeLists.txt'.format(self.project_root), 'r') as cmake_file:
            cmake_template = cmake_file.read()

        messages_files = ['    {}.msg'.format(x) for x in self.get_messages()]
        cmake_template = cmake_template.replace('$MESSAGES', '\n'.join(messages_files))

        service_files = ['    {}'.format(basename(x)) for x in
                         glob.glob('{}/srv/*.srv'.format(self.project_root))]
        cmake_template = cmake_template.replace('$SERVICES', '\n'.join(service_files))

        cmake_template = cmake_template.replace('$ROS_PROJECT', self.ros_project)
        cmake_template = cmake_template.replace('$EXEC_NAME', self.project_config['exec_name'])
        cmake_template = fill_header(cmake_template)

        with open('{}/CMakeLists.txt'.format(self.project_root), 'w') as cmake_file:
            cmake_file.write(cmake_template)

    def generate_package(self):
        with open('{}/package.xml'.format(self.project_root), 'r') as package_file:
            package_template = package_file.read()
        package_template = package_template.replace('$ROS_PROJECT', self.ros_project)
        package_template = fill_header(package_template)
        with open('{}/package.xml'.format(self.project_root), 'w') as package_file:
            package_file.write(package_template)

    def generate_project_config(self):
        messages = self.get_all_messages()
        self.project_config['in'] = [x for x in messages if self.find_message_type(x) == 'in']
        self.project_config['out'] = [x for x in messages if self.find_message_type(x) == 'out']
        with open(self.project_config_path, 'w') as project_config_file:
            project_config_file.write(simplejson.dumps(self.project_config, indent=2))

    def fill_vars(self):
        for file in glob.glob('{}/src/*.cpp'.format(self.project_root)):
            with open(file, 'r') as f:
                content = f.read()
            content = fill_header(content)
            content = content.replace('$ROS_PROJECT', self.ros_project)
            content = content.replace('$EXEC_NAME', self.project_config['exec_name'])
            with open(file, 'w') as f:
                f.write(content)
        for file in glob.glob('{}/include/{}/*.h'.format(self.project_root, self.ros_project)):
            with open(file, 'r') as f:
                content = f.read()
            content = fill_header(content)
            content = content.replace('$ROS_PROJECT', self.ros_project)
            content = content.replace('$EXEC_NAME', self.project_config['exec_name'])
            with open(file, 'w') as f:
                f.write(content)

    @staticmethod
    def to_underscore(name):
        tmp = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', tmp).upper()

    def generate_header_shm(self):
        header_path = '{}/include/{}/{}.h'.format(self.project_root, self.ros_project, self.project_config['exec_name'])
        with open(header_path, 'r') as header_file:
            header = header_file.read()

        messages = self.get_messages()

        header = header.replace('$STRUCTS_INCLUDE', self.generate_structs_include(messages))
        header = header.replace('$USER_VARS_EXTERN', self.generate_user_vars_extern(messages))

        with open(header_path, 'w') as header_file:
            header_file.write(header)

    def generate_cpp_shm(self):
        cpp_path = '{}/src/{}.cpp'.format(self.project_root, self.project_config['exec_name'])
        with open(cpp_path, 'r') as cpp_file:
            cpp = cpp_file.read()

        messages = self.get_messages()

        cpp = cpp.replace('$USER_VARS', self.generate_user_vars(messages))
        cpp = cpp.replace('$TICK_A', self.generate_tick(messages, 'a'))
        cpp = cpp.replace('$TICK_B', self.generate_tick(messages, 'b'))

        with open(cpp_path, 'w') as cpp_file:
            cpp_file.write(cpp)

    def generate_user_vars_extern(self, messages):
        lines = []
        for message in messages:
            lines.append('extern {} {}_var;'.format(self.to_underscore(message), self.to_underscore(message).lower()))
        return '\n'.join(lines)

    def generate_user_vars(self, messages):
        lines = []
        for message in messages:
            lines.append('{} {}_var;'.format(self.to_underscore(message), self.to_underscore(message).lower()))
        return '\n'.join(lines)

    def generate_tick(self, messages, tick):
        lines = []
        reverse_tick = 'b' if tick == 'a' else 'a'
        for message in messages:
            if self.find_message_type(message) == 'out':
                continue
            line = '        memcpy({0}.buffer_{1}, &{0}_var, {0}.length);'
            lines.append(line.format(self.to_underscore(message).lower(), tick))
        lines.append('')
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            line = '        memcpy(&{0}_var, {0}.buffer_{1}, {0}.length);'
            lines.append(line.format(self.to_underscore(message).lower(), reverse_tick))
        return '\n'.join(lines)

    def generate_structs_include(self, messages):
        lines = []
        for message in messages:
            lines.append('#include <{}/{}Struct.h>'.format(self.ros_project, message))
        return '\n'.join(lines)

    """
        def generate_xap(self):
        with open('templates/xap.h.template', 'r') as header_template_file:
            header_template = header_template_file.read()

        input_vars = []
        for var in self.mapping['in']:
            var_line = ('\t{} {} {}:{};'.format(
                ' '.join(var['attributes']), var['type'], var['alias'], var['size'])
            )
            input_vars.append(var_line)
        header_template = header_template.replace('$PI_IN_FIELDS', '\n'.join(input_vars))

        output_vars = []
        for var in self.mapping['out']:
            var_line = ('\t{} {} {}:{};'.format(
                ' '.join(var['attributes']), var['type'], var['alias'], var['size'])
            )
            input_vars.append(var_line)
        header_template = header_template.replace('$PI_OUT_FIELDS', '\n'.join(output_vars))

        with open(self.mapping['xap_path'], 'w') as header_file:
            header_file.write(header_template)
        print("xap.h file generated")

    def generate_cn_mapping(self):
        cn_mapping_file = open(self.cn_mapping_path, 'w')
        cn_mapping_file.write("--CN_MAPPING--\n")
        for var in self.mapping['in']:
            cn_mapping_file.write('i {} {} VAR_SIZE\n'.format(var['index'], var['subindex']))
        for var in self.mapping['out']:
            cn_mapping_file.write('o {} {} VAR_SIZE\n'.format(var['index'], var['subindex']))
        cn_mapping_file.close()
        print('CN mapping generated')
    """

    def generate_project_ros(self):
        self.generate_header_ros()
        self.generate_cpp_ros()
        print("Done!")

    def generate_header_ros(self):
        header_path = '{}/include/{}/{}.h'.format(self.project_root, self.ros_project,
                                                  self.project_config['exec_name'])
        with open(header_path, 'r') as header_file:
            header = header_file.read()

        messages = self.get_messages()

        header = header.replace('$ROS_MESSAGES_INCLUDE', self.generate_ros_messages_include(messages))
        header = header.replace('$USER_MESSAGES_EXTERN', self.generate_user_messages_extern(messages))

        with open(header_path, 'w') as header_file:
            header_file.write(header)

    @staticmethod
    def generate_ros_messages_include(messages):
        lines = []
        for message in messages:
            lines.append('#include <epl_wrapper/{}.h>'.format(message))
        return '\n'.join(lines)

    def generate_user_messages_extern(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            lines.append(
                'extern epl_wrapper::{}::ConstPtr {}_msg;'.format(message, self.to_underscore(message).lower()))
        lines.append('')
        for message in messages:
            if self.find_message_type(message) == 'out':
                continue
            lines.append('extern epl_wrapper::{} {}_msg;'.format(message, self.to_underscore(message).lower()))
        return '\n'.join(lines)

    def generate_cpp_ros(self):
        cpp_path = '{}/src/{}.cpp'.format(self.project_root, self.project_config['exec_name'])
        with open(cpp_path, 'r') as cpp_file:
            cpp = cpp_file.read()

        messages = self.get_messages()

        cpp = cpp.replace('$USER_MESSAGES', self.generate_user_messages(messages))
        cpp = cpp.replace('$MESSAGES_CALLBACKS_DECLARATIONS', self.generate_messages_callbacks_declarations(messages))
        cpp = cpp.replace('$PUBLISHERS', self.generate_publishers(messages))
        cpp = cpp.replace('$SUBSCRIBERS', self.generate_subscribers(messages))
        cpp = cpp.replace('$ROS_LOOP', self.generate_ros_loop(messages))
        cpp = cpp.replace('$MESSAGES_CALLBACKS', self.generate_messages_callbacks(messages))

        with open(cpp_path, 'w') as cpp_file:
            cpp_file.write(cpp)

    def generate_user_messages(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            lines.append('epl_wrapper::{}::ConstPtr {}_msg;'.format(message, self.to_underscore(message).lower()))
        lines.append('')
        for message in messages:
            if self.find_message_type(message) == 'out':
                continue
            lines.append('epl_wrapper::{} {}_msg;'.format(message, self.to_underscore(message).lower()))
        return '\n'.join(lines)

    def generate_messages_callbacks_declarations(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            line = 'void {}_callback(const epl_wrapper::{}::ConstPtr& msg);'
            lines.append(line.format(self.to_underscore(message).lower(), message))
        return '\n'.join(lines)

    def generate_publishers(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'out':
                continue
            line = '    ros::Publisher {0}_pub = node.advertise<epl_wrapper::{1}>("{1}", 1);'
            lines.append(line.format(self.to_underscore(message).lower(), message))
        return '\n'.join(lines)

    def generate_subscribers(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            line = '    ros::Subscriber {0}_sub = node.subscribe("{1}", 1, {0}_callback);'
            lines.append(line.format(self.to_underscore(message).lower(), message))
        return '\n'.join(lines)

    def generate_ros_loop(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'out':
                continue
            lines.append('        {0}_pub.publish({0}_msg);'.format(self.to_underscore(message).lower()))
        lines.append('')
        return '\n'.join(lines)

    def generate_messages_callbacks(self, messages):
        lines = []
        for message in messages:
            if self.find_message_type(message) == 'in':
                continue
            line = []
            line.append('void {}_callback(const epl_wrapper::{}::ConstPtr& msg)'.format(
                self.to_underscore(message).lower(),
                message
            ))
            line.append('{')
            line.append('    {}_msg = msg;'.format(self.to_underscore(message).lower()))
            line.append('}')
            line.append('')
            lines.append('\n'.join(line))
        return '\n'.join(lines)
