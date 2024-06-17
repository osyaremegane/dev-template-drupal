#!/bin/bash

# Drushインストール
cd /opt/drupal
composer self-update
composer require drush/drush

# Drupalインストール
vendor/drush/drush/drush site-install --locale=ja --db-url=mysql://mariadb:mariadb@db:3306/mariadb standard  install_configure_form.enable_update_status_emails=NULL -y

# 設定ファイル上書き
cp /workspaces/dev-template-drupal/.devcontainer/drupal/default/settings.php web/sites/default/settings.php
cp /workspaces/dev-template-drupal/.devcontainer/drupal/local.services.yml web/sites

# adminパスワードを変更
vendor/drush/drush/drush user:password admin "P@ssw0rd"

# 権限変更
chown -R www-data:www-data /opt/drupal
