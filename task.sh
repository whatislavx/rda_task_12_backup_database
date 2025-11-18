#!/bin/bash

export DB_USER="backup"
export DB_PASSWORD="<password>"

USER="$DB_USER"
PASSWORD="$DB_PASSWORD"

mysqldump -u"$USER" -p"$PASSWORD" --databases ShopDB > full_backup.sql
mysql -u"$USER" -p"$PASSWORD" ShopDBReserve < full_backup.sql

mysqldump -u"$USER" -p"$PASSWORD" --no-create-info ShopDB > backup_data.sql
mysql -u"$USER" -p"$PASSWORD" ShopDBDevelopment < backup_data.sql