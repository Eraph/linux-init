#!/bin/bash

# Check if an array contains a value
# First argument is item to find
# Following arguments are array elements
# Usage: contains itemToFind array
# Returns 0 (true) if found (success)
# Returns 1 (false) if not found (non-success)
function contains() {
    local match="$1" array=$2

    for i in "${array[@]}"
    do
        if [ "$i" == "$match" ] ; then
            return 0;
        fi
    done

    return 1
}

# Check if an array is not empty
# Usage: notEmpty array
function notEmpty() {
    return ${#$1[@]} != 0
}