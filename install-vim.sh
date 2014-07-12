set -e

cd /tmp


if cat /etc/issue | grep Ubuntu >/dev/null; then
    echo
    echo "Detected Ubuntu in /etc/issue"
    echo
    sudo apt-get install -y vim-addon-manager markdown
    git clone https://github.com/plasticboy/vim-markdown.git
    cd vim-markdown
    sudo make install
    vim-addon-manager install mkd
fi

# Create a backup directory for vim
mkdir -p ~/.backup/vim/swap
# Create the colors directory for vim
mkdir -p ~/.vim/colors

# Create symlink to vimrc
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc_old
ln -s $scriptdir/conf-files/vim/.vimrc ~/.vimrc

# Add monokai color scheme
cp $scriptdir/conf-files/vim/monokai.vim ~/.vim/colors
