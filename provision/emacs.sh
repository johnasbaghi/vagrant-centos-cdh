#!/usr/bin/env bash

yum install -y gcc make ncurses-devel
yum install -y giflib-devel libjpeg-devel libtiff-devel

cd /tmp 

# Install Emacs 24 From Source
if [[ -a /vagrant/artifacts/emacs-24.3.tar.gz ]]; then
    cp /vagrant/artifacts/emacs-24.3.tar.gz /tmp/
else
    wget http://ftp.gnu.org/pub/gnu/emacs/emacs-24.3.tar.gz
fi

tar xzvf emacs-24.3.tar.gz
cd emacs-24.3
./configure --without-x --without-selinux
make
make install
