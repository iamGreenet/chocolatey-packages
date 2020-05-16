$ErrorActionPreference = 'Stop';
$url = 'https://github.com/agalwood/Motrix/releases/download/v1.5.10/Motrix-1.5.10-ia32-win.zip'
$url64 = 'https://github.com/agalwood/Motrix/releases/download/v1.5.10/Motrix-1.5.10-win.zip'
$checksum = 'b794a2480aff90d25923a6dbf706d46f5d8e4b088295dffcc77699eebf8afe1b'
$checksum64 = 'c71ac2726688e0efe34626e27215c28808594f0b57bab3375052982ae9b7a12b'
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










    








