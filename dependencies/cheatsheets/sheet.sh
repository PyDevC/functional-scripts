#!/usr/bin/env bash
languages=`echo "bash c cpp python java html css lua" | tr ' ' '\n'`
core_utils=`echo "awk sed cut xargs" | tr ' ' '\n'`

selected=`printf "$languages \n $core_utils" | fzf`
read -p "query: " query
query=`echo $query | tr ' ' '+'`

if [[  ]];then
  echo languahe
  curl cht.sh/$selected/$query # only works for languages
else
  echo core
  curl cht.sh/$selected~$query # only works for core utils
fi
