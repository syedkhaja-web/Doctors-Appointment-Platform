#!/bin/bash

# Quick Deployment Script for Doctors Appointment Platform
# This script helps you prepare and deploy your application

echo "🚀 Doctors Appointment Platform - Deployment Helper"
echo "=================================================="
echo ""

# Check if required tools are installed
echo "Checking prerequisites..."

if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ Node.js and npm are installed"
echo ""

# Check for environment variables
echo "Checking environment variables..."
if [ ! -f .env ]; then
    echo "⚠️  .env file not found!"
    echo "Please create a .env file with the following variables:"
    echo ""
    echo "DATABASE_URL=your-database-url"
    echo "NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your-clerk-key"
    echo "CLERK_SECRET_KEY=your-clerk-secret"
    echo "NEXT_PUBLIC_VONAGE_APPLICATION_ID=your-vonage-app-id"
    echo "VONAGE_PRIVATE_KEY=your-vonage-private-key"
    echo ""
    read -p "Press Enter to continue after setting up .env file..."
fi

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

# Generate Prisma Client
echo ""
echo "🔧 Generating Prisma Client..."
npx prisma generate

# Run database migrations (optional - uncomment if needed)
# echo ""
# echo "🗄️  Running database migrations..."
# npx prisma migrate deploy

# Build the application
echo ""
echo "🏗️  Building the application..."
npm run build

echo ""
echo "✅ Build completed successfully!"
echo ""
echo "Next steps:"
echo "1. If deploying to Vercel:"
echo "   - Run: vercel (or vercel --prod for production)"
echo "   - Or connect your GitHub repo at https://vercel.com/new"
echo ""
echo "2. Make sure to set all environment variables in your hosting platform"
echo ""
echo "3. Run database migrations after deployment:"
echo "   npx prisma migrate deploy"
echo ""
echo "📖 For detailed instructions, see DEPLOYMENT.md"
