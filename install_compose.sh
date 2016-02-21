#!/bin/bash

docker-compose run --rm apache-php curl -O https://getcomposer.org/installer

docker-compose run --rm apache-php php installer
