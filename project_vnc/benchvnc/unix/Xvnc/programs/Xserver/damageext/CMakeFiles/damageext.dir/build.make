# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jlucas/WeiWang/project_vnc/benchvnc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jlucas/WeiWang/project_vnc/benchvnc

# Include any dependencies generated for this target.
include unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/depend.make

# Include the progress variables for this target.
include unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/progress.make

# Include the compile flags for this target's objects.
include unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/flags.make

unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o: unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/flags.make
unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o: unix/Xvnc/programs/Xserver/damageext/damageext.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jlucas/WeiWang/project_vnc/benchvnc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o"
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS)  -fno-strict-aliasing -o CMakeFiles/damageext.dir/damageext.c.o   -c /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext/damageext.c

unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/damageext.dir/damageext.c.i"
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS)  -fno-strict-aliasing -E /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext/damageext.c > CMakeFiles/damageext.dir/damageext.c.i

unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/damageext.dir/damageext.c.s"
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS)  -fno-strict-aliasing -S /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext/damageext.c -o CMakeFiles/damageext.dir/damageext.c.s

unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o.requires:

.PHONY : unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o.requires

unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o.provides: unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o.requires
	$(MAKE) -f unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/build.make unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o.provides.build
.PHONY : unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o.provides

unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o.provides.build: unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o


# Object files for target damageext
damageext_OBJECTS = \
"CMakeFiles/damageext.dir/damageext.c.o"

# External object files for target damageext
damageext_EXTERNAL_OBJECTS =

lib/libdamageext.a: unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o
lib/libdamageext.a: unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/build.make
lib/libdamageext.a: unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jlucas/WeiWang/project_vnc/benchvnc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../../../../lib/libdamageext.a"
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext && $(CMAKE_COMMAND) -P CMakeFiles/damageext.dir/cmake_clean_target.cmake
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/damageext.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/build: lib/libdamageext.a

.PHONY : unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/build

unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/requires: unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/damageext.c.o.requires

.PHONY : unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/requires

unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/clean:
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext && $(CMAKE_COMMAND) -P CMakeFiles/damageext.dir/cmake_clean.cmake
.PHONY : unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/clean

unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/depend:
	cd /home/jlucas/WeiWang/project_vnc/benchvnc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jlucas/WeiWang/project_vnc/benchvnc /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext /home/jlucas/WeiWang/project_vnc/benchvnc /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unix/Xvnc/programs/Xserver/damageext/CMakeFiles/damageext.dir/depend

