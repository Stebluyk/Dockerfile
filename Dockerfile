FROM ubuntu:14.04
 
 
RUN apt-get update \
  && apt-get install -y \
  postgresql-9.3 \
  postgresql-contrib \
  php5-fpm \
  php5-pgsql \
  nginx \
  mc
  
COPY phppgadmin /usr/share/nginx/html/phppgadmin
COPY etc/nginx/sites-available/phppgadmin /etc/nginx/sites-available/
COPY etc/postgresql/9.3/main/* /etc/postgresql/9.3/main/
COPY entrypoint.sh /
COPY dumb.sql /
  
RUN service postgresql start \
        && psql -U postgres -c "CREATE USER support WITH SUPERUSER PASSWORD 'support';" \
        && psql -U postgres -c "CREATE DATABASE application WITH OWNER support;"  \
        && psql -U postgres "application" < dumb.sql
RUN rm -rf /etc/nginx/sites-enabled/* \
  && ln -s /etc/nginx/sites-available/phppgadmin /etc/nginx/sites-enabled/
  
  
CMD /entrypoint.sh
 
