# Quick Deployment Script for Doctors Appointment Platform (PowerShell)
# This script helps you prepare and deploy your application

Write-Host "🚀 Doctors Appointment Platform - Deployment Helper" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Check if required tools are installed
Write-Host "Checking prerequisites..." -ForegroundColor Yellow

try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js is installed: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js is not installed. Please install Node.js 18+ first." -ForegroundColor Red
    exit 1
}

try {
    $npmVersion = npm --version
    Write-Host "✅ npm is installed: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ npm is not installed. Please install npm first." -ForegroundColor Red
    exit 1
}

Write-Host ""

# Check for environment variables
Write-Host "Checking environment variables..." -ForegroundColor Yellow
if (-not (Test-Path ".env")) {
    Write-Host "⚠️  .env file not found!" -ForegroundColor Yellow
    Write-Host "Please create a .env file with the following variables:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "DATABASE_URL=your-database-url"
    Write-Host "NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your-clerk-key"
    Write-Host "CLERK_SECRET_KEY=your-clerk-secret"
    Write-Host "NEXT_PUBLIC_VONAGE_APPLICATION_ID=your-vonage-app-id"
    Write-Host "VONAGE_PRIVATE_KEY=your-vonage-private-key"
    Write-Host ""
    Read-Host "Press Enter to continue after setting up .env file"
}

# Install dependencies
Write-Host ""
Write-Host "📦 Installing dependencies..." -ForegroundColor Yellow
npm install

# Generate Prisma Client
Write-Host ""
Write-Host "🔧 Generating Prisma Client..." -ForegroundColor Yellow
npx prisma generate

# Build the application
Write-Host ""
Write-Host "🏗️  Building the application..." -ForegroundColor Yellow
npm run build

Write-Host ""
Write-Host "✅ Build completed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. If deploying to Vercel:"
Write-Host "   - Run: vercel (or vercel --prod for production)"
Write-Host "   - Or connect your GitHub repo at https://vercel.com/new"
Write-Host ""
Write-Host "2. Make sure to set all environment variables in your hosting platform"
Write-Host ""
Write-Host "3. Run database migrations after deployment:"
Write-Host "   npx prisma migrate deploy"
Write-Host ""
Write-Host "📖 For detailed instructions, see DEPLOYMENT.md" -ForegroundColor Cyan
