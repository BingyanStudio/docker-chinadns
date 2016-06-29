FROM alpine:3.3

ENV CHINADNS_VERSION 1.3.2

COPY ./run.sh /

RUN buildDeps='git autoconf automake build-base' && \
    apk update && \
    apk add $buildDeps && \
    cd /tmp && \
      git clone https://github.com/shadowsocks/ChinaDNS && cd ChinaDNS && \
      git checkout ${CHINADNS_VERSION} && \
      ./autogen.sh && \
      ./configure && make && make install && \
      cp chnroute.txt iplist.txt /etc/ && \
    cd / && rm -rf /tmp/ChinaDNS && \
    apk del $buildDeps && \
    rm -rf /var/cache/apk/* && \
    chmod +x /run.sh

ENV DNS 114.114.114.114,208.67.222.222:443,8.8.8.8
ENV VERBOSE true

EXPOSE 53/udp

CMD ["/run.sh"]
