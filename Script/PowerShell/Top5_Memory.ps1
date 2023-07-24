# 파워쉘 코드: 현재 실행 중인 프로세스의 목록을 가져오고, 메모리 사용량이 가장 높은 상위 5개 프로세스를 출력합니다.

# Get-Process 명령을 실행하여 현재 실행 중인 프로세스의 목록을 가져옵니다.
# Get-Process

# Sort-Object 명령을 사용하여 프로세스의 메모리 사용량을 내림차순으로 정렬합니다.
# -Property switch는 정렬할 속성을 지정합니다. 이 경우 WorkingSet 속성을 지정합니다.
# -Descending switch는 정렬 순서를 내림차순으로 지정합니다.
# Sort-Object -Property WorkingSet -Descending

# Select-Object 명령을 사용하여 상위 5개 프로세스를 선택합니다.
# -First switch는 선택할 개수를 지정합니다. 이 경우 5개를 지정합니다.
# Select-Object -First 5

Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 5