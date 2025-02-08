#!/bin/bash

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
  output=`git -C $1 $2 $3`
  if [[ $output != "" ]]; then
    printf "\n*********************[$1]*********************\n"
    echo $output
    printf "\n"
  fi
}

git_status(){
  # $1 is for directory name
  git_exec $1 "status" "--porcelain"
}


git_commit(){
  # $1 is for directory name
  # $2 to choose between all or select --added later
  echo $1
  read -p "Do you want to commit you changes to this repo [Y/n]: " confirm
  if [[ $confirm == "y" || $confirm == "Y" ]]; then
    read -p "Enter commit message: " message
    git_exec $1 "commit -m" $message
  elif [[ $confirm == "n" || $confirm == "N" ]]; then
    echo "exiting..."
  else
    echo "try again"
  fi 
}

git_log(){
  # $1 is for directory name
  git_exec $1 "log" "--graph --oneline"
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
   git_exec $d "status" "--porcelain"
  done
done
