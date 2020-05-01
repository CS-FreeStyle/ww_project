# Install script for directory: /home/jerry/Documents/jerry/benchvnc/unix/Xvnc/include

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
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/bigreqsproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/compositeproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/damageproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/fixesproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/fontsproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/inputproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/kbproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/libxkbfile/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/presentproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/randrproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/renderproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/resourceproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/scrnsaverproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/videoproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/xcmiscproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/xextproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/xf86bigfontproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/xineramaproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/xproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/glproto/cmake_install.cmake")
  include("/home/jerry/Documents/jerry/benchvnc/build/unix/Xvnc/include/libXext/cmake_install.cmake")

endif()

