## Summary
`Vagrant php7 symfony3` is a Debian 8 virtual box, which is preconfigured for testing PHP7, Symfony 3 apps and developing extensions across many versions of PHP. It contains many essential development packages, which are common used 
in Symfony project.


## Before Installation

Make sure that you are at least at Vagrant version 1.7.x and virtualbox 5.x

If you are on Windows use the [Manual Install](#manual-install) instructions or use git-bash.

## 1. Start Vagrant Box
```
$ git clone https://github.com/vikbert/vagrant-php7-symfony3.git
$ cd vagrant-php7-symfony3
$ vagrant up
$ vagrant ssh
```

## 2. Config the `/etc/hosts`
Add this to your hosts file on the hostmachine, for example on my MacbookPro machine

```
192.168.7.7 php7default
```

To view the demo application, go to `http://php7default` in the browser.g

![phpinfo page](assets/php7default.png?raw=true "phpinfo page")


## 3. Create new Symfony Websites

added Symfony app name `php7symfony` as server alias to `/etc/hosts` on the host machine

```
192.168.7.7  php7symfony php7symfony.local
```

create Symfony App named `php7symfony` in vagrant machine

```
$ vagrant ssh
$ cd /vagrant/scripts
$ sudo ./create-sites-symfony.sh php7symfony
```

Check the URL `http://php7symfony` in the browser
 
![Symfony 3 standard project](assets/php7symfony-3.png?raw=true "symfony 3 standard project")
