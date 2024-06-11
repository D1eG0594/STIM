**Online video game store - Database Project**

Steam is an application whose characteristic functionality is to be a virtual video game store for PC (personal computer) users. It was born in 2003 and from there it began to become what is now known as the most popular online video game store in the world.
The objective of the project is to replicate the basic functionalities and characteristics that the Steam database would have. Seeking that the final replica of said database is as close to the essence of the application as possible.

The project has the following: 
- Database code in SQL and its required explanations so that it can be replicated in a good way 
- Technical document with the development process and the initial and evolutionary approaches of the project
- Paper in IEEE format that describes and shows the user the final project
- Poster, which allows the user to see the essentials of the project as a summary
And all the additional documentation for the proper understanding of the entire database. These files are all available in pdf format within the repository folder called **"Project Documentation".**


Within the repository you can find different folders, the first one that appears is the DB folder, in it you will find several folders, one called "DATA_BACKUP" that contains the backup copy of all the data stored in the database in an easy-to-use csv format. viewing and access.
You will also find a folder called **"SQL"**, which contains the SQL codes that will allow you to create the database, fill it with specific information and perform the queries posed. A valid clarification can be presented here and that is that if you want to replicate the database, the best way outside of the repetitive use of the "insert into" command in a script in your database manager environment, the best way is to take each . csv from the folder described above and insert them entity by entity using the "import_data" option; This will allow you to not only have an orderly fill of information, but it will save you a significant amount of time.

The rest of the subfolders that you will find will be .py files necessary for the environment and other functionalities of the application itself.
Finally you will see a file called "db_stim1", this file corresponds to the SQL that you will need to execute if you want to view the replica of the database system optimally. As a personal tip, in case of replicating the database, it is suggested to create a new one in your database management environment and select the "Tools" option and click on the option that says something related to "Import_backup" or "Restore_backup". Once done, select the file "db_stim1" and click accept. After these steps you will be able to see the database generated in your management environment if you wish.


**Aditional recommendations**

-You have to install postgres and some database manager, preferably we recommend DBeaver CE 

-Don't forget to create a connection with postgres

-All the information that you take from here shoud be appropriately referenced





**DatabaseFoundations**

2024-I **District University Francisco José de Caldas**


