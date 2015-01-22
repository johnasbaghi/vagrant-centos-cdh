set -e
# Install cloudera repo 
cd /tmp
wget http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm
sudo yum --nogpgcheck localinstall -y cloudera-cdh-5-0.x86_64.rpm
sudo rpm --import http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera
rm cloudera-cdh-5-0.x86_64.rpm

# Install and setup hadoop/yarn
sudo yum install -y hadoop-conf-pseudo
sudo yum install -y java-1.7.0-openjdk-devel
sudo -u hdfs hdfs namenode -format
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done
sudo -u hdfs hadoop fs -mkdir -p /tmp/hadoop-yarn/staging/history/done_intermediate
sudo -u hdfs hadoop fs -chown -R mapred:mapred /tmp/hadoop-yarn/staging 
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp 
sudo -u hdfs hadoop fs -mkdir -p /var/log/hadoop-yarn
sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-yarn
sudo service hadoop-yarn-resourcemanager start
sudo service hadoop-yarn-nodemanager start
sudo service hadoop-mapreduce-historyserver start
sudo -u hdfs hadoop fs -mkdir -p /user/vagrant
sudo -u hdfs hadoop fs -chown vagrant /user/vagrant

# Install and setup zookeeper
sudo yum install -y zookeeper-server
sudo service zookeeper-server init
sudo service zookeeper-server start

#Turn off iptables
sudo service iptables stop
chkconfig iptables off

#Turn off bell
echo "set bell-style none" > /home/vagrant/.inputrc
sudo chown vagrant:vagrant /home/vagrant/.inputrc

# Set java_home
echo "export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64" >> /home/vagrant/.bashrc

# Install Maven for java development
wget http://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
cd /usr/local
sudo tar xvf /tmp/apache-maven-3.0.5-bin.tar.gz
sudo rm /tmp/apache-maven-3.0.5-bin.tar.gz
sudo ln -s apache-maven-3.0.5/ maven
echo "export M2_HOME=/usr/local/maven" >> /home/vagrant/.bashrc
echo "export PATH=\$M2_HOME/bin:\${PATH}" >> /home/vagrant/.bashrc
