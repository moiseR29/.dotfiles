if [ ! -d $HOME/.dotfiles ]; then
  echo "Please clone repo, REPO and it was clone in .dotfiles folder on root"
  exit 1
fi

DOTFILES_PATH=$HOME/.dotfiles

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
