#!/bin/bash
apt update
timedatectl set-timezone America/New_York
apt install apache2 mariadb-server php libapache2-mod-php php-mysql lsb-release gnupg2 -y
echo "deb https://zmrepo.zoneminder.com/debian/release-1.36 "`lsb_release -c -s`"/" >> /etc/apt/sources.list.d/zoneminder.list
wget -O - https://zmrepo.zoneminder.com/debian/archive-keyring.gpg | apt-key add -
apt-get update && apt install zoneminder=1.36.11-bullseye1 -y
systemctl enable zoneminder.service
systemctl start zoneminder
a2enconf zoneminder
a2enmod rewrite headers expires
service apache2 reload
