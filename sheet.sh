#!/usr/bin/env bash
languages=`echo "c cpp python java html css lua" | tr ' ' '\n'`

selected=`printf "$languages" | fzf`
read -p "query: " query

curl cht.sh/$selected/$query
