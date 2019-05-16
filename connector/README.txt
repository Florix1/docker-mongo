Hategan Florin George - 16.05.2019


====Project Title====
	Database Backup


====Getting Started====
	This project is a request I received with the list of the actual tasks in 
the tasks.txt file.General idea is to make a backup of a mongodb database that is
placed in a docker container.More of a step by step guide with the following 
functionalities : backup db, restore db and generate random db.


====Structure of files====
/connector
¦   README.txt
¦
+---backup
¦       backup_ftw.zip
¦       backup_one.zip
¦       Dummy.txt
¦
+---config
¦       mongod.conf
¦
+---scripts
        generate.js
        generate.sh
        init.sh
        pack.sh
        unpack.sh
	

====Prerequisites====
	What things you need to install the software and how to install them :

	Docker version 18.09.2 (the one I used) or higher.Depends on the host OS
so please check *(1)


====Running the tests====
	Disclaimer : the host environment for me was Windows 10 and I will just
assume that other OS have similar problems, but I cannot foresee any complications 
that may occure with docker on your OS.

	1)Open a terminal/powershell as sudo/administrator

	2)Download the files from my github or archive in email *(2)

        3)Log in on your docker account + *If you are a Windows 10 user do what 
the last comment says from here *(3) as you will need to mount some disk space
in order to communicate with the container
	
	4)*Optional!Pull the mongodb image : docker pull mongo:4.0.8
        I chose the version as it is a recent and stable one because just mongo will
get you the latest version and this forces the same environment.
	
	5)docker run --name ok -d -v absolute_path_to_connector\:/connector/ mongo:4.0.8 mongod -f /connector/config/mongod.conf
	This is telling docker to run the container under the name "ok",
	-d places it in the background (stands for detached)
        -v allows a mounting point so that the host and the container will be
able to share data.
        !!!You must replace absolute_path_to_conntector
        mongo:4.0.8 this will automatically do 4)
        the rest tells mongodb to use the specified configuration file

	6)Connect to the container useing docker exec -it ok bash
	Note that "ok" is just the name I set at 5)
        -it stands for interactive terminal

	7)Run the init.sh script :
	cd /connector/scripts/
	./init
	This should install zip and then you are good to go.

	8)Run any of the scripts :
		- generate.sh takes 0/1/2 arguments that are the database_name and count
		The javascript insets count entries in the database.
		An entry has the following format
		{
    			index : for loop index,
    			user : randomString of size 10,
     			password : randomString of size 12,
    			hiredate: randomDate
  		}
		By default the database name is test and the count is 100.Note that you
		cannot change only the count, you have to specify db too!
		
		-pack.sh takes 1 argument, the database name
		Creates a zip archive and places it in the /connector/backup/ directory for
                both the host and the container, oviously.
		The file format is backup_(db_name).zip
		Created useing mongodump.

		-unpack.sh takes 2 arguments, old_db new_db
		Note that you must have a backup beforehand!
		Restored using mongorestore.
		It doesn't have the --droptable active
		The collection and the db will be named new_db
		

====Problems during implementation====
	Windows is not my goto when it comes to programming but I don't have
dual boot and working with new technologies inside a virtual machine that I haven't
had time to backup doesn't sound like a good idea.I bumped into things like (3)*
	I had like a real struggle trying to configure the mongodb instance because
mongod isn't quite working properly as it has a socket exception and I was not able
to fix it which made other options like (4)* impossible.The only way around is to
launch the container with the actual configuration.
	The actual coding part took the least as it was a rather easy task and 
the real strugle was with the docker errors and research.


====Break down of thought process====
	As mentioned above Windows was not my friend and I would have liked to go
for more of a shorter aproch and use something like this (4)*.But I couldn't make
the bash to recognize the docker command even if the env variable was set...
	I used bash as it didn't require installation and opted for zip as it feels
like a middle ground for all the Operating Systems.I thaught about going around
mounting the files using something like got or a ssh connection but it seemed way
too complicated.
	Overall a nice and simple task with really interesting technologies.
	Thank you for your time!


====Authors====
	Hategan Florin George


====Acknowledgments and links====
	(1)* https://docs.docker.com/install/
	(2)* https://github.com/Florix1/docker-mongo
	(3)* https://forums.docker.com/t/how-to-i-execute-the-command-inside-docker-container-using-shell-script/54161
	(4)* https://blog.studiointeract.com/mongodump-and-mongorestore-for-mongodb-in-a-docker-container-8ad0eb747c62	