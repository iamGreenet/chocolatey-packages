$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/NetchX/Netch/releases/download/1.4.1-Beta2/Netch.x86-1.4.1-Beta2.zip'
$checksum = '0B163DAA0BA7ED7D99D2D718C28405288FF4CC82DA4C61CB050DFE1D132E9577'
$url64 = 'https://github.com/NetchX/Netch/releases/download/1.4.1-Beta2/Netch.x64-1.4.1-Beta2.zip'
$checksum64 = '6A08E5944B669E9F68E046E75D193B7165A8515AD873296DE4DE0B897D568760'
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
