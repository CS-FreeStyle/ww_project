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
include unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/depend.make

# Include the progress variables for this target.
include unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/progress.make

# Include the compile flags for this target's objects.
include unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/flags.make

unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o: unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/flags.make
unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o: unix/Xvnc/lib/libsha1/sha1.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jlucas/WeiWang/project_vnc/benchvnc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o"
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1 && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sha1.dir/sha1.c.o   -c /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1/sha1.c

unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sha1.dir/sha1.c.i"
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1 && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1/sha1.c > CMakeFiles/sha1.dir/sha1.c.i

unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sha1.dir/sha1.c.s"
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1 && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1/sha1.c -o CMakeFiles/sha1.dir/sha1.c.s

unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o.requires:

.PHONY : unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o.requires

unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o.provides: unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o.requires
	$(MAKE) -f unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/build.make unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o.provides.build
.PHONY : unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o.provides

unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o.provides.build: unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o


# Object files for target sha1
sha1_OBJECTS = \
"CMakeFiles/sha1.dir/sha1.c.o"

# External object files for target sha1
sha1_EXTERNAL_OBJECTS =

lib/libsha1.a: unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o
lib/libsha1.a: unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/build.make
lib/libsha1.a: unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jlucas/WeiWang/project_vnc/benchvnc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../../../lib/libsha1.a"
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1 && $(CMAKE_COMMAND) -P CMakeFiles/sha1.dir/cmake_clean_target.cmake
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sha1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/build: lib/libsha1.a

.PHONY : unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/build

unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/requires: unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/sha1.c.o.requires

.PHONY : unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/requires

unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/clean:
	cd /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1 && $(CMAKE_COMMAND) -P CMakeFiles/sha1.dir/cmake_clean.cmake
.PHONY : unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/clean

unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/depend:
	cd /home/jlucas/WeiWang/project_vnc/benchvnc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jlucas/WeiWang/project_vnc/benchvnc /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1 /home/jlucas/WeiWang/project_vnc/benchvnc /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1 /home/jlucas/WeiWang/project_vnc/benchvnc/unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unix/Xvnc/lib/libsha1/CMakeFiles/sha1.dir/depend

