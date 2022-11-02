#!/bin/bash

# initialize the cache_dir
if [ ! -d /var/spool/squid/00 ]; then
  echo "Making cache directory!"
  chown -R squid:squid /var/spool/squid
  /usr/sbin/squid -N -f /opt/squid.conf -z
fi

echo "Starting squid!"
/usr/sbin/squid -NYC -d 1 -f /opt/squid.conf
