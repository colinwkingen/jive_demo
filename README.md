# Development Environment Submission

This app is a interview demo project for Jive. 

It includes form submission and validation, and uses a mySql database.

### Instructions

To deploy this app, build it using eclipse or Maven, and place
the resulting .WAR file in the webapps directory of your Tomcat server or equivalent.

The database must be built. There is a file titled jive_demo.sql included in this project.

To execute this file, ensure you have the proper privileges on your mySql database. 
You will probably need to execute this file as user root.

At the command line in the directory where the sql file is located, enter:

$sudo mysql -u root -p < jive_demo.sql

This will prompt you for your sudo password, and the password for the root user on your mySql
database. If you do not have root access to mySql use another user with appropriate privileges
in place of root and the accompanying password.

If no errors are thrown, go to your tomcat server at http://localhost:8080/JiveDemoProject 
and check out this totally sweet app.

If errors occur, open the sql file to see the contents.
I usually use 

$nano

for tasks like this. The commands are all there, and
you can log into mysql and enter them manually.  





