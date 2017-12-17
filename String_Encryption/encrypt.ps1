#raw
$RawPassword = '1B91DFA1-654E-4770-9D7E-1E8CCF2042CB'

function base64Encode(){
    Param(
        [Parameter(Mandatory=$True)]
        [ValidateNotNull()]
        [string]$valueToEncode
    )
    [string] $encodedValue = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($valueToEncode))
    return $encodedValue
}


Function encryptEnvelope ($unprotectedcontent, $cert)
{
            [System.Reflection.Assembly]::LoadWithPartialName("System.Security") | Out-Null
            $utf8content = [Text.Encoding]::UTF8.GetBytes($unprotectedcontent)
            $content = New-Object Security.Cryptography.Pkcs.ContentInfo `
                    -argumentList (,$utf8content)
            $env = New-Object Security.Cryptography.Pkcs.EnvelopedCms $content
            $recpient = (New-Object System.Security.Cryptography.Pkcs.CmsRecipient($cert))
            $env.Encrypt($recpient)
            $base64string = [Convert]::ToBase64String($env.Encode())
            return $base64string
}

$Cert = Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -like "CN=API.test*"}

encryptEnvelope -unprotectedcontent $(base64Encode -valueToEncode $RawPassword) -cert $Cert > test.txt

