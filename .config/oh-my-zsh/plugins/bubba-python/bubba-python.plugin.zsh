export MY_VIRTUALENV=$HOME/.config/python/venvs/Bubba
export BIN_VIRTUALENV=/usr/local/bin/virtualenv
LAST_PIP_CACHE_FILE=$HOME/.config/python/last_pip_update

if [[ `uname` == 'Linux' ]]; then
    export MY_OS=`awk -F'=' '/^ID=/ {print $2}' /etc/os-release`
    if [[ $MY_OS == 'amzn' ]]; then
        export BIN_PYTHON3=/usr/local/bin/python3.6
        export BIN_VIRTUALENV=/usr/bin/virtualenv
    elif [[ $MY_OS == 'ubuntu' ]]; then
        export BIN_PYTHON3=/usr/bin/python3
    fi
elif [[ `uname` == 'Darwin' ]]; then
    export BIN_PYTHON3=/usr/local/bin/python3
fi

if [[ ! -d ${MY_VIRTUALENV} ]]; then
	mkdir -p ${MY_VIRTUALENV}
	$BIN_PYTHON3 $BIN_VIRTUALENV -q --python $BIN_PYTHON3 $MY_VIRTUALENV
fi

source $MY_VIRTUALENV/bin/activate


$MY_VIRTUALENV/bin/pip install -q -r $HOME/.config/python/requirements.txt

if [[ -e $LAST_PIP_CACHE_FILE ]]; then
	THIS_MONTH=$(echo `date` | awk '{print $2,$6}')
	LAST_MONTH=$(<$LAST_PIP_CACHE_FILE)
	if [[ $THIS_MONTH != $LAST_MONTH ]]; then
		$MY_VIRTUALENV/bin/pip install -q -r $HOME/.config/python/requirements.txt
		echo $THIS_MONTH > $LAST_PIP_CACHE_FILE
	fi
else
	$MY_VIRTUALENV/bin/pip install -q -r $HOME/.config/python/requirements.txt
	echo $THIS_MONTH > $LAST_PIP_CACHE_FILE
fi
	
