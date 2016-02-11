A base image used to run/compile your emberjs apps in a reproducible environment

In order to avoid filesystem permissions issues (root is the default user used to run programs in docker), create a custom local image, like so:

```
FROM ffissore/docker-node-emberjs:latest

#by adding a user that matches the one used to start docker, we avoid file system permissions issues
ARG USERID
RUN adduser --disabled-login --gecos "" username --uid $USERID

USER $USERID
```

Build it with

```
docker build --build-arg USERID=$(id -u) -t my_custom_node_emberjs_image .
```

And run it with

```
docker run \
  -t -i \
  --rm \
  -p 4200:4200 \
  -p 35729:35729 \
  -v $(pwd):/app \
  -v ~/.npm:/home/username/.npm \
  --name=my_app \
  my_custom_node_emberjs_image \
  /usr/local/bin/ember server
```

