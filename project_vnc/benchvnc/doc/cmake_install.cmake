# Install script for directory: /home/jlucas/WeiWang/project_vnc/benchvnc/doc

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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/doc" TYPE FILE FILES
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/newconn-java.png"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/newconn-win.png"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/somerights20.png"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/unixauth-java.png"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/unixauth-win.png"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/vgltransportservernetwork.png"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/vncauth-java.png"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/vncauth-win.png"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/x11transport.png"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/LICENSE-PuTTY.txt"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/LICENSE.txt"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/index.html"
    "/home/jlucas/WeiWang/project_vnc/benchvnc/doc/turbovnc.css"
    )
endif()

