# Install script for directory: /home/jerry/Documents/jerry/benchvnc/unix/Xvnc/programs/Xserver

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Xvnc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Xvnc")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Xvnc"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/jerry/Documents/jerry/benchvnc/build/bin/Xvnc")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Xvnc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Xvnc")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/Xvnc")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/man/man1" TYPE FILE RENAME "Xserver.1" FILES "/home/jerry/Documents/jerry/benchvnc/unix/Xvnc/programs/Xserver/man/Xserver.man")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/man/man1" TYPE FILE RENAME "Xvnc.1" FILES "/home/jerry/Documents/jerry/benchvnc/unix/Xvnc/programs/Xserver/Xvnc.man")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/Xext/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/Xi/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/composite/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/damageext/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/dix/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/fb/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/glx/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/mi/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/miext/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/os/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/present/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/randr/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/render/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/xfixes/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/xkb/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/programs/Xserver/hw/vnc/cmake_install.cmake")

endif()

