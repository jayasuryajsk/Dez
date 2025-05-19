$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $true

param(
    [string]$Channel = $env:ZED_CHANNEL
)

if (-not $Channel) { $Channel = 'stable' }

$arch = if ($env:PROCESSOR_ARCHITECTURE -eq 'ARM64') { 'aarch64' } else { 'x86_64' }
$tmp    = New-Item -ItemType Directory -Path ([System.IO.Path]::GetTempPath()) -Name ("zed-" + [System.Guid]::NewGuid().ToString())
$bundle = Join-Path $tmp "zed-windows-$arch.zip"
$uri    = "https://zed.dev/api/releases/$Channel/latest/zed-windows-$arch.zip"

Write-Output "Downloading Zed..."
Invoke-WebRequest -Uri $uri -OutFile $bundle -UseBasicParsing

$installDir = Join-Path $env:LOCALAPPDATA 'Programs\Zed'
if (Test-Path $installDir) { Remove-Item $installDir -Recurse -Force }
Expand-Archive -Path $bundle -DestinationPath $installDir -Force

$startMenuDir = Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs'
$shortcutPath = Join-Path $startMenuDir 'Zed.lnk'
$wsh = New-Object -ComObject WScript.Shell
$sc = $wsh.CreateShortcut($shortcutPath)
$sc.TargetPath = Join-Path $installDir 'Zed.exe'
$sc.IconLocation = Join-Path $installDir 'Zed.exe'
$sc.WorkingDirectory = $installDir
$sc.Save()

# File association for .zed files
$progIdPath = 'HKCU:\Software\Classes\Zed.File'
New-Item -Path $progIdPath -Force | Out-Null
Set-ItemProperty -Path $progIdPath -Name '(Default)' -Value 'Zed File' | Out-Null
New-Item -Path "$progIdPath\shell\open\command" -Force | Out-Null
$cli = Join-Path $installDir 'bin\zed.exe'
Set-ItemProperty -Path "$progIdPath\shell\open\command" -Name '(Default)' -Value "`"$cli`" `"%1`"" | Out-Null
New-Item -Path 'HKCU:\Software\Classes\.zed' -Force | Out-Null
Set-ItemProperty -Path 'HKCU:\Software\Classes\.zed' -Name '(Default)' -Value 'Zed.File' | Out-Null

Write-Output "Zed installed to $installDir"
