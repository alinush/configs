set -e 
scriptdir=$(readlink -f $(dirname $0))

sudo apt-get install grc
ln -s $scriptdir/conf-files/grc ~/.grc
