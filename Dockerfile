FROM wordpress:php7.4

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# Install secure plugins
COPY install-plugins.sh /usr/local/bin/install-plugins.sh
RUN chmod +x /usr/local/bin/install-plugins.sh

# Setup WP quickly
COPY docker-wp-setup.sh /usr/local/bin/docker-wp-setup.sh
RUN chmod +x /usr/local/bin/docker-wp-setup.sh