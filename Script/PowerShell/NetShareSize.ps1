$shares = net share | Select-String -Pattern '^.+\s+([A-Z]:\\.+)\s+.+' | ForEach-Object {
    $share = $_.Matches[0].Groups[0].Value.Split(' ')[0]
    $path = $_.Matches[0].Groups[1].Value
    [PSCustomObject]@{
        Share = $share
        Path = $path
    }
}

$output = foreach ($share in $shares) {
    $size = (Get-ChildItem $share.Path -Recurse | Measure-Object -Property Length -Sum).Sum / 1GB
    "$($share.Share) : $($size) GB"
}

$output | Out-File -FilePath NetshareSize.txt