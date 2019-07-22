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

mkdir -p $HOME/bin
export PATH=$HOME/bin:$HOME/.composer/vendor/bin:$PATH

LAST_CONFIG_CACHE_FILE=$HOME/.last_git_update
THIS_MONTH=$(echo `date` | awk '{print $2,$6}')

if [[ -e $LAST_CONFIG_CACHE_FILE ]]; then
    LAST_MONTH=$(<$LAST_CONFIG_CACHE_FILE)
    if [[ $THIS_MONTH != $LAST_MONTH ]]; then

        # Pull any updates to my dotfile.
        /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull --quiet

        # Then update any submodules.
        /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule update --quiet --recursive

        # Finally, install all my nvim plugins, or update them.
        nvim --headless -es +PlugUpgrade +PlugInstall +PlugUpdate +qall!
        echo $THIS_MONTH > $LAST_CONFIG_CACHE_FILE
    fi
else
        # Pull any updates to my dotfile.
        /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull --quiet

        # Then update any submodules.
        /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule update --quiet --recursive

        # Finally, install all my nvim plugins, or update them.
        nvim --headless -es +PlugUpgrade +PlugInstall +PlugUpdate +qall!
        echo $THIS_MONTH > $LAST_CONFIG_CACHE_FILE
fi


# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/oh-my-zsh

# Configure Powerlevel9k
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_OS_ICON_FOREGROUND='166'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"
ZSH_DISABLE_COMPFIX="true"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx aws bubba-nerdfont bubba-brew bubba-exports bubba-aliases bubba-iterm-integration bubba-python command-not-found git git-flow-avh phing python systemd wd zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/bubba/.phpbrew/bashrc

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

export DISPLAY=:0
alias ssh="ssh -Y"
clear
