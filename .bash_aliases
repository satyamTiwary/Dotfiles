#Helper Functions
cc() { cd "$@" && la; }

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
alias cpp="cc ~/Documents/CppThings"
alias yocto="cc ~/Public/YoctoThings"
