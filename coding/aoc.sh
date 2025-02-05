#!/bin/bash

AOC=~/personal/advent-of-code
AOC_COOKIE=""

alias aos="cd $AOC;python3 solution.py < in.txt"
alias aot="cd $AOC;echo -ne '\\e[0;34m';python3 solution.py < test.txt; echo -ne '\\e[0m'"
alias aoc="aot;echo:aos"

aoc-load(){
if [ $1 ];then
    curl --cookie "session=$AOC_COOKIE" $link > in.txt
fi
}
