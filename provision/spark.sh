#!/usr/bin/env bash

cd /tmp

# Spark
if [[ -a /vagrant/artifacts/spark-1.3.0-bin-hadoop2.3.tgz ]]; then
    cp /vagrant/artifacts/spark-1.3.0-bin-hadoop2.3.tgz /tmp/
else
    wget http://d3kbcqa49mib13.cloudfront.net/spark-1.3.0-bin-hadoop2.3.tgz
fi

tar -zxvf spark-1.3.0-bin-hadoop2.3.tgz

mv spark-1.3.0-bin-hadoop2.3 /usr/lib/

ln -s /usr/lib/spark-1.3.0-bin-hadoop2.3 /opt/spark

cp /vagrant/artifacts/spark-env.sh /opt/spark/conf/

chown vagrant:vagrant -R /usr/lib/spark-1.3.0-bin-hadoop2.3

mkdir -p /var/log/spark
chmod 777 /var/log/spark

/opt/spark/sbin/start-master.sh

/opt/spark/sbin/start-slaves.sh
