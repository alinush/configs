mv ~/.bash_aliases ~/.bash_aliases_old
ln -s ~/repos/configs/conf-files/bash/.bash_aliases ~/.bash_aliases

mv ~/.vimrc ~/.vimrc_old
ln -s ~/repos/configs/conf-files/.vimrc ~/.vimrc

mv ~/.gitconfig ~/.gitconfig_old
ln -s ~/repos/configs/conf-files/.gitconfig ~/.gitconfig

[ -f ~/.profile_mine ] && mv ~/.profile_mine ~/.profile_mine_old
cp ~/repos/configs/conf-files/bash/.profile_mine ~/.profile_mine
