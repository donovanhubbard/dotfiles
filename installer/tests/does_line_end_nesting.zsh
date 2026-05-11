#!/usr/bin/env zsh

source ../parser.zsh

test_does_line_end_nesting(){
  local ARG=$1
  local NESTINGS=$2
  local EXPECTED=$3
  does_line_end_nesting "$ARG" $NESTINGS
  ANSWER=$?
  if [[ "$ANSWER" != "$EXPECTED" ]]; then
    print "FAILED does_line_end_nesting: '$ARG': Expected '$EXPECTED' but got '$ANSWER'"
    return 1
  fi
}

test_does_line_end_nesting "foo: bar" 0 $FALSE
test_does_line_end_nesting "  foo: bar" 1 $FALSE
test_does_line_end_nesting "foo: bar" 1 $TRUE
test_does_line_end_nesting "    foo: bar" 2 $TRUE
test_does_line_end_nesting "  foo: bar" 1 $TRUE



