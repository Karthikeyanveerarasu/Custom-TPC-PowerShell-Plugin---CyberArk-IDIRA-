$strActionName = $args[0]
$Username =$args[1]
$Address =$args[2]
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-FlowInfo{
param(
[Parameter(Mandatory=$true)]
[string]$Message
)
Write-Host ("Info: {0}" -f $Message)
}

function New-StandardErrorMessage {
param(
[Parameter(Mandatory=$true)]
[string]$Code,
[Parameter(Mandatory=$true)]
[string]$Message
)

return "{0}: {1}" -f $Code, $Message
}

function Invoke-AppLogin{
param(
[Parameter(Mandatory=$true)]
[string]$Username,

[Parameter(Mandatory=$true)]
[string]$Address,

[Parameter(Mandatory=$true)]
[string]$Password
)
try{
Write-FlowInfo "Starting password verification."
Write-FlowInfo "Username: $Username"
$BaseUrl = "$($Address)"
if($strActionName -eq "verifypass"){

# Verify Logic Here

Write-Host "Password Verified successfully."
exit 0;

else{
Write-Host( New-StandardErrorMessage -Code "ERR_INVALID_USERNAMR_OR_PASSWORD" -Message "Invalid Credentails" )
Write-Host "Login request failed."
exit 1;
}
}
if($strActionName -eq "changepass"){


Write-Host "Enter new password."
$newpass = [Console]::ReadLine()


#change logic Here

Write-Host "Password updated successfully."
exit 0;
}

}
catch{
Write-Host( New-StandardErrorMessage -Code "ERR_SCRIOT_FAILED" -Message $_.Exception.Message )
exit 1;
}
}
Write-Host "Enter current password."
$Password = [Console]::ReadLine()
Invoke-AppLogin -Username $Username -Address $Address -Password $Password
