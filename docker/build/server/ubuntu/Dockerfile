FROM ubuntu:bionic

# Surpresses debconf complaints of trying to install apt packages interactively
# https://github.com/moby/moby/issues/4032#issuecomment-192327844

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt upgrade -y
RUN apt install apache2 mysql-server composer ufw less wget php libapache2-mod-php php-mysql php-curl php-xml php-zip php-mbstring php-soap php-imagick php-intl -y
RUN ufw allow in "Apache"
RUN service apache2 restart
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

WORKDIR /var/www
COPY ["craftcms-source", "craftcms"]
RUN chown -R www-data:www-data craftcms

CMD ["apachectl","-D","FOREGROUND"]
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod ssl

EXPOSE 80
EXPOSE 443

