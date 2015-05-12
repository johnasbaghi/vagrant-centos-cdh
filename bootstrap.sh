#!/usr/bin/env bash

set -e

cp /vagrant/artifacts/bashrc ~/.bashrc 

. ~/.bashrc 

if [[ ! -d /srv/software ]]; then 
    mkdir -p /srv/software
fi

chmod 777 /srv/software
cd /tmp

yum -y install git

#Turn off iptables
service iptables stop
chkconfig iptables off

/vagrant/provision/python.sh

/vagrant/provision/python-packages.sh

/vagrant/provision/java.sh

/vagrant/provision/maven.sh

/vagrant/provision/gradle.sh

# Install cloudera repo 
/vagrant/provision/hadoop.sh


# #Turn off bell
# echo "set bell-style none" > /home/vagrant/.inputrc
# sudo chown vagrant:vagrant /home/vagrant/.inputrc

/vagrant/provision/spark.sh

#/vagrant/provision/giraph.sh

/vagrant/provision/elasticsearch.sh

/vagrant/provision/mitie.sh

/vagrant/provision/igraph.sh

/vagrant/provision/scala.sh
