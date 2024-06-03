# First Steps

## Configurar Internet
sudo systemctl start NetworkManager.service
sudo systemctl enable NetworkManger.serive
sudo systemctl start wpa_supplicant.service
sudo systemctl enable wpa_supplicant.service
ip link
ip link set <tarjeta> up
nmcli dev wifi connect <RED> password <PASS>

## Instalar primeras utilidades y paru
sudo pacman -S terminator git wget curl nerd-fonts

git clone https://aur.archlinux.org/paru-bin.git -> makepkg -si

sudo pacman -S zsh
chsh -s $(which zsh)

## Instalar lightdm
sudo pacman -S lightdm lightdm-gtk-greeter
sudo vim /etc/lightdm/lightdm.conf -> greeter-session=lightdm-gtk-greeter
sudo systemctl enable lightdm.service

## Instalar Qtile y demas utilidades
sudo pacman -S qtile code firefox rofi which nitrogen feh pulseaudio pavucontrol
pamixer arandr udiskie ntfs-3g network-manager-applet volumeicon cbatticon xorg-xinit
base-devel xorg xorg-server git thunar ranger glib2 gvfs lxappearance picom geeqie
bat dusnt xclip lsd exa sof-firmware brightnessctl pulseaudio-alsa pulseaudio-bluetooth
bluez bluez-utils scrot

## Clonar Rofi
git clone https://github.com/adi1090x/rofi.git
chmod -x setup.sh
./setup.sh

reboot
