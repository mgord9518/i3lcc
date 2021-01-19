# i3lcc (i3lock-configuratorinator)
The mildly useful project nobody asked for! Configuration program for i3lock-color

![example](preview.png)

## Quick installation
Download install.bash, set as executable with 'chmod +x install.bash', then run
It can also be run directly if downloaded from github if the file structure is kept the same.

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
