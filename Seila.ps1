function Test-Pipeline() {
  param(
    [Parameter(ValueFromPipeline)] $numero
  )

  begin {
    Write-Host "Início"
  }
  process {
    Write-Host $numero
  }
  end {
    Write-Host "Fim"
  }
}
