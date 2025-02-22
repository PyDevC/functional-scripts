#!/usr/bin/env bash

SEARCH=$HOME # fzf searches in this directory

set_location(){
  # sets a new location for fzf to search
  if [[ $# -gt 0 ]]; then
    if [[ $1 == "-def" ]];then
      SEARCH=$HOME
    else
      SEARCH=$1
    fi
  else
    echo "Location: $SEARCH"
  fi
}

get_location(){
  # gets the location of the main $SEARCH 
  echo $SEARCH
}
