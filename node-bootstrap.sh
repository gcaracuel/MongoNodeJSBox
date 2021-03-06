#!/usr/bin/env bash

# Get root up in here
sudo su

# Just a simple way of checking if you we need to install everything
if [ ! -d "/var/www" ]
then
    # Add mongo to apt
    apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list

    # Add Chris Lea's Node repo
    apt-key adv --keyserver keyserver.ubuntu.com --recv C7917B12
    echo 'deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu precise main' | sudo tee /etc/apt/sources.list.d/node.list


    # Update and begin installing some utility tools
    apt-get -y update

    apt-get install -y python-software-properties
    apt-get install -y vim git subversion curl
    apt-get install -y memcached build-essential
    apt-get install -y nodejs=0.10.17-1chl1~precise1
    apt-get install -y npm

    # Install latest stable version of mongo
    apt-get install mongodb-10gen


    # Symlink our host www to the guest /var/www folder
    ln -s /vagrant/www /var/www

    # Victory!
    echo "FINISHED!  Your default node server is now running. Find it in node-mongo-vagrant/www/default/"

    # Run it
    node /var/www/default/server.js
fi
