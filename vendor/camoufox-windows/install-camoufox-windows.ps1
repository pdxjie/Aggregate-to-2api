param(
    [switch]$Replace
)

$ErrorActionPreference = "Stop"

$Version = "152.0.4"
$Build = "beta.30"
$Sha256 = "ea52a02fb1cfb1813ef6a326bea03fb2b650c9774143d953a94a27bfc8f10072"
$Sha8 = $Sha256.Substring(0, 8)
$AssetSize = 493141328
$ZipName = "camoufox-152.0.4-beta.30-win.x86_64.zip"
$FolderName = "$Version-$Build-$Sha8"
$RelativeActive = "browsers/official/$FolderName"

$ZipPath = Join-Path $PSScriptRoot $ZipName
$InstallRoot = Join-Path $env:LOCALAPPDATA "camoufox"
$VersionDir = Join-Path $InstallRoot ("browsers\official\" + $FolderName)

if (-not (Test-Path $ZipPath)) {
    throw "Missing $ZipName in $PSScriptRoot"
}

$ActualHash = (Get-FileHash -Algorithm SHA256 $ZipPath).Hash.ToLowerInvariant()
if ($ActualHash -ne $Sha256) {
    throw "SHA256 mismatch for $ZipName. Expected $Sha256, got $ActualHash"
}

if (Test-Path $VersionDir) {
    if (-not $Replace) {
        Write-Host "Camoufox $Version-$Build is already installed at $VersionDir"
    } else {
        Write-Host "Replacing existing install: $VersionDir"
        Remove-Item -Recurse -Force $VersionDir
    }
}

if (-not (Test-Path $VersionDir)) {
    New-Item -ItemType Directory -Force $VersionDir | Out-Null
    Write-Host "Extracting $ZipName to $VersionDir"
    Expand-Archive -Path $ZipPath -DestinationPath $VersionDir -Force

    $VersionJson = [ordered]@{
        version = $Version
        build = $Build
        prerelease = $true
        sha256 = $Sha256
        asset_size = $AssetSize
    } | ConvertTo-Json
    Set-Content -Path (Join-Path $VersionDir "version.json") -Value $VersionJson -Encoding UTF8
}

New-Item -ItemType Directory -Force $InstallRoot | Out-Null
$Config = [ordered]@{
    active_version = $RelativeActive
} | ConvertTo-Json
Set-Content -Path (Join-Path $InstallRoot "config.json") -Value $Config -Encoding UTF8
New-Item -ItemType File -Force (Join-Path $InstallRoot ".0.5_FLAG") | Out-Null

Write-Host "Camoufox Windows package installed."
Write-Host "Active version: $RelativeActive"
Write-Host "Install root: $InstallRoot"
Write-Host "Executable: $(Join-Path $VersionDir 'camoufox.exe')"
