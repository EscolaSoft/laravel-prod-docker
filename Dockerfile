FROM devilbox/php-fpm:7.4-prod

RUN apt-get update && \
    apt-get install supervisor -y \
    && mkdir -p /var/log/supervisor

# composer
RUN curl --silent --show-error https://getcomposer.org/composer.phar > composer.phar \
    && mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer

#EXPOSE 9000
#CMD ["php-fpm", "-F"]

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]