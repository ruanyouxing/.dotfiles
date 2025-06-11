#!/bin/sh

USER="ruanyouxing"
TOKEN="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"
notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

if [ "$notifications" -gt 0 ]; then
    echo " $notifications"
else
    echo " 0"
fi
