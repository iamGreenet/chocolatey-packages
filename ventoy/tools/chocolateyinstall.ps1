$ErrorActionPreference = 'Stop';
$url = 'https://github.com/ventoy/Ventoy/releases/download/v1.0.13/ventoy-1.0.13-windows.zip'
$checksum = '9b5debbdade41332d9fea4c966a08743e9a263c79ed0e0e95fdba5ba0f139f09'

$packageName = $env:ChocolateyPackageName
$shortcutsPath = Join-Path ([Environment]::GetFolderPath("Programs")) 'Ventoy.lnk'
$unzipPath = "$Env:LOCALAPPDATA\$packageName"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $unzipPath
  url           = $url
  softwareName  = 'ventoy'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Get-ChildItem -Path $unzipPath | Get-ChildItem | Move-Item -Destination $unzipPath

Install-ChocolateyShortcut -shortcutFilePath $shortcutsPath -Target "$unzipPath\Ventoy2Disk.exe"









    








