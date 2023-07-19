# ActiveDirectory 모듈을 임포트
Import-Module ActiveDirectory
# Get-ADUser 명령을 사용하여 사용자계정이라는 이름의 사용자 계정을 가져옵니다. lastLogonTimeStamp 속성은 사용자 계정의 마지막 로그온 날짜를 가져옵니다.
$lastLogonTimestamp = (Get-ADUser -Identity "사용자계정" -Properties "lastLogonTimeStamp").lastLogonTimeStamp
#  lastLogonTimestamp 변수를 DateTime 객체로 변환합니다.
$lastLogonDate = [DateTime]::FromFileTime($lastLogonTimestamp)
# lastLogonDate 변수를 출력합니다.
Write-Host $lastLogonDate