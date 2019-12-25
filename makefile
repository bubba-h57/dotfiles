PHP_VER?=7.2

brew:
	brew install \
		mhash \
		mcrypt \
		curl \
		zlib \
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
	php /Users/Bubba/Development/phpbrew/bin/phpbrew install --name=$(PHP_VER) $(PHP_VER) +bcmath +bz2="/usr/local/opt/bzip2" \
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
		+openssl="/usr/local/Cellar/openssl/1.0.2s"  \
		+zip \
		+zlib="/usr/local/opt/zlib" \
		+fpm \
		+sqlite \
		+mysql \
		+pgsql="/usr/local/opt/postgresql" \
		+pdo
	php /Users/Bubba/Development/phpbrew/bin/phpbrew switch $(PHP_VER)-zts
	php /Users/Bubba/Development/phpbrew/bin/phpbrew  ext install vips -- --with-readline=/usr/local/opt/readline
	php /Users/Bubba/Development/phpbrew/bin/phpbrew ext install iconv -- --with-iconv=/usr/local/opt/libiconv
	php /Users/Bubba/Development/phpbrew/bin/phpbrew ext install intl -- --with-icu-dir=/usr/local/opt/icu4c
	php /Users/Bubba/Development/phpbrew/bin/phpbrew ext install parallel
	php /Users/Bubba/Development/phpbrew/bin/phpbrew ext install yaml

ctags:
	git clone git@github.com:universal-ctags/ctags.git ~/Development/ctags
	export LIBXML_CFLAGS=-I/usr/local/opt/libxml2/include/libxml2
	cd ~/Development/ctags
	./autogen.sh
	./configure
	make
	make install
