# PowerShell script to setup git authentication for ST10082749/ZeniPay
# GitHub requires Personal Access Token instead of password

Write-Host "GitHub Authentication Setup for ZeniPay" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Note: GitHub no longer accepts passwords for git operations
Write-Host "IMPORTANT: GitHub requires a Personal Access Token (PAT) instead of password." -ForegroundColor Yellow
Write-Host ""

Write-Host "Steps to create a Personal Access Token:" -ForegroundColor Cyan
Write-Host "1. Go to: https://github.com/settings/tokens" -ForegroundColor White
Write-Host "2. Click 'Generate new token (classic)'" -ForegroundColor White
Write-Host "3. Name it: 'ZeniPay Git Access'" -ForegroundColor White
Write-Host "4. Select expiration (90 days recommended)" -ForegroundColor White
Write-Host "5. Check 'repo' scope (Full control of private repositories)" -ForegroundColor White
Write-Host "6. Click 'Generate token'" -ForegroundColor White
Write-Host "7. Copy the token (starts with ghp_)" -ForegroundColor White
Write-Host ""

$token = Read-Host "Enter your Personal Access Token (or press Enter to skip)"

if ($token) {
    # Configure git to use the token
    $remoteUrl = "https://${token}@github.com/ST10082749/ZeniPay.git"
    
    Write-Host "Setting up git remote with token..." -ForegroundColor Green
    git remote set-url origin $remoteUrl
    
    Write-Host "Testing connection..." -ForegroundColor Green
    git fetch origin
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Success! Authentication configured." -ForegroundColor Green
        Write-Host "You can now push your code with: git push -u origin --all" -ForegroundColor Cyan
        
        # Remove token from URL for security (credentials are cached)
        git remote set-url origin https://github.com/ST10082749/ZeniPay.git
        Write-Host "Remote URL reset to standard format (credentials cached)." -ForegroundColor Yellow
    } else {
        Write-Host "Authentication failed. Please check your token." -ForegroundColor Red
    }
} else {
    Write-Host "Skipped token setup. You'll be prompted for credentials on next push." -ForegroundColor Yellow
}

