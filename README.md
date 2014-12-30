watchthis
=========

A simple Bash script that checks a list of IPs and/or domains for HTTP status codes and emails you if one of the sites goes down.

For best results, set up a cron job running every hour or so.

### Known issues:

* 30X redirect codes count as errors, and will be reported as such. To avoid this, make sure you put the final destination in the watch list.

* No timeout function. If a site query hangs without delivering a status code, the script won't know to move on or return any kind of error. It's patient.
