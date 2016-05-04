#!/bin/sh

/usr/bin/mongod &
for i in $(seq 1 60); do
    [[ $(nc 127.0.0.1 27017 &> /dev/null; echo $?) -eq 0 ]] && {
        break
    }
    echo waiting on mongodb; sleep 1
done

usr/bin/node /usr/local/lib/node_modules/statsd/bin/statsd /usr/local/statsdmongo/config.js
