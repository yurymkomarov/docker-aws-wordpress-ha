FROM wordpress:5.4.0-php7.3

WORKDIR /usr/local/bin
RUN apt-get update && apt-get install -y wget
RUN wget https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-7.3/latest-64bit
RUN tar -zxvf latest-64bit && rm -rf latest-64bit
RUN chown root:root amazon-elasticache-cluster-client.so && mv amazon-elasticache-cluster-client.so /usr/local/lib/php/extensions/*/
RUN echo 'extension=amazon-elasticache-cluster-client.so' >> /usr/local/etc/php/conf.d/amazon-elasticache-cluster-client.ini

WORKDIR /var/www/html
