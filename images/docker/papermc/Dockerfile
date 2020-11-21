FROM alpine:latest
RUN apk update && apk add openjdk11-jre-headless
COPY . /srv/papermc
WORKDIR /srv/papermc
RUN sh build.sh
ENTRYPOINT sh /srv/papermc