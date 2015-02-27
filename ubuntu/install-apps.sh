#!/bin/bash

# Remove a few of these: Rhythmbox
#echo "Removing some crappy apps..."
#sudo apt-get remove rhythmbox

# VLC, git, svn
echo "Installing some new apps..."
sudo apt-get install -y vim minicom subversion git libxss1 gedit-plugins \
    build-essential vlc apt-file indicator-cpufreq eclipse eclipse-cdt \
    gpointing-device-settings htop iotop xclip compizconfig-settings-manager \
    compiz-plugins compiz-plugins-extra

