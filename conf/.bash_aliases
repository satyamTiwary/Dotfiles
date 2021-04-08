#Helper Functions
alias la="ls -a"
cl() { cd "$@" && ls; }
alias cd=cl

alias his="history 10"

#Basic Folder Navigation
function lt() { tree -a --prune -I $(cat .gitignore ~/.gitignore | egrep -v "^#.*$|^[[:space:]]*$" | tr "\\n" "|") -L 2; }
alias ltc="lt | column"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd $HOME"
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
PROMPT_COMMAND='if [[ "$bashrc" != "$PWD" && "$PWD" != "$HOME" && -e .bashrc ]]; then bashrc="$PWD"; . .bashrc; fi'


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
alias gundo="git reset --soft HEAD~1"


function glf() { glod --grep="$1"; }

source "$HOME/.bash_env_local"
#Directories
alias 2docs="cd $DOCSFOLDER"
alias 2dots="cd $HOME/dotfiles"
alias 2dev="cd $HOME/Dev"
alias 2ins="cd $HOME/Installs"

alias 2c="cd $DOCSFOLDER/C-Things"
alias 2cpp="cd $DOCSFOLDER/Cpp-Things"
alias 2py="cd $DOCSFOLDER/Python-Things"
alias 2yocto="cd $HOME/Public/Yocto-Things"
alias 2haskell="cd $DOCSFOLDER/Haskell-Things"

alias 2snips="cd $HOME/.vim/UltiSnips/"

alias 2notes="cd $DOCSFOLDER/Notes"

function 2pro() {
  cd $DOCSFOLDER/Notes/ProceduralNotes/$1
}
#complete -W "c cpp linux haskell python React html-css markup yocto riscv git installation-history" 2pro 

alias 2latex="cd $DOCSFOLDER/Notes/Latex"
alias 2story="cd $DOCSFOLDER/Story-Things"

# Open
alias obib="vi $DOCSFOLDER/Notes/Latex/main.bib"

#Servers
LINODE_SERVER_IP="172.105.40.131"
LINODE_USER="satyam"
alias linode="mosh ${LINODE_USER}@${LINODE_SERVER_IP}"

#Applications
alias matl="cd $DOCSFOLDER/Matlab-Things && matlab -nodesktop -nosplash"
