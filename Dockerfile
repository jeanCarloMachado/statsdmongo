FROM ubuntu:latest
MAINTAINER contato@jeancarlomachado.com.br
RUN locale-gen en_US.UTF-8 \
	&& export LANG=en_US.UTF-8 \
	&& apt-get update \
	&& apt-get -y install libkrb5-dev \
	&& apt-get -y install nodejs \
	&& ln -s /usr/bin/nodejs /usr/bin/node \
	&& apt-get -y install npm \
	&& npm install npm -g \
    && npm install -g statsd \
	&& apt-get -y install mongodb \
    && mkdir -p /data/db \
    && npm install -g mongo-statsd-backend 

EXPOSE 27017
EXPOSE 8125
EXPOSE 8126

ADD mongo /usr/local/statsdmongo
ENTRYPOINT /usr/bin/mongod & sleep 10 ; /usr/bin/node /usr/local/lib/node_modules/statsd/bin/statsd /usr/local/statsdmongo/config.js 
