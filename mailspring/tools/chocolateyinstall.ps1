
$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Foundry376/Mailspring/releases/download/1.7.8/MailspringSetup.exe'
$checksum = '0a07c7f964f350f94fe1f8c3b57ea88ee7c0f8cdcb34687db1a061972c252f54'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'Mailspring*'

  checksum       = $checksum
  checksumType   = 'sha256'

  silentArgs     = '-s'
}

Install-ChocolateyPackage @packageArgs
