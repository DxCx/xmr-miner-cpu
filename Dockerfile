FROM alpine:latest

RUN set -ex \
	&& apk add --no-cache --update \
		util-linux \
		libcurl \
		coreutils \
	&& apk add --virtual build-dependencies --no-cache \
		alpine-sdk \
		curl-dev \
		automake \
		jansson \
		autoconf \
		git \
    && git clone https://github.com/wolf9466/cpuminer-multi \
	&& cd cpuminer-multi/ \
	&& autoreconf -fi \
    && CFLAGS="-march=native" ./configure \
	&& make \
	&& make install \
    && apk del build-dependencies \
    && rm -rf /tmp/* /var/tmp/*

ENV USERNAME=NOTSET
ENV PASSWORD=x
ENV URL="stratum+tcp://xmr.pool.minergate.com:45560"
ENV ALGORITHM=cryptonight
ENV PRIORITY=19

ADD run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh
ENTRYPOINT ["/bin/sh", "/usr/local/bin/run.sh"]
