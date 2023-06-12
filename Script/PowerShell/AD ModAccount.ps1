#그룹 사용자 조회
Get-ADGroupMember -Identity 카카오톡허용 | Select-Object name | Select-String "DCC20500640"

#그룹 내 단일 사용자 제거 (다중사용자일 경우 쉼표로 사용자 구분, -Identity "카카오톡허용")
Remove-ADGroupMember -Identity 카카오톡허용 -Members DCC20500640

#그룹 사용자 추가 
Add-ADGroupMember -Identity 카카오톡허용 -Members DCC20500640