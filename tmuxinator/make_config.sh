#
#
#

Help() {
  echo
  echo "Generate a tmuxinator template yml file"
  echo "Syntax: make_config.sh [-Options] <Project_Name> <Root_Directory>" 
  echo
  echo "  options:" 
  echo "    -h --help     Print this Help"
  echo
  echo "Root_Directory:   ~(default), or example: ~/Documents"
  echo
}

while getopts ":h" option; do
  case $option in
    h) # display Help
      Help
      exit;;
  esac
done

CONFIGNAME=${1}
CONFIGROOT=${2:-$HOME}

if [ -z $CONFIGNAME ];
then
  read -p 'Input Config Name: ' CONFIGNAME
fi

(
echo "cat << EOF"
cat template.sample
echo EOF
) | bash > $CONFIGNAME.yml

echo
echo "Config Name: $CONFIGNAME"
echo "Config Root Directory: $CONFIGROOT"
echo
echo "Config file generated $CONFIGNAME.yml"
echo

