#/usr/bin/bash

mkdir -p /chroot
tar -x --same-owner -pvxf $1 -C /chroot/
