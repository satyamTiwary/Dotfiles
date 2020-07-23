#Helper Functions
cc() { cd "$@" && la; }
alias cd="cc"
DOCSFOLDER="~/${DOCSFOLDER}"

#Basic Folder Navigation
alias la="ls -a" #added for compatibility with windows
alias .="ls -a"
alias ..="cc .."
alias ...="cc ../.."
alias ....="cc ../../.."
alias .....="cc ../../../.."
alias ~="cc ~"
alias o="xdg-open ." #TODO: make it applicable to windows too
alias df="df -h"
#Edit Aliases
alias bashrc="vim ~/.bash_aliases"
alias rebash="source ~/.bashrc"

#Git Aliases
alias gst="git status"
alias gad="git add"
alias gps="git push"
alias gpu="git pull"
alias gdf="git diff"
alias gcm="git commit -m"

#Directories
alias 2cpp="cc ${DOCSFOLDER}/Cpp-Things"
alias 2c="cc ${DOCSFOLDER}/C-Things"
alias 2py="cc ${DOCSFOLDER}/Python-Things"
alias yocto="cc ~/Public/YoctoThings"

#Servers
LINODE_SERVER_IP="172.105.40.131"
LINODE_USER="satyam"
alias linode="mosh ${LINODE_USER}@${LINODE_SERVER_IP}"

