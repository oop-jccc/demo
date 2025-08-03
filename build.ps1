#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Build script for the demo .NET project
.DESCRIPTION
    This script provides commands to restore, build, test, clean, and run the demo project.
.PARAMETER Command
    The command to execute: restore, build, test, clean, run, rebuild, or publish
.PARAMETER Configuration
    The build configuration: Debug or Release (default: Debug)
.EXAMPLE
    .\build.ps1 build
    .\build.ps1 build -Configuration Release
    .\build.ps1 test
#>

param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("restore", "build", "test", "clean", "run", "rebuild", "publish")]
    [string]$Command,
    
    [Parameter(Mandatory = $false)]
    [ValidateSet("Debug", "Release")]
    [string]$Configuration = "Debug"
)

$ErrorActionPreference = "Stop"
$ProjectPath = "demo/demo.csproj"
$SolutionPath = "demo/demo.sln"

function Write-Header {
    param([string]$Message)
    Write-Host ""
    Write-Host "=== $Message ===" -ForegroundColor Cyan
    Write-Host ""
}

function Invoke-DotNetCommand {
    param([string]$Arguments)
    
    Write-Host "Executing: dotnet $Arguments" -ForegroundColor Yellow
    $process = Start-Process -FilePath "dotnet" -ArgumentList $Arguments -Wait -PassThru -NoNewWindow
    
    if ($process.ExitCode -ne 0) {
        Write-Error "Command failed with exit code $($process.ExitCode)"
        exit $process.ExitCode
    }
}

try {
    switch ($Command) {
        "restore" {
            Write-Header "Restoring NuGet packages"
            Invoke-DotNetCommand "restore $SolutionPath"
        }
        
        "build" {
            Write-Header "Building solution ($Configuration)"
            Invoke-DotNetCommand "build $SolutionPath --configuration $Configuration --no-restore"
        }
        
        "test" {
            Write-Header "Running tests ($Configuration)"
            Invoke-DotNetCommand "test $SolutionPath --configuration $Configuration --no-build --verbosity normal"
        }
        
        "clean" {
            Write-Header "Cleaning solution"
            Invoke-DotNetCommand "clean $SolutionPath"
        }
        
        "run" {
            Write-Header "Running application ($Configuration)"
            Invoke-DotNetCommand "run --project $ProjectPath --configuration $Configuration"
        }
        
        "rebuild" {
            Write-Header "Rebuilding solution ($Configuration)"
            Invoke-DotNetCommand "clean $SolutionPath"
            Invoke-DotNetCommand "restore $SolutionPath"
            Invoke-DotNetCommand "build $SolutionPath --configuration $Configuration"
        }
        
        "publish" {
            Write-Header "Publishing application ($Configuration)"
            $OutputPath = "publish"
            Invoke-DotNetCommand "publish $ProjectPath --configuration $Configuration --output $OutputPath"
            Write-Host "Published to: $OutputPath" -ForegroundColor Green
        }
    }
    
    Write-Host ""
    Write-Host "✅ Command '$Command' completed successfully!" -ForegroundColor Green
    
} catch {
    Write-Host ""
    Write-Host "❌ Command '$Command' failed: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
