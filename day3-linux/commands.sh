#!/bin/bash
# Day 3 — Processes, grep, awk, sed, log analysis

# Process management
ps aux                              # all processes
ps aux --sort=-%cpu | head -10      # top CPU consumers
ps aux | grep nginx                 # find specific process
kill -15 <PID>                      # graceful stop
kill -9 <PID>                       # force kill

# grep - find/filter
grep "ERROR" /var/log/app.log           # find errors
grep -i "error" /var/log/app.log        # case insensitive
grep -n "error" /var/log/app.log        # show line numbers
grep -r "password" /etc/ 2>/dev/null    # search recursively
grep -v "INFO" /var/log/app.log         # exclude INFO lines
grep -c "ERROR" /var/log/app.log        # count errors
grep -E "ERROR|WARN" /var/log/app.log   # find ERROR or WARN

# awk - extract columns
awk '{print $1}'                    # print first column
awk -F: '{print $1}'                # split by colon, print first
awk '$3 > 1 {print $1,$2,$3}'      # filter where column 3 > 1
awk '{print $1, $7, $9}'           # print IP, URL, status code

# sed - replace text
sed 's/old/new/' file               # replace in output only
sed -i 's/old/new/' file            # replace in file permanently
sed -i 's/localhost/zopper.com/' nginx.conf  # real use case

# All 3 together - real log analysis
grep "ERROR" /var/log/app.log | awk '{print $4,$5,$6,$7}' | sort | uniq -c | sort -rn

# nginx log analysis
tail -100 /var/log/nginx/access.log | awk '{print $1, $7, $9}'  # IP URL Status
grep " 502 " /var/log/nginx/access.log                           # find 502 errors
awk '{print $9}' /var/log/nginx/access.log | sort | uniq -c | sort -rn  # count by status
