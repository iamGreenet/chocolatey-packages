$ErrorActionPreference = 'Stop';

$shortcutPath = [Environment]::GetFolderPath("Programs") + '\Office Tool Plus.lnk'
$installDir = $Env:LOCALAPPDATA + '\' + $env:ChocolateyPackageName

Write-Host "Remove $shortcutPath"
Remove-Item -Path $shortcutPath -ErrorAction SilentlyContinue
Write-Host "Remove $installDir"
Remove-Item -Path $installDir -Recurse -Force -ErrorAction SilentlyContinue