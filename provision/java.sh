#!/usr/bin/env bash

cd /tmp

if [[ -a /vagrant/artifacts/jdk-7u72-linux-x64.tar.gz ]]; then
    cp /vagrant/artifacts/jdk-7u72-linux-x64.tar.gz /tmp/jdk-7u72-linux-x64.tar.gz
else
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u72-b14/jdk-7u72-linux-x64.tar.gz"
fi

tar -zxvf jdk-7*

mkdir -p /usr/lib/jvm
mv /tmp/jdk1.7.0_72 /usr/lib/jvm
ln -s /usr/lib/jvm/jdk1.7.0_72 /usr/lib/jvm/default-java

alternatives --install /usr/bin/java java /usr/lib/jvm/default-java/bin/java 2
alternatives --install /usr/bin/jar jar /usr/lib/jvm/default-java/bin/jar 2
alternatives --install /usr/bin/javac javac /usr/lib/jvm/default-java/bin/javac 2
alternatives --set jar /usr/lib/jvm/default-java/bin/jar
alternatives --set javac /usr/lib/jvm/default-java/bin/javac

cp /vagrant/artifacts/java-profile.sh /etc/profile.d/java.sh


. ~/.bashrc
