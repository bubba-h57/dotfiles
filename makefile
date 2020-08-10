PHP?=/usr/bin/php
PHP_VER?=7.4
PHPBREW?=/Users/bubba/Development/phpbrew/bin/phpbrew

phpbrew:
	curl -L -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar
	chmod +x phpbrew.phar
	sudo mv phpbrew.phar /usr/local/bin/phpbrew

apt:
	sudo apt update
	sudo apt install -y build-essential software-properties-common
	sudo apt install -y git curl wget zip unzip mysql-server \
		php7.2 php7.2-common php7.2-cli php7.2-gd php7.2-mysql php7.2-curl php7.2-intl php7.2-mbstring php7.2-bcmath php7.2-imap php7.2-xml php7.2-zip
	sudo apt install -y \
		autoconf \
		bzip2 \
		composer \
		neovim \
		bison \
		re2c \
		mcrypt \
		curl \
		zlib1g \
		gpg \
		mysql-client \
		libc6 \
		icu-devtools \
		nodejs \
		jq \
		mysql-client \
		libvips42 \
		libffi-dev \
		libedit-dev \
		libbz2-dev \
		libcurl4 \
		libcurl4-openssl-dev \
		libonig-dev \
		libzip-dev \
		libxml2

php:
	$(PHP) $(PHPBREW) install \
		--name=7.4 7.4 \
		+bcmath \
		+bz2 \
		+calendar \
		+cli \
		+ctype \
		+curl \
		+dom \
		+fileinfo \
		+filter \
		+iconv \
		+ipc \
		+json \
		+mbregex \
		+mbstring \
		+mhash \
		+mcrypt \
		+pcntl \
		+pcre \
		+pdo \
		+pear \
		+phar \
		+posix \
		+readline \
		+sockets \
		+tokenizer \
		+xml \
		+openssl  \
		+zip \
		+zlib \
		+fpm \
		+sqlite \
		+mysql \
		+pdo
	 $(PHP) $(PHPBREW) switch $(PHP_VER)
	 $(PHP) $(PHPBREW) ext install vips
	 $(PHP) $(PHPBREW) ext install iconv
	 $(PHP) $(PHPBREW) ext install intl
	 $(PHP) $(PHPBREW) ext install yaml

ctags:
	git clone git@github.com:universal-ctags/ctags.git /usr/local/src/ctags
	export LIBXML_CFLAGS=-I/usr/local/opt/libxml2/include/libxml2
	cd /usr/local/src/ctags
	./autogen.sh
	./configure
	make
	make install

ruby:
	sudo apt-add-repository -y ppa:rael-gc/rvm
	sudo apt-get update
	sudo apt-get install rvm
	rvm install ruby

pyenv:
	curl https://pyenv.run | bash

python-dev:
	sudo apt-get install --no-install-recommends -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev