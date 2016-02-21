FROM ubuntu:14.04
MAINTAINER Gump Lei <gump.lei@alphasolution.com.mo>

VOLUME ["/var/www/html", "/etc/apache2/sites-available"]

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y apache2 supervisor php5 php5-cli libapache2-mod-php5 \
		php5-mcrypt php5-curl php5-gd php5-intl

RUN a2enmod rewrite && php5enmod mcrypt
RUN useradd ubuntu

RUN sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php5/apache2/php.ini && \
	sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php5/cli/php.ini && \
	sed -ri 's/^;date.timezone =/date.timezone = Asia\/Macau/g' /etc/php5/apache2/php.ini && \
	sed -ri 's/^;date.timezone =/date.timezone = Asia\/Macau/g' /etc/php5/cli/php.ini

RUN sed -ri 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=ubuntu/g' /etc/apache2/envvars

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

WORKDIR /var/www/html