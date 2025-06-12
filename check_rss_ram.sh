#! /bin/sh

if [ -z "$1" ]; then
  echo "Usage: $0 <PID>"
  exit 1
fi
pid=$1

awk '{ printf "RSS: %.1fMB\n", $2*4/1024 }' /proc/$pid/statm


