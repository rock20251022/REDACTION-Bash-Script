#!/bin/bash

current_date=$(date +"%m/%d/%Y")

for file in "$@"
do
    sed -E -i -f assign2.sed -e "s|<date>|$current_date|g" "$file"
done
