#!/bin/bash

# Script to install Harry's custom keyboard layout for Cosmic DE
set -e

echo "Installing Harry's custom keyboard layout..."

# Check if running as root for system files
if [[ $EUID -eq 0 ]]; then
    echo "Please run this script as a regular user, it will use sudo when needed."
    exit 1
fi

# Define paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
XKB_CONFIG_DIR="$SCRIPT_DIR/.config/xkb"
SYMBOLS_FILE="$XKB_CONFIG_DIR/symbols/hb"
LAYOUT_XML="$XKB_CONFIG_DIR/hb_layout.xml"

# System XKB paths
SYSTEM_XKB_DIR="/usr/share/X11/xkb"
SYSTEM_SYMBOLS_DIR="$SYSTEM_XKB_DIR/symbols"
SYSTEM_RULES_DIR="$SYSTEM_XKB_DIR/rules"

echo "1. Copying symbols file to system directory..."
sudo cp "$SYMBOLS_FILE" "$SYSTEM_SYMBOLS_DIR/"
echo "   ✓ Copied $SYMBOLS_FILE to $SYSTEM_SYMBOLS_DIR/"

echo "2. Updating XKB rules files..."

# Backup original files
sudo cp "$SYSTEM_RULES_DIR/base.xml" "$SYSTEM_RULES_DIR/base.xml.backup.$(date +%Y%m%d-%H%M%S)" 2>/dev/null || true
sudo cp "$SYSTEM_RULES_DIR/evdev.xml" "$SYSTEM_RULES_DIR/evdev.xml.backup.$(date +%Y%m%d-%H%M%S)" 2>/dev/null || true

# Function to add layout to XML file if not already present
add_layout_to_xml() {
    local xml_file="$1"
    local layout_entry='    <layout>
      <configItem>
        <name>hb</name>
        <shortDescription>hb</shortDescription>
        <description>English (Harry)</description>
        <languageList>
          <iso639Id>eng</iso639Id>
        </languageList>
      </configItem>
    </layout>'

    if ! sudo grep -q '<name>hb</name>' "$xml_file" 2>/dev/null; then
        echo "   Adding layout to $xml_file..."
        # Find the layoutList section and add our layout
        if sudo grep -q '<layoutList>' "$xml_file"; then
            # Add after <layoutList> opening tag
            sudo sed -i "/<layoutList>/a\\$layout_entry" "$xml_file"
        else
            echo "   Warning: Could not find <layoutList> in $xml_file"
        fi
    else
        echo "   Layout already exists in $xml_file"
    fi
}

# Add layout to both base.xml and evdev.xml
add_layout_to_xml "$SYSTEM_RULES_DIR/base.xml"
add_layout_to_xml "$SYSTEM_RULES_DIR/evdev.xml"

echo "3. Clearing XKB cache..."
sudo rm -rf /var/lib/xkb/* 2>/dev/null || true

echo "4. Reloading XKB configuration..."
setxkbmap -query
setxkbmap -layout hb 2>/dev/null && echo "   ✓ Successfully loaded hb layout" || echo "   ! Layout available but may need manual selection"

echo ""
echo "Installation complete!"
echo ""
echo "To use your custom layout:"
echo "1. Open Cosmic Settings"
echo "2. Go to Input > Keyboard"
echo "3. Look for 'English (Harry)' or 'hb' in the layout list"
echo "4. Select it as your active layout"
echo ""
echo "If the layout doesn't appear immediately, try:"
echo "- Logging out and back in"
echo "- Restarting your session"
echo "- Running: setxkbmap -layout hb"
echo ""
echo "To test the layout immediately, run: setxkbmap -layout hb"