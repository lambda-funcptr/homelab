FROM harbor.fnptr.net/docker/library/alpine:latest
VOLUME ["/data", "/config"]
RUN apk update && apk add openjdk11-jre-headless tmux
COPY . /srv/papermc
WORKDIR /srv/papermc
RUN sh build.sh
ENTRYPOINT sh /srv/papermc/start_server.sh