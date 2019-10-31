$ErrorActionPreference = 'Stop';

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$title = $env:ChocolateyPackageTitle
$installPath = Join-Path -Path "$localAppData" -ChildPath "$title"

Remove-Item -Path (Join-Path -Path $shortcutsPath -ChildPath 'Netch.lnk') -ErrorAction SilentlyContinue
if (Test-Path "$installPath") { Remove-Item -Path "$installPath" -Recurse -Force -ErrorAction SilentlyContinue }