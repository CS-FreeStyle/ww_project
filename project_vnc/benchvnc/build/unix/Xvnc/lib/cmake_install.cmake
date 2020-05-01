# Install script for directory: /home/jerry/Documents/jerry/benchvnc/unix/Xvnc/lib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/opt/TurboVNC")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/bzip2/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/libXau/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/libXdmcp/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/libXfont2/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/libfontenc/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/libxshmfence/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/pixman/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/xtrans/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/libxcb/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/libX11/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/lib/libsha1/cmake_install.cmake")

endif()

