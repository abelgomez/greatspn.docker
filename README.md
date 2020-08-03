# GreatSPN via SSH on Fedora

## Building

Copy the sources to your docker host and build the container:

```
$ ./do.sh build
```

## Running

To run the container, binding to port 2222 on the host:

```
$ ./do.sh start
```

This will create a user named `user` using the password `secret`.

It is possible to build a container with a randomly generated
password.  You can obtain the password via `docker logs`:

```
$ docker run --name greatspn -d -p 2222:22 dice/greatspn
$ docker logs greatspn | grep 'ssh user password'
ssh user password: O2WXqqQ1CWwXHxrLZGip
```
## Stopping and cleaning

To stop the container, run:

```
$ ./do.sh stop
```

To remove the container, run (it must be stopped first):

```
$ ./do.sh remove
```

# Entering the container

To start an interactive shell in the container, run:

```
$ ./do.sh enter
```

To connect to this container via SSH, run:

```
$ ssh -p 2222 user@localhost
user@localhost's password: 
[user@d3a244022ca5 ~]$ 
```

## Other notes

It is possible to issue several commands at a time to the `do.sh` utility script.

E.g., to build and start a container, run:

```
$ ./do.sh build start
```

Similarly, to stop and destroy it, run:

```
$ ./do.sh stop remove
```


