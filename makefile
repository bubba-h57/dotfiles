PHP_VER?=7.3.8

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
		libedit

php:
	phpbrew install --name=$(PHP_VER)-zts $(PHP_VER) +bcmath +bz2="/usr/local/opt/bzip2" \
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
		+openssl="/usr/local/opt/openssl"  \
		+zip \
		+zlib="/usr/local/opt/zlib" \
		+fpm \
		+sqlite \
		+mysql \
		+pgsql="/usr/local/opt/postgresql" \
		+pdo \
		-- --enable-maintainer-zts
	phpbrew switch $(PHP_VER)-zts
	phpbrew ext install vips -- --with-readline=/usr/local/opt/readline
	phpbrew ext install iconv -- --with-iconv=/usr/local/opt/libiconv
	phpbrew ext install intl -- --with-icu-dir=/usr/local/opt/icu4c
	phpbrew ext install parallel
