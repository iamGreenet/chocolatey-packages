$ErrorActionPreference = 'Stop';
$url = 'https://github.com/agalwood/Motrix/releases/download/v1.5.13/Motrix-1.5.13-ia32-win.zip'
$url64 = 'https://github.com/agalwood/Motrix/releases/download/v1.5.13/Motrix-1.5.13-win.zip'
$checksum = '39c6d72c98a70a430c00c840e59f0a8d920a690e3289632992f3ccbb12c40430'
$checksum64 = '40ca21744bfac722518e7f25b90f806e85e82e015041325535d91f6d776eaa4e'
$packageName = $env:ChocolateyPackageName
$shortcutsPath = [Environment]::GetFolderPath("Programs")

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$Env:LOCALAPPDATA\$packageName\"
  url            = $url
  url64bit       = $url64

  softwareName   = 'motrix'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Motrix.lnk') -targetPath (Join-Path -Path $Env:LOCALAPPDATA -ChildPath "$packageName\Motrix.exe")










    








