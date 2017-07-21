#
#   This file was generated with EPL ROS generator
#   Generated on: $TIMESTAMP
#   Version: $VERSION
#   License: $LICENSE
#

cmake_minimum_required(VERSION 2.8.3)
project($ROS_PROJECT)

find_package(catkin REQUIRED COMPONENTS
    roscpp
    std_msgs
    message_generation
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

add_executable($EXEC_NAME
    src/$EXEC_NAME.cpp
    src/memory_api.cpp
    src/priority_setter.cpp
    src/generated_wrapper.cpp
    src/user_app.cpp
)
add_dependencies($EXEC_NAME ${catkin_EXPORTED_TARGETS})
add_dependencies($EXEC_NAME ${${PROJECT_NAME}_EXPORTED_TARGETS})
target_link_libraries($EXEC_NAME ${catkin_LIBRARIES} rt)
set_target_properties($EXEC_NAME PROPERTIES COMPILE_FLAGS -std=c++11)
