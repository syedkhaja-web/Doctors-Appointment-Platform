# ⚡ Quick Local Setup

## ✅ What's Done
- ✅ Dependencies installed
- ✅ Development server starting
- ✅ Prisma Client generated

## ⚠️ What You Need to Do

### 1. Create `.env.local` file

In the `doctors-appointment-platform` folder, create a file named `.env.local` with:

```env
DATABASE_URL="postgresql://user:password@host:port/database?schema=public"
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY="pk_test_..."
CLERK_SECRET_KEY="sk_test_..."
NEXT_PUBLIC_VONAGE_APPLICATION_ID="your-app-id"
VONAGE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----"
```

### 2. Get Your Credentials

**Database (Neon - Free):**
- Go to: https://neon.tech
- Sign up → Create project → Copy connection string

**Clerk (Free):**
- Go to: https://dashboard.clerk.com
- Create app → Copy API keys

**Vonage (Free tier):**
- Go to: https://dashboard.nexmo.com/
- Create Video API app → Copy credentials

### 3. Run Database Migrations

After adding DATABASE_URL to `.env.local`, run:

```bash
npx prisma migrate dev
```

### 4. Restart Server

If server is running, stop it (Ctrl+C) and restart:

```bash
npm run dev
```

## 🌐 Access Your App

Once running, open: **http://localhost:3000**

---

## 📝 Quick Commands

```bash
# Start dev server
npm run dev

# Run migrations
npx prisma migrate dev

# Generate Prisma Client
npx prisma generate

# Build for production
npm run build
```

---

## 🆘 Issues?

- **Port 3000 already in use?** 
  - Stop other servers or change port: `npm run dev -- -p 3001`

- **Database errors?**
  - Check DATABASE_URL in .env.local
  - Run: `npx prisma migrate dev`

- **Clerk errors?**
  - Add http://localhost:3000 to Clerk's allowed URLs

---

**The dev server should be starting now! Check http://localhost:3000 in a few seconds.**
