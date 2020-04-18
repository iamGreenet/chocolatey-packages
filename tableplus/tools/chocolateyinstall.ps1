$ErrorActionPreference = 'Stop';
$url = 'https://s3.amazonaws.com/tableplus-win-builds/122/TablePlusSetup.exe'
$checksum = '05BB147A189DEB2F86AF70981CB29847E0DC8F32617738273F5F8C28DD2ABAB8'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'TablePlus'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
