FROM tomee:8-jdk-7.0.3-plus

# Informs that this container listens on port 8080
EXPOSE 8080

# Sets the base directory for COPY instructions
WORKDIR /usr/local/tomee

# File that grants access to the TomcatManager app
COPY tomcat-users.xml /usr/local/tomee/conf/tomcat-users.xml  

COPY context.xml /usr/local/tomee/conf/Catalina/localhost/manager.xml

# TomEE main configuration file
COPY tomee.xml /usr/local/tomee/conf/tomee.xml

# JDBC driver to connect to Mariadb
COPY mariadb-java-client-2.0.3.jar /usr/local/tomee/lib/

#COPY ${artifactId}-${version}.war /usr/local/tomee/webapps/${artifactId}.war

# Commande par defaut
CMD ["catalina.sh","run"]