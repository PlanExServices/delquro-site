$ErrorActionPreference = "Stop"

$Project = "C:\Users\plane\delquro-site"
Set-Location $Project

if (-not (Test-Path ".\style.css")) {
    throw "style.css not found in $Project"
}

$BackupRoot = Join-Path $Project ".site-backups"
if (-not (Test-Path $BackupRoot)) {
    New-Item -ItemType Directory -Path $BackupRoot | Out-Null
}

$Stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$BackupDir = Join-Path $BackupRoot $Stamp
New-Item -ItemType Directory -Path $BackupDir | Out-Null
Copy-Item ".\style.css" (Join-Path $BackupDir "style.css") -Force

$css = Get-Content ".\style.css" -Raw

$replacements = @(
    @{ Old='--accent: #48aeb3;';        New='--accent: #527e69;' },
    @{ Old='--accent-bright: #72e0e5;'; New='--accent-bright: #739f8a;' },
    @{ Old='--accent: #2d9ca3;';        New='--accent: #628c78;' },
    @{ Old='--accent-bright: #21878d;'; New='--accent-bright: #85ae9b;' },

    @{ Old='--accent: #7a2330;';        New='--accent: #527e69;' },
    @{ Old='--accent-bright: #a63a4b;'; New='--accent-bright: #739f8a;' },
    @{ Old='--accent: #8b2f3d;';        New='--accent: #628c78;' },
    @{ Old='--accent-bright: #b64a5d;'; New='--accent-bright: #85ae9b;' },

    @{ Old='--accent: #3f6b57;';        New='--accent: #527e69;' },
    @{ Old='--accent-bright: #5f8f77;'; New='--accent-bright: #739f8a;' },
    @{ Old='--accent: #4c7563;';        New='--accent: #628c78;' },
    @{ Old='--accent-bright: #6a917d;'; New='--accent-bright: #85ae9b;' },

    @{ Old='--accent: #4b7762;';        New='--accent: #527e69;' },
    @{ Old='--accent-bright: #699681;'; New='--accent-bright: #739f8a;' },
    @{ Old='--accent: #5a8470;';        New='--accent: #628c78;' },
    @{ Old='--accent-bright: #79a08d;'; New='--accent-bright: #85ae9b;' },

    @{ Old='--accent: #2f5c49;';        New='--accent: #527e69;' },
    @{ Old='--accent-bright: #4a7a63;'; New='--accent-bright: #739f8a;' },
    @{ Old='--accent: #3f6856;';        New='--accent: #628c78;' },
    @{ Old='--accent-bright: #5a836f;'; New='--accent-bright: #85ae9b;' },

    @{ Old='--accent: #5d7f6d;';        New='--accent: #527e69;' },
    @{ Old='--accent-bright: #7fa08e;'; New='--accent-bright: #739f8a;' },
    @{ Old='--accent: #6c8c7c;';        New='--accent: #628c78;' },
    @{ Old='--accent-bright: #8faf9d;'; New='--accent-bright: #85ae9b;' }
)

foreach ($pair in $replacements) {
    $css = $css.Replace($pair.Old, $pair.New)
}

Set-Content ".\style.css" $css -Encoding UTF8

Write-Host "Green accent applied." -ForegroundColor Green
Write-Host "Backup saved to: $BackupDir" -ForegroundColor Yellow
Write-Host "Current accent lines:" -ForegroundColor Cyan
Select-String -Path ".\style.css" -Pattern -- '--accent:','--accent-bright:' | Select-Object LineNumber, Line
