

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
        $brew_prefix//include \
        $brew_prefix//lib \
        $brew_prefix//opt \
        $brew_prefix//sbin \
        $brew_prefix//share \
        $brew_prefix//var/homebrew/linked \
        $brew_prefix//Cellar
fi

export PATH=/Users/bubba/homebrew/bin:$PATH
brew install coreutils