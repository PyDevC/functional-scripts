#!/usr/bin/env bash
languages=`echo "c cpp python java html css lua" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

echo $query
echo $selected
if printf $languages | grep -qs $selected; then
  curl cht.sh/$selected/`echo $query | tr ' ' '+'`
else
  curl cht.sh/$selected~$query
fi

