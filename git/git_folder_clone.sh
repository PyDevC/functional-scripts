#!/usr/bin/env bash

file=""
url=""
branch=""
dir=""
method=""
branch_example_names="main master trunk"

###############################
# GET PROTOCOL #
###############################
protocol=("${1//// }") 
protocol=($(echo $protocol | tr " " " " ))
protocol="${protocol[0]}"


if [ $# -gt 2 ]; then
    branch=`grep "$branch_example_names"`

fi




###################################
# WILL UPDATE LATER #
###################################
if [ "$protocol" == "https:" ]; then
    url="$1"
fi
if [ "$2" != "" ]; then
    dir="$2"
fi
if [ "$3" != "" ]; then
    branch="$3"
fi
if [ "$4" != ""  ]; then
    method="$4"
fi

help(){
    desc="A useful git script for multi-purpose"
    func="[url] [sub-directory] [branch] [method]"
    func_help="Print this description"
    func_no_checkout="uses git --no-checkout. It prevents the auto download of all files from the git"
    func_archive="uses git archive. It downloads just the folder without cloning"
    func_simple_clone="get the clone for repo."
    func_partial_clone="creates a partial clone using --filter=blob:none. This is helpful for less download data"
    warnings=""

    echo $desc
    echo $func
    echo "--help" $func_help
    echo "--no-checkout --no-chk" $func_no_checkout
    echo "--archive" $func_archive
    echo "--partial" $func_partial_clone
    echo "no argument passes" $func_simple_clone
    echo $warnings
}

no_checkout(){
    git clone --no-checkout "$url"
    cd "$file" 
    git sparse-checkout init
    git sparse-checkout set "$dir"
    git checkout "$branch"
}

archive(){
    # method doesn't work for https protocol 
    # find alternative solution
    git archive --remote=$url HEAD:$dir | tar -x
}

simple_clone(){
    git clone "$url"
}

partial_clone(){
    git clone --filter=blob:none "$url"
    cd "$file"
    git sparse-checkout init
    git sparse-checkout set "$dir"
    git checkout "$branch"
}

##########
# CHANGE #
###################################
file=("${url//// }") # returns the url as spaced individul
file=($(echo $file | tr " " " " )) # converts file string to array
file="${file[3]}" # gets the git repo name
file="${file%.git}" # gets the repo name
##################################

##################
# ECHO VARIABLES #
##################################
echo file: "$file"
echo url: "$url"
echo branch: "$branch"
echo dir: "$dir"
echo method: "$method"
##################################

# method 
case "$method" in
    "--help")
        help
        ;;
    "--no-chk" | "--no-checkout")
        no_checkout
        ;;
    "--archive")
        archive
        ;;
    "--partial")
        partial_clone
        ;;
    "")
        simple_clone
        ;;
    *)
        echo "not a method"  
        ;;
esac
