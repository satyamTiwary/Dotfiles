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

  sudo apt install vim tmux npm python3 exuberant-ctags tmuxinator net-tools texlive-binaries tree ipython3 tree poppler-utils texlive-latex-extra linux-tools-generic ghc hugs latexmk llvm clang
  sudo apt-get install texlive-latex-base texlive-latex-extra

  pip3 install pynvim autopep8 cmake_format
  sudo npm install -g eslint js-beautify remark-cli scmindent livedown

  # Repo tools
  mkdir $HOME/bin
  PATH=$HOME/bin:$PATH
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
  chmod a+x ~/bin/repo

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  
fi

