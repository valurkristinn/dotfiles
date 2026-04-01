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

# Postgres sql
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

# Man pager
export MANPAGER='nvim +Man!'

# Prompt
NEWLINE=$'\n'
export PROMPT="%n@%m %~ %{$(tput setaf 6)%}${NEWLINE}$ %{$(tput setaf 255)%}"


eval "$(pyenv init -)"
eval "$(fzf --zsh)"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh



alias git-graph="git log --all --graph --decorate --oneline"
alias flush-dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias ta='tmux attach'
alias dotfiles='sh ~/scripts/dotfiles.sh'
alias schoolDir='cd ~/Documents/Vault/Skóli'
alias ls='eza --icons'
alias of='open .'
alias prevmd='python3 ~/scripts/prevmd.py'
alias mv='mv -i'
alias mvrecent='find ~/Downloads/ -type f -mmin -3 -exec mv {} . \;'
alias copy='xclip -selection clipboard'
alias gerry='git add --all && git commit && git push'
alias proxmox='ssh root@100.86.109.99'

# Sieve
alias sieve-ls="sieve-connect --server mailserver.purelymail.com --user valur@valur.me --list < ~/.sievepass"
alias sieve-pull="sieve-connect --server mailserver.purelymail.com --user valur@valur.me --download --remotesieve roundcube --localsieve filters.sieve < ~/.sievepass"
alias sieve-push="sieve-connect --server mailserver.purelymail.com --user valur@valur.me --upload --localsieve filters.sieve --remotesieve roundcube < ~/.sievepass && sieve-connect --server mailserver.purelymail.com --user valur@valur.me --activate --remotesieve roundcube < ~/.sievepass"

mkcd() {
    mkdir "$1" && cd "$1"
} 

HISTFIEL=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=10000
HISTFILESIZE=10000

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
export LC_ALL=en_US.UTF-8
