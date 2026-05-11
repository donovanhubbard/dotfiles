#!/usr/bin/env zsh

source ../parser.zsh

test_serialize(){
  local YAML_FILE_PATH=$1
  local EXPECTED=$2
  serialize $1
  if [[ "$REPLY" != "$EXPECTED" ]]; then
    print "FAILED serialize: '$YAML_FILE_PATH': Expected '$EXPECTED' and got '$REPLY'"
    return 1
  fi
}

print_debug "= Running serialize ="

# Simple yaml map
test_serialize "simple.yaml" "breakfast:\"eggs\"lunch:\"sandwich\"dinner:\"steak\""

# 1 nested object
test_serialize "nested1.yaml" "pizza:\"anchovies:\"fresh\"salami:\"many\""

# Simple array
#test_serialize simple-array-no-indent.yaml "fruits:(\"Apple\",\"Orange\",\"Banana\")"

# Simple array with map before and after array
