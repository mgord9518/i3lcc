# i3lcc (i3lock-configuratorinator)
The mildly useful project nobody asked for! Configuration program for i3lock-color

![example](preview.png)

To use, set './bin/i3lcc' as executable and run it.
This is in very early development, I highly recommend launching from a terminal so Python error messages can be read

### Dependencies:
```
pyqt5 python3 imagemagick i3lock-color
```

## Short term goals:
  * Detect whether i3lock-color and imagemagick are on the system, display an error message if not found
  * Add background screenshot filters using imagemagick (blur, pixelation)
  * Add support for more of i3lock-color's functions (such as editing greeter text) instead of just automatically disabling them
  * Find and squash bugs
  * Tweak and purdify code (especially getting rid of old, deprecated code)
  * Create a simple user-install script

## Mid term goals:
  * Create AUR and DEB packages (and maybe Flatpak? Fuck Snap.)
  * Add support for saving settings in a user config file, and a system-wide default config
  * Add support for more image formats using imagemagick

## Long term goals:
  * Is this really a long term project? Perfect and refine it I guess
