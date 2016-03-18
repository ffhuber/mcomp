FROM php:5.6-apache

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev git && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd mysqli

RUN \
  mkdir -p /var/www/html && \
  curl -sL https://download.moodle.org/download.php/direct/stable30/moodle-3.0.3.tgz | \ 
  tar -zxf - -C /var/www/html

ADD repo-key /
RUN \
  mkdir -p /var/www/html/conf && \
  chmod 600 /repo-key && \  
  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \  
  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \ 
  git clone git@bitbucket.org:AndyMoore111/mdlconf.git /var/www/html/conf && \
  mv /var/www/html/conf/config.php /var/www/html/moodle && \
  rm -rf /var/www/html/conf && \
  chown -R www-data:www-data /var/www/html/moodle

RUN mkdir /var/moodledata
RUN chown -R www-data:www-data /var/moodledata; chmod 777 /var/moodledata

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
