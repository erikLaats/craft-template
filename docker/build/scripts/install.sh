#!/bin/bash
cd /var/www/craftcms

composer require $1
./craft plugin/install $2
./craft plugin/install redactor
./craft plugin/install feed-me
./craft plugin/install architect
./craft plugin/install migrationassistant
./craft architect/import schemas/init.json
./craft migrate/all

chown -R www-data:www-data .
apachectl -DFOREGROUND