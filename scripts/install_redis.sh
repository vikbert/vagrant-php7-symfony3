#!/usr/bin/env bash

sudo apt-get update && apt-get install -y software-properties-common
sudo apt-get update
sudo apt-get install -y redis-server

cd /home/vagrant/src

function clonePhpRedis() {
	sudo rm -rf phpredis
	git clone  https://github.com/phpredis/phpredis.git	
}

function switchPhpredisToPhp7() {
	cd phpredis
	git checkout php7
	makeext 7
	sudo service php-fpm restart
	sudo service nginx restart
}
## path: /home/vagrant/src
if ! clonePhpRedis
then 
	echo >&2 'Cloing phpredis failed.' ## sending the output to standard error instead of standard out
	exit 1
else
	switchPhpredisToPhp7
fi






