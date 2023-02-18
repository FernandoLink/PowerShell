param($tipoDeExportacao)

$ErrorActionPreference = "Stop"

# comentário
$nameExpr = @{
    Label = "Nome";
    Expression = { $_.Name }
}

<#
comentário
de 
várias linhas
#>
$lengthExpr = @{
    Label = "Tamanho";
    Expression = { "{0:N2}KB" -f ($_.Length / 1KB) }
}

$params = $nameExpr, $lengthExpr

$resultado = 
    gci -Recurse -File |
        ? Name -like "*e*" |
        select $params

if ($tipoDeExportacao  -eq "HTML") {
    $estilos = Get-Content .\styles.css
    $styleTag = "<style>$estilos</style>"
    $tituloPagina = "Relatorio de Scripts em Migracao"
    $tituloBody = "<h1>$tituloPagina</h1>"
    $resultado  | ConvertTo-html -Head $styleTag -Title $tituloPagina -Body $tituloBody | Out-File .\relatorio.html
} elseif ($tipoDeExportacao -eq "JSON") {
    $resultado  | ConvertTo-json | Out-File .\relatorio.json
} elseif ($tipoDeExportacao -eq "CSV") {
    $resultado  | ConvertTo-csv -NoTypeInformation -Delimiter ";" | Out-File .\relatorio.csv
} else {
    "Parametro do tipo de exportacao nao informado: [HTML, JSON, CSV]"
}