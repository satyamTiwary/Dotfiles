#!/bin/bash

echo 'Copying .bash_aliases to the home directory.'
cp ./.bash_aliases ~/
echo '	-> Done.'
echo 'Copying .gitconfig to the home directory.'
cp ./.gitconfig ~/
echo '	-> Done'

source ~/.bash_aliases
echo 'New aliases activated.'

# Environment Variables
echo 'Setting environment variables'
export NAME='SatyamTiwary'
export EMAIL='satyamtiwary@vvbiotech.com'
export GITHUB='https//github.com/$NAME/'

cd ~
