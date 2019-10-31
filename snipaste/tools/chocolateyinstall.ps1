$ErrorActionPreference = 'Stop';
$url = 'https://dl.snipaste.com/win-x86-beta-cn'
$url64 = 'https://dl.snipaste.com/win-x64-beta-cn'
$checksum = '1d2bee8e99f6c407cc10eb8b38f1f71fd78d44255c4368b988587a6cb2060b99'
$checksum64 = '31dcd4dfedc4afa0f52dac775ee645b4b23e8ef54438dc677ff9de1c10ca2c47'

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
