# 🚀 Complete Deployment Guide - Doctors Appointment Platform

## 📋 Project Details

- **Project Type**: Next.js Full Stack Application
- **Frontend**: Next.js 15.3.2 (React 19)
- **Backend**: Next.js API Routes (Server Actions)
- **Database**: PostgreSQL (via Prisma ORM)
- **Authentication**: Clerk
- **Video Calls**: Vonage Video API
- **GitHub Repo**: https://github.com/syedkhaja-web/Doctors-Appointment-Platform

---

## 🎯 Recommended Deployment Setup (Easiest & Best)

**Frontend + Backend**: Vercel (Best for Next.js)  
**Database**: Neon (Free PostgreSQL, works perfectly with Vercel)

**Why this combination?**
- ✅ Vercel is made by Next.js creators - perfect integration
- ✅ Zero configuration needed
- ✅ Free tier is generous
- ✅ Automatic deployments from GitHub
- ✅ Neon PostgreSQL is free and fast

---

## 📝 Step-by-Step Deployment (Beginner Friendly)

### STEP 1: Set Up Database (5 minutes)

1. **Go to Neon**: https://neon.tech
2. **Sign up** (free account - use GitHub to sign in)
3. **Create a new project**:
   - Click "Create Project"
   - Name it: `doctors-appointment-db`
   - Region: Choose closest to you
   - Click "Create Project"
4. **Copy your connection string**:
   - After creation, you'll see "Connection string"
   - Click "Copy" - it looks like: `postgresql://user:password@host/dbname?sslmode=require`
   - **SAVE THIS** - you'll need it in Step 3

---

### STEP 2: Set Up Clerk Authentication (3 minutes)

1. **Go to Clerk**: https://clerk.com
2. **Sign up** (free account)
3. **Create Application**:
   - Click "Create Application"
   - Name: `Doctors Appointment Platform`
   - Choose authentication methods (Email, Google, etc.)
   - Click "Create"
4. **Get your API keys**:
   - You'll see two keys:
     - **Publishable Key** (starts with `pk_test_` or `pk_live_`)
     - **Secret Key** (starts with `sk_test_` or `sk_live_`)
   - **SAVE BOTH** - you'll need them in Step 3

---

### STEP 3: Set Up Vonage Video API (3 minutes)

1. **Go to Vonage**: https://vonage.com
2. **Sign up** (free account)
3. **Create Video API Application**:
   - Go to Dashboard → Video API
   - Click "Create Application"
   - Name it: `Doctors Video Calls`
   - Click "Create"
4. **Get your credentials**:
   - **Application ID**: Copy this number
   - **Private Key**: Click "Generate" or "Download" - save the key file
   - **SAVE BOTH** - you'll need them in Step 3

---

### STEP 4: Deploy to Vercel (5 minutes)

