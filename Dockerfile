
FROM ubuntu:14.04

MAINTAINER Daniel Queiroz <daniellqueiroz@gmail.com>


# PRE-REQUISITES

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common \
    				   python-software-properties \
    				   build-essential \
    				   libssl-dev \
    				   libcurl4-gnutls-dev \ 
    				   libexpat1-dev \
    				   gettext \
    				   openssl \
    				   nano \
    				   git \
    				   zip \
    				   unzip \ 
    				   wget\
    				   curl


# JAVA

ARG JAVA_ARCHIVE=http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/server-jre-8u121-linux-x64.tar.gz

ENV JAVA_HOME /usr/local/jdk1.8.0_121
ENV PATH $PATH:$JAVA_HOME/bin

RUN curl -sL --retry 3 --insecure \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" $JAVA_ARCHIVE \
  | tar -xz -C /usr/local/ && ln -s $JAVA_HOME /usr/local/java 


RUN mkdir /workspace 
WORKDIR /workspace
VOLUME /workspace


CMD ["bash"]

