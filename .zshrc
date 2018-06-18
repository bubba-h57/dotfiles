# turn off Ctrl + s XOFF (XON is Ctrl + q)
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

# Path to your oh-my-zsh configuration.
export ZSH=/home/bubba/.oh-my-zsh
export ZSH_CUSTOM=/home/bubba/.config/oh-my-zsh

# Configure Powerlevel9k
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon load virtualenv dir vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws bubba-exports bubba-aliases aws-exports command-not-found git git-flow-avh colorize phing )

source $ZSH/oh-my-zsh.sh

prompt_context() {
  local current_state="DEFAULT"
  typeset -AH context_states
  context_states=(
    "ROOT"      "yellow"
    "DEFAULT"   "011"
    "WARN"      "227"
    "ALERT"     "160"
  )

  local content=""

  if [[ $HOSTNAME == prd-citadel* ]] || [[ $HOSTNAME == qa-* ]]; then
    current_state="WARN"
  elif [[ $HOSTNAME == prd-* ]]; then
    current_state="ALERT"
  fi

  if [[ "$POWERLEVEL9K_ALWAYS_SHOW_CONTEXT" == true ]] || [[ "$USER" != "$DEFAULT_USER" ]] || [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then

      if [[ $(print -P "%#") == '#' ]]; then
        current_state="ROOT"
      fi

      content="${POWERLEVEL9K_CONTEXT_TEMPLATE}"

  elif [[ "$POWERLEVEL9K_ALWAYS_SHOW_USER" == true ]]; then
      content="$USER"
  else
      return
  fi

  "$1_prompt_segment" "${0}_${current_state}" "$2" "$DEFAULT_COLOR" "${context_states[$current_state]}" "${content}"
}

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
