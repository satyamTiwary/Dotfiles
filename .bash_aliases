#Helper Functions
cc() { cd "$@" && la; }

#Basic Folder Navigation
alias .="la"
alias ..="cc .."
alias ...="cc ../.."
alias ~="cc ~"
alias o="xdg-open ."

#Edit Aliases
alias bashrc="vim ~/.bash_aliases"
alias rebash="source ~/.bashrc"

#Directories
alias cpp="cc ~/Documents/CppThings"
alias yocto="cc ~/Public/YoctoThings"
