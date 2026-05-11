#!/usr/bin/env zsh

source ../parser.zsh

test_trim_tailing_whitespace(){
  local ARG=$1
  local EXPECTED=$2
  trim_tailing_whitespace "$ARG"
  if [[ "$REPLY" != "$EXPECTED" ]]; then
    print "FAILED trim_tailing_whitespace: '$ARG': Expected '$EXPECTED' but got '$REPLY'"
    return 1
  fi
}

test_trim_tailing_whitespace "foo" "foo"
test_trim_tailing_whitespace "foo " "foo"
test_trim_tailing_whitespace "foo  " "foo"
test_trim_tailing_whitespace "foo bar" "foo bar"
test_trim_tailing_whitespace "foo bar " "foo bar"
test_trim_tailing_whitespace "" ""
test_trim_tailing_whitespace " " ""

