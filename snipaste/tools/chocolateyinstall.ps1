$ErrorActionPreference = 'Stop';
$url = 'https://bitbucket.org/liule/snipaste/downloads/Snipaste-2.3.5-Beta-x86.zip'
$url64 = 'https://bitbucket.org/liule/snipaste/downloads/Snipaste-2.3.5-Beta-x64.zip'
$checksum = 'a4f2e169940c1968bfba1908a7ebd4a99044019895092ab5a58bcc13bf4fa0f8'
$checksum64 = 'e4bbe8aad3fc98ff0e1b8a24f3e4e5793aa1bccca81058b31649bf7159f9fd5e'

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
