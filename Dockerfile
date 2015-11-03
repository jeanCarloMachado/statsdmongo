FROM ubuntu:latest
RUN locale-gen en_US.UTF-8 \
	&& export LANG=en_US.UTF-8 \
	&& apt-get update \
	&& apt-get -y install mongodb \
	&& service mongodb start \
	&& apt-get -y install nodejs npm \
    && sudo npm install -g statsd \
    && sudo npm install -g mongo-statsd-backend 

EXPOSE 27017
EXPOSE 8125
EXPOSE 8126

ENTRYPOINT [ "/bin/bash", "-t", "-i" ]
