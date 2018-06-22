# turn off Ctrl + s XOFF (XON is Ctrl + q)
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef
setopt noflowcontrol

#umask 0027 = 750 for dirs & 640 for files.
#umask 0077 = 700 for dirs & 600 for files 
#umask 0007 = 770 for dirs & 660 for files     
umask 0027

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/oh-my-zsh

# Configure Powerlevel9k
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon virtualenv php_version vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx aws bubba-exports bubba-aliases bubba-python command-not-found git git-flow-avh colorize phing pyenv python systemd wd zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
