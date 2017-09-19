set -e 
scriptdir=$( cd $(dirname $0) ; pwd -P )

[ "$OS" = "Linux" -a "$OS_FLAVOR" = "Ubuntu" ] && sudo apt-get install grc

ln -s "$scriptdir/conf-files/grc" ~/.grc

echo
echo "All done!"
echo
