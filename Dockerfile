# Docker container image to host Entersection MySQL data
FROM mysql:latest
MAINTAINER gregoryfoster <greg@foojutsu.com>
ENV MYSQL_ROOT_PASSWORD=123456 \
    MYSQL_DATABASE=wp_entersection \
    MYSQL_USER=wp_admin \
    MYSQL_PASSWORD=123456

# Copy the MySQL dump file into the image's automatic import directory
# Issue: the MySQL container blocks on load, sometimes causing the WordPress container to exit on boot
COPY entersection-mysqldump.sql /docker-entrypoint-initdb.d/
