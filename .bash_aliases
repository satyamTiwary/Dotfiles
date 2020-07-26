#Helper Functions
cc() { cd "$@" && la; }
alias cd="cc"

#Basic Folder Navigation
alias la="ls -a" #added for compatibility with windows
alias .="ls -a"
alias ..="cc .."
alias ...="cc ../.."
alias ....="cc ../../.."
alias .....="cc ../../../.."
alias ~="cc $HOME"
alias o="xdg-open ." #TODO: make it applicable to windows too
alias df="df -h"

#Edit Aliases
alias bashrc="vim $HOME/.bash_aliases"
alias rebash="source $HOME/.bashrc && treload"
alias localenv="vim $HOME/.bash_env_local"

#Tmux Alias
alias vi="vim"
alias t="tmux"
  #tmux sessions
  alias tsls="tmux list-sessions"
  alias tls="tsls"
  alias tsnew="tmux new -s"
  alias tsatt="tmux attach -t"
  alias tsdet="tmux detach"
  alias tssw="tmux switch -t"
  alias tska="tmux kill-server"
  alias tskill="tmux kill-session"
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
alias gst="git status --short"
alias gad="git add"
alias gada="git add . && gst"
alias gadaa="git add --all && gst"
alias gadu="git add --update && gst"
alias gps="git push"
alias gpu="git pull"
alias gdf="git diff"
alias gdfa="git diff HEAD"
alias gcm="git commit --message"
alias gci="git commit --interactive"
alias grbi="git rebase --interactive"
alias glog="git log --graph --oneline --decorate --all"
alias glod="git log --pretty=format:'%h %ad %s' --date=short --all"
alias gin="git init"

function glf() { glod --grep="$1"; }

#Directories
alias 2cpp="cc $HOME/Cpp-Things"
alias 2c="cc $HOME/C-Things"
alias 2py="cc $HOME/Python-Things"
alias yocto="cc $HOME/Public/YoctoThings"

#Servers
LINODE_SERVER_IP="172.105.40.131"
LINODE_USER="satyam"
alias linode="mosh ${LINODE_USER}@${LINODE_SERVER_IP}"

