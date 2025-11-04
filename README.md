# 🧹 pantheon-scrub

**Automated repo cleanup for Pantheon deployments**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/bash-5.0+-green.svg)](https://www.gnu.org/software/bash/)
[![Unofficial Support](https://img.shields.io/badge/pantheon-Unofficial_Support-yellow?logo=pantheon&color=FFDC28)](https://pantheon.io/docs/oss-support-levels#unofficial-support)

> **⚠️ Professional Services Project:** This tool is developed and maintained by Pantheon Professional Services. It is not an official Pantheon product, but is provided to help customers resolve common deployment issues.

A professional CLI tool that scrubs away commits violating Pantheon's git hooks and fixes symlink issues. Keep your repositories squeaky clean! ✨

---

## 🚀 Quickstart

### One-Liner Installation

```bash
curl -fsSL https://raw.githubusercontent.com/pantheon-systems/pantheon-scrub/main/pantheon-scrub -o pantheon-scrub && chmod +x pantheon-scrub && ./pantheon-scrub all
```

### Install Globally

```bash
sudo curl -fsSL https://raw.githubusercontent.com/pantheon-systems/pantheon-scrub/main/pantheon-scrub -o /usr/local/bin/pantheon-scrub && sudo chmod +x /usr/local/bin/pantheon-scrub

# Then run from anywhere
cd /path/to/your/pantheon/site
pantheon-scrub all
```

---

## 🧹 What Gets Scrubbed?

`pantheon-scrub` removes commits that violate Pantheon's git hooks:

- ✅ Commits modifying `wp-content/uploads`
- ✅ Commits modifying `sites/default/files`
- ✅ Commits modifying `web/sites/default/files`
- ✅ Commits modifying `web/wp-content/uploads`
- ✅ Commits modifying `pantheon.upstream.yml`

It also fixes:

- ✅ Broken symlinks (converts to relative paths like `../uploads`)
- ✅ Symlinks committed as files (ensures mode 120000)

---

## 📋 Commands

```bash
pantheon-scrub <command> [repository-path]
```

| Command | Description |
|---------|-------------|
| `scan` | Scan for issues that need scrubbing |
| `fix-symlinks` | Fix symlinks to use relative paths |
| `clean` | Deep scrub - removes problematic commits |
| `all` | Full scrub (scan → fix → clean) |
| `help` | Show help message |

---

## 💡 Usage Examples

```bash
# Scan current repository
pantheon-scrub scan

# Scan another repository
pantheon-scrub scan /path/to/repo

# Fix symlinks only
pantheon-scrub fix-symlinks

# Deep scrub git history
pantheon-scrub clean

# Full scrub workflow (recommended)
pantheon-scrub all
```

---

## 🎯 Common Pantheon Errors Fixed

### Error 1: Reserved File Paths

```
remote: Contains changes to one of the reserved files paths: ['sites/default/files', 'wp-content/uploads', 'web/sites/default/files', 'web/wp-content/uploads']
remote: This path is reserved for the CMS filesystem and should not be
remote: added or committed to your codebase.
```




**Solution:** `pantheon-scrub clean`

### Error 2: pantheon.upstream.yml

```
remote: Contains changes to pantheon.upstream.yml which is reserved
  for the exclusive use of the upstream.
```

**Solution:** `pantheon-scrub clean`
**Note:** Use `pantheon.yml` instead for site configuration

### Error 3: Broken Symlinks

```
wp-content/cache: broken symbolic link to /files/cache
```

**Solution:** `pantheon-scrub fix-symlinks`

---

## 🔒 Safety Features

- ✅ **Automatic backups** - Creates backup branch before scrubbing
- ✅ **Interactive confirmations** - Asks before making changes
- ✅ **Never auto-pushes** - You control when to push
- ✅ **Works anywhere** - Pass repository path as argument
- ✅ **Colored output** - Easy-to-read status messages
- ✅ **Dry-run scanning** - Check issues before fixing

---

## 📦 Requirements

**git-filter-repo** must be installed:

```bash
# macOS
brew install git-filter-repo

# Linux/Other
pip install git-filter-repo
```

---

## 🎨 Sample Output

```bash
$ pantheon-scrub scan

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🧹 Scrubbing Repository - Scan Mode
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

→ Checking for commits modifying reserved paths...

⚠ Found commits modifying: wp-content/uploads
  cc62e5dfa 2023-05-09 PMT: Add the wp-config.php file.
  11fe5f3f6 2023-05-03 PMT: Add the wp-config.php file.

→ Checking symlink configuration...

✓ wp-content/uploads → ../uploads (correct)
✗ wp-content/uploads is tracked as a file (should be removed from history)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🧹 Scrub Results
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠ Found 2 issue(s) that need scrubbing

ℹ Run: pantheon-scrub clean to scrub these issues
```

---

## 🔄 Full Scrub Workflow

When you run `pantheon-scrub all`, it performs:

### 1. 🔍 Scan
Identifies all issues in your repository

### 2. 🔗 Fix Symlinks
Creates correct relative symlinks (`../uploads`)

### 3. 🧹 Deep Scrub
Removes problematic commits from git history

### 4. ✅ Verification
Provides instructions for manual push

Each step asks for confirmation before proceeding.

---

## 🆘 Rollback Instructions

If something goes wrong:

```bash
# Find your backup branch
git branch | grep backup

# Restore from backup
git checkout master-backup-<timestamp>

# Force push to restore (if already pushed)
git push pantheon master --force-with-lease
```

---

## 🎓 How It Works

### Scanning
- Checks git history for commits modifying reserved paths
- Verifies symlink configuration
- Reports issues without making changes

### Fixing Symlinks
- Removes broken symlinks
- Creates relative symlinks (`wp-content/uploads → ../uploads`)
- Stages changes for commit

### Deep Scrub
- Creates automatic backup branch
- Uses `git-filter-repo` to rewrite history
- Removes all commits touching reserved paths
- Preserves all other commits

---

## 📚 Documentation

- [Pantheon Symlinks Documentation](https://docs.pantheon.io/symlinks-assumed-write-access)
- [git-filter-repo Documentation](https://github.com/newren/git-filter-repo)
- [Pantheon Git FAQ](https://pantheon.io/docs/git-faq)

---

## 🤝 Contributing

Found a bug or have a suggestion? Open an issue or PR!

```bash
git clone https://github.com/pantheon-systems/pantheon-scrub.git
cd pantheon-scrub
# Make your improvements
```

---

## 📄 License

MIT License - Free to use for any purpose

---

## 🎯 Quick Reference

```bash
# Install
curl -fsSL https://raw.githubusercontent.com/pantheon-systems/pantheon-scrub/main/pantheon-scrub -o pantheon-scrub && chmod +x pantheon-scrub

# Scan for issues
pantheon-scrub scan

# Fix everything
pantheon-scrub all

# Push to Pantheon (after verification)
git push pantheon master --force-with-lease
```

---

<div align="center">

### ✨ Keep your Pantheon repos squeaky clean! ✨

**Made with 🧹 by Pantheon Professional Services**

> **Note:** This is a Professional Services project and not an official Pantheon product (yet). It is provided as-is to help customers resolve common git hook violations when pushing to Pantheon.

[⭐ Star this repo](https://github.com/pantheon-systems/pantheon-scrub) if pantheon-scrub helped you!

</div>

