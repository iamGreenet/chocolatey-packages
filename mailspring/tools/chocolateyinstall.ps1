
$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Foundry376/Mailspring/releases/download/1.7.7/MailspringSetup.exe'
$checksum = '85ce024f160acb2741b74523e879803e9c0424a35f0da47aae266a1c71f9f217'

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
