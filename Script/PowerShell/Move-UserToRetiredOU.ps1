# Import the Active Directory Module
import-module activedirectory

# Get the user account
$user = get-aduser testacc1

# Get the OU to move the user account to, but that's not work anymore...
$ou = get-adorganizationalunit 퇴직자

# Move the user account to the OU
move-aduser $user -destination $ou


# this for real.
Import-Module ActiveDirectory
Get-ADUser -Identity DCC20212045 | Move-ADObject -TargetPath "OU=퇴직자,DC=DLCON,DC=CO,DC=KR"
