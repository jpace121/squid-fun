FROM docker.io/library/ubuntu:18.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y squid && \
    rm -rf /var/lib/apt/lists/*

RUN chown -R proxy:proxy /var
RUN chmod -R 775 /var

COPY run_squid.sh /opt/run_squid.sh
RUN chmod u+x /opt/run_squid.sh

ENTRYPOINT ["/opt/run_squid.sh" ]
