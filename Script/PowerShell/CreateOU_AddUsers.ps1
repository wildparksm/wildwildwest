# Import the Active Directory module
Import-Module ActiveDirectory

# Set the OU and group name
$ou = "OU=DLGROUPS,DC=DLCON,DC=CO,DC=KR"
$groupName = "AWS"

# Create the new security group in the specified OU
New-ADGroup -Name $groupName -GroupScope Global -Path $ou

# Add the specified user accounts to the group
Add-ADGroupMember -Identity $groupName -Members "DCC1", "DCC2", "DCC3", "DCC100", "DCC18"