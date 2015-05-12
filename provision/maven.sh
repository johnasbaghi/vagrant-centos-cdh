#!/usr/bin/env bash

cd /tmp 

# Install Maven for java development
if [[ -a /vagrant/artifacts/apache-maven-3.2.5-bin.tar.gz ]]; then
    cp /vagrant/artifacts/apache-maven-3.2.5-bin.tar.gz /tmp/
else
    wget http://apache.mesi.com.ar/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
fi

sudo tar -zxvf apache-maven-3.2.5-bin.tar.gz
sudo mv apache-maven-3.2.5 /usr/lib
sudo rm /tmp/apache-maven-3.2.5-bin.tar.gz
sudo ln -s /usr/lib/apache-maven-3.2.5/ /usr/lib/maven

cp /vagrant/artifacts/maven-profile.sh /etc/profile.d/maven.sh
