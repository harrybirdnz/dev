# Harry's Custom Keyboard Layout

A programmer-friendly keyboard layout based on US QWERTY with macron support for te reo Māori.

## Features

### 🔧 Programmer Symbols
Top row optimized for coding:
```
` → ` (grave)     # → # (hash)
1 → + (plus)      ! → ! (exclamation)
2 → [ (bracket)   % → % (percent)  
3 → { (brace)     $ → $ (dollar)
4 → ( (paren)     ~ → ~ (tilde)
5 → & (ampersand)
6 → = (equal)
7 → ) (paren)
8 → } (brace)
9 → ] (bracket)
0 → * (asterisk)
- → ! (exclamation)
= → $ (dollar)
```

### 🔤 Macron Support
Access māori macrons using Alt key:
- **Alt + a** = ā
- **Alt + e** = ē  
- **Alt + i** = ī
- **Alt + o** = ō
- **Alt + u** = ū
- **Alt + Shift + vowel** = uppercase macrons (Ā, Ē, Ī, Ō, Ū)

## Installation

### Quick Install
```bash
./install
```

### Manual Steps
1. Copy `hb` to `/usr/share/X11/xkb/symbols/`
2. Add layout entry to `/usr/share/X11/xkb/rules/base.xml` and `evdev.xml`
3. Clear XKB cache: `sudo rm -rf /var/lib/xkb/*`
4. Activate: `setxkbmap -layout hb`

## Usage

### Cosmic DE
1. Settings → Desktop → Input → Keyboard
2. Select "English (Harry)" from layout list

### Command Line
```bash
setxkbmap -layout hb
```

### Make Persistent
The layout should persist across sessions. If not:
- Set in desktop environment settings
- Or add to shell profile: `setxkbmap -layout hb`

## Files

- `hb` - XKB symbols file defining the layout
- `install` - Installation script for fresh systems
- `README.md` - This documentation

## Compatibility

- ✅ Cosmic DE (Pop!_OS)
- ✅ GNOME
- ✅ KDE Plasma  
- ✅ XFCE
- ✅ Most X11/Wayland desktop environments

## Troubleshooting

### Layout not appearing in settings
- Log out and back in
- Restart desktop session
- Check if files are properly installed

### Macrons not working
- Ensure Alt key is not remapped by other software
- Test with: `setxkbmap -layout hb && xev` (X11 only)

### Layout resets after reboot
- Set layout in desktop environment settings
- Or add `setxkbmap -layout hb` to startup applications