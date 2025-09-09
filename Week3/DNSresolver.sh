#!/bin/bash

network_prefix=$1
dns=$2

for i in $(seq 1 254); do
ip="$network_prefix.$i"
result=$(nslookup $ip $dns 2>/dev/null)

if ! grep -q "can't find" <<< $result; then
echo "$result"
fi
done
