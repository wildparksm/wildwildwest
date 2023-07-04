# ActiveDirectory 모듈 가져오기
import-module activedirectory

# 사용자 목록 가져오기
$users = Get-ADUser -Filter * -Properties LastLogonDate | Select-Object SamAccountName, GivenName, LastLogonDate, Enabled
# 필터링
$users = $users | Where-Object {$_.SamAccountName -like "dcc32020017" -or $_.SamAccountName -like "dcc32021001" -or $_.SamAccountName -like "dcc32021008" -or $_.SamAccountName -like "dcc32021018" -or $_.SamAccountName -like "dcc32021022" -or $_.SamAccountName -like "dcc32021028" -or $_.SamAccountName -like "dcc32021037" -or $_.SamAccountName -like "dcc32022008" -or $_.SamAccountName -like "dcc32022031" -or $_.SamAccountName -like "dcc32023001" -or $_.SamAccountName -like "dcc32023002" -or $_.SamAccountName -like "dcc32023006" -or $_.SamAccountName -like "dcc32023007" -or $_.SamAccountName -like "dcc32023008" -or $_.SamAccountName -like "dcc32023009"}

# 결과 출력하기
$users | Format-Table SamAccountName, GivenName, LastLogonDate,Enabled
