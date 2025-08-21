export PATH="/Users/valur/Library/Python/3.9/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export CLASSPATH=$CLASSPATH:.:~/algs4/algs4.jar
export PATH="$PATH:/Users/valur/.local/bin"
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

NEWLINE=$'\n'
export PROMPT="%n %~ %{$(tput setaf 6)%} ${NEWLINE}%# %{$(tput setaf 255)%}"



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



HISTFIEL=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify




