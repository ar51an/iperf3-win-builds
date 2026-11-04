[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string] $PackageDirectory,

    [int] $Port = 5202
)

$ErrorActionPreference = 'Stop'
$package = (Resolve-Path -LiteralPath $PackageDirectory).Path
$iperf = Join-Path $package 'iperf3.exe'
$cygwin = Join-Path $package 'cygwin1.dll'

if (-not (Test-Path -LiteralPath $iperf -PathType Leaf)) {
    throw "iperf3.exe was not found in $package"
}
if (-not (Test-Path -LiteralPath $cygwin -PathType Leaf)) {
    throw "cygwin1.dll was not found in $package"
}

$testRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("iperf-smoke-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $testRoot | Out-Null
$serverOut = Join-Path $testRoot 'server.out.log'
$serverErr = Join-Path $testRoot 'server.err.log'
$clientJson = Join-Path $testRoot 'client.json'

$server = Start-Process -FilePath $iperf `
    -ArgumentList @('-s', '-p', $Port) `
    -RedirectStandardOutput $serverOut `
    -RedirectStandardError $serverErr `
    -PassThru `
    -WindowStyle Hidden

try {
    Start-Sleep -Seconds 2
    & $iperf -c 127.0.0.1 -p $Port -t 2 -P 2 --json | Set-Content -LiteralPath $clientJson
    if ($LASTEXITCODE -ne 0) {
        throw "iperf3 client exited with code $LASTEXITCODE"
    }

    $result = Get-Content -LiteralPath $clientJson -Raw | ConvertFrom-Json
    $bytes = [int64] $result.end.sum_received.bytes
    if ($bytes -le 0) {
        throw 'The loopback transfer completed without receiving data.'
    }

    Write-Host "Loopback smoke test passed: $bytes bytes received."
}
finally {
    if (-not $server.HasExited) {
        Stop-Process -Id $server.Id -Force
        $server.WaitForExit()
    }
}
