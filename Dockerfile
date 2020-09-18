FROM php:apache

RUN apt-get update && \
	apt-get install -y git bind9-host mtr iputils-ping traceroute sqlite3 && \
	a2enmod remoteip

RUN { \
		echo 'RemoteIPHeader X-Forwarded-For'; \
	} | tee "$APACHE_CONFDIR/conf-available/docker-remoteip.conf" \
	&& a2enconf docker-remoteip

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


COPY entrypoint /usr/local/bin/

ENTRYPOINT ["entrypoint"]

WORKDIR /var/www/html
CMD ["apache2-foreground"]
