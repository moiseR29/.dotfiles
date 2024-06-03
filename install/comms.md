# COMMS

## FONTS

> Descargar repo dotfiles

ln -s ~/.dotfiles/fonts/MesloLGS NF /usr/share/fonts/MesloLGS NF
sudo cp -r ~/.dotfiles/fonts/*.ttf /usr/share/fonts

## symbolic systems
sudo ln -s /lib/firmware/mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin.zst /lib/firmware/mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin.zst

## Habilitar Bluetooth
sydo systemctl start bluetooth.service
sydo systemctl enable bluetooth.service

## Habilitar pulseaudio

systemctl --user enable pulseaudio
systemctl --user start pulseaudio

paru -S brave

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

pacman -S discord

paru -S beekeeper-studio

paru -S slack-desktop

paru -S nerd-fonts

# Install Docker
sudo pacman -S docker

sudo systemctl start docker.service
sudo systemctl enbale docker.service

sudo usermod -aG docker $USER
newgrp docker

sudo pacman -S docker-compose
