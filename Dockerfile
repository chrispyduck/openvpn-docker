# Smallest base image
FROM alpine:3.9

MAINTAINER chrispyduck

ADD VERSION .

# Install needed packages
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main/" >> /etc/apk/repositories \
 && apk add --update \
      bash \
      easy-rsa \
      iptables \
      openssl \
      openvpn \
 && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Configure tun
RUN mkdir -p /dev/net && \
    mknod /dev/net/tun c 10 200 

