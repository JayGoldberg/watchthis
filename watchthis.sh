#!/bin/bash

HOSTS="www.example.com 123.456.78.910"
TIMEOUT=6
EMAIL="your.email@example.com"

for hostname in $HOSTS
do
  status_code=$(curl -sL -w '%{http_code}' $hostname -m $TIMEOUT -o /dev/null)
  echo "$status_code"
  if [ "$status_code" -ne 200 ]
    then echo "Error: $status_code on $hostname"
    echo "Error: $status_code" | mail -s "watchthis: $hostname is down" -t "$EMAIL" < /dev/null
  fi
done
