#!/bin/bash

if command -v tmuxinator &> /dev/null
then
  ln -s ./tmuxinators/* ~/.config/tmuxinator/
  echo "tmuxinator yaml files updated"
else
  echo "tmuxinator was not found."
fi

