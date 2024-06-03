if [ ! -d $HOME/.dotfiles ]; then
  echo "Please clone repo, REPO and it was clone in .dotfiles folder on root"
  exit 1
fi

DOTFILES_PATH=$HOME/.dotfiles

## symbolic systems
sudo ln -s /lib/firmware/mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin.zst /lib/firmware/mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin.zst

## Install fonst

ln -s ~/.dotfiles/fonts/MesloLGS NF /usr/share/fonts/MesloLGS NF
sudo cp -r ~/.dotfiles/fonts/*.ttf /usr/share/fonts

## Delete if exists

rm -rf $HOME/.zshrc
rm -rf $HOME/.p10k.zsh
rm -rf $HOME/.vimrc
rm -rf $HOME/.config/terminator
rm -rf $HOME/.config/bat
rm -rf $HOME/.config/dunst
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/picom
rm -rf $HOME/.config/qtile

## Symbolic links binaries

chmod -x ~/.dotfiles/bin/changebright ~/.dotfiles/bin/changevolume ~/.dotfiles/bin/takepic ~/.dotfiles/bin/wifimanager ~/.dotfiles/bin/rofix2 ~/.dotfiles/bin/rofix3
ln -s ~/.dotfiles/bin/changebright /usr/bin/changebright
ln -s ~/.dotfiles/bin/changevolume /usr/bin/changevolume
ln -s ~/.dotfiles/bin/takepic /usr/bin/takepic
ln -s ~/.dotfiles/bin/wifimanager /usr/bin/wifimanager
ln -s ~/.dotfiles/bin/rofix2 /usr/bin/rofix2
ln -s ~/.dotfiles/bin/rofix3 /usr/bin/rofix3

## Symbolic links

ln -sf $DOTFILES_PATH/.config/terminator $HOME/.config/terminator
ln -sf $DOTFILES_PATH/.zshrc $HOME/.zshrc
ln -sf $DOTFILES_PATH/.p10k.zsh $HOME/.p10k.zsh
ln -sf $DOTFILES_PATH/.vimrc $HOME/.vimrc
ln -sf $DOTFILES_PATH/.config/alacritty $HOME/.config/alacritty
ln -sf $DOTFILES_PATH/.config/bat $HOME/.config/bat
ln -sf $DOTFILES_PATH/.config/Code/User/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -sf $DOTFILES_PATH/.config/Code/User/settings.json $HOME/.config/Code/User/settings.json
ln -sf $DOTFILES_PATH/.config/dunst $HOME/.config/dunst
ln -sf $DOTFILES_PATH/.config/nvim $HOME/.config/nvim
ln -sf $DOTFILES_PATH/.config/picom.conf $HOME/.config/picom/picom.conf
ln -sf $DOTFILES_PATH/.config/qtile $HOME/.config/qtile

## Symbolic Synapticssudo
sudo ln -S /usr/share/X11/xorg.conf.d/10-quirks.conf /etc/X11/xorg.conf.d/10-quirks.conf
sudo ln -S /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
sudo ln -S /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
