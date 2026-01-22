#!/bin/bash

# Installation script for Harry's NZ keyboard layout with macron support
set -e

echo "=== Installing Harry's NZ Keyboard Layout (with Macrons) for Cosmic DE ==="
echo ""

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    echo "❌ Please run this script as a regular user, it will use sudo when needed."
    exit 1
fi

# Define paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYMBOLS_FILE="$SCRIPT_DIR/.config/xkb/symbols/hb_nz"
PYTHON_SCRIPT="$SCRIPT_DIR/add_layout_multi.py"

# Check if required files exist
if [[ ! -f "$SYMBOLS_FILE" ]]; then
    echo "❌ NZ symbols file not found: $SYMBOLS_FILE"
    exit 1
fi

if [[ ! -f "$PYTHON_SCRIPT" ]]; then
    echo "❌ Python script not found: $PYTHON_SCRIPT"
    exit 1
fi

echo "✅ Found required files"
echo ""

# Step 1: Copy symbols file with new name
echo "1️⃣  Copying NZ symbols file to system directory..."
sudo cp "$SYMBOLS_FILE" "/usr/share/X11/xkb/symbols/hb_nz"
echo "   ✅ Copied NZ symbols file successfully"
echo ""

# Step 2: Add layout to XML files
echo "2️⃣  Adding NZ layout to XKB rules files..."
sudo python3 "$PYTHON_SCRIPT" "hb_nz" "English (Harry NZ with Macrons)"
echo ""

# Step 3: Clear cache
echo "3️⃣  Clearing XKB cache..."
sudo rm -rf /var/lib/xkb/* 2>/dev/null || true
echo "   ✅ XKB cache cleared"
echo ""

# Step 4: Test layout
echo "4️⃣  Testing NZ keyboard layout..."
if setxkbmap -layout hb_nz 2>/dev/null; then
    echo "   ✅ NZ layout loaded successfully!"
else
    echo "   ⚠️  Layout may need manual selection (this is normal for Wayland)"
fi

# Check current layout
echo ""
echo "📋 Current keyboard layout status:"
setxkbmap -query 2>/dev/null || echo "   (Unable to query - this is normal for Wayland)"
echo ""

echo "🎉 NZ Layout Installation Complete!"
echo ""
echo "📝 How to use your custom NZ layout with macrons:"
echo ""
echo "   Method 1 - Cosmic Settings (Recommended):"
echo "   1. Open Cosmic Settings"
echo "   2. Go to Desktop > Input > Keyboard"
echo "   3. Look for 'English (Harry NZ with Macrons)' in the layout list"
echo "   4. Select it as your active layout"
echo ""
echo "   Method 2 - Command Line:"
echo "   Run: setxkbmap -layout hb_nz"
echo ""
echo "🔧 NZ Layout Features:"
echo "   ✨ All your original programmer-friendly symbols"
echo "   ✨ PLUS macron support using Right Alt key:"
echo "      • Right Alt + a = ā"
echo "      • Right Alt + e = ē" 
echo "      • Right Alt + i = ī"
echo "      • Right Alt + o = ō"
echo "      • Right Alt + u = ū"
echo "      • Right Alt + Shift + vowel = uppercase macrons (Ā, Ē, etc.)"
echo ""
echo "   You now have both layouts available:"
echo "   • 'English (Harry)' - original layout"
echo "   • 'English (Harry NZ with Macrons)' - with macron support"
echo ""
echo "Happy coding with macrons! 🇳🇿"