$ErrorActionPreference = 'Stop';
$url = 'https://bitbucket.org/liule/snipaste/downloads/Snipaste-2.4-Beta-x86.zip'
$url64 = 'https://bitbucket.org/liule/snipaste/downloads/Snipaste-2.4-Beta-x64.zip'
$checksum = 'e6c2094d257da6bd8ad5bd8d527e47968f85d358e8ddc3f3c72d3a1b99b28eac'
$checksum64 = '7eaf2da6f4aef39f49fa5b07d17cf20d4998dcaaea0c20868e5fbc9ce1eedb2b'

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
