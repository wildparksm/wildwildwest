# 파워쉘 코드: 컴퓨터의 보안 채널을 테스트하고 복구합니다.

# $Cred 변수를 선언하고 Get-Credential 명령을 실행하여 사용자 자격 증명을 가져옵니다.
$Cred = Get-Credential

# Test-ComputerSecureChannel 명령을 실행하여 컴퓨터의 보안 채널을 테스트합니다.
# -Credential switch는 사용자 자격 증명을 지정합니다.
# -Repair switch는 보안 채널이 손상된 경우 복구합니다.
Test-ComputerSecureChannel -Credential $Cred -Repair
