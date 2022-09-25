#!/bin/bash

wp core install --url=localhost --title="WP Secure Test" --admin_user=admin --admin_password=test123% --admin_email=info@example.com --allow-root

wp core update --allow-root

wp language core install ja --allow-root

wp site switch-language ja --allow-root