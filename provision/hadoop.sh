#!/usr/bin/env bash

cd /tmp

if [[ -a /vagrant/artifacts/cloudera-cdh-5-0.x86_64.rpm ]]; then
    cp /vagrant/artifacts/cloudera-cdh-5-0.x86_64.rpm /tmp/
else
    wget http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm
fi

yum --nogpgcheck localinstall -y cloudera-cdh-5-0.x86_64.rpm
rpm --import http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera
rm cloudera-cdh-5-0.x86_64.rpm

# Install and setup hadoop/yarn
yum install -y hadoop-conf-pseudo


sudo -u hdfs hdfs namenode -format

for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done

/usr/lib/hadoop/libexec/init-hdfs.sh 

# sudo -u hdfs hadoop fs -mkdir -p /tmp/hadoop-yarn/staging/history/done_intermediate
# sudo -u hdfs hadoop fs -chown -R mapred:mapred /tmp/hadoop-yarn/staging 
# sudo -u hdfs hadoop fs -chmod -R 1777 /tmp 
# sudo -u hdfs hadoop fs -mkdir -p /var/log/hadoop-yarn
# sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-yarn

service hadoop-yarn-resourcemanager start
service hadoop-yarn-nodemanager start
service hadoop-mapreduce-historyserver start

sudo -u hdfs hadoop fs -mkdir -p /user/vagrant
sudo -u hdfs hadoop fs -chown vagrant /user/vagrant

# Install and setup zookeeper
yum install -y zookeeper-server
service zookeeper-server init
service zookeeper-server start
