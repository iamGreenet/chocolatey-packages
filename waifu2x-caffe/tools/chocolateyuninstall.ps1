$ErrorActionPreference = 'Stop';

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$packageName = $env:ChocolateyPackageName
$installPath = Join-Path -Path "$localAppData" -ChildPath "$packageName"

Remove-Item -Path (Join-Path -Path $shortcutsPath -ChildPath 'waifu2x-caffe.lnk') -ErrorAction SilentlyContinue
if (Test-Path "$installPath") { Remove-Item -Path "$installPath" -Recurse -Force -ErrorAction SilentlyContinue }