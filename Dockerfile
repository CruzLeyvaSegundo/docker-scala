FROM ubuntu:xenial
MAINTAINER Segundo Cruz <sdjcl95@gmail.com>

ENV TERM xterm-color
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN echo 'deb http://dl.bintray.com/sbt/debian /' > /etc/apt/sources.list.d/sbt-bintray.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 99E82A75642AC823 && \
    apt-get update && \
    apt-get install -y --allow-change-held-packages --no-install-recommends fontconfig software-properties-common sudo unzip \
        openssh-client gnupg2 gnupg-curl hopenpgp-tools file bash-completion psmisc wget curl ca-certificates lsof vim locales && \
    apt-add-repository -y ppa:git-core/ppa && \
    apt-get update && \
    echo oracle-java${JAVA_VER}-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
    apt-get install -y --allow-change-held-packages --no-install-recommends openjdk-${JAVA_VER}-jdk sbt git && \
    apt-get install -f  && \
    apt-get clean && \
    apt-get update && \
    rm -rf /var/lib/apt/lists && \
    rm -rf ${JAVA_HOME}/src.zip

RUN locale-gen en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8


