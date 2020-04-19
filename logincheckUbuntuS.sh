#!/bin/bash

# Collect the failed login attempts
FAILED_LOG=/tmp/failed.$$.log
egrep "Failed pass" /var/log/auth.log > $FAILED_LOG 

#extracts the IP Address('s)
grep "Failed password for" $FAILED_LOG | grep -Po "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" \
| sort | uniq -c

# Remove temporary file
rm -f $FAILED_LOG
