#!/bin/bash

# Stolen from github somewhere...

# initialize the cache_dir
if [ ! -d /var/spool/squid3/00 ]; then
  /usr/sbin/squid3 -N -f /opt/squid.conf -z
fi

/usr/sbin/squid3 -NYC -d 1 -f /opt/squid.conf
