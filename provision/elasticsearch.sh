#!/usr/bin/env bash

cd /tmp

# elasticsearch
if [[ -a /vagrant/artifacts/elasticsearch-1.4.2.noarch.rpm ]]; then
    cp /vagrant/artifacts/elasticsearch-1.4.2.noarch.rpm /tmp/
else
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.noarch.rpm
fi
 
rpm -Uvh elasticsearch-1.4.2.noarch.rpm

/sbin/chkconfig --add elasticsearch
chkconfig elasticsearch on
