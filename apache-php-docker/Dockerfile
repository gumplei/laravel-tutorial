FROM ubuntu:16.04
MAINTAINER Gump Lei <gump.lei@alphasolution.com.mo>

VOLUME ["/var/www/html", "/etc/apache2/sites-available"]

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y git curl apache2 supervisor \
		php php-cli libapache2-mod-php php-apcu wkhtmltopdf xvfb
RUN apt-get install -y php-mcrypt \
		php-curl php-gd php-intl php-mysql php-xml php-mbstring php-zip php-soap
RUN apt-get clean && \
	rm -rf /var/lib/apt/lists/* \
		/tmp/* \
		/var/tmp/*

# Install xvfb for wkhtmltopdf
RUN echo '#!/bin/bash\nxvfb-run -a --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf -q $*' > /usr/bin/wkhtmltopdf.sh && \
		chmod a+x /usr/bin/wkhtmltopdf.sh && \
		ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf

RUN a2enmod rewrite && phpenmod mcrypt mbstring zip 
RUN useradd -m ubuntu

RUN sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php/7.0/apache2/php.ini && \
	sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php/7.0/cli/php.ini && \
	sed -ri 's/^;date.timezone =/date.timezone = Asia\/Macau/g' /etc/php/7.0/apache2/php.ini && \
	sed -ri 's/^;date.timezone =/date.timezone = Asia\/Macau/g' /etc/php/7.0/cli/php.ini

RUN sed -ri 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=ubuntu/g' /etc/apache2/envvars

RUN sed -ri 's/memory_limit = 128M/memory_limit = 384M/g' /etc/php/7.0/apache2/php.ini

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

WORKDIR /var/www/html
