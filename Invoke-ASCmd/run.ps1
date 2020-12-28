$errorMessage = "Ok"
$AzureSasInstance = "{your azure instance}"
$User = "{your user name}"
$PwdTXTPath = "{your crypted password}"
$PassKey = {your pass key} #Sample : [byte]95,13,58,45,22,11,88,82,11,34,67,91,19,20,96,82
$PWord = ConvertTo-SecureString -key $PassKey -String ($PwdTXTPath) #$PWord = ConvertTo-SecureString -String "xxx" -AsPlainText -Force
$Credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $User,$PWord


$requestBody = Get-Content $Request -Raw #| ConvertFrom-Json

try{
    Invoke-ASCmd -Credential $Credential -server:$AzureSasInstance -Query:$requestBody
}
catch{
    $errorMessage = "Error: $($_.Exception.Message)"
}

Out-File -Encoding Ascii -FilePath $Response -inputObject "Result : $errorMessage"
