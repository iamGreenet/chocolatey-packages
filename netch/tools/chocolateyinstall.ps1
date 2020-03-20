$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/NetchX/Netch/releases/download/v1.4.1-Beta4/Netch.x86-v1.4.1-Beta4.zip'
$checksum = 'CFEF150B28DA6A9FE18B9D4D6C7807C440B6174B7F197C6A7F1AE725E355652E'
$url64 = 'https://github.com/NetchX/Netch/releases/download/v1.4.1-Beta4/Netch.x64-v1.4.1-Beta4.zip'
$checksum64 = 'FB09439EEF98FF69C4E810D0549449BBFC045249312E0D4B01E865BC89A31E50'
$title = $env:ChocolateyPackageTitle

$localAppData = $Env:LOCALAPPDATA
$shortcutsPath = [Environment]::GetFolderPath("Programs")

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$localAppData\$title\"
  url            = $url
  url64          = $url64

  softwareName   = 'netch*'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Netch.lnk') -Target (Join-Path -Path $localAppData -ChildPath "$title\Netch.exe")
