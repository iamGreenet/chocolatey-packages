$ErrorActionPreference = 'Stop';
$url = 'https://github.com/agalwood/Motrix/releases/download/v1.5.15/Motrix-1.5.15-ia32-win.zip'
$url64 = 'https://github.com/agalwood/Motrix/releases/download/v1.5.15/Motrix-1.5.15-win.zip'
$checksum = 'c1be36ac072373318ef4f43387c06af173666d926b1c30e09e8415d98fa78243'
$checksum64 = '76e35952d8edfa14d97a720de3ee07d65468ca218c3f65d78e1bd185224118db'
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










    








