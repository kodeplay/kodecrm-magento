#!/bin/bash

dbuser="root"
dbpass="kode"
dbhost="localhost"

# extract magento
echo "Cleaning up existing installation..."
cd /home/vineet/public_html/projects/kodecrm_platforms
rm -rf magento

echo "Extracting magento installation..."
tar xzf magento-1.7.0.2.tar.gz

# get sample data
echo "Preparing sample data..."
if [ -f magento-sample-data-1.6.1.0.tar.gz ]
then
    rm -rf magento-sample-data-1.6.1.0
else
    wget http://www.magentocommerce.com/downloads/assets/1.6.1.0/magento-sample-data-1.6.1.0.tar.gz    
fi

tar xzf magento-sample-data-1.6.1.0.tar.gz

mv magento-sample-data-1.6.1.0/media/* magento/media/
mv magento-sample-data-1.6.1.0/magento_sample_data_for_1.6.1.0.sql magento/data.sql

echo "Changing to magento installation directory..."
cd magento
chmod -R o+w media var
chmod o+w app/etc

echo "Setting up new database..."
dt=`date +'%m%d%Y'`
dbname=`echo magento_kodecrm_$dt`

drop="DROP DATABASE $dbname"
mysql -u ${dbuser} -h ${dbhost} -p${dbpass} -e "$drop"
create="CREATE DATABASE $dbname;"
mysql -u $dbuser -h $dbhost -p$dbpass -e "$create"
mysql -u $dbuser -h $dbhost -p$dbpass $dbname < data.sql

echo "Running Magento installation script..."
php -f install.php -- \
    --license_agreement_accepted "yes" \
    --locale "en_US" \
    --timezone "America/Los_Angeles" \
    --default_currency "USD" \
    --db_host "$dbhost" \
    --db_name "$dbname" \
    --db_user "$dbuser" \
    --db_pass "$dbpass" \
    --url "http://projects.kp/kodecrm_platforms/magento/" \
    --use_rewrites "yes" \
    --use_secure "no" \
    --secure_base_url "" \
    --use_secure_admin "no" \
    --admin_firstname "Vineet" \
    --admin_lastname "Naik" \
    --admin_email "vineet.naik@kodeplay.com" \
    --admin_username "admin" \
    --admin_password "k0d3crmm4g3nt0"


echo "Adding KodeCRM extension..."
rm -rf ../kodecrm_module_magento
git clone git@vineet-desktop.local:/home/git/repos/kodecrm_module_magento.git ../kodecrm_module_magento
cp -r ../kodecrm_module_magento/magento/app .
cp -r ../kodecrm_module_magento/magento/lib .
rm -rf ../kodecrm_module_magento

