#!/usr/bin/env bash

SEARCH=$HOME

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
  # gets the location of the main $SEARCH pretty useless unless you want to
  # know the location where fzf will work
  echo $SEARCH
}
