$ErrorActionPreference = 'Stop';

$binPath = "$env:ChocolateyInstall\bin\"
$utils = @('getopt', 'gitignore', 'ln', 'runat', 'say', 'shasum', 'shim', 'sudo', 'time', 'touch', 'vimtutor')

foreach ($util in $utils) {
    # Uninstall-BinFile -Name $util -Path "$toolsDir\$util.ps1"
    Remove-Item -Path "$binPath\$util.ps1" -Force -ErrorAction SilentlyContinue
}