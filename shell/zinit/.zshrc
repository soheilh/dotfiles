# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# --- Source/Load zinit ---
source "${ZINIT_HOME}/zinit.zsh"

# --- Load starship theme ---
zinit ice as"command" from"gh-r" atclone"./starship init zsh > init.zsh" src"init.zsh"
zinit light starship/starship

# -- PATH --
export PATH="$HOME/.cargo/bin:$PATH"

# --- Add Plugins ---
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light junegunn/fzf
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light so-fancy/diff-so-fancy
zinit light hlissner/zsh-autopair

eval "$(fzf --zsh)"

# --- Load completions ---
autoload -Uz compinit
compinit -C

# --- Completion styling ---
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# --- Keybindings ---
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^K' history-beginning-search-backward-end
bindkey '^J' history-beginning-search-forward-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
## ctrl+arrows
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
## ctrl+delete
bindkey "\e[3;5~" kill-word
## ctrl+backspace
bindkey '^H' backward-kill-word
## ctrl+shift+delete
bindkey "\e[3;6~" kill-line

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

# --- Aliases ---
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias la='eza -a --icons'
alias lt='eza --tree --level=2 --icons'
alias ip='ip -c'
alias diff='diff --color'
alias grep='rg --color=auto'
alias rm='rm -i'

# --- Tor Aliases ---
alias tor-on='sudo systemctl start tor.service'
alias tor-off='sudo systemctl stop tor.service'
alias tor-rs='sudo systemctl restart tor.service'
alias tor-status='journalctl -exfu tor'

# --- Git aliases ---
alias gs='git status'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

# --- Completion ---
# Completion scripts setup. Remove the following line to uninstall
if [[ -f "$HOME/.dart-cli-completion/zsh-config.zsh" ]]; then
    source "$HOME/.dart-cli-completion/zsh-config.zsh"
fi
