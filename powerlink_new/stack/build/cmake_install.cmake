# Install script for directory: /home/dev/powerlink_new/stack

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/dev/powerlink_new/stack/lib/linux/x86_64")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/dev/powerlink_new/stack/build/proj/linux/liboplkmn/cmake_install.cmake")
  INCLUDE("/home/dev/powerlink_new/stack/build/proj/linux/liboplkmnapp-userintf/cmake_install.cmake")
  INCLUDE("/home/dev/powerlink_new/stack/build/proj/linux/liboplkmnapp-kernelintf/cmake_install.cmake")
  INCLUDE("/home/dev/powerlink_new/stack/build/proj/linux/liboplkmnapp-kernelpcie/cmake_install.cmake")
  INCLUDE("/home/dev/powerlink_new/stack/build/proj/linux/liboplkmndrv-pcap/cmake_install.cmake")
  INCLUDE("/home/dev/powerlink_new/stack/build/proj/linux/liboplkcn/cmake_install.cmake")
  INCLUDE("/home/dev/powerlink_new/stack/build/proj/linux/liboplkcnapp-userintf/cmake_install.cmake")
  INCLUDE("/home/dev/powerlink_new/stack/build/proj/linux/liboplkcnapp-kernelintf/cmake_install.cmake")
  INCLUDE("/home/dev/powerlink_new/stack/build/proj/linux/liboplkcndrv-pcap/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/dev/powerlink_new/stack/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/dev/powerlink_new/stack/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
