#!/bin/bash

# Final installation script for Harry's keyboard layout in Cosmic DE
set -e

echo "=== Installing Harry's Custom Keyboard Layout for Cosmic DE ==="
echo ""

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    echo "❌ Please run this script as a regular user, it will use sudo when needed."
    exit 1
fi

# Define paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYMBOLS_FILE="$SCRIPT_DIR/.config/xkb/symbols/hb"
PYTHON_SCRIPT="$SCRIPT_DIR/add_layout.py"

# Check if required files exist
if [[ ! -f "$SYMBOLS_FILE" ]]; then
    echo "❌ Symbols file not found: $SYMBOLS_FILE"
    exit 1
fi

if [[ ! -f "$PYTHON_SCRIPT" ]]; then
    echo "❌ Python script not found: $PYTHON_SCRIPT"
    exit 1
fi

echo "✅ Found required files"
echo ""

# Step 1: Copy symbols file
echo "1️⃣  Copying symbols file to system directory..."
sudo cp "$SYMBOLS_FILE" "/usr/share/X11/xkb/symbols/"
echo "   ✅ Copied symbols file successfully"
echo ""

# Step 2: Add layout to XML files
echo "2️⃣  Adding layout to XKB rules files..."
sudo python3 "$PYTHON_SCRIPT"
echo ""

# Step 3: Clear cache
echo "3️⃣  Clearing XKB cache..."
sudo rm -rf /var/lib/xkb/* 2>/dev/null || true
echo "   ✅ XKB cache cleared"
echo ""

# Step 4: Test layout
echo "4️⃣  Testing keyboard layout..."
if setxkbmap -layout hb 2>/dev/null; then
    echo "   ✅ Layout loaded successfully!"
else
    echo "   ⚠️  Layout may need manual selection (this is normal for Wayland)"
fi

# Check current layout
echo ""
echo "📋 Current keyboard layout status:"
setxkbmap -query 2>/dev/null || echo "   (Unable to query - this is normal for Wayland)"
echo ""

echo "🎉 Installation Complete!"
echo ""
echo "📝 How to use your custom layout:"
echo ""
echo "   Method 1 - Cosmic Settings (Recommended):"
echo "   1. Open Cosmic Settings"
echo "   2. Go to Desktop > Input > Keyboard"
echo "   3. Look for 'English (Harry)' in the layout list"
echo "   4. Select it as your active layout"
echo ""
echo "   Method 2 - Command Line:"
echo "   Run: setxkbmap -layout hb"
echo ""
echo "   Method 3 - If layout doesn't appear:"
echo "   - Log out and back in"
echo "   - Restart your desktop session"
echo "   - Reboot (if necessary)"
echo ""
echo "🔧 Layout Features:"
echo "   - Based on US QWERTY with programmer-friendly symbols"
echo "   - Top row optimized for coding with easy access to brackets, braces, etc."
echo "   - Symbols repositioned for better programming workflow"
echo ""
echo "Happy coding! 🚀"