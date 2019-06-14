export PATH=/bin
export PATH=/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
# If we are funning
if [[ -a /usr/local/Cellar/bash/5.0.2/bin/bash ]]; then
    export PATH=/usr/local/Cellar/bash/5.0.2/bin:$PATH
fi

export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=.:$PATH

export LINUX=0
export OSX=0

if [[ `uname` == 'Linux' ]]; then
    export LINUX=1
    export BIN_DIRCOLORS=`which dircolors`
    export MY_OS=`awk -F'=' -v replace="'" '/^ID=/ {gsub(/"/,"",$2); gsub(replace,"",$2);print $2}' /etc/os-release`

    if [[ $MY_OS == 'amzn' ]]; then
        export BIN_LS=/usr/bin/ls
        VERSION_ID=`awk -F'=' -v replace="'" '/^VERSION_ID=/ {gsub(/"/,"",$2); gsub(replace,"",$2);print $2}' /etc/os-release`
        if [[ $VERSION_ID == '2017.03' ]]; then
            export BIN_LS=/bin/ls
        fi
    elif [[ $MY_OS == 'ubuntu' ]]; then
        export BIN_LS=/bin/ls
    fi
elif [[ `uname` == 'Darwin' ]]; then
    export OSX=1
    export BIN_DIRCOLORS=`which gdircolors`
    export BIN_LS=/usr/local/bin/gls
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
