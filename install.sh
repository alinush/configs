set -e
scriptdir=$(readlink -f $(dirname $0))

[ -f ~/.bash_aliases ] && mv ~/.bash_aliases ~/.bash_aliases_old
ln -s $scriptdir/conf-files/bash/.bash_aliases ~/.bash_aliases

[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc_old
ln -s $scriptdir/conf-files/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/colors
cp $scriptdir/conf-files/vim/monokai.vim ~/.vim/colors

[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig_old
ln -s $scriptdir/conf-files/.gitconfig ~/.gitconfig
