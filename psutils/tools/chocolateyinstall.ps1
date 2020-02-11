$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/lukesampson/psutils/archive/master.zip'
$checksum = '2F601C517555478EC619688C1AF64F530BA172AA0015298C3556CCBA71C75A3B'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $url

  softwareName   = 'psutils*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Remove-Item -Recurse -ErrorAction SilentlyContinue -Exclude "*.ps1" "$toolsDir\psutils-master\*"
Install-ChocolateyPath "$toolsDir\psutils-master\"