Get-ADComputer -Filter * -Properties * | 
Sort-Object LastLogon | 
Select-Object Name, LastLogonDate,@{Name='LastLogon';Expression={[DateTime]::FromFileTime($_.LastLogon)}} | 
Export-Csv C:\adcomputers-last-logon.csv -NoTypeInformation

###########################################################################################################


$Computers =  Get-ADComputer  -Filter {(enabled -eq "true") -and (OperatingSystem -Like "*10*")} | Select-Object -ExpandProperty Name
$output=@()
ForEach($PSItem in $Computers) {
$User = Get-CimInstance Win32_ComputerSystem -ComputerName $PSItem | Select-Object -ExpandProperty UserName
$Obj = New-Object -TypeName PSObject -Property @{
        "Computer" = $PSItem
        "User" = $User
    }
$output+=$Obj    
}

