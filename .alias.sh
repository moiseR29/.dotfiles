# os alias
alias update_console="source ~/.zshrc"
alias osv="neofetch"
alias grep='grep --color=auto'

# apps alias
alias n="nvim "
alias nv="nvim ."
alias move_branch="git fetch && git checkout " 

# Conditional Alias
if [ $(which bat) ]; then
  alias bt='bat --theme="Dracula" --style="numbers,changes,header"'
  bhelp() {
      "$@" --help 2>&1 | bat --plain --language=help
  }

  if [ $(which xclip) ]; then
    bcopy() {
      bat "$@" | xclip -sel clip
    }
  fi

  bdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --theme="Dracula" --diff
  }

fi

if [ $(which lsd) ]; then
  alias ll='lsd -lh --group-dirs=first'
  alias la='lsd -a --group-dirs=first'
  alias l='lsd --group-dirs=first'
  alias lla='lsd -lha -group-dirs=first'
  alias ls='lsd --group-dirs=first'
fi

if [ $(which exa) ]; then
  alias tree='exa -T'
fi

