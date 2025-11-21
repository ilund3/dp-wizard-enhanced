# Deployment Guide

## Overview

DP Wizard Enhanced is a Python Shiny web application that requires a server to run. It **cannot** be deployed on GitHub Pages (which only hosts static sites). You need a platform that can run Python web applications.

## Recommended: Render

[Render](https://render.com) is a great option for deploying Shiny applications. It offers:
- Free tier for testing
- Automatic deployments from GitHub
- Easy configuration
- Built-in HTTPS

### Deploying to Render

1. **Push your code to GitHub** (if not already done)

2. **Sign up/Login to Render** at https://render.com

3. **Create a New Web Service**:
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the repository: `dp-wizard-enhanced`

4. **Configure the service**:
   - **Name**: `dp-wizard-enhanced` (or your preferred name)
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -e ".[app]"`
   - **Start Command**: `python run.py`
   - **Plan**: Free (or paid for production)
   
   **Note**: If you're using the `render.yaml` file, these settings are already configured.

5. **Deploy**: Click "Create Web Service"

   Render will automatically:
   - Install dependencies
   - Build your application
   - Start the server
   - Provide a public URL (e.g., `https://dp-wizard-enhanced.onrender.com`)

### Environment Variables

The `render.yaml` file is already configured. If you need to customize:
- The app will automatically use the `PORT` environment variable provided by Render
- You can add additional environment variables in the Render dashboard if needed

## Alternative Platforms

### Railway
1. Sign up at https://railway.app
2. Create new project from GitHub repo
3. Railway auto-detects Python and will run `dp-wizard`

### Fly.io
1. Install Fly CLI: `curl -L https://fly.io/install.sh | sh`
2. Run `fly launch` in your project directory
3. Follow prompts to configure

### Heroku
1. Create a `Procfile` with: `web: dp-wizard`
2. Use Heroku CLI or dashboard to deploy

## Important Notes

- **GitHub Pages will NOT work** - it only hosts static HTML/CSS/JS files
- The app requires Python 3.10 or later
- First startup may take a minute (as noted in the app)
- Free tiers on most platforms have limitations (sleep after inactivity, slower cold starts)

## Local Testing

Before deploying, test locally:
```bash
pip install -e ".[app]"
dp-wizard --demo
```

Then visit http://localhost:8000 in your browser.

