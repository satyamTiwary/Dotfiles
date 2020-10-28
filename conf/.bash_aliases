#Helper Functions
function cc() { cd "$@" && la; }
function cm() {
  if [ ! -e "$@" ]
  then
    mkdir "$@"
  fi
  cc "$@";
}

alias his="history 10"

alias cd="cc"

#Basic Folder Navigation
alias la="ls -a" #added for compatibility with windows
function lt() { tree -a --prune -I $(cat .gitignore ~/.gitignore | egrep -v "^#.*$|^[[:space:]]*$" | tr "\\n" "|") -L 2; }
alias ltc="lt | column"
alias ..="cc .."
alias ...="cc ../.."
alias ....="cc ../../.."
alias .....="cc ../../../.."
alias ~="cc $HOME"
alias df="df -h"
function o() { 
  if ! command -v X &> /dev/null 
  then
    vim .
  else
    xdg-open .
  fi 
}

#Edit Aliases
alias bashrc="vim $HOME/.bash_aliases"
alias rebash="source $HOME/.bashrc && treload"
alias localenv="vim $HOME/.bash_env_local"

#Tmux Alias
alias vi="vim"
alias tmux='tmux -u'
#tmux sessions
alias tsls="tmux list-sessions"
alias tls="tsls"
alias tsnew="tmux new -s"
alias tsatt="tmux attach -t"
alias tsat="tmux attach -t"
alias tsdet="tmux detach"
alias tsdett="tmux detach"
alias tssw="tmux switch -t"
alias tska="tmux kill-server && tsls"
alias tskill="tmux kill-session && tsls"
#tmux windows
alias twnw="tmux new-window"    #prefix + c
alias twls="tmux list-windows"
alias twsw="tmux select-window" #prefix + 0-9
alias twrw="tmux rename-window" #prefix + ,
alias twkill="tmux kill-window"
#tmux general
alias tres="tmux-resurrect"
alias tlk="tmux list-keys"
alias tlc="tmux list-commands"
alias tinfo="tmux info"
alias treload="tmux source-file $HOME/.tmux.conf"
#tmuxinator
alias tx="tmuxinator"
alias txnew="tx new"
alias txstart="tx start"
alias txedit="tx edit"
alias txstop="tx stop"
alias txls="tx list"
alias txdel="tx delete"
alias txcp="tx copy"

#Git Aliases
function gclone() { git clone $MYGIT/$1; }
alias gst="git status --short"
alias gad="git add"
alias gada="git add . && gst"
alias gadaa="git add --all && gst"
alias gadu="git add --update && gst"
alias gadc="git add .; git commit --message"
alias gps="git push"
alias gpu="git pull"
alias gdf="git diff"
alias gdfa="git diff HEAD"
alias gcm="git commit --message"
alias gci="git commit --interactive"
alias grbi="git rebase --interactive"
alias gloga="git log --graph --oneline --decorate --all"
alias glog="git log --graph --oneline --decorate --max-count=10"
alias glod="git log --pretty=format:'%h %ad %s' --date=short --all"
alias gin="git init"
alias gcb="git checkout -b"


function glf() { glod --grep="$1"; }

source "$HOME/.bash_env_local"
#Directories
alias 2docs="cc $DOCSFOLDER"
alias 2dots="cc $HOME/dotfiles"

alias 2c="cm $DOCSFOLDER/C-Things"
alias 2cpp="cm $DOCSFOLDER/Cpp-Things"
alias 2py="cm $DOCSFOLDER/Python-Things"
alias 2sicp="cm $DOCSFOLDER/SICP-Things"
alias 2yocto="cm $HOME/Public/Yocto-Things"
alias 2haskell="cm $DOCSFOLDER/Haskell-Things"
alias 2bsc="cm $DOCSFOLDER/Bluespec-Things"
alias 2bnfc="cm $DOCSFOLDER/BNFC-Things"

alias 2snips="cm $HOME/.vim/UltiSnips/"

alias 2notes="cm $DOCSFOLDER/Notes"

function 2pro() {
  cm $DOCSFOLDER/Notes/ProceduralNotes/$1
}
complete -W "c cpp linux haskell python React html-css markup yocto riscv git installation-history" 2pro 

alias 2latex="cm $DOCSFOLDER/Notes/Latex"
alias 2story="cm $DOCSFOLDER/Story-Things"

# Open
alias obib="vi $DOCSFOLDER/Notes/Latex/main.bib"

#Servers
LINODE_SERVER_IP="172.105.40.131"
LINODE_USER="satyam"
alias linode="mosh ${LINODE_USER}@${LINODE_SERVER_IP}"

#Applications
alias matl="cm $DOCSFOLDER/Matlab-Things && matlab -nodesktop -nosplash"
