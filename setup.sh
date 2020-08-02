#!/bin/bash

declare -a file_names=(".bashrc" ".bash_aliases" ".bash_env" ".gitconfig" ".vimrc" ".tmux.conf" ".tmux.conf.local" ".latexmkrc")
echo "Home Directory: $HOME
" 

chmod +x ./scripts/tmuxinator.sh
chmod +x ./scripts/ultisnips.sh
./scripts/tmuxinator.sh
./scripts/ultisnips.sh
echo ${DOCSFOLDER}

chmod +x ./tmuxinator/make_config.sh

tick=$'\u2714'
cross=$'\u2718'

# Copy files named above from this directory to home directory
copy_count=0
for i in "${file_names[@]}"
do
  # check if file exists, if not - create it
  if [ -f "$HOME/${i}" ]
  then
    echo "${i}:		File Exists"
  else
    echo "${i}:		${cross} File Does Not Exists."
    echo "File created by satyamtiwary/dotfiles/setup.sh" > $HOME/${i}
    echo "${i}:		${tick}  File created."
  fi
  
  diff ./conf/"${i}" $HOME/"${i}"
  difference=$(diff ./conf/${i} $HOME/${i})
  size=${#difference}
  if [ "${size}" -gt 0 ] 
  then
    if cp ./conf/"${i}" $HOME/"${i}"
    then
      echo "${i}:	${tick} Copied ./conf/${i} to $HOME/${i}"
      #source $HOME/${i}
      echo "${i}: 	${tick} file activated."
      copy_count=$((copy_count+1))
    else
      echo "${i}:	${cross} Copy Failed!"
    fi
  else
    echo "${i}:		${tick} File Already Up to date."
  fi
  echo ""
done

# If any copy was done: Reactivate the bash aliases
if [ "${copy_count}" -gt 0 ]
then
  echo "${tick} ${copy_count} files modified/added and activated." 
else
  echo "${cross} No new file(s) modified/added"
fi

