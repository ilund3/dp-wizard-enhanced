# Deploying DP Wizard to Fly.io

This guide will help you deploy your Shiny app to Fly.io's free tier.

## Fly.io Free Tier Benefits

- **3 shared-cpu-1x VMs** (enough for small apps)
- **160GB outbound data transfer per month**
- **Apps stay running** (no spin-down)
- **Persistent storage** available

## Prerequisites

1. Install Fly CLI: https://fly.io/docs/getting-started/installing-flyctl/
2. Sign up for a Fly.io account: https://fly.io/

## Deployment Steps

1. **Login to Fly.io:**
   ```bash
   fly auth login
   ```

2. **Launch your app:**
   ```bash
   fly launch
   ```
   
   When prompted:
   - App name: Use the default or choose your own
   - Region: Choose the one closest to you (e.g., `iad` for US East)
   - Overwrite `fly.toml`: Yes

3. **Deploy:**
   ```bash
   fly deploy
   ```

4. **View your app:**
   ```bash
   fly open
   ```

## Configuration

The app is configured to run in demo mode by default. To change this, edit the `fly.toml` file and modify the `[processes]` section.

## Monitoring

- View logs: `fly logs`
- Check status: `fly status`
- SSH into your app: `fly ssh console`

## Important Notes

- The free tier includes 3 VMs, so you can run up to 3 apps simultaneously
- Each app gets 160GB/month outbound traffic
- The app will stay running 24/7 on the free tier (unlike Render which spins down)
- If you exceed traffic limits, Fly.io will notify you

## Troubleshooting

If you encounter issues:
1. Check logs: `fly logs`
2. Check app status: `fly status`
3. View app details: `fly apps list`
4. SSH into container: `fly ssh console`

