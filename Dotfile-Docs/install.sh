#!/bin/bash

install() {

dotfiles_dir="$HOME/.dotfiles/"

# Install Yay
yay_url="https://aur.archlinux.org/yay-bin.git"
git clone $yay_url "$HOME/yay" && cd "$HOME/yay" && makepkg -si || exit

# Install packages
yay -S $(cat "$dotfiles_dir/Dotfile-Docs/WIP-yay_pkglist.txt") || exit

# Enable case-insensitive bash completion
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc || exit

# Update default browser and editor
echo "BROWSER=google-chrome-stable" | sudo tee -a /etc/environment
echo "EDITOR=helix" | sudo tee -a /etc/environment

# enable reflector service
reflector_config="/etc/xdg/reflector/reflector.conf"
echo -e "--save /etc/pacman.d/mirrorlist\n--country US\n--protocol https\n--latest 10\n--sort rate" | sudo tee -a $reflector_config
sudo systemctl enable reflector.service || exit

# enable ssd TRIM
sudo systemctl enable fstrim.timer 

# update laptop touchpad controls
if [[ $is_laptop ]]
then
  sudo sed -i '/libinput touchpad catchall/ a\
  \tOption "NaturalScrolling" "True"\n\tOption "Tapping" "on"' /usr/share/X11/xorg.conf.d/40-libinput.conf
fi

# update pacman settings to desired
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

if [[ ! $is_laptop ]]
then
  sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
fi

# change lightdm configuration
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-slick-greeter/g' /etc/lightdm/lightdm.conf

# change default cursor icon
sudo sed -i 's/Adwaita/MacOSMOD/g' /usr/share/icons/default/index.theme
}


# ask user if this is a laptop
echo "Is this computer a laptop? (y/N)"
read input

if [ "$input" = 'y' ] || [ "$input" = 'Y' ] 
then
  is_laptop=true
else
  is_laptop=false
fi

install