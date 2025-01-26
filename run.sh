#!/bin/bash

scripts_dir="$(cd "$(dirname ${BASH_SOURCE[0]} &> /dev/null && pwd)")"

dry="0"
grep=""

run_dir=`find $script_dir/runs -mindepth 1 -maxdepth 1 -executable`

log(){
    if [[ "$dry" == "1" ]]; then
        echo "[ DRY RUN ]: " $1
    else
        echo "$1"
    fi
}

while [[ $# -gt 0 ]]; do 
    if [[ "$1" == "--dry" ]]; then
        dry="1"
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
    if [[ $dry == "0" ]]; then
        $s
    fi
done
