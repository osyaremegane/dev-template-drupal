# Use the default MariaDB image
FROM mariadb:10.4

ENV MARIADB_ROOT_PASSWORD=mariadb
ENV MARIADB_DATABASE=mariadb
ENV MARIADB_USER=mariadb
ENV MARIADB_PASSWORD=mariadb

# Expose the MySQL port to be accessible to the web container.
EXPOSE 3306
