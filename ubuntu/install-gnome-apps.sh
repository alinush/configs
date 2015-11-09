#!/bin/bash

# Remove a few of these: Rhythmbox
#echo "Removing some crappy apps..."
#sudo apt-get remove rhythmbox

echo "Installing some new apps..."
sudo apt-get install -y \
    gedit-plugins \
    vlc \
    indicator-cpufreq \
    gpointing-device-settings \
    compizconfig-settings-manager \
    compiz-plugins \
    compiz-plugins-extra \
    recoll \
    sni-qt:i386 \
