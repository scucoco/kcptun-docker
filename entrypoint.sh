#!/bin/bash
sed -i "s/10.10.10.10:4000/$remotehost:$remoteport/g" /root/kcptun/client-config.json

exec "$@"
