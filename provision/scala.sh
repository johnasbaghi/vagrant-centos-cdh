#!/usr/bin/env bash


cd /tmp/

# Scala
if [[ -a /vagrant/artifacts/scala-2.11.1.tgz ]]; then
    cp /vagrant/artifacts/scala-2.11.1.tgz /tmp/
else
    wget http://downloads.typesafe.com/scala/2.11.1/scala-2.11.1.tgz
fi

sudo tar xvf scala-2.11.1.tgz
sudo mv scala-2.11.1 /opt/scala


