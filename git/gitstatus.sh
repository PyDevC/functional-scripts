#!/bin/bash

dir=$HOME # directory to search into 
command="--"
queries="" # command

search(){ # searches the .git dir in $1
    local repositories
    repositories=`dirname $(find $1 -name ".git" -type d)`
    echo $repositories
}

git_exec(){
    printf "*********************\n\n\n[$1]\n\n\n*********************"
    git -C $1 $2
}

while [[ $# -gt 0 ]]; do 
    if [[ -d $1 ]]; then
        echo 1
        dir=$1
    elif [[ $1 == "$command*" ]]; then
        echo 2
        method=$1
    else
        echo 3
        queries=$1
    fi
    shift
done

echo $queries
echo $dir
echo $command
echo $method

repo=`search $dir`

for d in $repo; do
    for query in $queries;do 
        git_exec $d $query
    done
done
