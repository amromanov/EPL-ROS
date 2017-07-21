#!/usr/bin/env python3

from argparse import ArgumentParser

import shutil

from globals import output_root
from project_generator import ProjectGenerator
from wrapper_generator import WrapperGenerator

if __name__ == '__main__':
    arg_parser = ArgumentParser(description="EPL ROS file generator")

    arg_parser.add_argument('--gen-wrapper', dest='generate_wrapper', action='store_true',
                            help="Generate EPL-ROS wrapper")
    arg_parser.add_argument('--gen-project', dest='generate_project', action='store_true',
                            help="Generate EPL-ROS project")
    arg_parser.add_argument('--gen-cn', dest='generate_cn', action='store_true',
                            help="Generate files for CN")
    arg_parser.add_argument('--clean', dest='clean', action='store_true',
                            help="Remove all generated files")

    arg_parser.add_argument('--xap', dest='xap_path', action='store', default='xap.h',
                            help="Path to EPL header file")
    arg_parser.add_argument('--ros-mapping', dest='ros_mapping_path', action='store', default='ros.map.json',
                            help="Path to ROS mapping file")
    arg_parser.add_argument('--node-mapping', dest='node_mapping_path', action='store', default='cn.map.json',
                            help="Path to CN mapping file")
    arg_parser.add_argument('--project-config', dest='project_config_path', action='store', default='project.json',
                            help="Path to project config file")

    args = arg_parser.parse_args()

    if args.clean:
        try:
            shutil.rmtree(output_root)
        except:
            pass
        print("Cleaning done!")
        exit(0)

    if args.generate_wrapper:
        WrapperGenerator(args)
        exit(0)

    if args.generate_project:
        ProjectGenerator(args)
        exit(0)

    if args.generate_cn:
        WrapperGenerator(args)
        exit(0)

    arg_parser.print_help()
    exit(0)
