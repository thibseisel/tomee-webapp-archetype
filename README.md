A Maven archetype that allows quick creation and deployment of a JavaEE webapp.

# Features
- [Apache TomEE](https://tomee.apache.org) application server with JAX-RS, EJB and JPA API out of the box,
- [MariaDB](https://mariadb.org) open-source database,
- [Docker](https://docker.com) container engine for quick deployment in your dev/prod environment,
- [Angular](https://angular.io) front-end framework

# Prerequisites

- Maven
- Docker
- NodeJS v6.9.0 or newer

Note that if you're using Windows, you need to install a virtualization tool such as VirtualBox to run Docker in a Linux virtual machine.

# Using this archetype

The archetype is available through Maven Central. You don't have to manually download anything.
Just open a command prompt and type in the following command to start the creation of your project :

```
mvn archetype:generate -DarchetypeGroupId=fr.nihilus -DarchetypeArtifactId=tomee-webapp-archetype
```

You will be prompted to specify your groupId, artifactId, version and package name.
Before accepting the setup by typing Y, check that the value of the following properties are correct :
- __dbName__ : the name you want to give to your MySQL database
- __dbUser__ : the name of your MySQL user. This will be used by your application to connect via JPA.
- __dbPassword__ : the password for your user.
- __dbRootPassword__ : the password for the _root_ user.

If not, type N and set their value to match your expectations.

Your project is now fully generated !

# Running the generated project

## Windows

Copy the content of the folder _docker/DEV_ of your generated project to your Linux virtual machine.
In order to do that, you can use WinSCP or type the following command in a Git Bash :
```bash
scp -r docker/DEV/* username@localhost:~
```
Where _username_ is the name of your user in virtual machine.

When done, create the MySQL and TomEE docker images with the provided scripts.

```bash
./build-images.sh  
./run-images.sh  
```

Check that TomEE is working correctly by opening your browser with the following url address : _http://localhost:8080_.
You can now build the Angular part of this sample project and then upload the whole project to the running TomEE container.
Navigate to the root folder of the project and run those commands :
```
cd angular  
npm install  
npm run build  
cd ..  
mvn tomcat7:deploy
```

Finally, open a browser at _http://localhost:8080/myapp_, where _myapp_ is the artifactId you gave when generating your project.
If a success message appear, then your project and development environment are now all set !

## Linux

You don't have to install a virtual machine to run Docker.
Navigate to the docker/DEV directory of your generated project., and run the following scripts to create your MySQL and TomEE docker images :

```
./build-images.sh  
./run-images.sh  
```

Check that TomEE is working correctly by navigating to the following url address : <http://localhost:8080>.
You can now build the Angular part of this sample project and then upload the whole project to the running TomEE container.
Navigate to the root folder of the project and run those commands :
```
cd angular  
npm run build  
cd ..  
mvn tomcat7:deploy
```

Finally, open a browser at <http://localhost:8080/myapp>, where _myapp_ is the artifactId you gave when generating your project.
If a success message appear, then your project and development environment are now all set !

# Generated directory structure
The generated project follows the Maven standard directory structure.

```
.
+-- _angular
+-- _docker
+--	_src
	+-- _main
		+-- _java
		+-- _resources
		+-- _webapp
	+-- _test
		+-- java
```

- The __src/main/java__ folder contains the code for your Java server application
- The __src/main/resources__ folder mainly contains configuration files (in our case, _persistence.xml_)
- The __src/main/webapp__ folder is where you put your HTML and Javascript client code
- The __src/test/java__ folder replicates the src/main/java package structure and contains all unit tests
- The __angular__ folder contains an Angular project generated with [@angular/cli](https://cli.angular.io)

In this project, there's an additional __docker__ folder containing scripts you used to setup your development environment.

# Sample code
The generated project features an example of a working RESTful application allowing to store and retrieve books.
Note that it only accepts JSON.
You can issue the following requests :
- __GET /api/books__ to get the list of all books from the database,
- __GET /api/books/{id}__ to get a specific book by its id,
- __POST /api/books__ to add a new book to the database (body must feature and object with a property "title"),
- __PUT /api/books/{id}__ to update an existing book (body must feature and object with a property "title"),
- __DELETE /api/books/{id}__ to delete an existing book.

You can also consume this API with the sample Angular application available at <http://localhost:8080/myapp>.

You are free to modify or delete this code to replace it with your own application logic.
