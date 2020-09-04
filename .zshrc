# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#umask 0027 = 750 for dirs & 640 for files.
#umask 0077 = 700 for dirs & 600 for files
#umask 0007 = 770 for dirs & 660 for files
umask 0027

mkdir -p $HOME/bin
export PATH=$HOME/bin:$HOME/.composer/vendor/bin:$PATH



# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/oh-my-zsh

# Configure Powerlevel
ZSH_THEME="powerlevel10k/powerlevel10k"


# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"
ZSH_DISABLE_COMPFIX="true"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws bubba-exports bubba-aliases bubba-python command-not-found git phing python systemd wd zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

export DISPLAY=:0
alias ssh="ssh -Y"

source $HOME/.phpbrew/bashrc
clear

export BROWSER='~/bin/chrome'
export PATH=".:./vendor/bin:$PYENV_ROOT/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
source /usr/share/rvm/scripts/rvm
export PATH="$PATH:$HOME/.rvm/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
