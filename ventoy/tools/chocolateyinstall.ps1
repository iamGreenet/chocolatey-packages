$ErrorActionPreference = 'Stop';
$url = 'https://github.com/ventoy/Ventoy/releases/download/v1.0.18/ventoy-1.0.18-windows.zip'
$checksum = '2cc51c2f127671a55af316d659afbc80781afcef2aaf71dc32d3903f9fa7ff7f'

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









    








