# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

## Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

## Load and initialise completion system
autoload -Uz compinit
compinit


# Aliases
alias grep='grep --color=auto'
alias ls="exa -l --icons"
alias cat="bat"
alias vim="nvim"


# Paths
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin


# QTF fix
export QT_QPA_PLATFORMTHEME="qt5ct"


# Wayland fix
export QT_QPA_PLATFORM=wayland
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway


# Tools setup
## starship
eval "$(starship init zsh)"

## fnm
export PATH="/home/binamra/.local/share/fnm:$PATH"
eval "`fnm env`"

## zoxide
eval "$(zoxide init zsh)"

## bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

## GitHub Copilot CLI
eval "$(github-copilot-cli alias -- "$0")"

# bun completions
[ -s "/home/binamra/.bun/_bun" ] && source "/home/binamra/.bun/_bun"

# pnpm
export PNPM_HOME="/home/binamra/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Multiple Nvims
alias chad="NVIM_APPNAME=nvchad nvim"

function nvims() {
  items=("default" "lvim" "nvchad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
