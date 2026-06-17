#!/bin/bash
# Day 2 — Networking + Disk Management

# Networking commands
cat /etc/hosts          # local DNS
cat /etc/resolv.conf    # nameserver config
nslookup zopper.com     # DNS lookup
curl -I https://zopper.com  # HTTP headers
ping zopper.com -c 4    # connectivity
traceroute zopper.com   # network path

# HTTP Status codes
# 200 = success
# 301 = permanent redirect
# 404 = not found
# 500 = server error
# 502 = bad gateway (ALB cant reach app)
# 504 = gateway timeout (app too slow)

# Disk management
df -h                                           # disk usage
du -sh /* 2>/dev/null | sort -rh | head -15    # largest folders
du -sh ~/Downloads/* | sort -rh | head -10     # drill into folder

# Clean journal logs
sudo journalctl --vacuum-time=7d               # keep last 7 days only

# Set permanent journal limit
# edit /etc/systemd/journald.conf
# add: SystemMaxUse=500M
# sudo systemctl restart systemd-journald
