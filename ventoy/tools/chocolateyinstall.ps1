$ErrorActionPreference = 'Stop';
$url = 'https://github.com/ventoy/Ventoy/releases/download/v1.0.07/ventoy-1.0.07-windows.zip'
$checksum = '095B06C21B28EADD69178EFF75CB447F2A61BDC467319D6611771EE44CCC3D39'

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









    








