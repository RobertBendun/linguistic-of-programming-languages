#!/bin/sh

for file in $@; do
	echo "include::$file[]"
	echo
done
