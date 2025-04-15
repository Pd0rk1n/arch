#!/bin/bash

# List of packages to install
packages=(
    rofi
    i3-wm
    polybar
    nemo
    lxappearance
    nitrogen
)

echo "Updating package database..."
sudo pacman -Sy

echo "Installing packages: ${packages[*]}"
for pkg in "${packages[@]}"; do
    if pacman -Qi "$pkg" &> /dev/null; then
        echo "$pkg is already installed."
    else
        echo "Installing $pkg..."
        sudo pacman -S --noconfirm "$pkg"
    fi
done

echo "Installation complete!"
