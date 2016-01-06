set -e
scriptdir=$(readlink -f $(dirname $0))

confdir=$scriptdir/../conf-files

sudo apt-get install tmux

[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.`date +%s`
[ -L ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.`date +%s`
ln -s $confdir/.tmux.conf ~/.tmux.conf
