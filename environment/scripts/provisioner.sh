#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
echo ">>> Updating system software (this will take a while)..."
apt-get -y update
DEBIAN_FRONTEND=noninteractive DEBIAN_PRIORITY=critical apt-get -q -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade
DEBIAN_FRONTEND=noninteractive DEBIAN_PRIORITY=critical apt-get -q -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" dist-upgrade
apt-get -y update
echo ">>> System software updated!"

echo ">>> Installing Apache..."
apt-get -y install apache2
echo ">>> Apache installed!"

echo ">>> Enabling mod_rewrite..."
a2enmod rewrite
echo ">>> mod_rewrite enabled!"

echo ">>> Creating docroot directory..."
mkdir -p /var/www/vagrant-base
echo ">>> docroot directory created!"

echo ">>> Final restarts..."
service apache2 restart
