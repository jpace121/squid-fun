FROM quay.io/centos/centos:stream9
# Using centos image since Ubuntu/Debian do not ship a version
# of squid that can inspect ssl.

RUN dnf upgrade -y && \
    dnf install -y squid && \
    dnf clean all && \
  	rm -rf /var/cache/yum

RUN chown -R squid:squid /var

COPY run_squid.sh /opt/run_squid.sh
RUN chmod u+x /opt/run_squid.sh

ENTRYPOINT ["/opt/run_squid.sh" ]