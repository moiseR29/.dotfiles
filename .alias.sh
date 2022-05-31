# os alias
alias update_console="source ~/.zshrc"
alias os_version="neofetch"
alias grep='grep --color=auto'

# apps alias
alias nv="nvim ."
alias move_branch="git fetch && git checkout " 

# infra tools alias
alias circle_local="circleci local execute --job "
alias circle_valid="circleci config validate"
alias ngrok_up="cd ~/infra-tools && ./ngrok http "
alias docker_perm="sudo chown $USER /var/run/docker.sock"
alias kubectl="sudo kubectl"
alias minikube="sudo minikube"

# Conditional Alias
if [ $(which bat) ]; then
  alias cat='bat --style=plain --paging=never'
fi

if [ $(which exa) ]; then
  alias ls='exa --group-directories-first'
  alias tree='exa -T'
fi

export GOBIN=/usr/local/go/bin
export GOPATH=$HOME/code/me/go
export PATH=$PATH:$GOBIN:$GOPATH/bin

alias py="pip3 "
alias pyx="python3.8 "

# Alias according to Source

# OPPIZI ENVS
source $HOME/.dotfiles/.oppizi.sh

# silvib@reklut.com
