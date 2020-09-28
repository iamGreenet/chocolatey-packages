$ErrorActionPreference = 'Stop';
$url = 'https://github.com/ventoy/Ventoy/releases/download/v1.0.22/ventoy-1.0.22-windows.zip'
$checksum = '6fae2b19406cda24c516b66228e31a0ac07703a5ed8b530c21f5bf5827ac9467'

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









    








