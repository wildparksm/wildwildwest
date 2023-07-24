# 파워쉘 코드: 컴퓨터의 CPU 사용률을 조회합니다.
# Get-WmiObject cmdlet을 사용하여 컴퓨터의 WMI 객체를 조회합니다.
# -Class switch는 조회할 WMI 클래스를 지정합니다. 이 경우 Win32_Processor 클래스를 조회합니다.
# Select-Object cmdlet을 사용하여 조회된 WMI 객체의 속성을 선택합니다. 이 경우 LoadPercentage 속성을 선택합니다.
# -ExpandProperty switch는 속성을 확장하여 개별 값으로 반환합니다. 이 경우 LoadPercentage 속성을 확장하여 CPU 사용률을 반환합니다.
Get-WmiObject Win32_Processor | Select-Object -ExpandProperty LoadPercentage