# 간혹 커널 설정을 바꿀 때에 sudo와 함께 echo 명령을 실행해도
# permission denied 에러가 나고 실행되지 않는 경우가 있을 것이다.

# $ sudo echo 1 > /proc/sys/vm/drop_caches
# bash: /proc/sys/vm/drop_caches: Permission denied

# 이는 shell (bash)이 echo 명령에는 sudo를 적용하지만
# redirection 자체에는 원래 사용자 권한을 그대로 남겨두기 때문이다.

# 이를 위한 해법은 다음과 같은 3가지 중 하나를 이용하면 된다.
# sudo -s 명령을 통해 아예 root로 login 한 후 해당 명령을 수행하고 logout
# shell 자체를 sudo로 실행하여 redirection을 포함한 명령을 수행
# tee 명령을 sudo로 실행하여 redirection을 수행

# 1번은 굳이 설명할 필요가 없을테고 2번은 다음과 같다.

$ sudo sh -c "echo 1 > /proc/sys/vm/drop_caches"

# 3번은 개인적으로 가장 우아한? 해법이라고 생각되는데
# tee 명령은 기본적으로 stdin을 stdout으로 그대로 보내주는 역할을 하며
# 추가적으로 파일 이름이 argument로 주어지면 해당 파일에도 stdin의 내용을 쓴다.

$ echo 1 | sudo tee /proc/sys/vm/drop_caches

# 앞서 말했다시피 tee 명령은 stdout에도 쓰기때문에 위의 명령을 실행하면 터미널에 1이 출력된다.
# 이것이 보기 싫은 사람은 단순히 tee의 stdout을 /dev/null로 redirect시키면 된다.
# 또한 "echo 1 >> /some/file"과 같은 append 연산을 수행하려면 tee 명령에 -a 옵션을 주면 된다.