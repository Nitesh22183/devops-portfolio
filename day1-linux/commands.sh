#!/bin/bash
# Day 1 — Linux Users, Groups, Permissions
# Everything I practiced today

# Create a new user
sudo useradd -m -s /bin/bash developer1
sudo passwd developer1

# Check user
id developer1
groups developer1

# Give sudo access
sudo usermod -aG sudo developer1

# Create a group
sudo groupadd developerss

# Add user to group
sudo usermod -aG developerss developer1

# Create app folder
sudo mkdir -p /var/www/zooper
sudo chown -R nitesh:developerss /var/www/zooper
sudo chmod 770 /var/www/zooper

# Permission numbers
# 777 = rwxrwxrwx = everyone everything = NEVER in production
# 755 = rwxr-xr-x = owner full, others read only = web folders
# 700 = rwx------ = only owner = private scripts
# 600 = rw------- = only owner read/write = private keys
# 644 = rw-r--r-- = owner write, others read = config files
