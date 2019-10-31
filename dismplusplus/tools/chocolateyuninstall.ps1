$ErrorActionPreference = 'Stop';

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$title = $env:ChocolateyPackageTitle

Remove-Item -Path (Join-Path -Path $shortcutsPath -ChildPath 'Dism++.lnk') -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path -Path "$Env:LOCALAPPDATA" -ChildPath "$title") -Recurse -Force -ErrorAction SilentlyContinue