param(
    [Parameter(Mandatory = $true)]
    [string] $Repository,

    [string[]] $Versions = @("8", "11", "16", "17", "19", "21", "22", "25", "26"),

    [switch] $Push
)

$ErrorActionPreference = "Stop"

$dockerInfo = docker info 2>$null
if ($LASTEXITCODE -ne 0) {
    throw "Docker is installed, but the Docker daemon is not running. Start Docker Desktop and try again."
}

foreach ($version in $Versions) {
    $context = Join-Path $PSScriptRoot "java_$version"
    $tag = "${Repository}:java_${version}_x11"

    if (-not (Test-Path -LiteralPath (Join-Path $context "Dockerfile"))) {
        throw "Missing Dockerfile for Java $version at $context"
    }

    Write-Host "Building $tag"
    docker build -t $tag $context

    if ($Push) {
        Write-Host "Pushing $tag"
        docker push $tag
    }
}
