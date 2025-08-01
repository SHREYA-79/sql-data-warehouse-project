
Purpose: 
    This script initialises a 'Datawarehouse' database by first removing any existing instance, 
    then creating a fresh database with three standard schemas: 'bronze', 'silver', and 'gold'.

IMPORTANT NOTICE:
    Executing this script will permanently delete the 'Datawarehouse' database if present,
    including all its contents. Ensure you have backups before proceeding.

USE master;
GO

--To check if there exists a database named 'DataWareHouse', IF Yes Then DROP the Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name='DataWareHouse'
BEGIN 
     ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
     DROP DATABASE DataWareHouse;
END;
GO

--To create the database 'DataWareHouse'
CREATE DATABASE DataWareHouse;
GO

USE DataWareHouse;
GO

--To create schemas for different layers of the projects
CREATE SCHEMA bronze;
GO --> Seperate batches when working with multiple SQL statements
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
