PHP_VER?=7.3.8

php:
	phpbrew install $(PHP_VER) +bcmath +bz2="/usr/local/opt/bzip2" \
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
		+pdo
