# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

echo
echo "==="
echo "bashrc: satyamtiwary/dotfiles (main)"
echo "---"
# Load bash_env file if it exists
if [ -f $HOME/.bash_env ]; then
  #echo "bash_env: Custom Environment Variables    Found"
  source $HOME/.bash_env
fi

# tmux: list all sessions
echo
echo "tmux: list of sessions in progress:"
tmux list-sessions
echo "tmux: tska      Tmux Sessions Kill All"
echo "tmux: tskill    Tmux Kill most recent session"
echo "==="
echo

source $HOME/.bash_aliases


PROMPT="%h:%n(%B%F{cyan}%~%f%b) "

