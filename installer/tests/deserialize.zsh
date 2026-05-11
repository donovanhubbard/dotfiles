#!/usr/bin/env zsh

source ../parser.zsh

test_deserialize(){
  local TEXT=$1
  local EXPECTED_RC=$2
  local EXPECTED=$3
  local ARGS=$4
  deserialize $TEXT $ARGS
  if [[ $? != $EXPECTED_RC ]]; then
    local EXPECTED_STRING=""
    if [[ 0 ]]; then
      EXPECTED_STRING="SUCCEED"
    else
      EXPECTED_STRING="FAIL"
    fi
    print "FAILED deserialize: '$TEXT': key='$ARGS' Expected function to $EXPECTED_STRING but it did not"
    return 1
  fi
  if [[ "$EXPECTED_RC" != 0 ]]; then
    return 0
  fi
  if [[ "$REPLY" != "$EXPECTED" ]]; then
    print "FAILED deserialize: '$TEXT': Expected '$EXPECTED' and got '$REPLY'"
    return 1
  fi
}

local SIMPLE_YAML="breakfast:\"eggs\"lunch:\"sandwich\"dinner:\"steak\""

# Basic lookup
test_deserialize "$SIMPLE_YAML" 0 "eggs" "breakfast"
test_deserialize "$SIMPLE_YAML" 0 "sandwich" "lunch"
test_deserialize "$SIMPLE_YAML" 0 "steak" "dinner"

# Bad Key
test_deserialize "$SIMPLE_YAML" 1 "eggs" "badKey"
# Partial match
test_deserialize "$SIMPLE_YAML" 1 "eggs" "dinners"

