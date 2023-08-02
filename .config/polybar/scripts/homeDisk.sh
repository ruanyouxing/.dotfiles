#!/bin/bash
echo "  󱂵 " "$(df -H /home | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 }')"
