#!/usr/bin/env bash

yum -y install libxml2-devel

cd /tmp 

# python igraph
if [[ -a /vagrant/artifacts/igraph-0.7.1.tar.gz ]]; then
    cp /vagrant/artifacts/igraph-0.7.1.tar.gz /tmp/
else
    wget http://igraph.org/nightly/get/c/igraph-0.7.1.tar.gz
fi

tar -xvf igraph-0.7.1.tar.gz

cd igraph-0.7.1/
./configure
make check
make install

cd /tmp

if [[ -a /vagrant/artifacts/python-igraph-0.7.tar.gz ]]; then
    cp /vagrant/artifacts/python-igraph-0.7.tar.gz /tmp/
else
    wget --no-check-certificate https://pypi.python.org/packages/source/p/python-igraph/python-igraph-0.7.tar.gz
fi

tar -xvf python-igraph-0.7.tar.gz
cd python-igraph-0.7/

python2.7 setup.py install
