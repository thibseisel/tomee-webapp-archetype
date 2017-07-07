FROM mariadb:latest

# Informs that this container listens on port 3306
EXPOSE 3306

# Specify your own database setup script to be executed at first startup
COPY init_database.sql /docker-entrypoint-initdb.d/