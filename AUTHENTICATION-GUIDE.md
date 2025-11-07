# Authentication Guide for ST10082749/ZeniPay

## Quick Setup - Personal Access Token (Recommended)

### Step 1: Create a Personal Access Token

1. Go to GitHub: https://github.com/settings/tokens
2. Click **"Generate new token (classic)"**
3. Give it a name: `ZeniPay Push Token`
4. Select expiration: Choose your preferred duration (90 days recommended)
5. Select scopes: Check **`repo`** (Full control of private repositories)
   - This includes all sub-permissions needed
6. Click **"Generate token"** at the bottom
7. **IMPORTANT**: Copy the token immediately (you won't see it again!)
   - It will look like: `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

### Step 2: Use the Token to Push

When you run `git push`, you'll be prompted for credentials:
- **Username**: Enter `ST10082749` (or your GitHub username for that account)
- **Password**: **Paste your Personal Access Token** (NOT your GitHub password)

The credentials will be saved by Windows Credential Manager for future use.

### Step 3: Alternative - Use Token in URL (Temporary)

If you want to push immediately without prompts:

```bash
git remote set-url origin https://YOUR_TOKEN@github.com/ST10082749/ZeniPay.git
git push -u origin --all
```

Then change it back after:
```bash
git remote set-url origin https://github.com/ST10082749/ZeniPay.git
```

## Using GitHub CLI (Alternative)

If you prefer using GitHub CLI:

1. **Install GitHub CLI:**
   ```powershell
   winget install GitHub.cli
   ```

2. **Login:**
   ```bash
   gh auth login
   ```
   Follow the prompts to authenticate

3. **Push:**
   ```bash
   git push -u origin --all
   ```

## Troubleshooting

### "Permission denied" error
- Make sure you have push access to the repository
- Verify your Personal Access Token has `repo` scope
- Check that you're using the correct username

### "Repository not found" error
- Verify the repository URL is correct
- Make sure the repository exists: https://github.com/ST10082749/ZeniPay
- Ensure you're authenticated with the correct GitHub account

### Credentials not working
- Clear cached credentials: `cmdkey /delete:git:https://github.com`
- Try using the token in the URL method (see Step 3 above)
- Check that your token hasn't expired

## Security Note

- **Never commit your Personal Access Token to the repository**
- Tokens are stored securely in Windows Credential Manager
- You can revoke tokens at any time from GitHub settings

