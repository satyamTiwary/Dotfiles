#!/bin/bash

# These dotfiles include various componenets with executable and folder structure dependencies
# Over time, these can be presented here either as notes or an executable shell file

function cli(){
  echo 
  echo "========================"
  echo " CLI mode installations"
  echo "========================"
  echo 
  sudo apt -y install vim tmux npm python3 build-essential exuberant-ctags tmuxinator net-tools texlive-binaries tree ipython3 tree poppler-utils texlive-latex-extra linux-tools-generic ghc hugs latexmk llvm clang lldb cabal-install bnfc doxygen curl python3-pip virtualenv openjdk-8-jdk openocd
  cabal update cmake-curses-gui
  sudo apt-get -y install cmake ccache cppcheck texlive-latex-base texlive-latex-extra asciidoctor pandoc graphviz ttf-mscorefonts-installer gcc-avr 
  pip3 install pynvim autopep8 cmake_format conan 
  sudo npm install -g eslint js-beautify remark-cli scmindent livedown
  
  bash ./install_jenkins.sh

  # Repo tools
  mkdir $HOME/bin
  PATH=$HOME/bin:$PATH
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
  chmod a+x ~/bin/repo 
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  if [ ! -e "$HOME/.vim/colors" ]
  then
    mkdir "$HOME/.vim/colors"
    echo "requirements: directory for color scheme monokai made"
  fi
  cp ./assets/monokai-colors/monokai.vim $HOME/.vim/colors/
  echo "requirements: Molokai colors file created/updated."
  echo 
  echo "========================"
  echo
}

function gui(){
  echo
  echo "========================"
  echo " GUI mode installations"
  echo "========================"
  echo 
  sudo apt-get -y install ghc libghc-regex-compat-dev libghc-syb-dev libghc-old-time-dev libghc-split-dev tcl-dev autoconf gperf flex bison iverilog verilator gtkwave 
  sudo snap -y install --classic code typora
  echo
  echo "========================="
  echo 
}

function help(){
  echo 
  echo "./requirements.sh [-i|-g|-h]"
  echo 
  echo " -c | --cli    : Install Packages associated with a command line system"
  echo " -g | --gui    : Install Packages associated with a graphical system"
  echo " -h | --help   : Print help text associated with this script"
  echo
  echo "---"
  echo
  }


## 
## string -> (void -> void)
case $1  in
  -c|--cli) cli ;;
  -g|--gui) cli; gui ;;
  -h|--help) help ;;
  *) help ;;
esac 

