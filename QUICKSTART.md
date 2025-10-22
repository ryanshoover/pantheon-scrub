# 🧹 pantheon-scrub - Quickstart Guide

Get your Pantheon repository cleaned in 60 seconds!

> **⚠️ Professional Services Project:** This is a Pantheon Professional Services tool, not an official Pantheon product.

---

## ⚡ Super Quick Start

### One Command to Rule Them All

```bash
curl -fsSL https://raw.githubusercontent.com/pantheon-systems/pantheon-scrub/main/pantheon-scrub -o pantheon-scrub && chmod +x pantheon-scrub && ./pantheon-scrub all
```

This will:
1. Download pantheon-scrub
2. Make it executable
3. Run the full scrub workflow (with confirmations at each step)

---

## 📋 Step-by-Step Quickstart

### 1. Download

```bash
curl -fsSL https://raw.githubusercontent.com/pantheon-systems/pantheon-scrub/main/pantheon-scrub -o pantheon-scrub
chmod +x pantheon-scrub
```

### 2. Scan for Issues

```bash
./pantheon-scrub scan
```

**Output:**
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🧹 Scrubbing Repository - Scan Mode
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠ Found 2 issue(s) that need scrubbing
```

### 3. Fix Everything

```bash
./pantheon-scrub all
```

Follow the interactive prompts. It will:
- Show you what needs fixing
- Ask for confirmation before each step
- Create automatic backups
- Guide you through the process

### 4. Push to Pantheon

```bash
git push pantheon master --force-with-lease
```

**Done!** ✨

---

## 🎯 Common Scenarios

### Scenario 1: "I just need to scan"

```bash
./pantheon-scrub scan
```

### Scenario 2: "I only need to fix symlinks"

```bash
./pantheon-scrub fix-symlinks
git commit -m "Fix symlinks per Pantheon docs"
git push pantheon master
```

### Scenario 3: "I need to clean git history"

```bash
./pantheon-scrub clean
# Verify
./pantheon-scrub scan
# Push
git push pantheon master --force-with-lease
```

### Scenario 4: "Do everything for me"

```bash
./pantheon-scrub all
```

---

## 🚨 Troubleshooting

### Error: "git-filter-repo not found"

**macOS:**
```bash
brew install git-filter-repo
```

**Linux:**
```bash
pip install git-filter-repo
```

### Error: "Not a git repository"

Make sure you're in your repository directory:
```bash
cd /path/to/your/pantheon/site
./pantheon-scrub scan
```

### Error: "Contains changes to reserved paths"

This is exactly what pantheon-scrub fixes! Run:
```bash
./pantheon-scrub clean
```

---

## 💡 Pro Tips

### Install Globally

```bash
sudo curl -fsSL https://raw.githubusercontent.com/pantheon-systems/pantheon-scrub/main/pantheon-scrub -o /usr/local/bin/pantheon-scrub
sudo chmod +x /usr/local/bin/pantheon-scrub

# Now use from anywhere
cd /path/to/any/repo
pantheon-scrub scan
```

### Scan Another Repository

```bash
./pantheon-scrub scan /path/to/other/repo
```

### Check What Will Be Removed

```bash
./pantheon-scrub scan
# Look at the output before running clean
```

### Rollback if Needed

```bash
# Find backup branch
git branch | grep backup

# Restore
git checkout master-backup-1234567890
```

---

## 📚 What Gets Scrubbed?

pantheon-scrub removes commits that modified:

- ✅ `wp-content/uploads`
- ✅ `sites/default/files`
- ✅ `web/sites/default/files`
- ✅ `web/wp-content/uploads`
- ✅ `pantheon.upstream.yml`

And fixes:

- ✅ Broken symlinks
- ✅ Symlinks with wrong paths

---

## 🔒 Safety Features

- **Automatic backups** - Creates backup branch before cleaning
- **Interactive confirmations** - Asks before making changes
- **Never auto-pushes** - You control when to push
- **Dry-run scanning** - Check issues before fixing

---

## 🎓 Understanding the Workflow

### The `all` Command Flow

```
1. SCAN
   ↓
   Shows what needs fixing
   ↓
2. CONFIRM
   ↓
   "Continue to fix symlinks? [yes/no]"
   ↓
3. FIX SYMLINKS
   ↓
   Creates correct relative symlinks
   ↓
4. CONFIRM
   ↓
   "Continue to clean git history? [yes/no]"
   ↓
5. CLEAN
   ↓
   Creates backup, removes bad commits
   ↓
6. VERIFY
   ↓
   Shows next steps for manual push
```

---

## 🆘 Need Help?

### Check the Full Documentation

```bash
./pantheon-scrub help
```

### Common Questions

**Q: Will this delete my files?**  
A: No! It only removes commits from git history. Your current files are safe.

**Q: Can I undo this?**  
A: Yes! pantheon-scrub creates a backup branch before cleaning.

**Q: Do I need to push immediately?**  
A: No. Verify everything first with `pantheon-scrub scan`.

**Q: What if something goes wrong?**  
A: Restore from the backup branch (shown in the output).

---

## 🎯 Quick Reference Card

```bash
# Download
curl -fsSL https://raw.githubusercontent.com/pantheon-systems/pantheon-scrub/main/pantheon-scrub -o pantheon-scrub && chmod +x pantheon-scrub

# Scan
./pantheon-scrub scan

# Fix symlinks only
./pantheon-scrub fix-symlinks

# Clean history only
./pantheon-scrub clean

# Do everything
./pantheon-scrub all

# Push to Pantheon
git push pantheon master --force-with-lease

# Rollback
git checkout master-backup-<timestamp>
```

---

## 🌟 Next Steps

After scrubbing your repository:

1. **Verify** - Run `pantheon-scrub scan` to confirm it's clean
2. **Test locally** - Make sure your site still works
3. **Push** - Use `git push pantheon master --force-with-lease`
4. **Monitor** - Check Pantheon dashboard for successful deployment

---

<div align="center">

### ✨ Your repository is now squeaky clean! ✨

**Questions?** Check the [full README](README.md) or open an issue on GitHub.

</div>

