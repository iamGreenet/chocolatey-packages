$ErrorActionPreference = 'Stop';

$shortcutPath = [Environment]::GetFolderPath("Programs") + "\Netch.lnk"
$localAppData = $Env:LOCALAPPDATA
$installPath = "$Env:LOCALAPPDATA\$env:ChocolateyPackageName"

Remove-Item -Path $shortcutPath -ErrorAction SilentlyContinue
if (Test-Path "$installPath") { 
    Remove-Item -Path "$installPath" -Recurse -Force -ErrorAction SilentlyContinue
}