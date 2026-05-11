#! /usr/bin/env zsh

arr=(one two three)

print $arr[2]

typeset -a arr2

arr2=(one "two three" four)

print $arr2[2]
print $arr2[0]

get_username() {
  local REPLY="admin_user"
}

print something
print $REPLY
get_username
print $REPLY
print something
