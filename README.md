# Docker container for GreatSPN via SSH on Fedora

This Docker image is useful to run the [DICE Simulation Tool](https://github.com/dice-project/DICE-Simulation) locally.

It can be run in Linux, MacOS X and Linux. See https://docs.docker.com/get-docker/ for the Docker installation instructions.

## Building by your own (Optional)

> **IMPORTANT:**
>
> **Building the image by you own is time consuming.**
>
> Since this image is automatically built and published [Docker Hub](https://hub.docker.com/r/abelgomez/greatspn/), **jump to the next Section if you only need an unmodified image**
>
> See: https://hub.docker.com/r/abelgomez/greatspn/

Clone or copy the sources to your docker host and build the container:

```
$ git clone https://github.com/abelgomez/greatspn.docker.git 
$ cd greatspn.docker
$ docker build --rm -t abelgomez/greatspn .
```

## Running

To run the container, binding the SSH server to port 2222 on the host with the default user named `user` and using the password `secret`.

```
$ docker run --name greatspn -d -p 2222:22 -e SSH_USERPASS=secret abelgomez/greatspn
```

It is also possible to customize the user name by setting the environment variable `SSH_USERNAME`.

To build a container with a randomly generated password.  You can obtain the password via `docker logs`:

```
$ docker run --name greatspn -d -p 2222:22 abelgomez/greatspn
$ docker logs greatspn | grep 'ssh user password'
ssh user password: O2WXqqQ1CWwXHxrLZGip
```

***NOTE**: Be sure that port 2222 is not being used by another service. In Windows it may happen that the port is free, but reserved. You can check reserved port ranges by running `netsh int ipv4 show excludedportrange tcp` in a command prompt.


## Stopping and cleaning

To stop the container, run:

```
$ docker stop greatspn
```

To remove the container, run (it must be stopped first):

```
$ docker rm greatspn
```

## Entering the container

To start an interactive shell in the container, run:

```
$ docker exec -it greatspn bash
```

In Git for Windows it may be necessary to use the utility command winpty:

```
$ winpty docker exec -it greatspn bash
```

To connect to this container via SSH, run:

```
$ ssh -p 2222 user@localhost
user@localhost's password: 
[user@9313075ae42e ~]$ 
```
