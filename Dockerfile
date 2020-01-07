# Confluent Client container
#
# VERSION 0.1 - not for production, use at own risk
#

#
# Using CentOS 7 as a base image
FROM centos:centos7

MAINTAINER mkieboom

# Install basic stuff
RUN yum install -y epel-release && \
    yum install -y wget telnet jq curl which

# Install Confluent package key
RUN rpm --import https://packages.confluent.io/rpm/5.3/archive.key

# Configure Confluent repo
RUN printf "[Confluent.dist] \n\
name=Confluent repository (dist) \n\
baseurl=https://packages.confluent.io/rpm/5.3/7 \n\
gpgcheck=1 \n\
gpgkey=https://packages.confluent.io/rpm/5.3/archive.key \n\
enabled=1 \n\
 \n\
[Confluent] \n\
name=Confluent repository \n\
baseurl=https://packages.confluent.io/rpm/5.3 \n\
gpgcheck=1 \n\
gpgkey=https://packages.confluent.io/rpm/5.3/archive.key \n\
enabled=1" > /etc/yum.repos.d/confluent.repo

# Install minimum (clients only)
RUN yum install -y confluent-kafka-2.12
