- Install packages from the pgklist

- set lightdm config to use ```lightdm-slick-greeter```

- Change lightdm background image

- Change GRUB2 theme (not finished yet)

- Enable case-insensitive bash completion with...
```bash
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
```

- pwfeedback

- Update default browser and editor (/etc/environment)
```
BROWSER=google-chrome-stable
EDITOR=vim
```

- Download and install Yay/Paru from AUR

- Download gtk/icon theme from AUR

- set default cursor theme in /usr/share/icons/default/

- Download discord/slack/spotify/google-chrome/vscode/github-cli 

- update paru configuration as needed

- update pacman configuration to allow color

- invert scroll direction and touch-to-click for laptop touchpad in ```/usr/share/X11/xorg.conf.d/40-libinput.conf``` and add to "touchpad catchall"...

```
Option "NaturalScrolling" "True"
Option "Tapping" "on"
```

- If on laptop, confirm that backlight is working, otherwise, need to install proper drivers for xorg video (ie xf86-video-intel for lilbuddy)

- Enable reflector service with ```/etc/xdg/reflector/reflector.conf``` config:
```
--save /etc/pacman.d/mirrorlist
--country US
--protocol https
--latest 10
--sort rate
```

with the command: 
```
sudo systemctl enable reflector.service
```

- If SSD present, activate TRIM with the command:
```
sudo systemctl enable fstrim.timer
```

- Add the ```autotiling``` script from the AUR.
