#!/usr/bin/env bash

dir=$HOME # directory to search into 
command="--"
queries="" # command

all_repo(){ # searches the .git dir in $1
  local repositories
  repositories=`dirname $(find $1 -name ".git" -type d)`
  echo $repositories
}

repo_selection(){ # fzf selection from all_repo
  local selected
  selected=$( all_repo $1 | fzf +m --height 50% --style full --input-label ' Destination ' --preview 'tree -C {}')
  echo $selected
}

git_exec(){
  # $1 is for directory name
  # $2 is for command
  # $3 is for another method
  # output=`git -C $1 $2 $3`
#  if [[ $output != "" ]]; then
    printf "*********************[$1]*********************\n"
#    echo $output
#    printf "\n"
#  fi
  git -C $1 $2 $3
}

status(){
  # $1 is for directory name
  # $2 for method
  if [[ $2 == "" ]];then
    git_exec $1 "status" "--porcelain"
  else
    git_exec $1 "status" $2
  fi
}

log(){
  # $1 is for directory name
  # $2 for the method
  if [[ $2 == "" ]]; then
    git_exec $1 "log" "--graph --oneline"
  else
    git_exec $1
  fi
}

while [[ $# -gt 0 ]]; do 
  if [[ $1 == "$command*" ]]; then
    method=$1
  elif [[ -d $1 ]]; then
    dir=$1
  else
    queries=$1
  fi
  shift
done


repo=`all_repo $dir`

for d in $repo; do
  for query in $queries;do
    $query $d $method
  done
done
