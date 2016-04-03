#!/bin/bash

sudo apt-get update
sudo apt-get install apache2 -y
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql -y
sudo mysql_install_db
sudo /usr/bin/mysql_secure_installation
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt -y
sed -ie "s/index.html index.cgi index.pl index.php/index.php index.html index.cgi index.pl/" /etc/apache2/mods-enabled/dir.conf
printf '%s\n%s\n%s\n' '<?php' 'phpinfo();' '?>' >> /var/www/html/test.php
sudo service apache2 restart
var=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
echo "U can now type in browiser this IP $var , to see your page."
