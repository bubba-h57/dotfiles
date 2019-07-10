

if groups $user | grep -q -w admin; 
then 
    brew_prefix=/usr/local/include 
else 
    brew_prefix=$HOME/homebrew
fi


brew_bin=$brew_prefix/bin/brew


if [ ! -f  $brew_bin ]; then
    mkdir $brew_prefix 
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $brew_prefix
    mkdir -p \
        $brew_prefix/etc \
        $brew_prefix/include \
        $brew_prefix/lib \
        $brew_prefix/opt \
        $brew_prefix/sbin \
        $brew_prefix/share \
        $brew_prefix/var/homebrew/linked \
        $brew_prefix/Cellar
fi

export PATH=/Users/bubba/homebrew/bin:$PATH

if [ ! -f  $brew_prefix/bin/gdircolors ]; then
    brew install coreutils
fi

if [ ! -f  $brew_prefix/bin/pyenv ]; then
    brew install pyenv
    pyenv init
fi


if [ ! -f  $HOME/bin/phpbrew ]; then
    curl -L -o $HOME/bin/phpbrew https://github.com/phpbrew/phpbrew/raw/master/phpbrew
    chmod +x $HOME/bin/phpbrew
    phpbrew init
fi


