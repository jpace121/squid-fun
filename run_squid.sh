#!/bin/bash

# initialize the cache_dir
if [ ! -d /var/spool/squid/00 ]; then
  /usr/sbin/squid -N -f /opt/squid.conf -z
fi

/usr/sbin/squid -NYC -d 1 -f /opt/squid.conf
