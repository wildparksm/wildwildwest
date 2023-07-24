# 모니터 대상 프로세스명
$proc = Get-Process abc
$percen = 0.68
$reserv = pparp
# 모니터 대상 프로세스가 전체 메모리의 50% 이상 점유가 감지 되면 자동으로 재시작
if ($proc.WorkingSetSize -gt (Get-WmiObject win32_OperatingSystem).TotalVisibleMemorySize * $percen) {
    Restart-Service $reserv
}