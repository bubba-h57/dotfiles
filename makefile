PHP?=/usr/bin/php
PHP_VER?=7.4
PHPBREW?=/Users/bubba/Development/phpbrew/bin/phpbrew
brew:
	brew install \
		autoconf \
		bzip2 \
		composer \
		neovim \
		bison \
		re2c \
		mhash \
		mcrypt \
		curl \
		zlib \
		gpg \
		postgresql \
		mysql \
		libzip \
		docker \
		docker-compose \
		docker-machine \
		xhyve \
		docker-machine-driver-xhyve \
		libiconv \
		icu4c \
		node \
		jq \
		mysql-client \
		vips \
		libffi \
		libedit \
		libxml2

php:
	$(PHP) $(PHPBREW) install \
		--name=$(PHP_VER) $(PHP_VER) \
		+bcmath \
		+bz2="/usr/local/opt/bzip2" \
		+calendar \
		+cli \
		+ctype \
		+curl="/usr/local/opt/curl" \
		+dom \
		+fileinfo \
		+filter \
		+iconv="/usr/local/opt/libiconv" \
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
		+readline="/usr/local/opt/readline" \
		+sockets \
		+tokenizer \
		+xml \
		+openssl="/usr/local/opt/openssl@1.1"  \
		+zip \
		+zlib="/usr/local/opt/zlib" \
		+fpm \
		+sqlite \
		+mysql \
		+pgsql="/usr/local/opt/postgresql" \
		+pdo
	 $(PHP) $(PHPBREW) switch $(PHP_VER)
	 $(PHP) $(PHPBREW) ext install vips -- --with-readline=/usr/local/opt/readline
	 $(PHP) $(PHPBREW) ext install iconv -- --with-iconv=/usr/local/opt/libiconv
	 $(PHP) $(PHPBREW) ext install intl -- --with-icu-dir=/usr/local/opt/icu4c
	 $(PHP) $(PHPBREW) ext install yaml

ctags:
	git clone git@github.com:universal-ctags/ctags.git ~/Development/ctags
	export LIBXML_CFLAGS=-I/usr/local/opt/libxml2/include/libxml2
	cd ~/Development/ctags
	./autogen.sh
	./configure
	make
	make install

ruby:
	gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	curl -sSL https://get.rvm.io | bash -s stable --ruby


