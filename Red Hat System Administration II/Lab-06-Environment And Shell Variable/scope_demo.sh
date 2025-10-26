#!/bin/bash
global_var="I'm global"

function demo() {
    local local_var="I'm local"
    echo "Inside function: $global_var, $local_var"
}

demo
echo "Outside: $global_var"
echo "Local outside: $local_var"  # This will be empty
