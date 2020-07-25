#!/bin/bash

target=""

tick=$'\u2714'
cross=$'\u2718'

if command -v tmuxinator &> /dev/null; then
  if [ -d $HOME/.config/tmuxinator ]; then
    target="$HOME/.config/tmuxinator"
  elif [ -d $HOME/.tmuxinator ]; then
    target="$HOME/.tmuxinator"
  else
    echo "tmuxinator:   ${tick} Config folder not found."
    exit
  fi

  # Action: Create the symbolic links
  cp ./tmuxinator/*.yml $target
  # ---
  echo "tmuxinator:   ${tick} Yaml files updated"
else
  echo "tmuxinator:   ${cross} Not found." >> /dev/stderr
  exit
fi

