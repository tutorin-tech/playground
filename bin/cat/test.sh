#!/bin/sh

BIN="$(pwd)/build/bin/cat/cat"

testCatSingleFile() {
  tmpfile="$(mktemp)"
  echo "Hello world" > "$tmpfile"

  output="$($BIN "$tmpfile")"
  assertEquals "Hello world" "$output"

  rm -f "$tmpfile"
}

testCatMultipleFiles() {
  f1="$(mktemp)"
  f2="$(mktemp)"
  echo -n "foo" > "$f1"
  echo -n "bar" > "$f2"

  output="$($BIN "$f1" "$f2")"
  assertEquals "foobar" "$output"

  rm -f "$f1" "$f2"
}

testCatStdin() {
  output="$(echo "from stdin" | $BIN)"
  assertEquals "from stdin" "$output"
}

testCatDashAsStdin() {
  f1="$(mktemp)"
  echo -n "file" > "$f1"

  output="$(echo -n "stdin" | $BIN "$f1" - "$f1")"
  assertEquals "filestdinfile" "$output"

  rm -f "$f1"
}

testCatNonexistentFile() {
  $BIN does_not_exist 2>/dev/null
  status=$?
  assertTrue "exit status should be nonzero" "[ $status -ne 0 ]"
}

# Load shUnit2
. shunit2
