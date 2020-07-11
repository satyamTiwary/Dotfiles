#Helper Functions
cc() { cd "$@" && ls; }

#Basic Folder Navigation
alias .="ls"
alias ..="cc .."
alias ...="cc ../.."
alias ~="cc ~"
alias o="xdg-open ."

#Edit Aliases
alias bashrc="nano ~/.bash_aliases"
alias rebash="source ~/.bashrc"

#Directories
alias cpp="cc ~/Documents/CppThings"
alias yocto="cc ~/Public/YoctoThings"
