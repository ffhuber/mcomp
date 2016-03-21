FROM php:5.6-apache

ENV Version 3

RUN apt-get update && apt-get install -y telnet mysql-client libpng12-dev libjpeg-dev git && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd mysqli

RUN pecl bundle -d /usr/src/php/ext redis \
&& rm /usr/src/php/ext/redis-*.tgz \
&& docker-php-ext-install redis

RUN \
  mkdir -p /var/www/html && \
  curl -sL https://download.moodle.org/download.php/direct/stable30/moodle-3.0.3.tgz | \ 
  tar -zxf - -C /var/www/html

#ADD repo-key /
#RUN \
#  mkdir -p /var/www/html/conf && \
#  chmod 600 /repo-key && \  
#  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \  
#  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \ 
#  git clone git@bitbucket.org:AndyMoore111/mdlconf.git /var/www/html/conf && \

ENV TMP 3
COPY config.php /var/www/html/moodle
COPY apache2.conf /etc/apache2/apache2.conf
COPY test.php /var/www/html/moodle

RUN a2enmod rewrite

RUN mkdir /var/moodledata
RUN mkdir /var/moodledata/school1
RUN mkdir /var/moodledata/school2
RUN chown -R www-data:www-data /var/www/html/moodle /var/moodledata; chmod 777 /var/moodledata

VOLUME /dataroot

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
