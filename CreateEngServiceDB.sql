USE master
GO

--IF (DB_ID(N'EngServiceDB') is not null) 
--    DROP DATABASE EngServiceDB;

IF EXISTS 
    (
    SELECT name
	FROM sys.databases
	WHERE name = N'EngServiceDB'
	)
	DROP DATABASE EngServiceDB;

IF (DB_ID(N'EngServiceDB') is null)
	CREATE DATABASE EngServiceDB ON PRIMARY 
	(
		name = N'EngServiceDB',
		filename = N'C:\MyDB\EngServiceDB\EngServiceDB.mdf', 
		size = 3072000KB ,
		maxsize = unlimited,
		filegrowth = 1024KB
	)
	LOG ON 
	(
		name = N'EngServiceDB_log',
		filename =N'C:\MyDB\EngServiceDB\EngServiceDB_log.ldf', 
		size = 1024000KB ,
		maxsize = 2048GB ,
		filegrowth = 10%
	);
GO