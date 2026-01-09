# Vercel API Deployment Script
# This script deploys using Vercel's REST API

$ErrorActionPreference = "Stop"

Write-Host "🚀 Deploying to Vercel via API..." -ForegroundColor Cyan

# Check if VERCEL_TOKEN is set
if (-not $env:VERCEL_TOKEN) {
    Write-Host "❌ VERCEL_TOKEN environment variable is not set." -ForegroundColor Red
    Write-Host ""
    Write-Host "To get a Vercel token:" -ForegroundColor Yellow
    Write-Host "1. Go to https://vercel.com/account/tokens" -ForegroundColor Yellow
    Write-Host "2. Create a new token" -ForegroundColor Yellow
    Write-Host "3. Set it as an environment variable: `$env:VERCEL_TOKEN='your-token'" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Alternatively, you can deploy via GitHub:" -ForegroundColor Yellow
    Write-Host "1. Go to https://vercel.com/new" -ForegroundColor Yellow
    Write-Host "2. Import your GitHub repository: syedkhaja-web/Doctors-Appointment-Platform" -ForegroundColor Yellow
    Write-Host "3. Add environment variables and deploy" -ForegroundColor Yellow
    exit 1
}

# Get project info
$projectName = "doctors-appointment-platform"
$githubRepo = "syedkhaja-web/Doctors-Appointment-Platform"

Write-Host "📦 Preparing deployment..." -ForegroundColor Yellow

# Build the project first
Write-Host "🏗️  Building project..." -ForegroundColor Yellow
npm run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Build successful!" -ForegroundColor Green

# Try to create/update project and deploy via Vercel API
Write-Host "🌐 Connecting to Vercel API..." -ForegroundColor Yellow

$headers = @{
    "Authorization" = "Bearer $env:VERCEL_TOKEN"
    "Content-Type" = "application/json"
}

# Get user/team info
try {
    $userResponse = Invoke-RestMethod -Uri "https://api.vercel.com/v2/user" -Headers $headers -Method Get
    Write-Host "✅ Authenticated as: $($userResponse.user.username)" -ForegroundColor Green
} catch {
    Write-Host "❌ Authentication failed. Please check your VERCEL_TOKEN." -ForegroundColor Red
    exit 1
}

# Try to find existing project or create new one
try {
    $projectsResponse = Invoke-RestMethod -Uri "https://api.vercel.com/v9/projects?teamId=" -Headers $headers -Method Get
    $existingProject = $projectsResponse.projects | Where-Object { $_.name -eq $projectName }
    
    if ($existingProject) {
        Write-Host "📁 Found existing project: $projectName" -ForegroundColor Green
        $projectId = $existingProject.id
    } else {
        Write-Host "📁 Creating new project: $projectName" -ForegroundColor Yellow
        
        $projectBody = @{
            name = $projectName
            gitRepository = @{
                type = "github"
                repo = $githubRepo
            }
            framework = "nextjs"
        } | ConvertTo-Json
        
        $createResponse = Invoke-RestMethod -Uri "https://api.vercel.com/v9/projects" -Headers $headers -Method Post -Body $projectBody
        $projectId = $createResponse.id
        Write-Host "✅ Project created!" -ForegroundColor Green
    }
} catch {
    Write-Host "⚠️  Could not create/find project via API. You may need to:" -ForegroundColor Yellow
    Write-Host "   1. Create the project manually at https://vercel.com/new" -ForegroundColor Yellow
    Write-Host "   2. Or use: npx vercel --prod (after logging in)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "✅ Deployment preparation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Go to https://vercel.com/new" -ForegroundColor Yellow
Write-Host "2. Import repository: $githubRepo" -ForegroundColor Yellow
Write-Host "3. Add environment variables:" -ForegroundColor Yellow
Write-Host "   - DATABASE_URL" -ForegroundColor Yellow
Write-Host "   - NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY" -ForegroundColor Yellow
Write-Host "   - CLERK_SECRET_KEY" -ForegroundColor Yellow
Write-Host "   - NEXT_PUBLIC_VONAGE_APPLICATION_ID" -ForegroundColor Yellow
Write-Host "   - VONAGE_PRIVATE_KEY" -ForegroundColor Yellow
Write-Host "4. Deploy!" -ForegroundColor Yellow
