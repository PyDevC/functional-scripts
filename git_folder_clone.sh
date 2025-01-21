#!/bin/bash
#####################################
# REWRITE ACCORDING TO func IN HELP #
#####################################
if [ $# -eq 1 ]; then
    dir="docs" 
elif [ $# -eq 3 ]; then
    dir="$2"
    branch="$3"
else 
    dir="$2"
fi

url="$1"
###################################

help(){
    desc="A useful git script for multi-purpose"
    func="[url] [sub-directory] [branch] [method]"
    func_help="Print this description"
    fucn_no_checkout="uses git --no-checkout. It prevents the auto download of all files from the git"
    warnings=""

}

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

no_checkout(){
    # url dir file branch
    git clone --no-checkout "$url"
    cd "$file" 
    git sparse-checkout init
    git sparse-checkout set "$dir"
    git checkout "$branch"
}

archive(){
    mkdir $file - $dir
    git archive --remote=$url HEAD:$dir
}

simple_clone(){}

partial_clone(){}
