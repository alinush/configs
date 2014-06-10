CONFDIR=~/repos/configs/conf-files/bash
BASHRC=~/.bashrc

echo ""                         >> $BASHRC
echo ". $CONFDIR/colors.sh"     >> $BASHRC
echo ". $CONFDIR/grc.sh"        >> $BASHRC
echo ". $CONFDIR/history.sh"    >> $BASHRC
echo ". $CONFDIR/less.sh"       >> $BASHRC
echo ". $CONFDIR/prompt.sh"     >> $BASHRC
echo ". $CONFDIR/dircolors.sh"  >> $BASHRC
