cd ~/Downloads && wget -c http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
sudo dpkg -i AdbeRdr9.5.5-1_i386linux_enu.deb
sudo apt-get -y install -f 
sudo apt-get -y install libgtk2.0-0:i386 libnss3-1d:i386 libnspr4-0d:i386 lib32nss-mdns libxml2:i386 libxslt1.1:i386 libstdc++6:i386 libpangoxft-1.0.0:i386 libpangox-1.0.0:i386 libidn11:i386
