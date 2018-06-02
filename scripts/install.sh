#!/usr/bin/env bash

JAVA_VERSION=8
#JAVA_VERSION=10

PPA_REPOSITORY=ppa:webupd8team/java

if [ ${JAVA_VERSION} -eq 10 ]; then
  PPA_REPOSITORY=ppa:linuxuprising/java
fi

add-apt-repository ${PPA_REPOSITORY}

JAVA=oracle-java${JAVA_VERSION}

apps=()
apps[0]=${JAVA}-installer
apps[1]=${JAVA}-set-default

if [ ${JAVA_VERSION} -ne 10 ]; then
  apps[2]=${JAVA}-unlimited-jce-policy
fi

apt-get update

for app in ${apps[@]}
do
    if [[ ${app} =~ ${JAVA}-(installer|unlimited-jce-policy) ]]; then
      echo "${app} shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
    fi
done

DEBIAN_FRONTEND=noninteractive apt-get -y install ${apps[@]}
