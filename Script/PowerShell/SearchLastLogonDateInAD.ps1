# 코드 제목: aaa OU에 포함된 계정 LastlogonDate 조회
# 설명: 이 코드는 aaa OU에 포함된 계정의 LastlogonDate를 조회합니다.
# 코드:
Get-ADUser -Filter * -Properties LastLogonDate -SearchBase "OU=aaa,DC=example,DC=com" | Select-Object Name, LastLogonDate | Export-Csv -Path .\userlastlogon.csv -NoTypeInformation -Encoding UTF8

# 주석:
# Get-ADUser cmdlet은 Active Directory에서 사용자를 검색합니다.
# Filter 매개변수는 검색할 사용자를 지정합니다. 이 경우 모든 사용자를 검색합니다.
# Properties 매개변수는 검색할 사용자 속성을 지정합니다. 이 경우 LastLogonDate 속성을 검색합니다.
# SearchBase 매개변수는 검색할 Active Directory 위치를 지정합니다. 이 경우 aaa OU를 검색합니다.
# Select cmdlet은 출력에서 선택할 속성을 지정합니다. 이 경우 Name 및 LastLogonDate 속성을 선택합니다.
# Export-Csv cmdlet은 출력을 CSV 파일로 내보냅니다. 이 경우 파일 이름은 userlastlogon.csv이고 인코딩은 UTF-8입니다.
# 이 코드는 aaa OU에 포함된 계정의 LastlogonDate를 CSV 파일로 내보냅니다. 이 파일은 다음과 같이 사용할 수 있습니다.

# 계정의 최근 로그온 날짜를 추적합니다.
# 계정의 로그온 활동을 모니터링합니다.
# 계정의 로그온 문제를 조사합니다.