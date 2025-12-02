# System paths first
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/System/Cryptexes/App/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"

# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# User tools
export PATH="/Users/valur/.local/bin:$PATH"
export PATH="/Users/valur/Library/Python/3.9/bin:$PATH"
export PATH="/Library/Apple/usr/bin:/Library/TeX/texbin:$PATH"
export PATH="/Applications/VMware Fusion.app/Contents/Public:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# OCaml/OPAM
export PATH="/Users/valur/.opam/default/bin:$PATH"

# GHCup
export PATH="/Users/valur/.ghcup/ghc/9.6.7/bin:$PATH"

# Java classpath
export CLASSPATH=".:$HOME/algs4/algs4.jar:$HOME/jdbc/sqlite-jdbc-3.43.0.0.jar"

# Prompt
NEWLINE=$'\n'
export PROMPT="%~ %{$(tput setaf 6)%}${NEWLINE}$ %{$(tput setaf 255)%}"


eval "$(pyenv init -)"
eval "$(fzf --zsh)"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh



alias git-graph="git log --all --graph --decorate --oneline"
alias flush-dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias ta='tmux attach'
alias dotfiles='sh ~/scripts/dotfiles.sh'
alias schoolDir='cd ~/Library/CloudStorage/OneDrive-Menntaský'
alias ls='eza --icons'
alias of='open .'

mkcd() {
    mkdir "$1" && cd "$1"
} 

HISTFIEL=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
