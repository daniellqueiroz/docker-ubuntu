
FROM ubuntu:latest

MAINTAINER Daniel Queiroz <daniellqueiroz@gmail.com>


# packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common \
    				   python-software-properties \
    				   build-essential \
    				   net-tools \
    				   libssl-dev \
    				   libcurl4-gnutls-dev \ 
    				   libexpat1-dev \
    				   gettext \
    				   openssl \
    				   nano \
    				   git \
    				   zip \
    				   unzip \ 
    				   wget \
    				   curl \ 
    				   ssh \
    				   rsync


# java
ARG JAVA_ARCHIVE=http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/server-jre-8u121-linux-x64.tar.gz

ENV JAVA_HOME /usr/local/jdk1.8.0_121
ENV PATH $PATH:$JAVA_HOME/bin

RUN curl -sL --retry 3 --insecure \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" $JAVA_ARCHIVE \
  | tar -xz -C /usr/local/ && ln -s $JAVA_HOME /usr/local/java 


RUN mkdir /workspace 
WORKDIR /workspace
VOLUME /workspace


CMD ["/bin/bash"]


# expose ports
EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 22 8080 8088 8188 8030 9999 10000 10001




