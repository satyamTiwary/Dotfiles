#Helper Functions
cc() { cd "$@" && la; }

DOCSFOLDER="~/${DOCSFOLDER}"

#Basic Folder Navigation
alias la="ls -a" #added for compatibility with windows
alias .="la"
alias ..="cc .."
alias ...="cc ../.."
alias ~="cc ~"
alias o="xdg-open ." #TODO: make it applicable to windows too

#Edit Aliases
alias bashrc="vim ~/.bash_aliases"
alias rebash="source ~/.bashrc"

#Directories
alias 2cpp="cc ${DOCSFOLDER}/Cpp-Things"
alias 2c="cc ${DOCSFOLDER}/C-Things"
alias 2py="cc ${DOCSFOLDER}/Python-Things"

alias yocto="cc ~/Public/YoctoThings"
