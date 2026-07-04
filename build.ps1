# build.ps1 — Kompatibilitäts-Wrapper (delegiert an src\build.ps1)

[CmdletBinding()]
param(
    [switch]$SkipZip,
    [switch]$SkipMarkdownLint,
    [switch]$Help
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$scriptPath = Join-Path $PSScriptRoot "src\build.ps1"
if (-not (Test-Path $scriptPath)) {
    throw "src\build.ps1 nicht gefunden: $scriptPath"
}

& $scriptPath @PSBoundParameters
exit $LASTEXITCODE
