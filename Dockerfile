FROM ubuntu:16.04
MAINTAINER Reimund Klain <reimund.klain@condevtec.de>

RUN apt-get update && apt-get install -y \
    libcurl3 \
    build-essential \
    automake \
    autotools-dev \
    libjansson-dev \
    autoconf \
    libcurl4-gnutls-dev \
    git

ENV USERNAME=NOTSET
ENV PASSWORD=x
ENV URL="stratum+tcp://xmr.pool.minergate.com:45560"
ENV ALGO=cryptonight

ADD run.sh /run.sh
RUN chmod 755 /run.sh
CMD /run.sh
