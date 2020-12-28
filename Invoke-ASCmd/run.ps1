$result_message = ""
$request_body = Get-Content $Request -Raw 


try{
    if ($request_body) 
    {
        $azure_ssas_instance = $(ls env:APP_SETTING_AZURE_TABULAR_INSTANCE).value
        $user = $(ls env:APP_SETTING_AZURE_USER_NAME).value
        $pwd_txt_path = $(ls env:APP_SETTING_AZURE_TXT_PWD).value
        $pass_key = {your pass key} #sample [byte]95,13,58,45,22,11,88,82,11,34,67,91,19,20,96,82
        $secure_pwd = ConvertTo-SecureString -key $pass_key -String ($pwd_txt_path) #$PWord = ConvertTo-SecureString -String "xxx" -AsPlainText -Force

        $credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $user,$secure_pwd
        #The ASCmdlet can be process operation or roles management operation
        $result_message = Invoke-ASCmd -Credential $credential -server:$azure_ssas_instance -Query:$request_body
    }
    else{
        $result_message = "Please answer the good ASCmdlet in the Body request."
    }
}
catch{
    $result_message = "Error: $($_.Exception.Message)"
}

Out-File -Encoding Ascii -FilePath $Response -inputObject $result_message
