FROM ubuntu:14.04

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade
 
# Basic Requirements
# RUN apt-get -y install mysql-server mysql-client pwgen python-setuptools curl git unzip mc
RUN apt-get -y install telnet mysql-client pwgen python-setuptools curl git unzip mc

# Moodle Requirements
RUN apt-get -y install apache2 php5 php5-redis php5-gd libapache2-mod-php5 postfix wget supervisor php5-pgsql vim curl libcurl3 libcurl3-dev php5-curl php5-xmlrpc php5-intl php5-mysql

# SSH
RUN apt-get -y install openssh-server
RUN mkdir -p /var/run/sshd

# mysql config
# RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

RUN easy_install supervisor
ADD ./start.sh /start.sh
ADD ./foreground.sh /etc/apache2/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf

ADD https://download.moodle.org/moodle/moodle-latest.tgz /var/www/moodle-latest.tgz
RUN cd /var/www; tar zxvf moodle-latest.tgz; mv /var/www/moodle /var/www/html
RUN chown -R www-data:www-data /var/www/html/moodle

RUN mkdir /var/moodledata
RUN chown -R www-data:www-data /var/moodledata; chmod 777 /var/moodledata

# Tenancy 3 (optional)
# RUN mkdir /var/moodledata0
# RUN chown -R www-data:www-data /var/moodledata0; chmod 777 /var/moodledata0
# RUN mkdir /var/moodledata1
# RUN chown -R www-data:www-data /var/moodledata1; chmod 777 /var/moodledata1
# RUN mkdir /var/moodledata2
# RUN chown -R www-data:www-data /var/moodledata2; chmod 777 /var/moodledata2

RUN chmod 755 /start.sh /etc/apache2/foreground.sh

EXPOSE 22 80
CMD ["/bin/bash", "/start.sh"]
