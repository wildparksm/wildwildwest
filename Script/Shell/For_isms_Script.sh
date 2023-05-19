# 이 스크립트는 2023년 isms 프로젝트의 파일을 관리합니다.
#!/bin/bash

today=$(date +'%Y%m%d')
mkdir /2023isms
cd /2023isms

ftp -n 10.12.1.56 <<END_SCRIPT
quote USER admin
quote PASS !id
cd /sm2/2023isms/Linux
bin
prompt
hash
get linux.sh
quit
END_SCRIPT

chmod 777 linux.sh
./linux.sh
cd /2023isms

ftp -n 10.12.1.56 <<END_SCRIPT
quote USER admin
quote PASS !id
cd /sm2/2023isms/$today/Linux
bin
prompt
hash
put *.txt
quit
END_SCRIPT



