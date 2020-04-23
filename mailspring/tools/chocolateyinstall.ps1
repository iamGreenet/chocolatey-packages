
$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Foundry376/Mailspring/releases/download/1.7.6/MailspringSetup.exe'
$checksum = '4536da18168e19f6e00ee7b3b531c238ccbe45b97e96bce2cca64106f6687761'

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
