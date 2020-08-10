# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# ls, the common ones I use a lot shortened for rapid fire usage
alias ls="$BIN_LS" # use gnu ls, and color
alias l='ls -lFh'     #size,show type,human readable
alias lb='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list

alias zshrc="$EDITOR $HOME/.zshrc" # Quick access to the ~/.zshrc file
alias resetZsh="source $HOME/.zshrc"

alias clr='clear'
alias cls='clear'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias hgrep='fc -El 0 | grep'

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

eval `$BIN_DIRCOLORS $ZSH_CUSTOM/dircolors-solarized/dircolors.256dark`

colorize_via_pygmentize () {
	if ! (( $+commands[pygmentize] ))
	then
        pip install Pygments pygments-solarized
	fi
	if [ $# -eq 0 ]
	then
		pygmentize -O style=solarized-dark -g
		return $?
	fi
	local FNAME lexer
	for FNAME in "$@"
	do
		lexer=$(pygmentize -N "$FNAME")
		if [[ $lexer != text ]]
		then
			pygmentize -O style=solarized-dark -l "$lexer" "$FNAME"
		else
			pygmentize -O style=solarized-dark -g "$FNAME"
		fi
	done
}

alias cat='colorize_via_pygmentize'

alias bubba="Hello Studly"

alias projects="cd $HOME/Development"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
alias qami="{ whoami; echo '@'; echo $HOSTNAME; echo ' in '; pwd;}| sed ':a;N;s/\n//;ba'"
