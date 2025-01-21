#!/usr/bin/env bash
languages=`echo "c golang cpp python rust java javascript html css lua" | tr ' ' '\n'`

selected=`printf "$languages" | fzf`
read -p "query: " query

curl cht.sh/$selected/$query
