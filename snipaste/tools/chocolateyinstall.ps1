$ErrorActionPreference = 'Stop';
$url = 'https://bitbucket.org/liule/snipaste/downloads/Snipaste-2.5-Beta-x86.zip'
$url64 = 'https://bitbucket.org/liule/snipaste/downloads/Snipaste-2.5-Beta-x64.zip'
$checksum = 'df66fa5fb0a09a45c864a5ea677d8386c20cdf92209fb478c74482d205e28f9b'
$checksum64 = '630cc9d34019a003d903ef3337e10b026c71895bdbdc249f67de79a98e4bdeda'

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
