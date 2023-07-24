# ActiveDirectory 모듈 가져오기
import-module activedirectory

# aacc 계정 정보 가져오기
$user = get-aduser aacc

# aacc 계정의 로그인 정보 가져오기
$logins = get-aduser $user -Properties LastLogonDate

# 최근 로그인 날짜 출력하기
foreach($login in $logins) {

    write-host $login.LastLogonDate

}
