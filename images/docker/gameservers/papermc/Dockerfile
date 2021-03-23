FROM harbor.fnptr.net/docker/library/alpine:latest
VOLUME ["/data", "/config"]
COPY . /srv/papermc
WORKDIR /srv/papermc
RUN apk update && apk add openjdk11-jre-headless; sh build.sh
ENTRYPOINT sh /srv/papermc/start_server.sh