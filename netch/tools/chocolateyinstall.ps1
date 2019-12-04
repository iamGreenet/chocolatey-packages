$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/NetchX/Netch/releases/download/1.3.5/Netch.1.3.5.x86.7z'
$checksum = 'f6c59e368ef36d0092f3caf6e18f56fcc8a90b9e9397909e915919355a1c92cd'
$url64 = 'https://github.com/NetchX/Netch/releases/download/1.3.5/Netch.1.3.5.x64.7z'
$checksum64 = '03bf6947b131e5ad88663af249351460c0642ee632c53f71635881c9c5a6f4a5'
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
