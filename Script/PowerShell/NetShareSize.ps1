# 파워쉘 코드: 네트워크 공유의 크기를 조회하고 파일에 저장합니다.

# $shares 변수를 선언하고 net share 명령을 실행하여 네트워크 공유 목록을 가져옵니다.
# Select-String cmdlet을 사용하여 공유 이름과 경로를 추출합니다.
# ForEach-Object cmdlet을 사용하여 각 네트워크 공유에 대해 반복합니다.
# $share 변수에 공유 이름을 저장합니다.
# $path 변수에 경로를 저장합니다.
# [PSCustomObject] cmdlet을 사용하여 PSCustomObject 객체를 생성합니다.
# Share 속성에 공유 이름을 설정합니다.
# Path 속성에 경로를 설정합니다.

$shares = net share | Select-String -Pattern '^.+\s+([A-Z]:\\.+)\s+.+' | ForEach-Object {
    $share = $_.Matches[0].Groups[0].Value.Split(' ')[0]
    $path = $_.Matches[0].Groups[1].Value
    [PSCustomObject]@{
        Share = $share
        Path = $path
    }
}

# $output 변수를 선언하고 foreach 루프를 사용하여 각 네트워크 공유에 대해 반복합니다.
# $size 변수에 Get-ChildItem cmdlet을 사용하여 공유 경로의 모든 파일의 크기를 계산합니다.
# $size 변수의 값을 1GB로 나눕니다.
# "$($share.Share) : $($size) GB" 문자열을 생성합니다.

$output = foreach ($share in $shares) {
    $size = (Get-ChildItem $share.Path -Recurse | Measure-Object -Property Length -Sum).Sum / 1GB
    "$($share.Share) : $($size) GB"
}

# $output 변수의 값을 Out-File cmdlet을 사용하여 NetshareSize.txt 파일에 저장합니다.

$output | Out-File -FilePath NetshareSize.txt
