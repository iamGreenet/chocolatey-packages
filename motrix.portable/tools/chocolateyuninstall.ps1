$ErrorActionPreference = 'Stop';

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$packageName = $env:ChocolateyPackageName

Remove-Item -Path (Join-Path -Path $shortcutsPath -ChildPath 'Motrix.lnk') -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path "$Env:LOCALAPPDATA" -ChildPath "$packageName") -Recurse -Force -ErrorAction SilentlyContinue