# Build script for Hebrew Text Fixer
# This script builds the standalone executable and Windows installer

Write-Host "=== Hebrew Text Fixer Build Script ===" -ForegroundColor Cyan
Write-Host ""

# Step 1: Build executable with PyInstaller
Write-Host "Step 1: Building standalone executable..." -ForegroundColor Yellow
& .\.venv\Scripts\pyinstaller.exe --clean hebrew_fixer.spec

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: PyInstaller build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Executable built successfully: dist\HebrewTextFixer.exe" -ForegroundColor Green
Write-Host ""

# Step 2: Check if Inno Setup is installed
Write-Host "Step 2: Checking for Inno Setup..." -ForegroundColor Yellow

# Check multiple possible locations
$innoSetupPaths = @(
    "C:\Program Files (x86)\Inno Setup 6\ISCC.exe",
    "$env:LOCALAPPDATA\Programs\Inno Setup 6\ISCC.exe",
    "C:\Program Files\Inno Setup 6\ISCC.exe"
)

$innoSetupPath = $null
foreach ($path in $innoSetupPaths) {
    if (Test-Path $path) {
        $innoSetupPath = $path
        break
    }
}

if (-not $innoSetupPath) {
    Write-Host "⚠ Inno Setup not found in common installation locations" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To create the installer:" -ForegroundColor Cyan
    Write-Host "1. Download Inno Setup from: https://jrsoftware.org/isdl.php" -ForegroundColor White
    Write-Host "2. Install Inno Setup" -ForegroundColor White
    Write-Host "3. Run this script again: .\build.ps1" -ForegroundColor White
    Write-Host ""
    Write-Host "The executable is ready in the dist\ folder." -ForegroundColor Green
    exit 0
}

Write-Host "✓ Found Inno Setup at: $innoSetupPath" -ForegroundColor Green
Write-Host ""

# Step 3: Build installer with Inno Setup
Write-Host "Step 3: Building Windows installer..." -ForegroundColor Yellow
& $innoSetupPath installer.iss

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Inno Setup build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Installer built successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Build complete! Files created:" -ForegroundColor Cyan
Write-Host "  - dist\HebrewTextFixer.exe (standalone executable)" -ForegroundColor White
Write-Host "  - installer\HebrewTextFixer-Setup-v1.0.exe (Windows installer)" -ForegroundColor White
