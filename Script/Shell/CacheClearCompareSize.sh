#!/bin/bash

buff_cache=$(free -h | awk '/^Mem:/ {print $6}')
buff_cache_value=${buff_cache%??}
# The % operator is used to remove the shortest match of the pattern from the end of the variable. 
buff_cache_unit=${buff_cache: -2}

if [[ "$buff_cache_unit" == "Gi" ]] && (( $(echo "$buff_cache_value > 5" | bc -l) )); then
    sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
fi

# 스크립트는 먼저 free 명령의 출력에서 buff_cache의 값을 가져옵니다. free 명령은 시스템에서 현재 사용중인 메모리의 양을 보여줍니다. 
# 버퍼 캐시는 최근에 액세스된 데이터를 저장하여 다음에 필요할 때 더 빠르게 액세스할 수 있습니다.
# 스크립트는 다음으로 버퍼 캐시 값의 측정 단위를 가져옵니다. 버퍼 캐시 값은 킬로바이트(KB), 메가바이트(MB), 또는 기가바이트(GB) 중 하나일 수 있습니다. 
# 스크립트는 측정 단위가 기가바이트인지 확인합니다.
# 측정 단위가 기가바이트이고 버퍼 캐시 값이 5보다 크면 스크립트는 sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches" 명령을 실행합니다. 
# sync 명령은 모든 데이터를 디스크에 플러시하고, echo 3 > /proc/sys/vm/drop_caches 명령은 커널에 버퍼 캐시를 삭제하라고 지시합니다.
# 버퍼 캐시를 삭제하면 일부 메모리를 해제할 수 있습니다. 이는 시스템이 메모리 부족으로 실행 중일 때 유용할 수 있습니다. 
# 그러나 버퍼 캐시를 삭제하면 최근에 액세스한 데이터에 대한 액세스가 약간 지연될 수 있음을 명심해야 합니다.