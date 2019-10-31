$ErrorActionPreference = 'Stop';

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$title = $env:ChocolateyPackageTitle
$localAppData = $Env:LOCALAPPDATA
$installPath = (Join-Path -Path "$localAppData" -ChildPath "$title")

Remove-Item -Path (Join-Path -Path $shortcutsPath -ChildPath 'Snipaste.lnk') -ErrorAction SilentlyContinue
if (Test-Path $installPath) { Remove-Item -Path $installPath -Recurse -Force -ErrorAction SilentlyContinue }
