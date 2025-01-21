#!/usr/bin/env bash
languages=`echo "c golang cpp python rust java javascript html css lua" | tr ' ' '\n'`
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

