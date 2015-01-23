set -e

mkdir -p /srv/software
chmod 777 /srv/software

# Install cloudera repo 
cd /tmp
wget http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm
sudo yum --nogpgcheck localinstall -y cloudera-cdh-5-0.x86_64.rpm
sudo rpm --import http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera
rm cloudera-cdh-5-0.x86_64.rpm

# Install and setup hadoop/yarn
sudo yum install -y hadoop-conf-pseudo

if [[ -a /vagrant/artifacts/jdk-7u72-linux-x64.tar.gz ]]; then
    cp /vagrant/artifacts/jdk-7u72-linux-x64.tar.gz /tmp/jdk-7u72-linux-x64.tar.gz
else
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u72-b14/jdk-7u72-linux-x64.tar.gz"
fi

tar -zxvf *.tar.gz*

mkdir -p /usr/lib/jvm
mv /tmp/jdk1.7.0_72 /usr/lib/jvm
ln -s /usr/lib/jvm/jdk1.7.0_72 /usr/lib/jvm/default-java

alternatives --install /usr/bin/java java /usr/lib/jvm/default-java/bin/java 2
alternatives --install /usr/bin/jar jar /usr/lib/jvm/default-java/bin/jar 2
alternatives --install /usr/bin/javac javac /usr/lib/jvm/default-java/bin/javac 2
alternatives --set jar /usr/lib/jvm/default-java/bin/jar
alternatives --set javac /usr/lib/jvm/default-java/bin/javac

cp /vagrant/artifacts/java-profile.sh /etc/profile.d/java.sh

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

# Install Maven for java development
wget http://apache.mesi.com.ar/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz

sudo tar -zxvf apache-maven-3.2.5-bin.tar.gz
sudo mv apache-maven-3.2.5 /usr/lib
sudo rm /tmp/apache-maven-3.2.5-bin.tar.gz
sudo ln -s /usr/lib/apache-maven-3.2.5/ /usr/lib/maven

cp /vagrant/artifacts/maven-profile.sh /etc/profile.d/maven.sh

# Gradle
wget http://services.gradle.org/distributions/gradle-2.2.1-bin.zip
sudo unzip gradle-2.2.1-bin.zip
sudo mv gradle-2.2.1 /usr/lib
sudo ln -s /usr/lib/gradle-2.2.1 /usr/lib/gradle

cp /vagrant/artifacts/gradle-profile.sh /etc/profile.d/gradle.sh



# Spark
sudo wget http://d3kbcqa49mib13.cloudfront.net/spark-1.2.0-bin-hadoop2.3.tgz
tar -zxvf spark-1.2.0-bin-hadoop2.3.tgz

mv spark-1.2.0-bin-hadoop2.3 /usr/lib/

ln -s /usr/lib/spark-1.2.0-bin-hadoop2.3 /usr/lib/spark

cp /vagrant/artifacts/spark-env.sh /usr/lib/spark/conf/

sudo chown vagrant:vagrant -R /usr/lib/spark-1.2.0-bin-hadoop2.3

mkdir -p /var/log/spark
chmod 777 /var/log/spark

/usr/lib/spark/sbin/start-master.sh


yum -y install git


#giraph

wget http://www.trieuvan.com/apache/giraph/giraph-1.1.0/giraph-dist-1.1.0-hadoop2-bin.tar.gz
tar -zxvf giraph-dist-1.1.0-hadoop2-bin.tar.gz
mv giraph-1.1.0-hadoop2-for-hadoop-2.5.1 /srv/software
ln -s /srv/software/giraph-1.1.0-hadoop2-for-hadoop-2.5.1 /srv/software/giraph

sudo chown vagrant:vagrant -R /srv/software/giraph-1.1.0-hadoop2-for-hadoop-2.5.1
