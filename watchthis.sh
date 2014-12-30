#!/bin/bash

HOSTS="www.example.com 123.456.78.910"

for hostname in $HOSTS
do
	status_line=`curl -iL $hostname 2>/dev/null | head -n 1`
	status_code=`echo $status_line | awk '{print $2}'`
	echo "${status_code}"
	if [ $status_code -ne 200 ]
		then echo "Error: $status_code on $hostname"
		echo "Error: $status_code" | mail -s "watchthis: $hostname is down" -t "your.email@example.com" < /dev/null
	fi
done