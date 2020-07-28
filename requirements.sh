#!/bin/bash

# These dotfiles include various componenets with executable and folder structure dependencies
# Over time, these can be presented here either as notes or an executable shell file

if [ $# -eq 0 ]
then
  if [ ! -e "$HOME/.vim/colors" ]
  then
    mkdir "$HOME/.vim/colors"
    echo "requirements: directory for color scheme monokai made"
  fi
  cp ./assets/monokai-colors/monokai.vim $HOME/.vim/colors/
  echo "requirements: Molokai colors file created/updated."
else

  sudo apt install tmux
  sudo apt install npm

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  sudo apt  install exuberant-ctags
  sudo apt install tmuxinator
  sudo apt install net-tools
  sudo apt install texlive-binaries
  sudo apt  install tree

  # Autoformat
  python3 -m pip install pynvim
  # autopep8
  pip3 install autopep8
  # ESlint
  sudo npm install -g eslint
  # html,css,js: Js-beautify
  sudo npm install -g js-beautify
  # markdown
  sudo npm install -g remark-cli
  # cmake
  pip3 install cmake_format

  # Scmindenter: recomended for scheme
  sudo npm install -g scmindent
fi

