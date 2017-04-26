#!/bin/bash
find /var/log/ -type f -name "*.log" | while read FILE; do
     count=$(grep -c ^ < "$FILE")
          echo "$(date)|$count|$FILE">>/root/counts.log
done
