#!/bin/sh

# ==============================================================================
#
# Shell Unit Test for the ported 'mkdir' program.
#
# Usage:
# 1. Ensure shunit2 is in the same directory.
# 2. Adjust the BIN path below if necessary.
# 3. Run from the terminal: ./test_mkdir.sh
#
# ==============================================================================

# Path to the built 'mkdir' executable.
# ADJUST IF NECESSARY.
BIN="$(pwd)/build/bin/mkdir/mkdir"

# --- Setup & Teardown Functions ---

# oneTimeSetUp is called once before all tests start.
oneTimeSetUp() {
  # Check if the mkdir executable exists and is executable
  assertTrue "mkdir executable not found or not executable at ${BIN}" "[ -x \"${BIN}\" ]"
}

# setUp is called before each test function.
# Creates a clean temporary directory for each test.
setUp() {
  TEST_DIR=$(mktemp -d)
  cd "${TEST_DIR}"
}

# tearDown is called after each test function.
# Cleans up the temporary directory.
tearDown() {
  cd - >/dev/null
  rm -rf "${TEST_DIR}"
}


# --- Test Suite ---

# Test 1: Create a single directory.
test_createSingleDirectory() {
  "${BIN}" "dir1"
  assertTrue "Directory 'dir1' should have been created" "[ -d 'dir1' ]"
}

# Test 2: Create multiple directories at once.
test_createMultipleDirectories() {
  "${BIN}" "dir_a" "dir_b" "dir_c"
  assertTrue "Directory 'dir_a' should exist" "[ -d 'dir_a' ]"
  assertTrue "Directory 'dir_b' should exist" "[ -d 'dir_b' ]"
  assertTrue "Directory 'dir_c' should exist" "[ -d 'dir_c' ]"
}

# # Test 3: Option -p to create nested directories.
test_optionP_createNestedDirectories() {
  "${BIN}" -p "parent/child/grandchild"
  assertTrue "Nested directory 'parent/child/grandchild' should have been created" "[ -d 'parent/child/grandchild' ]"
}

# # Test 4: Option -p should not error if the directory already exists.
test_optionP_succeedsIfDirectoryExists() {
  mkdir "existing_dir"
  "${BIN}" -p "existing_dir"
  assertEquals "Running 'mkdir -p' on an existing directory should return exit code 0 (success)" "0" "$?"
}

# # Test 5: Fail to create a directory if its parent does not exist (without -p).
test_failsIfParentDoesNotExist() {
  # Run in a subshell to suppress error messages from stdout/stderr
  ( "${BIN}" "nonexistent_parent/child" ) >/dev/null 2>&1
  assertNotEquals "Creating a directory without a parent should return a non-zero exit code (failure)" "0" "$?"
}

# # Test 6: Option -m to set an octal mode.
test_optionM_setsOctalMode() {
  "${BIN}" -m 700 "private_dir"
  assertTrue "Directory 'private_dir' should have been created" "[ -d 'private_dir' ]"

  # Get permissions using stat, format as octal (%a)
  PERMS=$(stat -c "%a" "private_dir")
  assertEquals "Permissions should be 700" "700" "${PERMS}"
}

# Test 7: Option -m to set a symbolic mode.
test_optionM_setsSymbolicMode() {
  # u=rwx,g=rx,o=
  "${BIN}" -m u=rwx,g=rx,o= "symbolic_dir"
  assertTrue "Directory 'symbolic_dir' should have been created" "[ -d 'symbolic_dir' ]"

  PERMS=$(stat -c "%a" "symbolic_dir")
  assertEquals "Permissions for u=rwx,g=rx,o= should be 750" "750" "${PERMS}"
}

# Load and run shunit2
. shunit2