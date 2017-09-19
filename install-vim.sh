set -e
#scriptdir=$(readlink -f $(dirname $0))
scriptdir=$( cd $(dirname $0) ; pwd -P )

. $scriptdir/shlibs/os.sh

cd /tmp

if [ "$OS" = "Linux" -a "$OS_FLAVOR" = "Ubuntu" ]; then
    :
fi

# Create a backup directory for vim
mkdir -p ~/.backup/vim/swap
# Create the colors directory for vim
mkdir -p ~/.vim/colors

# Create symlink to vimrc
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.`date +%s`
ln -s $scriptdir/conf-files/vim/.vimrc ~/.vimrc

# Add monokai color scheme
cp $scriptdir/conf-files/vim/monokai.vim ~/.vim/colors

echo
echo "All done!"
echo
