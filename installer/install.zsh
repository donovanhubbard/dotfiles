#!/bin/zsh

set -euo pipefail

function parse_yaml(){
  typeset -gA YAML

  YAML["key1"]="value1"
}

if [[ "$#" -eq 0 ]]; then
  CONFIG_FILE=dotfiles.yaml
elif [[ "$#" -eq 1 ]]; then
  CONFIG_FILE=$1
else
  print "$0: usage"
  exit
fi


parse_yaml $CONFIG_FILE
print ${(kv)YAML}

