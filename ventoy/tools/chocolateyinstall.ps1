$ErrorActionPreference = 'Stop';
$url = 'https://github.com/ventoy/Ventoy/releases/download/v1.0.17/ventoy-1.0.17-windows.zip'
$checksum = '2ebde7e40422e9c5a50ec4877fec42c45ca085ed6404a3eb9f241025db7e2deb'

$packageName = $env:ChocolateyPackageName
$shortcutsPath = Join-Path ([Environment]::GetFolderPath("Programs")) 'Ventoy.lnk'
$unzipPath = "$Env:LOCALAPPDATA\$packageName"
$version = $env:ChocolateyPackageVersion

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $unzipPath
  url           = $url
  softwareName  = 'ventoy'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Copy-Item -Path "$unzipPath/ventoy-$version/*" -Destination $unzipPath -Force -Recurse
Remove-Item "$unzipPath/ventoy-$version" -Force -Recurse

Install-ChocolateyShortcut -shortcutFilePath $shortcutsPath -Target "$unzipPath\Ventoy2Disk.exe" -WorkingDirectory $unzipPath









    








