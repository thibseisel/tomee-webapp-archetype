# tomee-webapp-archetype
Maven archetype that allows quick creation and deployment of a webapp with a TomEE server and a MySQL database.

# Prerequisites

- Maven
- Docker

Note that if you're using Windows, you need to install a virtualization tool such as VirtualBox to run Docker in a Linux virtual machine. 

# Using the archetype

Clone this repository and copy this Maven archetype to your local repository, located under __homedir/.m2/repository__.

  ```
  git clone https://github.com/thibseisel/tomee-webapp-archetype.git  
  cd tomee-webapp-archetype  
  mvn install
  ```

You can now generate a new project using this archetype.

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
Under the root folder of your generated project, deploy your application to tomEE with the following command :
`mvn tomcat7:deploy`

Finally, open a browser at _http://localhost:8080/myapp_, where _myapp_ is the artifactId you gave when generating your project.
If a success message appear, then your project and development environment are now all set !

## Linux

You don't have to install a virtual machine to run Docker.
Navigate to the docker/DEV directory of your generated project., and run the following scripts to create your MySQL and TomEE docker images :

```
./build-images.sh  
./run-images.sh  
```

Check that TomEE is working correctly by opening your browser with the following url address : _http://localhost:8080_.
Under the root folder of your generated project, deploy your application to tomEE with the following command :
```
mvn tomcat7:deploy
```

Finally, open a browser at _http://localhost:8080/myapp_, where myapp is the artifactId you gave when generating your project.
If a success message appear, then your project and development environment are now all set !

# Sample code
The generated project features an example of a working RESTful application allowing to store and retrieve books.
Note that it only accepts JSON.
You can issue the following requests :
- __GET /api/books__ to get the list of all books from the database,
- __GET /api/books/{id}__ to get a specific book by its id,
- __POST /api/books__ to add a new book to the database (body must feature and object with a property "title"),
- __PUT /api/books/{id}__ to update an existing book (body must feature and object with a property "title"),
- __DELETE /api/books/{id}__ to delete an existing book.

You are free to modify or delete this code to replace it with your own application logic.
