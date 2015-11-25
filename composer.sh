#!/usr/bin/env bash

export SF_VERSION=$1
export COMPOSER_VENDOR_DIR=vendor-${SF_VERSION}
export COMPOSER=composer-${SF_VERSION}.json

args=($@)

echo "Version: ${SF_VERSION}, Vendor: ${COMPOSER_VENDOR_DIR}, File: ${COMPOSER}"
echo "Args: ${args[@]:1}"

composer ${args[@]:1}

if [ -f app/bootstrap.php.cache ]; then
    mv app/bootstrap.php.cache app/${SF_VERSION}-bootstrap.php.cache
fi