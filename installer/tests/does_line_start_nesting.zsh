#!/usr/bin/env zsh

source ../parser.zsh

test_does_line_start_nesting(){
  local ARG=$1
  local EXPECTED=$2
  does_line_start_nesting "$ARG"
  ANSWER=$?
  if [[ "$ANSWER" != "$EXPECTED" ]]; then
    print "FAILED does_line_start_nesting: '$ARG': Expected '$EXPECTED' but got '$ANSWER'"
    return 1
  fi
}

test_does_line_start_nesting "foo: bar" $FALSE
test_does_line_start_nesting "foo:" $TRUE
test_does_line_start_nesting "foo: " $TRUE
test_does_line_start_nesting "foo: {}" $FALSE

