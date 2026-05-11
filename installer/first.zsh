#!/bin/zsh

typeset -A FIRST

FIRST[one]=1

typeset -A SECOND

FIRST[two]=$SECOND

SECOND[red]=blue

print $FIRST

print ${(kv)FIRST}
