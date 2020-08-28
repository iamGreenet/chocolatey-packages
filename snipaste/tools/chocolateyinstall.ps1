$ErrorActionPreference = 'Stop';
$url = 'https://bitbucket.org/liule/snipaste/downloads/Snipaste-2.5.1-Beta-x86.zip'
$url64 = 'https://bitbucket.org/liule/snipaste/downloads/Snipaste-2.5.1-Beta-x64.zip'
$checksum = '313972cb8f53394e176aff4116bafabc5c142518b66e9c9bd0d6b8913b7c80ca'
$checksum64 = 'e566eb4b9607cca091b3c906421cadeaf57dcaab1d1abe1c0240b93f43d8692c'

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
