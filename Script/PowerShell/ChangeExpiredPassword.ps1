$secpwd= ConvertTo-SecureString -String "P@ssword1!" -AsPlainText -Force
Set-ADAccountPassword semadmin1 -NewPassword $secpwd -Reset
Set-ADUser semadmin1 -ChangePasswordAtLogon $false
# Azure VM - 작업 - Run-Command (실행명령)