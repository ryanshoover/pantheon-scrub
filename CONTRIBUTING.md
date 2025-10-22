# Contributing to pantheon-scrub

Thank you for your interest in contributing to pantheon-scrub! 🧹

> **⚠️ Professional Services Project:** This tool is maintained by Pantheon Professional Services and is not an official Pantheon product. Contributions are welcome to help improve the tool for the community.

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:
- A clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Your environment (OS, bash version, git version)

### Suggesting Features

Feature suggestions are welcome! Please open an issue describing:
- The problem you're trying to solve
- Your proposed solution
- Any alternatives you've considered

### Submitting Pull Requests

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
   - Follow the existing code style
   - Add comments for complex logic
   - Test your changes thoroughly
4. **Commit your changes**
   ```bash
   git commit -m "Add feature: description"
   ```
5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```
6. **Open a Pull Request**

## Development Guidelines

### Code Style

- Use 4 spaces for indentation
- Follow existing naming conventions
- Add comments for non-obvious code
- Keep functions focused and single-purpose

### Testing

Before submitting a PR, test your changes:

```bash
# Test help command
./pantheon-scrub help

# Test scan on a test repository
./pantheon-scrub scan /path/to/test/repo

# Test fix-symlinks
./pantheon-scrub fix-symlinks /path/to/test/repo

# Test full workflow (use a test repo!)
./pantheon-scrub all /path/to/test/repo
```

### Commit Messages

Use clear, descriptive commit messages:

- ✅ `Fix: Handle symlinks with spaces in path`
- ✅ `Add: Support for Drupal 9 file paths`
- ✅ `Docs: Update installation instructions`
- ❌ `fix bug`
- ❌ `update`

## Project Structure

```
pantheon-scrub/
├── pantheon-scrub       # Main CLI script
├── install.sh           # Installation script
├── README.md            # User documentation
├── BRANDING.md          # Brand guidelines
├── CONTRIBUTING.md      # This file
└── LICENSE              # MIT License
```

## Areas for Contribution

### High Priority
- [ ] Add support for more Pantheon reserved paths
- [ ] Improve error messages and user guidance
- [ ] Add dry-run mode for clean command
- [ ] Better handling of edge cases

### Medium Priority
- [ ] Add tests (bats or similar)
- [ ] Support for custom reserved paths
- [ ] Progress indicators for long operations
- [ ] Colorized diff output

### Low Priority
- [ ] Man page
- [ ] Shell completion (bash/zsh)
- [ ] Homebrew formula
- [ ] Docker container

## Questions?

Feel free to open an issue with your question, or reach out to the maintainers.

## Code of Conduct

Be respectful, constructive, and professional. We're all here to make better tools.

---

Thank you for contributing to pantheon-scrub! 🧹✨

