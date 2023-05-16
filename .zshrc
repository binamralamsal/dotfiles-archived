# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/binamra/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
 
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# starship
eval "$(starship init zsh)"

# fnm
export PATH="/home/binamra/.local/share/fnm:$PATH"
eval "`fnm env`"

# Aliases
alias ls="exa -l --icons"
alias cat="bat"

# zoxide
eval "$(zoxide init zsh)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# NNN CONFIG START ----
export NNN_PLUG='f:fzopen;d:fzcd;g:gitroot;j:autojump;i:imgur;v:imgview;p:preview-tui;'
export NNN_FIFO=/tmp/nnn.fifo nnn

# export PAGER="less -R"

n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@" -Pp

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}
# NN CONFIG END -----

export PATH=$PATH:~/.local/bin

# QTF fix
export QT_QPA_PLATFORMTHEME="qt5ct"

# Wayland fix
export QT_QPA_PLATFORM=wayland
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway

export PATH=$PATH:~/.cargo/bin

eval "$(github-copilot-cli alias -- "$0")"
