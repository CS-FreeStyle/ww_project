# Install script for directory: /home/jerry/Documents/jerry/benchvnc/doc

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/doc" TYPE FILE FILES
    "/home/jerry/Documents/jerry/benchvnc/doc/vgltransportservernetwork.png"
    "/home/jerry/Documents/jerry/benchvnc/doc/unixauth-java.png"
    "/home/jerry/Documents/jerry/benchvnc/doc/x11transport.png"
    "/home/jerry/Documents/jerry/benchvnc/doc/vncauth-win.png"
    "/home/jerry/Documents/jerry/benchvnc/doc/unixauth-win.png"
    "/home/jerry/Documents/jerry/benchvnc/doc/newconn-java.png"
    "/home/jerry/Documents/jerry/benchvnc/doc/somerights20.png"
    "/home/jerry/Documents/jerry/benchvnc/doc/newconn-win.png"
    "/home/jerry/Documents/jerry/benchvnc/doc/vncauth-java.png"
    "/home/jerry/Documents/jerry/benchvnc/doc/LICENSE-PuTTY.txt"
    "/home/jerry/Documents/jerry/benchvnc/doc/LICENSE.txt"
    "/home/jerry/Documents/jerry/benchvnc/doc/index.html"
    "/home/jerry/Documents/jerry/benchvnc/doc/turbovnc.css"
    )
endif()

