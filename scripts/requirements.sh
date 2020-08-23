#!/bin/bash

# These dotfiles include various componenets with executable and folder structure dependencies
# Over time, these can be presented here either as notes or an executable shell file

case $1  in
  -c|--cli)
    echo 
    echo "cli mode installations"
    echo 
    sudo apt install vim tmux npm python3 exuberant-ctags tmuxinator net-tools texlive-binaries tree ipython3 tree poppler-utils texlive-latex-extra linux-tools-generic ghc hugs latexmk llvm clang lldb cabal-install 
    cabal update
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

    if [ ! -e "$HOME/.vim/colors" ]
    then
      mkdir "$HOME/.vim/colors"
      echo "requirements: directory for color scheme monokai made"
    fi
    cp ./assets/monokai-colors/monokai.vim $HOME/.vim/colors/
    echo "requirements: Molokai colors file created/updated."
    echo 
    echo "---"
    echo
    ;;

  -g|--graphical)
    echo
    echo "graphical mode installations"
    echo 
    sudo apt-get install ghc libghc-regex-compat-dev libghc-syb-dev libghc-old-time-dev libghc-split-dev tcl-dev autoconf gperf flex bison iverilog verilator gtkwave 
    sudo snap install --classic code typora
    echo
    echo "---"
    echo 
    ;;

  -h|--help)
    echo 
    echo "./requirements.sh [-i|-g|-h]"
    echo 
    echo " -c | --cli         : Install Base Set of Packages associated with a command line system"
    echo " -g | --graphical   : Install Packages associated with a graphical system"
    echo " -h | --help        : Print help text associated with this script"
    echo
    echo "---"
    echo
    ;;

  *)
    echo "default"
    ;;
esac 

