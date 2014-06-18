set -e
sudo yum update
sudo yum install vim git
sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
sudo yum update
sudo yum install freetype-freeworld
gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "hinting" "slight"
gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "antialiasing" "rgba"
echo "Xft.lcdfilter: lcddefault" > ~/.Xresources
sudo yum remove firefox
