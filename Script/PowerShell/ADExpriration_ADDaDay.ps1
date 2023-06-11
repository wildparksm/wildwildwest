# 실행하면 계정 만료일이 지정일인 2023-08-28보다 하루 먼저인 2023-08-27로 설정됩니다. 
# 그 이유는 PowerShell이 DateTime 매개변수에 지정된 날짜를 UTC로 간주하기 때문입니다. 
# UTC는 협정 세계시로, 한국 시간보다 9시간이 느립니다. 따라서 2023-08-28 UTC는 한국 시간으로 2023-08-27입니다.
$expirationDate = (Get-Date "08/31/2023").AddDays(1)
Set-ADAccountExpiration -Identity dcc90000223 -DateTime $expirationDate