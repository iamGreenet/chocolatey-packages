$ErrorActionPreference = 'Stop';
$url = 'https://github.com/agalwood/Motrix/releases/download/v1.5.12/Motrix-1.5.12-ia32-win.zip'
$url64 = 'https://github.com/agalwood/Motrix/releases/download/v1.5.12/Motrix-1.5.12-win.zip'
$checksum = '1595251387e1054b43abae791d8de3f028da10e80f1b10403df339bcff8a2b11'
$checksum64 = '0d8a10a5e8b677aefea7168de1b796ef26319954d4f3fea6dccd0595b7d4052b'
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










    








