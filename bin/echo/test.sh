#!/bin/sh

BIN="$(pwd)/build/bin/echo/echo"

testEchoEmpty() {
  output="$($BIN)"
  assertEquals "" "$output"
}

testEchoPrintsArguments() {
  output="$($BIN hello world)"
  assertEquals "hello world" "$output"
}

testEchoRedirection() {
  tmpfile="$(mktemp)"
  $BIN redirected output > "$tmpfile"
  output="$(cat "$tmpfile")"
  rm -f "$tmpfile"
  assertEquals "redirected output" "$output"
}

# Load shUnit2
. shunit2
