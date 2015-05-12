#!/usr/bin/env bash

cd /tmp 

#giraph
if [[ -a /vagrant/artifacts/giraph-dist-1.1.0-hadoop2-bin.tar.gz ]]; then
    cp /vagrant/artifacts/giraph-dist-1.1.0-hadoop2-bin.tar.gz /tmp/
else
    wget http://www.trieuvan.com/apache/giraph/giraph-1.1.0/giraph-dist-1.1.0-hadoop2-bin.tar.gz
fi

tar -zxvf giraph-dist-1.1.0-hadoop2-bin.tar.gz
mv giraph-1.1.0-hadoop2-for-hadoop-2.5.1 /srv/software
ln -s /srv/software/giraph-1.1.0-hadoop2-for-hadoop-2.5.1 /srv/software/giraph

chown vagrant:vagrant -R /srv/software/giraph-1.1.0-hadoop2-for-hadoop-2.5.1
