#!/bin/bash

# Final installation script for Harry's consolidated keyboard layout in Cosmic DE
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
CLEANUP_SCRIPT="$SCRIPT_DIR/cleanup_layouts.py"

# Check if required files exist
if [[ ! -f "$SYMBOLS_FILE" ]]; then
    echo "❌ Symbols file not found: $SYMBOLS_FILE"
    exit 1
fi

if [[ ! -f "$CLEANUP_SCRIPT" ]]; then
    echo "❌ Cleanup script not found: $CLEANUP_SCRIPT"
    exit 1
fi

echo "✅ Found required files"
echo ""

# Step 1: Copy symbols file
echo "1️⃣  Installing symbols file..."
sudo cp "$SYMBOLS_FILE" "/usr/share/X11/xkb/symbols/hb"
echo "   ✅ Copied symbols file successfully"
echo ""

# Step 2: Clean up and add layout to XML files
echo "2️⃣  Updating XKB rules files..."
sudo python3 "$CLEANUP_SCRIPT"
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
echo "🔧 Layout Features:"
echo "   ✨ Programmer-friendly symbol layout on top row"
echo "   ✨ Macron support using Alt key:"
echo "      • Alt + a = ā    • Alt + A = Ā"
echo "      • Alt + e = ē    • Alt + E = Ē" 
echo "      • Alt + i = ī    • Alt + I = Ī"
echo "      • Alt + o = ō    • Alt + O = Ō"
echo "      • Alt + u = ū    • Alt + U = Ū"
echo ""
echo "   Perfect for coding AND typing te reo Māori! 🇳🇿"
echo ""
echo "Happy coding! 🚀"