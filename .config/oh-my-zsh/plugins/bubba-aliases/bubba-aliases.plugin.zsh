# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# ls, the common ones I use a lot shortened for rapid fire usage
alias ls="$BIN_LS --color" # use gnu ls, and color
alias l='ls -lFh'     #size,show type,human readable
alias lb='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list

alias zshrc='$EDITOR ~/.zshrc' # Quick access to the ~/.zshrc file
alias resetZsh='source ~/.zshrc'

alias clr='clear'
alias cls='clear'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias hgrep='alias hgrep="fc -El 0 | grep'

alias t='tail -f'

alias vi='nvim'
alias :w='echo "Dude.. $SHELL != vi"'
alias :q='echo "Dude.. $SHELL != vi"'
alias :wq='echo "Dude.. $SHELL != vi"'
alias ssht='/usr/bin/ssh -f -N'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#Composer Aliases
alias c='composer'
alias csu='composer self-update'
alias cu='composer update'
alias ci='composer install'
alias ccp='composer create-project'
alias cdu='composer dump-autoload'

alias ap='ansible-playbook --private-key ansible.pem --vault-password-file .ansible-vault'

alias cat='colorize_via_pygmentize'

alias bubba="Hello Studly"

alias projects="cd $HOME/Development"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
alias qami="{ whoami; echo '@'; echo $HOSTNAME; echo ' in '; pwd;}| sed ':a;N;s/\n//;ba'"
