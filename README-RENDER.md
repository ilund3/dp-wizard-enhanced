# Deploying DP Wizard to Render (Free Tier)

Render offers a **free tier** that's perfect for Shiny apps. Here's how to deploy:

## Render Free Tier Benefits

- ✅ **Free forever** (no credit card required)
- ✅ **750 hours/month** (enough for 24/7 operation)
- ✅ **Simple deployment** from GitHub
- ⚠️ Apps spin down after 15 minutes of inactivity (wake up automatically when accessed)

## Quick Deploy Steps

### Option 1: One-Click Deploy (Easiest)

1. Go to https://render.com and sign up/login (free account, no credit card)
2. Click **"New +"** → **"Web Service"**
3. Connect your GitHub repository: `ilund3/dp-wizard-enhanced`
4. Render will auto-detect the `render.yaml` configuration
5. Click **"Create Web Service"**
6. Wait for deployment (~5-10 minutes first time)

### Option 2: Manual Configuration

1. Go to https://render.com and sign up/login
2. Click **"New +"** → **"Web Service"**
3. Connect your GitHub repository: `ilund3/dp-wizard-enhanced`
4. Configure:
   - **Name**: `dp-wizard-enhanced` (or your choice)
   - **Region**: Choose closest to you
   - **Branch**: `main`
   - **Root Directory**: (leave empty)
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt && pip install -e .`
   - **Start Command**: `python -m dp_wizard --demo`
   - **Plan**: `Free`
5. Add Environment Variables:
   - `HOST` = `0.0.0.0`
   - `PORT` = `8000`
   - `LAUNCH_BROWSER` = `false`
   - `RELOAD` = `false`
6. Click **"Create Web Service"**

## After Deployment

- Your app will be available at: `https://dp-wizard-enhanced.onrender.com` (or your custom URL)
- First deployment takes ~5-10 minutes
- Subsequent deployments are faster
- If app is sleeping, first visit may take 30-60 seconds to wake up

## Notes

- Free tier apps sleep after 15 minutes of inactivity but wake up automatically
- If you want 24/7 uptime, you can upgrade to a paid plan ($7/month)
- Render provides HTTPS automatically
- Logs are available in the Render dashboard

## Troubleshooting

- Check build logs in Render dashboard
- Verify environment variables are set correctly
- Ensure `requirements.txt` includes all dependencies
- Check that Python version is 3.10+ (Render should auto-detect)

