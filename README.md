# Setup 

```cmd
git clone https://github.com/galironfydar/kanata-config.git C:\Users\$env:USERNAME\AppData\Roaming\kanata
```

## Installation

To install Kanata as a service, execute the `install-kanata.ps1` script with administrator privileges:

```powershell
# Using PowerShell environment variable expansion:
& "$env:USERPROFILE\AppData\Roaming\kanata\install-kanata.ps1"

# Or if you're in the kanata directory:
.\install-kanata.ps1
```

This script performs the following actions:
- Installs Kanata using Cargo.
- Installs NSSM (Non-Sucking Service Manager) using Chocolatey.
- Creates the necessary configuration directory.
- Sets up Kanata as a Windows service that starts automatically.

## Uninstallation

To remove Kanata from your system, execute the `uninstall-kanata.ps1` script with administrator privileges:

```powershell
# Using PowerShell environment variable expansion:
& "$env:USERPROFILE\AppData\Roaming\kanata\uninstall-kanata.ps1"

# Or if you're in the kanata directory:
.\uninstall-kanata.ps1
```

This script will:
- Stop the Kanata service if it is running.
- Remove the Kanata service from NSSM.

## Configuration

The Kanata configuration file (`kanata.kbd`) defines key mappings and behavior. Below is an overview of the configuration:

```kbd
;; defsrc is still necessary
(defcfg
  process-unmapped-keys yes
)

(defsrc
  caps a s d f h j k l ;
)
(defvar
  tap-time 150
  hold-time 200
)

(defalias
  escctrl (tap-hold 100 100 esc lctl)
  a (tap-hold $tap-time $hold-time a lmet)
  s (tap-hold $tap-time $hold-time s lalt)
  d (tap-hold $tap-time $hold-time d lsft)
  f (tap-hold $tap-time $hold-time f lctl)
  h (tap-hold $tap-time $hold-time h lmet)  ;; added alias for 'h'
  j (tap-hold $tap-time $hold-time j rctl)
  k (tap-hold $tap-time $hold-time k rsft)
  l (tap-hold $tap-time $hold-time l ralt)
  ; (tap-hold $tap-time $hold-time ; rmet)
  nav (layer-toggle nav)  ;; new alias for navigation layer
)

(deflayer base
  @nav @a @s @d @f h @j @k @l @;
)

(deflayer nav
  _ _ _ _ _ left down up right _
)
```

### Key Sections:

- **defcfg**: Basic configuration settings.
- **defsrc**: Defines the source keys for customization.
- **defvar**: Variables for tap and hold timings to distinguish between quick presses and holds.
- **defalias**: Assigns dual functionalities to keys using tap-hold mechanics.
  - Example: Pressing `a` sends `'a'`, holding `a` triggers the Left Meta key.
- **deflayer**: Defines key layers.
  - **base**: The default key layer with home row mods.
  - **nav**: Navigation layer activated by holding the `caps` key, enabling arrow key functionality.

### Usage Tips:

- **Home Row Mods**: Utilize the dual-purpose keys for efficient typing and navigation without moving your hands.
- **Navigation Layer**: Hold the `caps` key to switch to the navigation layer, allowing arrow key operations with `h`, `j`, `k`, and `l`.

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
