$expirationDate = (Get-Date "08/31/2023").AddDays(1)
Set-ADAccountExpiration -Identity dcc90000223 -DateTime $expirationDate