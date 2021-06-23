# Description

This configuration has an accompanying video guide: https://youtu.be/xzJHI5AACQk

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

## Running the container

```
$ docker run -d twostack_node
```

## Attaching to a console inside container

Execute `docker ps | grep twostack_node` to get the *CONTAINER_ID*. 

```
$docker exec -i -t <INSERT_CONTAINER_ID_HERE> /bin/bash
``` 

## Working with `bitcoin-cli`
Once inside the container command prompt, you can use the `bitcoin-cli` command. 
The `bitcoin-cli` command has been aliased so you don't have to specify the data folder
where the RPC authentication cookies live. 

E.g. you can do : 

```
bitcoin-cli getblockcount
```


*NOTE* : A cron job has been scheduled to run every ten minutes inside the container. This cron job will generate a new block automatically. Also note that this job writes to the `/usr/var/coinbase.log` file inside the docker container. Writing data inside a container filesystem is inefficient, so please take care not to leave this container running when not in use. 

# Further Reading
- https://www.twostack.org/docs/getting-started/



