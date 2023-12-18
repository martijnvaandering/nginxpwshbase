#!/bin/sh
cmd="$@"
if [ $cmd ] ; then
	echo $cmd
	bash -c $cmd
fi

/etc/init.d/fcgiwrap start
chgrp nginx /var/run/fcgiwrap.socket && chmod g+w /var/run/fcgiwrap.socket
/etc/init.d/nginx start
tail -f /var/log/nginx/access.log -f /var/log/nginx/error.log