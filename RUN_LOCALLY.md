# 🖥️ Run Locally - Quick Guide

## Prerequisites
- ✅ Node.js installed (you have v22.20.0)
- ✅ npm installed (you have v11.6.0)
- ✅ Dependencies installed (done!)

## Step 1: Create Environment File

Create a `.env.local` file in the `doctors-appointment-platform` folder with:

```env
DATABASE_URL="your-database-url"
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY="your-clerk-key"
CLERK_SECRET_KEY="your-clerk-secret"
NEXT_PUBLIC_VONAGE_APPLICATION_ID="your-vonage-app-id"
VONAGE_PRIVATE_KEY="your-vonage-key"
```

**Quick Setup:**
- Database: Use Neon (https://neon.tech) - free PostgreSQL
- Clerk: Get from https://dashboard.clerk.com
- Vonage: Get from https://dashboard.nexmo.com/

## Step 2: Run Database Migrations

```bash
npx prisma migrate dev
```

This will:
- Create database tables
- Set up your schema

## Step 3: Start Development Server

```bash
npm run dev
```

## Step 4: Open Browser

Visit: http://localhost:3000

---

## Troubleshooting

### "Database connection failed"
- Check your DATABASE_URL in .env.local
- Make sure database is accessible

### "Clerk authentication error"
- Verify your Clerk keys are correct
- Add http://localhost:3000 to Clerk's allowed URLs

### "Module not found"
- Run: `npm install` again

---

## Commands Reference

```bash
# Install dependencies
npm install

# Run migrations
npx prisma migrate dev

# Generate Prisma Client
npx prisma generate

# Start dev server
npm run dev

# Build for production
npm run build

# Start production server
npm start
```
