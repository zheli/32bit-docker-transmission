FROM 32bit/ubuntu:14.04

MAINTAINER Zhe Li <linuxcity.jn@gmail.com>


RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y transmission-daemon && \
    mkdir -p /var/lib/transmission-daemon/incomplete && \
    mkdir -p /var/lib/transmission-daemon/downloads && \
    chown -R debian-transmission: /var/lib/transmission-daemon && \
    chown -R debian-transmission: /etc/transmission-daemon

ADD files/transmission-daemon /etc/transmission-daemon
ADD files/run_transmission.sh /run_transmission.sh

VOLUME ["/var/lib/transmission-daemon/downloads", "/var/lib/transmission-daemon/incomplete"]

EXPOSE 9091
EXPOSE 12345

USER debian-transmission

CMD ["/run_transmission.sh"]
