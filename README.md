# Setup 

```cmd
cargo install kanata
```

```cmd
mkdir C:\Users\chris\AppData\Roaming\kanata
copy kanata.kbd C:\Users\chris\AppData\Roaming\kanata
```

# Layout 

### Home Row Mods

The layout implements "home row mods" - keys that serve dual purposes when tapped or held:

Left Hand:
- `caps` → Navigation layer toggle
- `a` → Tap: 'a' / Hold: Left Meta (Windows key)
- `s` → Tap: 's' / Hold: Left Alt
- `d` → Tap: 'd' / Hold: Left Shift
- `f` → Tap: 'f' / Hold: Left Control

Right Hand:
- `h` → Tap: 'h' / Hold: Left Meta
- `j` → Tap: 'j' / Hold: Right Control
- `k` → Tap: 'k' / Hold: Right Shift
- `l` → Tap: 'l' / Hold: Right Alt
- `;` → Tap: ';' / Hold: Right Meta

### Navigation Layer
When the `caps` key is held, it activates a navigation layer that transforms:
- `h` → Left arrow
- `j` → Down arrow
- `k` → Up arrow
- `l` → Right arrow

The configuration uses tap-hold functionality to distinguish between quick presses (for normal letters) and held presses (for modifiers), making it both efficient and ergonomic.
