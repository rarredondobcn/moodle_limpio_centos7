#!/usr/bin/env bash

######################################################################
## MOODLE LIMPIO CENTOS 7
## RICARDO ARREDONDO RÍOS
######################################################################

sudo yum -y update
sudo yum install -y policycoreutils-python wget curl nano unzip
sudo yum install -y epel-release
sudo yum install -y yum-utils
sudo yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php73
sudo timedatectl set-timezone America/Santiago

sudo yum -y update
sudo yum -y upgrade
sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd

sudo yum -y install mariadb-server
sudo systemctl enable mariadb
sudo systemctl start mariadb

sudo yum -y install php7.3
sudo yum install -y php-pear
sudo yum install -y php7.3-curl
sudo yum install -y php7.3-dev
sudo yum install -y php7.3-gd
sudo yum install -y php7.3-mbstring
sudo yum install -y php7.3-zip
sudo yum install -y php7.3-mysql
sudo yum install -y php7.3-xml
sudo yum install -y php7.3-cli
sudo yum install -y php7.3-imagick
sudo yum install -y php7.3-gmp
sudo yum install -y php7.3-mcrypt
sudo yum install -y php7.3-odbc
sudo yum install -y php7.3-pgsql
sudo yum install -y php7.3-xsl
sudo yum install -y php7.3-bcmath
sudo yum install -y php-zip
sudo yum install -y unzip
sudo yum install -y openssl
sudo yum install -y php7.3-gd
sudo yum install -y php7.3-intl
sudo yum install -y php7.3-xmlrpc
sudo yum install -y php7.3-soap


sudo sed -i '$a skip-external-locking' /etc/my.cnf
sudo sed -i '$a bind_address = 0.0.0.0' /etc/my.cnf
systemctl restart mariadb


ROOT_DB_PASSWORD=""
CREATE="CREATE USER 'moodle'@'localhost' IDENTIFIED BY 'moodle'; "
GRANT="GRANT ALL PRIVILEGES ON *.* TO 'moodle'@'localhost' IDENTIFIED BY 'moodle'; "
FLUSH="FLUSH PRIVILEGES;"
CREATEDB="CREATE DATABASE moodle character set utf8mb4 collate utf8mb4_unicode_ci;"

sudo mysql -u root  -e "${CREATE}"
sudo mysql -u root  -e "${GRANT}"
sudo mysql -u root  -e "${FLUSH}"
sudo mysql -u root  -e "${CREATEDB}"

sudo yum -y install git


sudo sed -i -e 's/;max_input_vars = 1000/max_input_vars = 5000/' /etc/php.ini
sudo sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 50M/' /etc/php.ini
sudo sed -i -e 's/post_max_size = 8M/post_max_size = 30M/' /etc/php.ini


cd /var/www/html/
sudo git clone -b MOODLE_311_STABLE https://github.com/moodle/moodle.git
sudo mkdir /var/www/html/moodledata

sudo chown -R apache:apache /var/www/html/moodle/ /var/www/html/moodledata/
sudo chown -R apache: /var/www/html/moodle/ /var/www/html/moodledata/
sudo chmod -R 777 /var/www/html/moodle/ /var/www/html/moodledata/

sudo mkdir /etc/httpd/sites-available
sudo mkdir /etc/httpd/sites-enabled

sudo sed -i -e 's/IncludeOptional conf.d/#IncludeOptional conf.d/' /etc/httpd/conf/httpd.conf
sudo sed -i '$a IncludeOptional /etc/httpd/sites-enabled/*.conf' /etc/httpd/conf/httpd.conf

sudo cp /vagrant/moodle.test.conf /etc/httpd/sites-available/moodle.test.conf
sudo ln -s /etc/httpd/sites-available/moodle.test.conf /etc/httpd/sites-enabled/moodle.test.conf
sudo systemctl restart httpd

sudo setenforce 0
