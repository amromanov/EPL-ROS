#
#   This file was generated with EPL ROS generator
#   Generated on: $TIMESTAMP
#   Version: $VERSION
#   License: $LICENSE
#

cmake_minimum_required(VERSION 2.8.3)
project(epl_wrapper)

find_package(catkin REQUIRED COMPONENTS
    roscpp
    std_msgs
    message_generation
)

add_message_files(DIRECTORY msg FILES
$MESSAGES
)

add_service_files(DIRECTORY srv FILES
$SERVICES
)

generate_messages(
    DEPENDENCIES
    std_msgs
)

catkin_package(
    CATKIN_DEPENDS
    message_runtime
)

include_directories(
    include
    ${catkin_INCLUDE_DIRS}
)

add_executable(wrapper src/wrapper.cpp src/memory_api.cpp src/priority_setter.cpp src/generated_wrapper.cpp)
target_link_libraries(wrapper ${catkin_LIBRARIES} rt)
add_dependencies(wrapper epl_wrapper_generate_messages_cpp ${${PROJECT_NAME}_EXPORTED_TARGETS})
set_target_properties(wrapper PROPERTIES COMPILE_FLAGS -std=c++11)
