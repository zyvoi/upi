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
    org.onlyoffice.desktopeditors
    com.dec05eba.gpu_screen_recorder
    com.playonlinux.PlayOnLinux4
    org.videolan.VLC
    org.flameshot.Flameshot
    net.codeindustry.MasterPDFEditor
    org.kde.krita
    org.mozilla.Thunderbird
    org.mozilla.firefox
    org.kde.kdenlive
    io.appflowy.AppFlowy
    # Add more Flatpak app IDs as needed
)

for app_id in "${flatpaks[@]}"; do
    flatpak install --assumeyes $app_id
done

echo "Flatpak installation completed!"
