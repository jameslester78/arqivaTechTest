# Environment Preparation

You Will Need:

- An AWS Account
- A S3 bucket which you can read and write to
- A SQL Server RDS with admin permissions
- Spark installed locally
- A Local Jupyter Installation
- SQL Management Studio or other tool to query SQL Server

The Following Python Libraries

- findspark
- pyspark
- boto3
- pyodbc
- re (standard preinstalled library)
- datetime (standard preinstalled library)

#### S3 Bucket

The S3 bucket should contain 2 top level folders, named:

- processed
- unprocessed

You will need permissions to both read, write and delete objects in this bucket

#### SQL Server RDS

You will need admin priviledges as you will be running code to create a database and a login/database user

You may also want to have set up inbound rules to enable you to query the database locally

#### SQL Server JDBC driver

https://www.microsoft.com/en-us/download/details.aspx?id=54671

- place sqljdbc42.jar in %spark_home% jar folder
- restart spark
- check environment tab in spark ui for jar, look in the classpath section

# Run The Code

There are three sets of files here
https://github.com/jameslester78/arqivaTechTest/tree/main/fileset

These files represent sets of files that will land in your bucket where they will await processing

Copy the 2 files from fileset 1 folder to your S3 bucket - "unprocessed", these are the initial user and transaction files

Set up your rds by running the code found here - update the password to whatever you want it to be:
https://github.com/jameslester78/arqivaTechTest/blob/main/rdsCreate.sql

Open up Jupyter and load this file: https://github.com/jameslester78/arqivaTechTest/blob/main/submission.ipynb

Run the first cell to import findspark and set up your Spark session

Set your parameters in the third cell and run it

The fourth cell contains the functions that you will need, run it

The fifth and final cell conatins the code that will process the data, when ready - run it

You can verify the data in your rds looking at the tables: users, transactions and transSum

When ready repeat the process for the files contained in fileset2 and again in fileset3

A demo of the code being run as well as a look at the outputs can be found here:
https://youtu.be/0erdFqDuSZY
