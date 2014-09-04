FROM ubuntu:latest
MAINTAINER Don Li

# Reduce output from debconf
ENV DEBIAN_FRONTEND noninteractive
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get -y update
RUN apt-get install -y wget make gcc
RUN wget https://github.com/antirez/redis/archive/3.0.0-beta8.tar.gz
RUN tar zxf 3.0.0-beta8.tar.gz
RUN cd redis-3.0.0-beta8 && make

RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf

EXPOSE 6379 16379

ENTRYPOINT ["/redis-3.0.0-beta8/src/redis-server"]
