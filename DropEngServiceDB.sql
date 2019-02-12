USE master
GO

IF (DB_ID(N'EngServiceDB') is not null) 
    DROP DATABASE EngServiceDB;
GO