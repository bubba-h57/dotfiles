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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx aws bubba-exports bubba-aliases bubba-python bubba-iterm-integration command-not-found git git-flow-avh colorize phing pyenv python systemd wd zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

clear
