--BEFORE RUNNING UPDATE LOGIN/USER AND PASSWORD AS REQUIRED


USE [master]
GO

--Create DB
CREATE DATABASE [arqivaTechTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'arqivaTechTest', FILENAME = N'D:\rdsdbdata\DATA\arqivaTechTest.mdf' , SIZE = 20480KB , MAXSIZE = UNLIMITED, FILEGROWTH = 0)
 LOG ON 
( NAME = N'arqivaTechTest_log', FILENAME = N'D:\rdsdbdata\DATA\arqivaTechTest_log.ldf' , SIZE = 20480KB , MAXSIZE = 2048GB , FILEGROWTH = 0)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO


--Create Server Login
USE [master]
GO

CREATE LOGIN [rdsAccess1] WITH PASSWORD=N'PASSWORD', DEFAULT_DATABASE=[arqivaTechTest], DEFAULT_LANGUAGE=[us_english]
GO


--Create db user
USE [arqivaTechTest]
GO

CREATE USER [rdsAccess1] FOR LOGIN [rdsAccess1] WITH DEFAULT_SCHEMA=[dbo]
GO

USE [arqivaTechTest]
GO
ALTER ROLE [db_ddladmin]	 ADD MEMBER [rdsAccess1]
ALTER ROLE [db_datareader]	 ADD MEMBER [rdsAccess1]
ALTER ROLE [db_datawriter]	 ADD MEMBER [rdsAccess1]
GO


USE [arqivaTechTest]
GO


CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[date_of_birth] [date] NULL,
	[startdate] [datetime] NOT NULL,
	[enddate] [datetime] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_startDate]  DEFAULT (getdate()) FOR [startdate]
GO


USE [arqivaTechTest]
GO

CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userFk] [int] NULL,
	[transaction_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[transaction_date] [datetime] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[transactions] ADD  CONSTRAINT [DF_txns_dateFrom]  DEFAULT (getdate()) FOR [StartDate]
GO

ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [FK_transactions_users] FOREIGN KEY([userFk])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [FK_transactions_users]
GO




