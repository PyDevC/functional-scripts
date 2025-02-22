#!/bin/bash

find_file(){
  # finds all the files in the $SEARCH location
  # behavior for finding file
  files="$(find $SEARCH -type f | tr ' ' '\n')"
  echo $files
}

find_dir(){
  # finds all the directories in the $SEARCH location
  # behavior for finding dir
  dirs=`find $SEARCH -type d`
  echo $dirs
}

find_all(){
  files=`find $SEARCH`
  echo $files
}

selection(){
  # $1 should be a function call
  local selected
  selected=`$1 | fzf` # gets a selected files from
  echo "$selected"
}

find_file # files should load with newline character
find_all
find_all
