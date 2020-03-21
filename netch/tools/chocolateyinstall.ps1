$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/NetchX/Netch/releases/download/1.4.1-Beta5/Netch.x86-1.4.1-Beta5.zip'
$checksum = '88C0050C141CB58D6DE763E790470BFC27BD97CA1CE11BA30580DEFC69B20EB2'
$url64 = 'https://github.com/NetchX/Netch/releases/download/1.4.1-Beta5/Netch.x64-1.4.1-Beta5.zip'
$checksum64 = 'C6C974FA5F1AEF803452633E210A46C2B5DC63F6BA49AE93ACC5745E97CC0429'
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
