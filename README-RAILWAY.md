# Deploying DP Wizard to Railway (Free Tier)

Railway offers a **free tier** with $5/month credit (enough for small apps).

## Railway Free Tier Benefits

- ✅ **$5/month credit** (free forever if you stay under limit)
- ✅ **Apps stay running 24/7** (no spin-down)
- ✅ **Simple deployment** from GitHub
- ⚠️ Requires credit card verification (but won't charge if you stay under $5/month)

## Quick Deploy Steps

1. Go to https://railway.app and sign up/login
2. Click **"New Project"**
3. Click **"Deploy from GitHub repo"**
4. Select your repository: `ilund3/dp-wizard-enhanced`
5. Railway will auto-detect Python and start building
6. Add Environment Variables (in the Variables tab):
   - `HOST` = `0.0.0.0`
   - `PORT` = (Railway will set this automatically via $PORT)
   - `LAUNCH_BROWSER` = `false`
   - `RELOAD` = `false`
7. Generate a domain (Settings → Generate Domain)
8. Your app will be live!

## Notes

- Railway provides HTTPS automatically
- You'll get a `.railway.app` domain for free
- Monitor usage in the dashboard
- Logs are available in real-time
- If you exceed $5/month, you'll be charged (but small apps rarely do)

## Cost Estimation

For a small Shiny app:
- **~$2-4/month** typical usage
- **$5/month free credit** covers it
- You only pay if you exceed the credit

