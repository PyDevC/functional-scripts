#!/bin/bash

if [ $# -eq 1 ]; then
   dir="docs" 
elif [ $# -eq 3 ]; then
    dir="$2"
    branch="$3"
else 
    dir="$2"
fi

url="$1"

##########
# CHANGE #
###################################
file=("${url//// }") 
file=($(echo $file | tr " " " " ))
file="${file[3]}"
file="${file%.git}"
##################################

##################
# ECHO VARIABLES #
##################################
echo file: "$file"
echo url: "$url"
echo branch: "$branch"
echo dir: "$dir"
##################################

