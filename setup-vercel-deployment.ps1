# Setup Vercel Deployment via GitHub Integration
# This script helps set up automatic deployment

Write-Host "🚀 Setting up Vercel Deployment" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Your code has been pushed to GitHub!" -ForegroundColor Green
Write-Host "Repository: https://github.com/syedkhaja-web/Doctors-Appointment-Platform" -ForegroundColor Green
Write-Host ""

Write-Host "To complete the deployment, you have two options:" -ForegroundColor Yellow
Write-Host ""

Write-Host "Option 1: Deploy via Vercel Web Interface (Easiest)" -ForegroundColor Cyan
Write-Host "1. Go to: https://vercel.com/new" -ForegroundColor White
Write-Host "2. Click 'Import Git Repository'" -ForegroundColor White
Write-Host "3. Select: syedkhaja-web/Doctors-Appointment-Platform" -ForegroundColor White
Write-Host "4. Add these environment variables:" -ForegroundColor White
Write-Host "   - DATABASE_URL" -ForegroundColor Gray
Write-Host "   - NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY" -ForegroundColor Gray
Write-Host "   - CLERK_SECRET_KEY" -ForegroundColor Gray
Write-Host "   - NEXT_PUBLIC_VONAGE_APPLICATION_ID" -ForegroundColor Gray
Write-Host "   - VONAGE_PRIVATE_KEY" -ForegroundColor Gray
Write-Host "5. Click 'Deploy'" -ForegroundColor White
Write-Host ""

Write-Host "Option 2: Use Vercel CLI (Requires Login)" -ForegroundColor Cyan
Write-Host "1. Run: npx vercel login" -ForegroundColor White
Write-Host "2. Run: npx vercel --prod" -ForegroundColor White
Write-Host ""

Write-Host "After deployment, don't forget to:" -ForegroundColor Yellow
Write-Host "- Run database migrations: npx prisma migrate deploy" -ForegroundColor White
Write-Host "- Configure your domain in Vercel dashboard" -ForegroundColor White
Write-Host ""

# Try to open Vercel in browser
Write-Host "Opening Vercel deployment page..." -ForegroundColor Yellow
Start-Process "https://vercel.com/new?import=syedkhaja-web/Doctors-Appointment-Platform"
