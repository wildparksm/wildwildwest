#!/bin/bash

# 로그인
Connect-AzAccount

# 모든 구독에서 Basic SKU public IP 주소 가져오기
$basicIps = Get-AzPublicIpAddress -ListAll | Where-Object { $_.SkuName -eq "Basic" }

# 결과 출력
if ($basicIps.Count -ne 0) {
    Write-Output "Basic SKU public IP 주소 목록:"
    foreach ($ip in $basicIps) {
        Write-Output "구독 ID: $($ip.SubscriptionId)"
        Write-Output "리소스 그룹: $($ip.ResourceGroupName)"
        Write-Output "공개 IP 주소 이름: $($ip.Name)"
        Write-Output ""
    }
} else {
    Write-Output "현재 기본 SKU public IP 주소가 없습니다."
}
