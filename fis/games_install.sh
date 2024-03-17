#!/bin/bash

# Check if Flatpak is installed
if ! command -v flatpak &> /dev/null; then
    echo "Error: Flatpak is not installed. Please install Flatpak and try again."
    exit 1
fi

# Check if FlatHub is added as a remote
if ! flatpak remote-info --show-default flathub &> /dev/null; then
    echo "Adding Flathub as a remote..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Your actual script to install Flatpaks
flatpaks=(
    com.valvesoftware.Steam
    com.heroicgameslauncher.hgl
    com.discordapp.Discord
    net.lutris.Lutris
    # Add more Flatpak app IDs as needed
)

for app_id in "${flatpaks[@]}"; do
    flatpak install --assumeyes $app_id
done

echo "Flatpak installation completed!"
