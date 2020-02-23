$ErrorActionPreference = 'Stop';
$url = 'https://dl.snipaste.com/win-x86-beta'
$url64 = 'https://dl.snipaste.com/win-x64-beta'
$checksum = '3f91e1d94c9ba45b4e3345f616da473b4c453e19e6806f5db021d29cc9ea9dc0'
$checksum64 = '09069c9d79c111cfe4b3b30199bf26291e5faf1a8e202444dc01e51eb6c3e071'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$foldName = $env:ChocolateyPackageTitle
$installPath = Join-Path -Path $localAppData -ChildPath $foldName

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $installPath
  url            = $url
  url64bit       = $url64

  softwareName   = 'snipaste*'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Snipaste.lnk') -targetPath (Join-Path -Path $installPath -ChildPath 'snipaste.exe')
