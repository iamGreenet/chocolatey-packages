
$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Foundry376/Mailspring/releases/download/1.7.4/MailspringSetup.exe'
$checksum = '1e16e6f4f33c25a99e0f78cbec85db0c5f9e91f4b14800acb93223733a7020b6'

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
