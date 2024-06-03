# Install Arch Linux

## Change keyboard
loadkeys la-latin1

## verificar y formatear discos
fdisk -l
cfdisk
efi -> mkfs.vfat -F32 <disco>
/ -> mkfs.ext4 <disco>
/home -> mkfs.ext4 <disco>
swap -> mkswap <disco> -> swapon <disco>

## Validar internet (wifi)
ip link
ip link set wlan0 up
iwlist wlan0 scan
wpa_passphrase <nombre> <passwd> > /etc/wifi
wpa_supplicant -B -i wlan0 -D wext -c /etc/wifi
dhclient
ping google.com

## montar
mount <disco> /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/efi
mount <disco boot> /mnt/boot/efi
mount <disco home> /mnt/home

## Instalaciones
pacstrap /mnt base base-devel efibootmgr networkmanager grub gvfs xdg-user-dirs linux linux-firmware vimdhcpcd
dhcpcd netctl wpa_supplicant dialog xf86-input-synaptics

## Activar sistema
genfstab -pU /mnt >> /mnt/etc/fstab
arch-chroot /mnt

## Usuarios
passwd -> password root
useradd -m <user>
passwd <user>
usermod -aG wheel <user>
pacman -S sudo
vim /etc/sudoers -> descomentar "%wheel ALL=(ALL:ALL) ALL"

## Primeras Configuraciones
ln -s /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime -> configurar localtime
vim /etc/hostname -> configurar nombre de equipo
vim /etc/locale.gen -> configurar idiomas
locale-gen
echo LANG=es_AR.UTF-8 > /etc/locale.conf
echo KEYMAP=la-latin1 > /etc/vconsole.conf
echo "127.0.0.1 localhost" > /etc/host

grub-install --efi-directory=/boot/efi --bootloader-id=GRUB --target=x86_64-efi --removable
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -P

exit
umount -R /mnt
reboot
