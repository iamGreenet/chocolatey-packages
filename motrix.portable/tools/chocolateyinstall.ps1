$ErrorActionPreference = 'Stop';
$url = 'https://github.com/agalwood/Motrix/releases/download/v1.4.1/Motrix-1.4.1-ia32-win.zip'
$url64 = 'https://github.com/agalwood/Motrix/releases/download/v1.4.1/Motrix-1.4.1-win.zip'
$checksum = '4BF2BB8272D7E7A48130DC65B3CA313C91DAA0CF2F4C2603F7CE822793757C55'
$checksum64 = 'D42F72EA029FC29A38A1FB9439EAE8CB677FC243E8D9AFE35F2F6576F7F7DFBA'
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










    








