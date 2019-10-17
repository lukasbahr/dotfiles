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
# Export path
# ============================================================================

export KITTY_CONFIG_DIRECTORY=~/.config/kitty/kitty.conf
export FZF_DEFAULT_COMMAND='sudo ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ============================================================================
# Conda configuration
# ============================================================================

# added by Anaconda3 2019.03 installer
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
# . "/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

