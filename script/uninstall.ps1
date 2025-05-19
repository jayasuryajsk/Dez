$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $true

$installDir = Join-Path $env:LOCALAPPDATA 'Programs\Zed'
$shortcutPath = Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs\Zed.lnk'

if (Test-Path $installDir) {
    Remove-Item $installDir -Recurse -Force
}

if (Test-Path $shortcutPath) {
    Remove-Item $shortcutPath -Force
}

Remove-Item -Path 'HKCU:\Software\Classes\.zed' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path 'HKCU:\Software\Classes\Zed.File' -Recurse -Force -ErrorAction SilentlyContinue

Write-Output 'Zed has been uninstalled.'
