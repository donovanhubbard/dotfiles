#!/usr/bin/env zsh

DELIMITERS=(":" "\"" "," "(" ")")
typeset -rg TRUE=0
typeset -rg FALSE=1

serialize(){
  print_debug "=== Staring Serialize ==="
  YAML_FILE_PATH=$1
  local TEXT=""
  local NESTED=0

  while IFS= read -r line; do
    print_debug "line='$line'"
    if does_line_start_nesting $line; then
      NESTED+=1
      get_key $line
    else
      process_key_value $line
    fi

    TEXT+=$REPLY
  done < $YAML_FILE_PATH

  REPLY=$TEXT
}

return_false(){
  return $FALSE
}

return_true(){
  return $TRUE
}


process_key_value(){
  local LINE=$1
  get_key $line
  key=$REPLY
  get_value $line
  value=$REPLY
  REPLY="$key:\"$value\""
}

# is_array(){
#   local LINE=$1
#   if [[ $LINE != "-"* ]]; then
#     return 1
#   fi
# }

does_line_start_nesting(){
  local TEXT=$1
  trim_tailing_whitespace $TEXT
  TEXT=$REPLY
  DELIMITER_INDEX=${(SB)TEXT#":"}
  if [[ ${#TEXT} == $DELIMITER_INDEX ]]; then
    return $TRUE
  fi
  return $FALSE
}

get_nesting_change(){
  local TEXT=$1
  local NESTINGS=$2

  trim_leading_whitespace $TEXT
  local TRIMMED=$REPLY
  DIFFERENCE=$(( ${#TEXT} - ${#TRIMMED}))
  NEW_NESTINGS=$(( $DIFFERENCE / 2 ))

  if (( $NEW_NESTINGS == 0 )); then
    REPLY=0
    return 1
  fi

  REPLY=$NEW_NESTINGS

}

does_line_end_nesting(){
  local TEXT=$1
  local NESTINGS=$2

  trim_leading_whitespace $TEXT
  local TRIMMED=$REPLY
  print "HERE"
  DIFFERENCE=$(( ${#TEXT} - ${#TRIMMED}))
  NEW_NESTINGS=$(( $DIFFERENCE / 2 ))
}

get_key(){
  local TEXT=$1
  delimiterIndex=${(SB)TEXT#":"}
  TEXT=${TEXT[1,(($delimiterIndex - 1))]}
  trim_leading_whitespace $TEXT
  REPLY=$REPLY
}

get_value(){
  local TEXT=$1
  delimiterIndex=${(SB)TEXT#":"}
  TEXT=${TEXT[(($delimiterIndex + 1)),${#TEXT}]}
  trim_leading_whitespace $TEXT
  REPLY=$REPLY
}

trim_leading_whitespace(){
  local TEXT=$1
  while [[ $TEXT = " "* ]]; do
    TEXT=${TEXT[2,$#TEXT]}
  done
  REPLY=$TEXT
}

trim_tailing_whitespace(){
  local TEXT=$1
  while [[ $TEXT = *" " ]]; do
    TEXT=${TEXT[1,(($#TEXT - 1 ))]}
  done
  REPLY=$TEXT
}

deserialize(){
  local TEXT=$1
  local KEY=$2
  print_debug "== Staring deserialize =="
  print_debug "TEXT='$TEXT'"
  print_debug "KEY='$KEY'"

  #Check if the key is found at all
  if [[ $TEXT != *$KEY* ]]; then
    return 1
  fi

  local KEY_INDEX=${(SB)TEXT#$KEY}
  print_debug "$KEY_INDEX"
  local TEXT_STARTING_AT_KEY=${TEXT[(($KEY_INDEX + $#KEY + 2)),$#TEXT]}
  print_debug "$TEXT_STARTING_AT_KEY"
  local INDEX_OF_CLOSING_QUOTE=${(SB)TEXT_STARTING_AT_KEY#"\""}
  print_debug "$INDEX_OF_CLOSING_QUOTE"
  local VALUE=${TEXT_STARTING_AT_KEY[1,(($INDEX_OF_CLOSING_QUOTE - 1))]}
  REPLY=$VALUE
}

print_debug(){
  if [[ -n $DEBUG ]]; then
    print "$1"
  fi
}

# serialize simple.yaml
# print $REPLY
