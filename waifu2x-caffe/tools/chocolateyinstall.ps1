$ErrorActionPreference = 'Stop';
$url = 'https://github.com/lltcggie/waifu2x-caffe/releases/download/1.2.0.3/waifu2x-caffe.zip'
$checksum = 'a6d5627425c8e08448c7c20d1e5fc246f51c57e511e4bc757c5320ce405230a7'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$packageName = $env:ChocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$localAppData"
  url            = $url

  softwareName   = 'waifu2x-caffe*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'waifu2x-caffe.lnk') -targetPath (Join-Path -Path "$localAppData" -ChildPath "$packageName\waifu2x-caffe.exe")
