# i3lcc (i3lock-configuratorinator)
The mildly useful project nobody asked for! Configuration program for i3lock-color

![example](preview.png)

## Quick installation
```bash
wget https://raw.githubusercontent.com/mgord9518/i3lcc/main/install.bash 2>/dev/null;bash install.bash;rm install.bash
```
It can also be run directly if downloaded from github if the file structure is kept the same.

## Uninstallation
Simply run the install one-liner again, it will automatically detect the install and ask if you want to remove it.
Or if you want to manually uninstall:
```bash
rm -rv ~/.local/share/i3lcc \
       ~/.local/share/applications/i3lcc.desktop \
       ~/.local/share/icons/locolor/scalable/apps/i3lcc.svg \
       ~/.local/bin/i3lcc \
       ~/.config/i3lcc # (if you want to remove your configuration as well)
```
This is in very early development, I highly recommend launching from a terminal so Python error messages can be read

### Dependencies
```
pyqt5 python3 imagemagick i3lock-color libnotify-bin
```

## Short term goals:
  * Detect whether i3lock-color and imagemagick are on the system, display an error message if not found
  * Add more background screenshot filters using imagemagick (blur)
  * Find and squash bugs
  * Tweak and purdify code (especially getting rid of old, deprecated code)

## Mid term goals:
  * Create AUR and DEB packages (and maybe Flatpak? Fuck Snap.)
  * Add support for more image formats using imagemagick
