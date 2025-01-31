#!/bin/bash

scripts_dir=$(dirname "${BASH_SOURCE[0]}" &> /dev/null && pwd)

dry="0"
grep=""
analyze="0"

run_dir=`find $script_dir -mindepth 1 -maxdepth 1 -executable`
echo $scripts_dir
echo $run_dir

readfile(){
    file="$2"
    comment="#|"
    if [[ -f $file ]]; then
        while read -r line;do
            if [[ $line == $comment* ]]; then
                printf '%s\n' "$line"
            fi
        done < $file
    fi
}

log(){
    if [[ "$dry" == "1" ]]; then
        echo "[ DRY RUN ]: " $1
    elif [[ "$analyze" == "1" ]];then
        echo "[ ANALYZE ]: " $1
        readfile $1
    else
        echo "$1"
    fi
}

while [[ $# -gt 0 ]]; do 
    if [[ "$1" == "--dry" ]]; then
        dry="1"
    elif [[ $1 == "--dry-analyze" ]]; then
        analyze="1"
    else
        grep="$1"
    fi
    shift
done

for s in $run_dir; do 
    # filter out the mentioned files from grep
    if echo $s | grep -vq "$grep"; then
        log "grep \"$grep\" filter out $s"
        continue
    fi

    log "running $s"
    if [[ $dry == "0" && $analyze == "0" ]]; then
        $s
    fi
done
