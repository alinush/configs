#!/bin/bash

# Remove a few of these: Rhythmbox
#echo "Removing some crappy apps..."
#sudo apt-get remove rhythmbox

# VLC, git, svn
echo "Installing some new apps..."
sudo apt-get install -y vim \
    minicom \
    subversion \
    git \
    libxss1 \
    gedit-plugins \
    vlc \
    apt-file \
    indicator-cpufreq \
    gpointing-device-settings \
    htop \
    iotop \
    xclip \
    compizconfig-settings-manager \
    compiz-plugins \
    compiz-plugins-extra \
    markdown \
    colordiff \
    dos2unix \
    recoll \
    jhead \
    exiftool \
