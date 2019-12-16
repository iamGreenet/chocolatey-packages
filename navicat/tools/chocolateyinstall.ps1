$ErrorActionPreference = 'Stop';
$url = 'http://download3.navicat.com/download/navicat150_premium_en_x64.exe'

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'exe'
  url          = $url

  softwareName = 'PremiumSoft Navicat Premium*'

  checksum     = 'AD30AF49A6B01A69C6535ECA8BCCF2B7DBFB2925422B499815C0DBA62B545E17'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
