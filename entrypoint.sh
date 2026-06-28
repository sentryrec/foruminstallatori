#!/bin/bash
set -e

MYBB_VERSION=${MYBB_VERSION:-1840}

if [ ! -f /var/www/html/index.php ]; then
    echo "Installing MyBB ${MYBB_VERSION}..."

    wget -q https://resources.mybb.com/downloads/mybb_${MYBB_VERSION}.zip -O /tmp/mybb.zip

    unzip -q /tmp/mybb.zip -d /tmp

    cp -R /tmp/Upload/* /var/www/html/

    chown -R www-data:www-data /var/www/html

    rm -rf /tmp/Upload /tmp/mybb.zip
fi

exec "$@"
