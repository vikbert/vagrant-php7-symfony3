#!/usr/bin/env bash

export LC_ALL="en_US.UTF-8" && /vagrant/makephp 7 && /vagrant/newphp 70

cd /vagrant/scripts/

# reset & clean up nginx
sudo ./clear-sites.sh

# install phpredis extension and redis server
suodo ./install_redis.sh

sudo apt-get install -y unzip nodejs npm wget curl