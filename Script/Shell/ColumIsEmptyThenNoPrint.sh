# passwd -sa는 passwd 파일의 모든 항목을 출력하고, awk '{if($3!="") print $0}'는 passwd 파일의 세 번째 필드가 비어 있지 않은 항목만 출력합니다.
passwd -sa | awk '{if($3!="") print $0}' 