1. **Go to Vercel**: https://vercel.com
2. **Sign up** (use GitHub - it's easiest)
3. **Import your project**:
   - Click "Add New..." → "Project"
   - Click "Import Git Repository"
   - Find: `syedkhaja-web/Doctors-Appointment-Platform`
   - Click "Import"

4. **Configure Project** (Vercel auto-detects Next.js):
   - **Framework Preset**: Next.js (auto-detected) ✅
   - **Root Directory**: `doctors-appointment-platform` (IMPORTANT!)
   - **Build Command**: `npm run build` (default - keep it)
   - **Output Directory**: `.next` (default - keep it)
   - **Install Command**: `npm install` (default - keep it)

5. **Add Environment Variables** (CRITICAL STEP):
   Click "Environment Variables" and add these ONE BY ONE:

   ```
   Name: DATABASE_URL
   Value: [Paste your Neon connection string from Step 1]
   ```

   ```
   Name: NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY
   Value: [Paste your Clerk Publishable Key from Step 2]
   ```

   ```
   Name: CLERK_SECRET_KEY
   Value: [Paste your Clerk Secret Key from Step 2]
   ```

   ```
   Name: NEXT_PUBLIC_VONAGE_APPLICATION_ID
   Value: [Paste your Vonage Application ID from Step 3]
   ```

   ```
   Name: VONAGE_PRIVATE_KEY
   Value: [Paste your Vonage Private Key from Step 3]
   ```
   
   **Important for VONAGE_PRIVATE_KEY**:
   - It should include the entire key with `-----BEGIN PRIVATE KEY-----` and `-----END PRIVATE KEY-----`
   - Replace actual newlines with `\n` in the Vercel environment variable
   - Example format:
     ```
     -----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC...\n-----END PRIVATE KEY-----
     ```

6. **Deploy**:
   - Click "Deploy" button
   - Wait 2-3 minutes for build to complete
   - ✅ Your site will be live!

---

### STEP 5: Set Up Database Schema (2 minutes)

After deployment, you need to create database tables:

1. **Go to your Vercel project** → "Deployments" tab
2. **Click on the latest deployment** → "Functions" tab
3. **Or use Vercel CLI** (if you have it installed):
   ```bash
   npx vercel login
   npx vercel link
   npx prisma migrate deploy
   ```

**Alternative: Use Vercel's Build Command**

1. Go to Vercel Project → Settings → General
2. Find "Build & Development Settings"
3. Change "Build Command" to:
   ```
   npm run build && npx prisma migrate deploy
   ```
4. Click "Save"
5. Go to "Deployments" → Click "..." on latest deployment → "Redeploy"

---

### STEP 6: Configure Clerk for Production (2 minutes)

1. **Go to Clerk Dashboard** → Your Application
2. **Go to "Paths"** or "Domains"
3. **Add your Vercel URL**:
   - Your Vercel URL looks like: `https://your-project.vercel.app`
   - Add this to "Allowed URLs" or "Redirect URLs"
4. **Save changes**

---

## ✅ Final Checklist

After deployment, verify:

- [ ] Site is accessible at your Vercel URL
- [ ] Can sign up new users
- [ ] Can sign in
- [ ] Database connection works (no errors in logs)
- [ ] Can book appointments
- [ ] Video calls work (test with two users)

---

## 🔧 Common Errors & Fixes

### Error 1: "Database connection failed"
**Fix**: 
- Check `DATABASE_URL` in Vercel environment variables
- Make sure Neon database is running
- Check if connection string has `?sslmode=require` at the end

### Error 2: "Clerk authentication error"
**Fix**:
- Verify `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY` and `CLERK_SECRET_KEY` are correct
- Add your Vercel URL to Clerk's allowed domains
- Make sure you're using the same environment (test vs live keys)

### Error 3: "Prisma Client not generated"
**Fix**:
- Add to Vercel build command: `npm run build && npx prisma generate && npx prisma migrate deploy`
- Or run migrations manually after deployment

### Error 4: "Vonage Video not working"
**Fix**:
- Check `VONAGE_PRIVATE_KEY` format - must have `\n` for newlines
- Verify `NEXT_PUBLIC_VONAGE_APPLICATION_ID` is correct
- Check Vonage dashboard for API limits

### Error 5: "Build failed - Module not found"
**Fix**:
- Make sure "Root Directory" in Vercel is set to `doctors-appointment-platform`
- Check that all dependencies are in `package.json`

---

## 🌐 Your Live URLs

After deployment, you'll get:

- **Production URL**: `https://your-project-name.vercel.app`
- **Preview URLs**: Each Git push creates a preview deployment

---

## 📊 Monitoring & Updates

### Automatic Deployments
- Every push to `main` branch = automatic production deployment
- Every pull request = preview deployment

### View Logs
- Vercel Dashboard → Your Project → "Deployments" → Click deployment → "Functions" tab

### Update Environment Variables
- Vercel Dashboard → Your Project → Settings → Environment Variables

---

## 🆘 Need Help?

1. **Check Vercel Logs**: Dashboard → Deployments → Functions
2. **Check Build Logs**: Dashboard → Deployments → Click deployment
3. **Vercel Docs**: https://vercel.com/docs
4. **Next.js Docs**: https://nextjs.org/docs

---

## 🎉 Success!

Once deployed, your Doctors Appointment Platform will be live at:
**https://your-project-name.vercel.app**

Share this URL with users to start booking appointments!
