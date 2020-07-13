#!/bin/bash

declare -a file_names=(".bash_aliases" ".gitconfig" ".vimrc")
home=${1:-'~'}
echo "Home Directory: ${home}
"

tick=$'\u2714'
cross=$'\u2718'

# Copy files named above from this directory to home directory
copy_count=0
for i in "${file_names[@]}"
do
  diff ./"${i}" ${home}/"${i}"
  difference=$(diff ./${i} ${home}/${i})
  size=${#difference}
  if [ "${size}" -gt 0 ] 
  then
    if cp ./"${i}" ${home}/"${i}"
    then
      echo "${tick} Copied ./${i} to ${home}/${i}"
      copy_count=$((copy_count+1))
    else
      echo "${cross} Copy Failed!"
    fi
  else
    echo "${tick} File Already Up to date."
  fi
done

# If any copy was done: Reactivate the bash aliases
if [ "${copy_count}" -gt 0 ]
then
  source ~/.bash_aliases
  echo "${tick} New aliases activated"
else
  echo "${cross} No new aliases to be activated"
fi

# Setup Environment Variables
#echo 'Setting environment variables'
export NAME='SatyamTiwary'
#export EMAIL='satyamtiwary@vvbiotech.com'
export GITHUB='https//github.com/$NAME/'

