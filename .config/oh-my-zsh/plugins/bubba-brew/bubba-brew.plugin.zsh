

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
    brew install libxml2 bzip2 curl zlib git hub


fi

export PATH=/Users/bubba/homebrew/bin:$PATH

if [ ! -f  $brew_prefix/bin/gdircolors ]; then
    brew install coreutils
fi

if [ ! -f  $brew_prefix/bin/nvim ]; then
brew install nvim
fi


if [ ! -f  $brew_prefix/bin/pyenv ]; then
    brew install pyenv
    pyenv init
    pyenv install 3.7.4
    pyenv shell 3.7.4
    pip install neovim
fi


if [ ! -f  $HOME/bin/phpbrew ]; then
    curl -L -o $HOME/bin/phpbrew https://github.com/phpbrew/phpbrew/raw/master/phpbrew
    chmod +x $HOME/bin/phpbrew
    phpbrew init
    phpbrew install 7.3 +default+fpm+dbs +bz2="$(brew --prefix bzip2)" +curl="$(brew --prefix curl)" +zlib="$(brew --prefix zlib)"
    phpbrew switch php-7.3.7
    EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

    if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
    then
        >&2 echo 'ERROR: Invalid composer installer signature'
        rm composer-setup.php
        exit 1
    fi

    php composer-setup.php --quiet --install-dir="$HOME/bin"
    RESULT=$?
    rm composer-setup.php
    mv $HOME/bin/composer.phar $HOME/bin/composer
    echo $RESULT
fi


