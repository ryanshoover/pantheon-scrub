# Changelog

All notable changes to pantheon-scrub will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial release of pantheon-scrub
- `scan` command to check for Pantheon git violations
- `fix-symlinks` command to fix broken symlinks
- `clean` command to remove problematic commits from history
- `all` command for full workflow
- Colored terminal output
- Interactive confirmations
- Automatic backup branches
- Support for WordPress and Drupal paths

### Security
- Never auto-pushes changes
- Creates backup branches before destructive operations
- Requires explicit confirmation for history rewriting

## [1.0.0] - 2025-10-22

### Added
- First stable release
- Complete documentation
- Installation script
- MIT License

---

## Version History

- **1.0.0** - Initial Release
  - Core functionality for scanning and cleaning Pantheon repositories
  - Professional CLI with colored output
  - Safety features (backups, confirmations)
  - Complete documentation

---

## Future Roadmap

### Planned Features
- [ ] Dry-run mode for clean command
- [ ] Support for custom reserved paths
- [ ] Progress indicators
- [ ] Shell completion
- [ ] Automated tests
- [ ] Homebrew formula

### Under Consideration
- [ ] Support for more CMS platforms
- [ ] Git hook integration
- [ ] CI/CD integration examples
- [ ] Docker container

---

**Note:** This project follows semantic versioning. Breaking changes will only occur in major version updates.

