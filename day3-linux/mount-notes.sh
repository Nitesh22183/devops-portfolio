#!/bin/bash
# Day 3 — Disk, Mount, Filesystem

# See all disks and partitions
lsblk

# See mounted filesystems
df -h
mount | grep -v loop | grep -v tmpfs

# Get UUID of a disk
blkid /dev/sda3

# Create and mount a disk image
dd if=/dev/zero of=/tmp/fakedisk.img bs=1M count=100
mkfs.ext4 /tmp/fakedisk.img
mkdir /mnt/fakedisk
mount -o loop /tmp/fakedisk.img /mnt/fakedisk

# Unmount
umount /mnt/fakedisk

# Add to fstab for permanent mount
# UUID=xxxx  /mnt/fakedisk  ext4  defaults  0  0
# Then test: mount -a

# Filesystem types
# ext4  = Linux standard
# vfat  = Windows/USB
# swap  = virtual memory
# tmpfs = RAM based (lost on reboot)
# overlay = Docker containers
