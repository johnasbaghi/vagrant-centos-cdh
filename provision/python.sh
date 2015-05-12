#!/usr/bin/env bash


yum -y groupinstall "Development tools"

yum -y install zlib-devel
yum -y install bzip2-devel
yum -y install openssl-devel
yum -y install ncurses-devel
yum -y install sqlite-devel


cd /tmp

if [[ -a /vagrant/artifacts/Python-2.7.9.tar.xz ]]; then 
    cp /vagrant/artifacts/Python-2.7.9.tar.xz /tmp/
else
    wget --no-check-certificate https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz
fi

tar xf Python-2.7.9.tar.xz

mv Python-2.7.9 /opt/
cd /opt/Python-2.7.9/

./configure --prefix=/usr/local
make && make altinstall

#ln -s /usr/local/bin/python2.7 /usr/local/bin/python

cd /tmp

if [[ -a /vagrant/artifacts/setuptools-1.4.2.tar.gz ]]; then 
    cp /vagrant/artifacts/setuptools-1.4.2.tar.gz /tmp/
else
    wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz
fi

tar -xvf setuptools-1.4.2.tar.gz

cd setuptools-1.4.2

. ~/bashrc

python2.7 setup.py install

if [[ -a /vagrant/artifacts/get-pip.py ]]; then 
    python2.7 /vagrant/artifacts/get-pip.py
else
    curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python2.7 -
fi


