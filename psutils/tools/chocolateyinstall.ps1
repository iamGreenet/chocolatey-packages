$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/lukesampson/psutils/archive/master.zip'
$checksum = '4C8AD14D2C137FBEEDCEDC2D0DE4027DCAE2E39D0E80A0709EA9C09717BE093D'
$packageName = $env:ChocolateyPackageName
$binPath = "$env:ChocolateyInstall\bin\"
$utils = @('getopt', 'gitignore', 'ln', 'runat', 'say', 'shasum', 'shim', 'sudo', 'time', 'touch', 'vimtutor')

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = $url

  softwareName   = 'psutils*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Move-Item "$toolsDir\psutils-master\*" $toolsDir
Remove-Item "$toolsDir\psutils-master"

foreach ($util in $utils) {
  # Install-BinFile -Name $util -Path "$toolsDir\$util.ps1"
  Copy-Item -Path "$toolsDir\$util.ps1" -Destination $binPath
}