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
    org.gnu.pspp
    io.gitlab.gregorni.Calligraphy
    org.libreoffice.LibreOffice
    org.mozilla.firefox
    com.spotify.Client
    com.usebottles.bottles #For Fusion360
    com.getpostman.Postman
    com.anydesk.Anydesk
    org.kde.krita
    org.gnome.Boxes
    org.flameshot.Flameshot
    com.jgraph.drawio.desktop
    com.sublimetext.three
    cc.arduino.arduinoide
    com.ultimaker.cura
    io.github.wereturtle.ghostwriter
    org.raspberrypi.rpi-imager
    uk.org.greenend.chiark.sgtatham.putty
    org.fritzing.Fritzing
    org.jupyter.JupyterLab
    com.st.STM32CubeIDE
    org.openhantek.OpenHantek6022
    com.dreamsourcelab.DSView
    io.github.Figma_Linux.figma_linux
    org.freecadweb.FreeCAD
    org.kicad.KiCad
    org.onlyoffice.desktopeditors
    com.visualstudio.code
    io.github.shiftey.Desktop
    org.remmina.Remmina
    org.eclipse.Javascript
    # Add more Flatpak app IDs as needed
)

for app_id in "${flatpaks[@]}"; do
    flatpak install --assumeyes $app_id
done

echo "Flatpak installation completed!"
