#!/usr/bin/env bash

PROJECT_NAME=$1

if [ $# -eq 0 ]
  then
    echo "No symfony app name supplied!"
    exit 1;
fi

## config new project on nginx
cd /vagrant/scripts
sudo ./create-sites-symfony.sh $PROJECT_NAME

## download symfony standard project
wget https://github.com/symfony/symfony-standard/archive/master.zip && unzip master.zip && rm -rf master.zip

sudo rm -rf /vagrant/sites/$PROJECT_NAME && mv symfony-standard-master /vagrant/sites/$PROJECT_NAME

## overwrite app_dev
cp /vagrant/scripts/config/app_dev.php /vagrant/sites/$PROJECT_NAME/web/
cp /vagrant/scripts/config/parameters.yml /vagrant/sites/$PROJECT_NAME/app/config/
cd /vagrant/sites/$PROJECT_NAME && composer --prefer-dist install