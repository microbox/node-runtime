FROM alpine:edge
MAINTAINER Ling <x@e2.to>
ENV NODE_VERSION=6.11.4

RUN apk add --update nodejs=${NODE_VERSION}-r0 ca-certificates bash unzip libc6-compat tzdata && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/npm /usr/lib/node_modules

COPY config /root
ONBUILD COPY dist.zip /root/
WORKDIR /root
CMD /root/bootstrap.sh

# EOF