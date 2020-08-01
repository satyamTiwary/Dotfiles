#!/bin/bash

target=""

tick=$'\u2714'
cross=$'\u2718'

if [ -d $HOME/.vim/UltiSnips ]; then
  target="$HOME/.vim/UltiSnips"
elif [ -d $HOME/.UltiSnips ]; then
  target="$HOME/.UltiSnips"
else
  echo "UltiSnips:   ${tick} folder not found."
  exit
fi

  # Action: Create the symbolic links
  cp ./UltiSnips/*.snippets $target
  # ---
  echo "UltiSnips:   ${tick} snippet files updated"

