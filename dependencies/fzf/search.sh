#!/usr/bin/env bash

find_file(){
  # finds all the files in the $SEARCH variable
  # behavior for finding file
  files=`find $SEARCH -type f`
  echo $files
}
