set -e
scriptdir=$(readlink -f $(dirname $0))

cd /tmp

#
# Moved this to .vimrc
#
#if [ -f /etc/issue ] ; then
#    if cat /etc/issue | grep Ubuntu >/dev/null; then
#        echo
#        echo "Detected Ubuntu in /etc/issue"
#        echo
#        sudo apt-get install -y vim-addon-manager markdown
#        git clone https://github.com/plasticboy/vim-markdown.git
#        cd vim-markdown
#        sudo make install
#        vim-addon-manager install mkd
#    fi
#fi

sudo apt-get install vim-gocomplete
vim-addon-manager install gocode
vim-addon-manager install go-syntax

# Create a backup directory for vim
mkdir -p ~/.backup/vim/swap
# Create the colors directory for vim
mkdir -p ~/.vim/colors

# Create symlink to vimrc
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.`date +%s`
ln -s $scriptdir/conf-files/vim/.vimrc ~/.vimrc

# Add monokai color scheme
cp $scriptdir/conf-files/vim/monokai.vim ~/.vim/colors
