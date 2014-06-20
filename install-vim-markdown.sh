set -e

cd /tmp

if cat /etc/issue | grep Ubuntu >/dev/null; then
    echo
    echo "Detected Ubuntu using /etc/issue"
    echo
    sudo apt-get install -y vim-addon-manager
    git clone https://github.com/plasticboy/vim-markdown.git
    cd vim-markdown
    sudo make install
    vim-addon-manager install mkd
fi
