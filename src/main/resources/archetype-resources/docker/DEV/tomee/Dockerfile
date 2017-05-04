FROM tomee:8-jdk-7.0.3-plus

# On expose le port 8080 de tomcat a l'exterieur du conteneur
EXPOSE 8080

# Dossier de travail
WORKDIR /usr/local/tomee

# Ajout du fichier de configuration des utilisateurs tomee
COPY tomcat-users.xml /usr/local/tomee/conf/tomcat-users.xml  

# Ajout du fichier context.xml pour autoriser les acces aux outils d'administration de tomee
# - A commenter si Aucune action d'administration n'est réalisée depuis l'interface web de tommee
COPY context.xml /usr/local/tomee/conf/Catalina/localhost/manager.xml

# Ajout du fichier de configuration tomee (datasources...)
COPY tomee.xml /usr/local/tomee/conf/tomee.xml  

# Ajout du driver jdbc
COPY mysql-connector-java-5.1.35-bin.jar /usr/local/tomee/lib/

# Ajout de l'application web
# - Pas nécessaire depuis l'environneemnt de DEV, le war est déployé depuis Eclipse
# - via la plugin maven tomcat7-maven-plugin
#COPY ${artifactId}-${version}.war /usr/local/tomee/webapps/ara.war

# Commande par defaut
CMD ["catalina.sh","run"]