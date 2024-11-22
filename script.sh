#!/bin/bash

while read line; do
	ip=$(echo "$line" | awk '{print $1}')
	domain=$(echo "$line" | awk '{print $2}')

	first_char=${line:0:1}
	if [[ "$first_char" =~ [0-9] ]]; then
		result=$(nslookup "$domain")
		if !( echo "$result" | grep -q "Address: ${ip}" ); then
			echo  "Bogus IP for ${domain} in /etc/hosts !"
		fi
	fi
done </etc/hosts
