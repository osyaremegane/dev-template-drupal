#!/bin/bash

# drupalフォルダの権限を変更
chown -R www-data:www-data /opt/drupal

# Apache起動
apachectl start