#!/usr/bin/env bash

cd ../..
. $(pwd)/dependencies/fzf/search.sh
selection find_files

# TODO: testing not working due test file not being in same dir.

