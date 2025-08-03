@echo off
setlocal enabledelayedexpansion

REM Build script for the demo .NET project
REM Usage: build.bat [command] [configuration]
REM Commands: restore, build, test, clean, run, rebuild, publish
REM Configuration: Debug (default) or Release

set "COMMAND=%~1"
set "CONFIGURATION=%~2"

if "%COMMAND%"=="" (
    echo Usage: build.bat [command] [configuration]
    echo Commands: restore, build, test, clean, run, rebuild, publish
    echo Configuration: Debug ^(default^) or Release
    exit /b 1
)

if "%CONFIGURATION%"=="" set "CONFIGURATION=Debug"

set "PROJECT_PATH=demo/demo.csproj"
set "SOLUTION_PATH=demo/demo.sln"

echo.
echo === %COMMAND% ^(%CONFIGURATION%^) ===
echo.

if "%COMMAND%"=="restore" (
    echo Restoring NuGet packages...
    dotnet restore "%SOLUTION_PATH%"
    if !errorlevel! neq 0 exit /b !errorlevel!
) else if "%COMMAND%"=="build" (
    echo Building solution...
    dotnet build "%SOLUTION_PATH%" --configuration %CONFIGURATION% --no-restore
    if !errorlevel! neq 0 exit /b !errorlevel!
) else if "%COMMAND%"=="test" (
    echo Running tests...
    dotnet test "%SOLUTION_PATH%" --configuration %CONFIGURATION% --no-build --verbosity normal
    if !errorlevel! neq 0 exit /b !errorlevel!
) else if "%COMMAND%"=="clean" (
    echo Cleaning solution...
    dotnet clean "%SOLUTION_PATH%"
    if !errorlevel! neq 0 exit /b !errorlevel!
) else if "%COMMAND%"=="run" (
    echo Running application...
    dotnet run --project "%PROJECT_PATH%" --configuration %CONFIGURATION%
    if !errorlevel! neq 0 exit /b !errorlevel!
) else if "%COMMAND%"=="rebuild" (
    echo Rebuilding solution...
    dotnet clean "%SOLUTION_PATH%"
    if !errorlevel! neq 0 exit /b !errorlevel!
    dotnet restore "%SOLUTION_PATH%"
    if !errorlevel! neq 0 exit /b !errorlevel!
    dotnet build "%SOLUTION_PATH%" --configuration %CONFIGURATION%
    if !errorlevel! neq 0 exit /b !errorlevel!
) else if "%COMMAND%"=="publish" (
    echo Publishing application...
    set "OUTPUT_PATH=publish"
    dotnet publish "%PROJECT_PATH%" --configuration %CONFIGURATION% --output "!OUTPUT_PATH!"
    if !errorlevel! neq 0 exit /b !errorlevel!
    echo Published to: !OUTPUT_PATH!
) else (
    echo Unknown command: %COMMAND%
    echo Valid commands: restore, build, test, clean, run, rebuild, publish
    exit /b 1
)

echo.
echo ✅ Command '%COMMAND%' completed successfully!
exit /b 0
