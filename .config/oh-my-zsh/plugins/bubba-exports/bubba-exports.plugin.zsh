# If we are funning
if [[ -a /usr/local/Cellar/bash/5.0.2/bin/bash ]]; then
    export PATH=/usr/local/Cellar/bash/5.0.2/bin:$PATH
fi

export OSX=1
export BIN_DIRCOLORS=`which dircolors`
export BIN_LS="ls --color=tty"


export HOSTNAME="`hostname -s`"
export PAGER="less"
export EDITOR="nvim"

#GIT Settings
export GIT_AUTHOR_NAME=Bubba
export GIT_AUTHOR_EMAIL=rob@stechstudio.com
export GIT_COMMITTER_NAME=Bubba
export GIT_COMMITTER_EMAIL=rob@stechstudio.com

export STS_USER=bubba

# Export Colors for LS
if [[ -a $ZSH_CUSTOM/dircolors-solarized/dircolors.256dark ]]; then
    eval `$BIN_DIRCOLORS $ZSH_CUSTOM/dircolors-solarized/dircolors.256dark`
fi
