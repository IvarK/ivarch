#!/bin/bash

# check if yay is installed
if ! command -v yay &> /dev/null; then
  echo "yay is not installed. Installing yay..."
  # Install yay
  sudo pacman -S --needed git base-devel --noconfirm
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ..
  rm -rf yay-bin
else
  echo "yay is already installed."
fi

# enable multilib repository
echo "Enabling multilib repository..."
sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf
sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm

echo "install various packages..."
# Read packages.conf and install it's packages all in one go
# ignore lines starting with #
# and convert newlines to spaces
packages=$(grep -v '^#' packages.conf | tr '\n' ' ')
yay -S --needed $packages --noconfirm

# rync content of dotfiles directory to home directory
echo "Copying dotfiles to home directory..."
rsync -av dotfiles/ $HOME/

systemctl enable sddm.service
