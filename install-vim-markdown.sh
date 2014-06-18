set -e

cd /tmp
sudo apt-get install -y vim-addon-manager
git clone https://github.com/plasticboy/vim-markdown.git
cd vim-markdown
sudo make install
vim-addon-manager install mkd
