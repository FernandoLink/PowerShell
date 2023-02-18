function Get-FileSHA1($filePath) {

    if ($filePath -ne $null) {
        $fileContent = Get-Content $filePath
        $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

        $sha1 = New-Object System.Security.Cryptography.SHA1Managed

        $hash = $sha1.ComputeHash($fileBytes)

        $prettyHashSB = New-Object System.Text.StringBuilder
        foreach ($byte in $hash) {
            $hexaNotation = $byte.tostring("X2")
            $prettyHashSB.Append($hexaNotation) > $null
        }
        $prettyHashSB.ToString() 
    } else {
        foreach ($item in $input) {
            $fileContent = Get-Content $item
            $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

            $sha1 = New-Object System.Security.Cryptography.SHA1Managed

            $hash = $sha1.ComputeHash($fileBytes)

            $prettyHashSB = New-Object System.Text.StringBuilder
            foreach ($byte in $hash) {
                $hexaNotation = $byte.tostring("X2")
                $prettyHashSB.Append($hexaNotation) > $null
            }
            $prettyHashSB.ToString() 
        }
    }
}

function Get-FileSHA256($filePath) {
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    $sha1 = New-Object System.Security.Cryptography.SHA256Managed
    $hash = $sha1.ComputeHash($fileBytes)

    $prettyHashSB = New-Object System.Text.StringBuilder
    foreach ($byte in $hash) {
        $hexaNotation = $byte.tostring("X2")
        $prettyHashSB.Append($hexaNotation) > $null
    }
    $prettyHashSB.ToString() 
}

<#
$arquivo = "C:\Windows\Temp\AdobeARM.log"
$hashDoArquivo = Get-FileSHA1 $arquivo
Write-Host "O hash do arquivo $arquivo eh $hashDoArquivo" -BackgroundColor red -ForegroundColor White

$arquivo = "C:\Windows\Temp\AdobeARM.log"
$hashDoArquivo = Get-FileSHA256 $arquivo
Write-Host "O hash do arquivo $arquivo eh $hashDoArquivo" -BackgroundColor red -ForegroundColor White
#>