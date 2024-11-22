#!/bin/bash

#ip = $1
#domain = $2
#DNS = $3

result=$(nslookup "$2 $3")

if !( echo "$result" | grep -q "Address: ${1}" ); then
	echo "not cool"
else
	echo "cool"
fi
