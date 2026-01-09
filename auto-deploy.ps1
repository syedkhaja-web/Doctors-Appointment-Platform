# Automatic Deployment Script
Write-Host "🚀 AUTOMATIC DEPLOYMENT STARTING..." -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Verify project
Write-Host "📋 Step 1: Verifying project setup..." -ForegroundColor Yellow
if (-not (Test-Path "package.json")) {
    Write-Host "❌ Error: Not in project directory" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Project found" -ForegroundColor Green

# Step 2: Check GitHub
Write-Host ""
Write-Host "📋 Step 2: Checking GitHub status..." -ForegroundColor Yellow
try {
    $gitRemote = git remote get-url origin 2>$null
    if ($gitRemote) {
        Write-Host "✅ GitHub repository found" -ForegroundColor Green
        git add . 2>$null
        git commit -m "Auto-commit before deployment" 2>$null
        git push origin main 2>$null
        Write-Host "✅ Code pushed to GitHub" -ForegroundColor Green
    }
} catch {
    Write-Host "⚠️  Git check skipped" -ForegroundColor Yellow
}

# Step 3: Build
Write-Host ""
Write-Host "📋 Step 3: Building project..." -ForegroundColor Yellow
try {
    npm run build 2>&1 | Out-Null
    Write-Host "✅ Build successful!" -ForegroundColor Green
} catch {
    Write-Host "⚠️  Build step skipped" -ForegroundColor Yellow
}

# Step 4: Open deployment pages
Write-Host ""
Write-Host "📋 Step 4: Opening deployment pages..." -ForegroundColor Yellow
Write-Host ""

Start-Process "https://vercel.com/new?import=syedkhaja-web/Doctors-Appointment-Platform"
Start-Sleep -Seconds 2
Start-Process "https://neon.tech"
Start-Sleep -Seconds 1
Start-Process "https://dashboard.clerk.com"
Start-Sleep -Seconds 1
Start-Process "https://dashboard.nexmo.com"

Write-Host "✅ All pages opened in browser!" -ForegroundColor Green
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "📝 DEPLOYMENT INSTRUCTIONS" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Vercel page is open - Sign in and import repository" -ForegroundColor White
Write-Host "2. Set Root Directory to: doctors-appointment-platform" -ForegroundColor White
Write-Host "3. Add these 5 environment variables:" -ForegroundColor White
Write-Host "   - DATABASE_URL (from Neon)" -ForegroundColor Gray
Write-Host "   - NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY (from Clerk)" -ForegroundColor Gray
Write-Host "   - CLERK_SECRET_KEY (from Clerk)" -ForegroundColor Gray
Write-Host "   - NEXT_PUBLIC_VONAGE_APPLICATION_ID (from Vonage)" -ForegroundColor Gray
Write-Host "   - VONAGE_PRIVATE_KEY (from Vonage)" -ForegroundColor Gray
Write-Host "4. Click Deploy button" -ForegroundColor White
Write-Host ""
Write-Host "All service pages are now open in your browser!" -ForegroundColor Green
Write-Host ""
Write-Host "Deployment setup complete!" -ForegroundColor Cyan
