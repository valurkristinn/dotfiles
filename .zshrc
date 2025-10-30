# export PATH="/Users/valur/.opam/default/bin:/Users/valur/.pyenv/shims:/Users/valur/.pyenv/bin:/Users/valur/.nvm/versions/node/v22.12.0/bin:/Users/valur/Library/Python/3.9/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/Library/TeX/texbin:/Applications/VMware Fusion.app/Contents/Public:/Users/valur/.opam/default/bin:/Users/valur/.pyenv/bin:/Users/valur/.nvm/versions/node/v22.12.0/bin:/Users/valur/Library/Python/3.9/bin:/Users/valur/.local/bin:/Users/valur/.local/bin:/Users/valur/.local/bin"
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export PATH="/Users/valur/Library/Python/3.9/bin:$PATH"
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export CLASSPATH=$CLASSPATH:.:~/algs4/algs4.jar
# export CLASSPATH=$CLASSPATH:.:~/jdbc/sqlite-jdbc-3.43.0.0.jar
# export PATH="$PATH:/Users/valur/.local/bin"
# export PATH="$HOME/.pyenv/bin:$PATH"
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#
#
# NEWLINE=$'\n'
# export PROMPT="%n %~ %{$(tput setaf 6)%}${NEWLINE}%# %{$(tput setaf 255)%}"
#
# export PATH="/Users/valur/.ghcup/ghc/9.6.7/bin:$PATH"

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
export PROMPT="%n %~ %{$(tput setaf 6)%}${NEWLINE}%# %{$(tput setaf 255)%}"


eval "$(pyenv init -)"
eval "$(fzf --zsh)"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh



alias nvim="/Users/valur/nvim-macos-arm64/bin/nvim"
alias git graph="git log --all --graph --decorate --oneline"
alias flush-dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias ta='tmux attach'
alias dotfiles='sh ~/scripts/dotfiles.sh'
alias schoolDir='cd ~/Library/CloudStorage/OneDrive-Menntaský'
alias morpho='java -jar ../morpho.jar '
alias ls='eza --icons'

HISTFIEL=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

mkcd() {
    mkdir "$1" && cd "$1"
} 




# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/valur/.opam/opam-init/init.zsh' ]] || source '/Users/valur/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
