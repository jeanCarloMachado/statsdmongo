# statsdmongo

 A docker container for statsd with mongodb backend
 
 
 ##Configuration example
 
 ###docker-compose
 
 
 ```
 statsd:
    image: jeancarlomachado/statsdmongo
    ports:
        - "27017:27017"
        - "8125:8125/udp"
        - "8126:8126"

 ```

