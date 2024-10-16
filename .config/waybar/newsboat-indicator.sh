#!/bin/sh

# Get the number of unread newsboat feeds only if newsboat is not running
if ! pgrep -x "newsboat" >/dev/null; then
  newsboat -x reload
  newsboat -x print-unread | awk '{print $1}'
else
  echo ""
fi
