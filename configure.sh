# Verify exists folder
if [ ! -d $HOME/.dotfiles ]; then
  echo "Please clone repo, REPO and it was clone in .dotfiles folder on root"
  exit 1
fi

DOTFILES_PATH=$HOME/.dotfiles

ln -s $DOTFILES_PATH/.config/terminator $HOME/.config/terminator
ln -s $DOTFILES_PATH/.zshrc $HOME/.zshrc
ln -s $DOTFILES_PATH/.p10k.zsh $HOME/.p10k.zsh
ln -s $DOTFILES_PATH/.vimrc $HOME/.vimrc
ln -s $DOTFILES_PATH/.config/bat $HOME/.config/bat
ln -s $DOTFILES_PATH/.config/nvim $HOME/.config/nvim
ln -s $DOTFILES_PATH/.config/Code/User/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -s $DOTFILES_PATH/.config/Code/User/settings.json $HOME/.config/Code/User/settings.json
