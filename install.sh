#!/bin/bash

# pantheon-scrub installer
# Usage: curl -fsSL https://raw.githubusercontent.com/pantheon-systems/pantheon-scrub/main/install.sh | bash

set -e

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
SCRIPT_URL="https://raw.githubusercontent.com/pantheon-systems/pantheon-scrub/main/pantheon-scrub"

echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BOLD}${CYAN}🧹 pantheon-scrub installer${NC}"
echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

# Check for global install flag
if [ "$1" = "--global" ]; then
    INSTALL_DIR="/usr/local/bin"
    echo -e "${CYAN}Installing globally to ${BOLD}$INSTALL_DIR${NC}"
    echo -e "${YELLOW}Note: This may require sudo permissions${NC}\n"
else
    echo -e "${CYAN}Installing to ${BOLD}$INSTALL_DIR${NC}"
    echo -e "${YELLOW}Tip: Use --global to install to /usr/local/bin${NC}\n"
fi

# Create install directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo -e "${CYAN}Creating directory: $INSTALL_DIR${NC}"
    mkdir -p "$INSTALL_DIR"
fi

# Download the script
echo -e "${CYAN}Downloading pantheon-scrub...${NC}"
if command -v curl &> /dev/null; then
    curl -fsSL "$SCRIPT_URL" -o "$INSTALL_DIR/pantheon-scrub"
elif command -v wget &> /dev/null; then
    wget -q "$SCRIPT_URL" -O "$INSTALL_DIR/pantheon-scrub"
else
    echo -e "${RED}Error: Neither curl nor wget found. Please install one of them.${NC}"
    exit 1
fi

# Make executable
chmod +x "$INSTALL_DIR/pantheon-scrub"

echo -e "${GREEN}✓ pantheon-scrub installed successfully!${NC}\n"

# Check if install dir is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo -e "${YELLOW}⚠ Warning: $INSTALL_DIR is not in your PATH${NC}"
    echo -e "${YELLOW}Add this to your ~/.bashrc or ~/.zshrc:${NC}"
    echo -e "${BOLD}export PATH=\"\$PATH:$INSTALL_DIR\"${NC}\n"
fi

echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BOLD}${CYAN}🧹 Ready to scrub!${NC}"
echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

echo -e "${CYAN}Try these commands:${NC}"
echo -e "  ${BOLD}pantheon-scrub help${NC}      # Show help"
echo -e "  ${BOLD}pantheon-scrub scan${NC}      # Scan for issues"
echo -e "  ${BOLD}pantheon-scrub all${NC}       # Full scrub workflow\n"

echo -e "${CYAN}✨ Keep your Pantheon repos squeaky clean!${NC}\n"

