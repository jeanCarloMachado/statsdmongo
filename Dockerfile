FROM ubuntu:latest
MAINTAINER contato@jeancarlomachado.com.br
RUN locale-gen en_US.UTF-8 \
	&& export LANG=en_US.UTF-8 \
	&& export USER=root \
	&& apt-get update \
	&& apt-get -y install libkrb5-dev \
	&& apt-get -y install nodejs \
	&& ln -s /usr/bin/nodejs /usr/bin/node \
	&& apt-get -y install npm \
	&& npm install npm -g \
    && npm install -g statsd \
	&& apt-get -y install mongodb \
	&& service mongodb start \
    && npm install -g mongo-statsd-backend

EXPOSE 27017
EXPOSE 8125
EXPOSE 8126

VOLUME [ "/usr/local/statsdmongo", "mongo"]
CMD [ "/usr/bin/nodejs", "/root/node_modules/statsd/bin/statsd", "/usr/local/statsdmongo/config.js" ]
