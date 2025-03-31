#!/bin/bash

# Check if an array contains a value
# First argument is item to find
# Following arguments are array elements
# Usage: contains "itemToFind" "${array[@]}"
# Returns 0 (true) if found (success)
# Returns 1 (false) if not found (non-success)
function contains () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

# Check if an array is empty
# Usage: empty ${#array[@]}
function empty() {
    if [ $1 == 0 ];
    then
        return 1
    fi
    return 0
}