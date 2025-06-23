#!/bin/bash

echo "Installing yay"
sudo pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin


# echo "Run ML4W hyprland setup dotfiles install script"
# bash -c "$(curl -s https://raw.githubusercontent.com/mylinuxforwork/dotfiles/main/setup-arch.sh)"

echo "install various packages..."
yay -S --noconfirm \
  vivaldi spotify slack-desktop \
  visual-studio-code-bin \
  nano discord sddm wayland hyprland \
  hyprlock xdg-desktop-portal-hyprland \
  kitty pipewire wireplumber \
  pavucontrol hyprpolkitagent \
  uwsm libnewt wlogout quickshell \
  hyprland-qt-support hyprland-qtutils \
  nvidia-dkms nvidia-utils egl-wayland \
  lib32-nvidia-utils zsh telegram-desktop \
  oh-my-zsh zsh-syntax-highlightning zsh-theme-powerlevel10k-git \
  zsh-autocomplete
  ttf-jetbrains-mono-nerd

systemctl enable sddm.service --now

git clone https://github.com/IvarK/ivarch.git --depth 1
cp -r ivarch/dotfiles/* ~/.config/