
# 파워쉘 코드: 새만금전주6공구에 해당하는 사용자를 조회합니다.
# Get-ADUser cmdlet을 사용하여 Active Directory에서 사용자를 조회합니다.
# -Filter switch는 검색 조건을 지정합니다. 이 경우 Description 속성이 "새만금전주6공구"와 일치하는 사용자를 조회합니다.
# -Properties switch는 조회할 속성을 지정합니다. 이 경우 모든 속성을 조회합니다.
# Select-Object cmdlet을 사용하여 조회된 사용자의 속성을 선택합니다. 이 경우 SamAccountName, GivenName, Description, mail 속성을 선택합니다.
Get-ADUser -Filter {(Description -like "새만금전주6공구")} -Properties * | Select-Object SamAccountName, GivenName,Description, mail