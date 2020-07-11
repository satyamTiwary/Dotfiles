echo "Copying .bash_aliases to the home directory."
cp ./.bash_aliases ~/
echo "Done."
echo "Copying .gitconfig to the home directory."
cp ./.gitconfig ~/
echo "Done"

source ~/.bash_aliases
echo "New aliases activated."
