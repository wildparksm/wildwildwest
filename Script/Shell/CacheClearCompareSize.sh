#!/bin/bash

buff_cache=$(free -h | awk '/^Mem:/ {print $6}')
buff_cache_value=${buff_cache%??}
buff_cache_unit=${buff_cache: -2}

if [[ "$buff_cache_unit" == "Gi" ]] && (( $(echo "$buff_cache_value > 5" | bc -l) )); then
    sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
fi