# Deployment Guide

This guide will help you deploy the Doctors Appointment Platform to production.

## Prerequisites

Before deploying, ensure you have:
1. A PostgreSQL database (recommended: [Neon](https://neon.tech), [Supabase](https://supabase.com), or [Railway](https://railway.app))
2. A [Clerk](https://clerk.com) account for authentication
3. A [Vonage](https://vonage.com) account for video calls
4. A [Vercel](https://vercel.com) account (recommended) or another hosting platform

## Environment Variables

You'll need to set the following environment variables in your deployment platform:

### Required Variables

```bash
# Database Connection
DATABASE_URL="postgresql://user:password@host:port/database?schema=public"

# Clerk Authentication
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY="pk_test_..." # or pk_live_... for production
CLERK_SECRET_KEY="sk_test_..." # or sk_live_... for production

# Vonage Video API
NEXT_PUBLIC_VONAGE_APPLICATION_ID="your-vonage-app-id"
VONAGE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nYour private key here\n-----END PRIVATE KEY-----"
```

### Optional Clerk Variables (if using custom routes)

```bash
NEXT_PUBLIC_CLERK_SIGN_IN_URL="/sign-in"
NEXT_PUBLIC_CLERK_SIGN_UP_URL="/sign-up"
NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL="/"
NEXT_PUBLIC_CLERK_AFTER_SIGN_UP_URL="/onboarding"
```

## Deployment Options

### Option 1: Deploy to Vercel (Recommended)

Vercel is the easiest and most optimized platform for Next.js applications.

#### Steps:

1. **Install Vercel CLI** (optional, you can also use the web interface):
   ```bash
   npm i -g vercel
   ```

2. **Login to Vercel**:
   ```bash
   vercel login
   ```

3. **Navigate to your project directory**:
   ```bash
   cd doctors-appointment-platform
   ```

4. **Deploy**:
   ```bash
   vercel
   ```
   
   Or for production:
   ```bash
   vercel --prod
   ```

5. **Set Environment Variables**:
   - Go to your project on [Vercel Dashboard](https://vercel.com/dashboard)
   - Navigate to Settings → Environment Variables
   - Add all the required environment variables listed above

6. **Run Database Migrations**:
   After deployment, you need to run Prisma migrations:
   ```bash
   npx prisma migrate deploy
   ```
   
   Or set up a build command that includes migrations:
   ```bash
   npm run build && npx prisma migrate deploy
   ```

#### Alternative: Deploy via GitHub

1. Push your code to GitHub
2. Import your repository in [Vercel Dashboard](https://vercel.com/new)
3. Add environment variables in the Vercel dashboard
4. Deploy!

### Option 2: Deploy to Netlify

1. **Install Netlify CLI**:
   ```bash
   npm i -g netlify-cli
   ```

2. **Build settings** (create `netlify.toml`):
   ```toml
   [build]
     command = "npm run build && npx prisma migrate deploy"
     publish = ".next"
   
   [build.environment]
     NODE_VERSION = "18"
   ```

3. **Deploy**:
   ```bash
   netlify deploy --prod
   ```

4. **Set environment variables** in Netlify dashboard

### Option 3: Deploy to Railway

1. Connect your GitHub repository to [Railway](https://railway.app)
2. Add a PostgreSQL database service
3. Add environment variables
4. Railway will automatically detect Next.js and deploy

### Option 4: Deploy to Render

1. Create a new Web Service on [Render](https://render.com)
2. Connect your GitHub repository
3. Set build command: `npm install && npm run build && npx prisma migrate deploy`
4. Set start command: `npm start`
5. Add environment variables
6. Add a PostgreSQL database service

## Database Setup

### 1. Create a PostgreSQL Database

Choose one of these providers:
- **Neon** (recommended): https://neon.tech - Free tier available
- **Supabase**: https://supabase.com - Free tier available
- **Railway**: https://railway.app - Free tier available
- **Render**: https://render.com - Free tier available

### 2. Run Migrations

After setting up your database and getting the connection string:

```bash
# Set your DATABASE_URL
export DATABASE_URL="your-connection-string"

# Run migrations
npx prisma migrate deploy

# Generate Prisma Client
npx prisma generate
```

## Clerk Setup

1. Go to [Clerk Dashboard](https://dashboard.clerk.com)
2. Create a new application or use an existing one
3. Copy your API keys:
   - **Publishable Key**: `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY`
   - **Secret Key**: `CLERK_SECRET_KEY`
4. Configure allowed URLs in Clerk dashboard:
   - Add your production domain (e.g., `https://your-app.vercel.app`)
   - Add your local development URL (e.g., `http://localhost:3000`)

## Vonage Video API Setup

1. Sign up at [Vonage](https://vonage.com) (formerly TokBox)
2. Create a new Video API application
3. Generate API keys
4. Copy:
   - **Application ID**: `NEXT_PUBLIC_VONAGE_APPLICATION_ID`
   - **Private Key**: `VONAGE_PRIVATE_KEY` (keep this secure!)

## Post-Deployment Checklist

- [ ] All environment variables are set correctly
- [ ] Database migrations have been run
- [ ] Clerk is configured with your production domain
- [ ] Vonage Video API credentials are set
- [ ] Test user registration and login
- [ ] Test appointment booking
- [ ] Test video call functionality
- [ ] Verify database connections
- [ ] Check application logs for errors

## Troubleshooting

### Database Connection Issues
- Verify your `DATABASE_URL` is correct
- Check if your database allows connections from your hosting provider's IP
- Ensure SSL is enabled if required

### Clerk Authentication Issues
- Verify your Clerk keys are correct (test vs. live)
- Check that your domain is added to Clerk's allowed URLs
- Ensure environment variables are set correctly

### Vonage Video Issues
- Verify your Application ID and Private Key are correct
- Check that your Private Key format is correct (with newlines as `\n`)

### Build Failures
- Ensure all dependencies are in `package.json`
- Check Node.js version compatibility (requires Node 18+)
- Verify Prisma Client is generated: `npx prisma generate`

## Support

For issues or questions, refer to:
- [Next.js Documentation](https://nextjs.org/docs)
- [Vercel Documentation](https://vercel.com/docs)
- [Clerk Documentation](https://clerk.com/docs)
- [Vonage Video API Documentation](https://developer.vonage.com/video/overview)
