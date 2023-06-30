$Cred = Get-Credential
While ($True) {
    Test-ComputerSecureChannel -Credential $Cred -Repair
    Start-Sleep -Seconds 5
}