FROM php:5.6-apache

ENV Version 3

RUN apt-get update && apt-get install -y telnet mysql-client libpng12-dev libjpeg-dev git && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd mysqli zip

RUN \
  mkdir -p /var/www/html && \
  curl -sL https://download.moodle.org/download.php/direct/stable30/moodle-3.0.3.tgz | \ 
  tar -zxf - -C /var/www/html

COPY moodle-pulse/gab /var/www/html/moodle/auth/gab
COPY moodle-pulse/pulsews /var/www/html/moodle/local/pulsews
COPY moodle-pulse/scormupload /var/www/html/moodle/local/pulse
COPY config.php /var/www/html/moodle
COPY apache2.conf /etc/apache2/apache2.conf
COPY test.php /var/www/html/moodle
COPY pulse.conf /etc/apache2/sites-available/

RUN a2enmod rewrite
RUN a2ensite pulse

RUN mkdir /var/moodledata
RUN mkdir /var/moodledata/school0
RUN mkdir /var/moodledata/school1
RUN mkdir /var/moodledata/school2
RUN chown -R www-data:www-data /var/www/html/moodle /var/moodledata; chmod -R 777 /var/moodledata

VOLUME /var/moodledata

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
