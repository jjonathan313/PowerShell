$EncryptedPwd = $(Get-Content .\test.txt).Trim()
function base64Decode(){
    Param(
        [Parameter(Mandatory=$True)]
        [ValidateNotNull()]
        [string]$valueToDecode
    )
    [string] $decodedValue = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($valueToDecode))
    return $decodedValue
}

function decrypt-envelope ($base64string)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.Security") | Out-Null
    $content = [Convert]::FromBase64String($base64string)

    $env = New-Object Security.Cryptography.Pkcs.EnvelopedCms
    $env.Decode($content)
    $env.Decrypt()

    $utf8content = [text.encoding]::UTF8.getstring($env.ContentInfo.Content)
    return $utf8content
}

base64Decode -valueToDecode $(decrypt-envelope -base64string $EncryptedPwd)
