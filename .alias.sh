# os alias
alias update_console="source ~/.zshrc"
alias os_version="neofetch"
alias grep='grep --color=auto'
alias os_version="neofetch"

# apps alias
alias nv="nvim ."
alias move_branch="git fetch && git checkout " 

# infra tools alias
alias circle_local="circleci local execute --job "
alias circle_valid="circleci config validate"
#alias ngrok_up="cd && cd infra && ./ngrok http " TODO verify this
alias docker_perm="sudo chown $USER /var/run/docker.sock"
alias kubectl="sudo kubectl"
alias minikube="sudo minikube"

# path alias
PATH=$PATH:/usr/local/go/bin

# Conditional Alias
if [ $(which bat) ]; then
  alias cat='bat --style=plain --paging=never'
fi

if [ $(which exa) ]; then
  alias ls='exa --group-directories-first'
  alias tree='exa -T'
fi