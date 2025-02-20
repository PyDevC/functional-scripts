#!/usr/bin/env bash

find_file(){
  # finds all the files in the $SEARCH location
  # behavior for finding file
  files=`find $SEARCH -type f`
  echo $files
}

find_dir(){
  # finds all the directories in the $SEARCH location
  # behavior for finding dir
  file="$(find $SEARCH -type d` | selection )"
  echo $file
}


selection(){
  # $1 should be a function call
  local selected
  selected=`$1 | fzf` # gets a selected files from
  echo "$selected"
}

