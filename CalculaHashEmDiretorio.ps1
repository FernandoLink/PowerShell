param($diretorio)

$ErrorActionPreference = "Stop"

. .\ShaFile.ps1

$arquivos = Get-ChildItem $diretorio -File

foreach($item in $arquivos.FullName) {
    $hashItem = Get-FileSHA1 $item
    Write-Host "O hash do arquivo $item eh $hashItem" -BackgroundColor Red -ForegroundColor White
}