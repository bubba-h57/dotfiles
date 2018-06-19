export PATH=/bin
export PATH=/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Users/bubba/.composer/vendor/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=.:$PATH



if [[ `/usr/bin/uname` == 'Linux' ]]; then
    export LINUX=1
    export BIN_DIRCOLORS=`which dircolors`
    export BIN_LS=/usr/bin/ls
    export MY_VIRTUAL_ENV=/var/lib/ReproConnect/python3/bin/activate
else
    export LINUX=0
fi

if [[ `/usr/bin/uname` == 'Darwin' ]]; then
    export OSX=1
    export BIN_DIRCOLORS=`which gdircolors`
    export BIN_LS=/usr/local/bin/gls
    export MY_VIRTUAL_ENV=$HOME/.virtualenvs/Bubba/bin/activate
else
    export OSX=0
fi



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
