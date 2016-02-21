#/bin/bash

if [ ! -d ./composerdata ]; then
	mkdir ./composerdata
fi

docker-compose run --rm -u ubuntu apache-php php composer.phar create-project laravel/laravel src --prefer-dist