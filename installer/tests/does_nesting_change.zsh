#!/usr/bin/env zsh

source ../parser.zsh

test_get_nesting_change(){
  local ARG=$1
  local NESTINGS=$2
  local CHANGED=$3
  local CHANGE=$4

  get_nesting_change "$ARG" $NESTINGS
  ANSWER=$?
  if [[ "$ANSWER" != "$CHANGED" ]]; then
    print "FAILED get_nesting_change: '$ARG': Expected return code '$CHANGED' but got return code '$ANSWER'"
    return 1
  fi
  if [[ "$REPLY" != $CHANGE ]]; then
    print "FAILED get_nesting_change: '$ARG': Expected reply '$CHANGE' but got reply '$REPLY'"
    return 1
  fi
}

test_get_nesting_change "foo: bar" 0 $FALSE 0
test_get_nesting_change "  foo: bar" 0 $TRUE 1
test_get_nesting_change "  foo: bar" 1 $FALSE 0



