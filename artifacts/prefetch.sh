#!/usr/bin/env bash

# Pre populate the artifacts

#grep wget * | sed -e 's/^[a-zA-Z0-9\.]*://'

if [[ ! -a MITIE-models-v0.2.tar.bz2 ]]; then 
    wget -O - http://sourceforge.net/projects/mitie/files/binaries/MITIE-models-v0.2.tar.bz2 > MITIE-models-v0.2.tar.bz2
fi 

if [[ ! -a elasticsearch-1.4.2.noarch.rpm ]]; then 
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.noarch.rpm
fi

if [[ ! -a giraph-dist-1.1.0-hadoop2-bin.tar.gz ]]; then 
    wget http://www.trieuvan.com/apache/giraph/giraph-1.1.0/giraph-dist-1.1.0-hadoop2-bin.tar.gz
fi

if [[ ! -a gradle-2.2.1-bin.zip ]]; then 
    wget http://services.gradle.org/distributions/gradle-2.2.1-bin.zip
fi 

if [[ ! -a cloudera-cdh-5-0.x86_64.rpm ]]; then 
    wget http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm
fi

if [[ ! -a igraph-0.7.1.tar.gz ]]; then 
    wget http://igraph.org/nightly/get/c/igraph-0.7.1.tar.gz
fi

if [[ ! -a python-igraph-0.7.tar.gz ]]; then 
    wget --no-check-certificate https://pypi.python.org/packages/source/p/python-igraph/python-igraph-0.7.tar.gz
fi

if [[ ! -a jdk-7u72-linux-x64.tar.gz ]]; then 
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u72-b14/jdk-7u72-linux-x64.tar.gz"
fi

if [[ ! -a apache-maven-3.2.5-bin.tar.gz ]]; then 
    wget http://apache.mesi.com.ar/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
fi

if [[ ! -a Python-2.7.9.tar.xz ]]; then 
    wget --no-check-certificate https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz
fi

if [[ ! -a setuptools-1.4.2.tar.gz ]]; then 
    wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz
fi

if [[ ! -a spark-1.3.0-bin-hadoop2.3.tgz ]]; then 
    wget http://d3kbcqa49mib13.cloudfront.net/spark-1.3.0-bin-hadoop2.3.tgz
fi

if [[ ! -a scala-2.11.1.tgz ]]; then
    wget http://downloads.typesafe.com/scala/2.11.1/scala-2.11.1.tgz
fi
