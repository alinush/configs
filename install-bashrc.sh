set -e 

CONFDIR=~/repos/configs/conf-files/bash
BASHRC=~/.bashrc

echo ""                         >> $BASHRC

if grep Fedora /etc/issue >/dev/null; then
    echo " . /etc/bashrc" >> $BASHRC
    echo "[ -f ~/.bash_aliases ] && . ~/.bash_aliases" >> $BASHRC
fi

echo ". $CONFDIR/colors.sh"     >> $BASHRC
echo ". $CONFDIR/grc.sh"        >> $BASHRC
echo ". $CONFDIR/history.sh"    >> $BASHRC
echo ". $CONFDIR/less.sh"       >> $BASHRC
echo ". $CONFDIR/prompt.sh"     >> $BASHRC
echo ". $CONFDIR/dircolors.sh"  >> $BASHRC
