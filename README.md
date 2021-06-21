# Description
This repository holds a Docker build file for building a docker container 
that holds a BitcoinSV Node instance. 

The bitcoin node will be started in REGTEST mode, which means that
it will *NOT* connect to the public TEST network. This mode is 
ideal for local app development and script testing.

# Container Ops

## Building the container

```
$ docker build . -t twostack_node
```

## Attaching to a console inside container

```
$docker exec -i -t <INSERT_CONTAINER_ID_HERE> /bin/bash
``` 

## Generate a new block
Once inside the container command prompt, 

```
bitcoin-cli -datadir=/usr/var/bitcoin-data generate 1
```

# Further Reading
- https://www.twostack.org/docs/getting-started/



