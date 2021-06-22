#!/bin/bash

set -x

# Startup Cron so we can automine blocks
/etc/init.d/cron start

/usr/bin/bitcoind -datadir=/usr/var/bitcoin-data
