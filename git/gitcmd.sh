#!/usr/bin/env bash

dir=$HOME # directory to search into 
command="--"
queries="" # command
formatted=""
formatcmd=('log')

all_repo(){ # searches the .git dir in $1
  local repositories
  repositories=`dirname $(find $1 -name ".git" -type d)`
  echo $repositories | tr ' ' '\n'
}

repo_selection(){ # fzf selection from all_repo
  local selected
  local repo
  repo=`all_repo $1`
  selected=$( printf "$repo" | fzf +m --height 50% --style full --input-label ' Destination ' --preview 'tree -C {}')
  echo $selected 
}

git_exec(){
  # $1 is for directory name
  # $2 is for command
  # $3 is for another method
  printf "*********************[$1]*********************\n\n"
  if [[ $formatted == "1" ]];then
    git -C $1 --no-pager $2 $3
  else
    output=`git -C $1 --no-pager $2 $3`
    if [[ $output != "" ]]; then
      echo $output
    fi
    printf "\n"
  fi
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
  local selected 
  selected=`repo_selection $dir`

  if [[ $2 == "" ]]; then
    git_exec $selected "log" "-5" "--graph --oneline"
  else
    git_exec $1 
  fi
  exit
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
    if [[ " ${formatcmd[@]} " =~ " ${query} " ]]; then
      formatted="1"
    fi
    $query $d $method
  done
done
