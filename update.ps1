param(
    [String[]]$PackageName = '*'
)

function call_update([String]$PackageName) {
    Set-Location .\$PackageName
    if (Test-Path ".\update.ps1") {
        try {
            & ".\update.ps1"
        } catch {
            Write-Error $Error[0].Exception
        }
    }
    Set-Location ..\
}

if ($PackageName -eq '*') {
    Get-ChildItem -Directory | ForEach-Object {
        call_update($_.BaseName)
    }
} else {
    foreach ($item in $PackageName) {
        if (Test-Path $item) {
            call_update($item)
        }
    }
}