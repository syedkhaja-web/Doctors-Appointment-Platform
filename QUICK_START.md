# ⚡ QUICK START - Deploy in 15 Minutes

## 🎯 Fastest Way to Deploy

### 1. Database (2 min)
👉 https://neon.tech → Sign up → Create project → Copy connection string

### 2. Authentication (1 min)  
👉 https://clerk.com → Sign up → Create app → Copy keys

### 3. Video API (1 min)
👉 https://vonage.com → Sign up → Create Video app → Copy credentials

### 4. Deploy (5 min)
👉 https://vercel.com/new → Import `syedkhaja-web/Doctors-Appointment-Platform` → Add environment variables → Deploy

### 5. Database Setup (1 min)
👉 Vercel Settings → Build Command → Add: `&& npx prisma migrate deploy` → Redeploy

## 📋 Environment Variables to Add in Vercel

```
DATABASE_URL=your-neon-connection-string
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your-clerk-key
CLERK_SECRET_KEY=your-clerk-secret
NEXT_PUBLIC_VONAGE_APPLICATION_ID=your-vonage-app-id
VONAGE_PRIVATE_KEY=your-vonage-key-with-\n-for-newlines
```

## ✅ Done!

Your site will be live at: `https://your-project.vercel.app`

**Full detailed guide**: See `COMPLETE_DEPLOYMENT_GUIDE.md`
