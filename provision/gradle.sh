#!/usr/bin/env bash


# Gradle
if [[ -a /vagrant/artifacts/gradle-2.2.1-bin.zip ]]; then
    cp /vagrant/artifacts/gradle-2.2.1-bin.zip /tmp/
else
    wget http://services.gradle.org/distributions/gradle-2.2.1-bin.zip
fi

sudo unzip gradle-2.2.1-bin.zip
sudo mv gradle-2.2.1 /usr/lib
sudo ln -s /usr/lib/gradle-2.2.1 /usr/lib/gradle

cp /vagrant/artifacts/gradle-profile.sh /etc/profile.d/gradle.sh


