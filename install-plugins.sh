#!/bin/bash

wp plugin install siteguard --allow-root --force --activate
wp plugin install wordfence --allow-root --force --activate

shopt -s lastpipe
grep -E "RewriteRule \^login_.*\(\.\*\)\\$ wp-login.php" .htaccess | sed -r 's/^.*(login_.*)\(\.\*\).*$/\1/g' | read -d '' loginUri

echo "ログインURLは： {ドメイン名}/$loginUri"
