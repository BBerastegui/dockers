FROM debian:jessie
MAINTAINER Borja Berastegui

# Sysctl
COPY sysctl-config.sh /tmp/sysctl-config.sh
RUN sysctl-config.sh

# Install libreswan
RUN apt-get install -y libnss3-dev libnspr4-dev pkg-config libpam-dev libcap-ng-dev libcap-ng-utils libselinux-dev libcurl4-nss-dev libgmp3-dev flex bison gcc make libunbound-dev libnss3-tools libreswan

COPY libreswan-config.sh /tmp/libreswan-config.sh

RUN /tmp/libreswan-config.sh

# Start IPSec
RUN systemctl enable xl2tpd.service
RUN ipsec setup start
RUN ipsec verify

RUN apt-get install -y xl2tpd

COPY ppp-config.sh /tmp/ppp-config.sh
RUN /tmp/ppp-config.sh

RUN systemctl enable xl2tpd.service
RUN systemctl start xl2tpd.service

RUN iptables --table nat --append POSTROUTING --jump MASQUERADE
