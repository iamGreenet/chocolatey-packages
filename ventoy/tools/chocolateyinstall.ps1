$ErrorActionPreference = 'Stop';
$url = 'https://github.com/ventoy/Ventoy/releases/download/v1.0.12/ventoy-1.0.12-windows.zip'
$checksum = 'd1be86c963fe495592ba8b36fd7f5766a5df2320bfc87aaf1b9325bc90c214c5'

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









    








