# Garpictures

project for the 2019/2020 TSW class.


### Projcet Members
 
* Garofalo Antonio (0512102870)
* Maio Cosimo (0512103899)

### Informations

Garpictures is an e-commerce webiste aimed at selling stock images.

### How to Build

Running this problem is fairly simple :
 ```
 git clone https://github.com/Huntonion/Garpictures/
 ```
Then run the ```GarpicturesDB.sql``` file using SQL server in order to load the database.
Connect the IDE of your choice to the DB and remember to change user and password in the ```ConnessioneDB.java``` java class.
Install the dependencies, specifically:
* mysql connector
* jstl
* servlet-api

Once done simply build it and run it on the IDE.

### How to Run

If you're just interested in running it:
* load the database using the ```GarpicturesDB.sql``` file however you want
* copy the ```TSW_war.war``` file into the ```webapps``` folder of your tomcat directory.
* then from your tomcat directory:
* ```
  cd bin
  sh startup.sh
  ```
 and the project should be loaded in tomcat.

