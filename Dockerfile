FROM rlaborius/web:latest
MAINTAINER Ronny Laborius <ronny@laborius.org>

RUN apt-get update
RUN apt-get --force-yes -y -q install php5-gmp php-net-ipv4 curl

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

RUN mkdir /etc/apache2/certs
RUN a2enmod ssl

RUN curl -L "http://downloads.sourceforge.net/project/phpipam/phpipam-1.1.tar" > /tmp/phpipam.tar
RUN rm -fr /var/www/html && cd /tmp && tar -xvf phpipam.tar && mv /tmp/phpipam /var/www/html
RUN sed -i "s/@localhost/@\\\\'%\\\\'/" /var/www/html/functions/functions-install.php

VOLUME /etc/apache2/certs/

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

COPY config.php /var/www/html/config.php

EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

