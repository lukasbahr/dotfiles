# ============================================================================
# Oh my zsh
# ============================================================================

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(
	git
	# zsh-autosuggestions
	# zsh-syntax-highlighting
	# autojump
	# pip
)

source $ZSH/oh-my-zsh.sh


# ============================================================================
# Theme
# ============================================================================

# Base 16
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Pure
export FPATH=$HOME/.zsh/pure:$FPATH
autoload -U promptinit; promptinit
prompt pure


# ============================================================================
# Alias
# ============================================================================

alias vi="nvim"
alias tmux="tmux -u"

# ============================================================================
# Vim mode
# ============================================================================

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# ============================================================================
# Export path
# ============================================================================

export KITTY_CONFIG_DIRECTORY=~/.config/kitty/kitty.conf
export FZF_DEFAULT_COMMAND='sudo ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ============================================================================
# Conda configuration
# ============================================================================


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

