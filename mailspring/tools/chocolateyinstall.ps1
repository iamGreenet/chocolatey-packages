
$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Foundry376/Mailspring/releases/download/1.7.2/MailspringSetup.exe'
$checksum = 'c9d64ab23a4f368c9b9645c3ed6e4af0642b31af95e21a6f172ed84e48dad28a'

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
