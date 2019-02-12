USE EngServiceDB
GO
------------------Dropping Existing Tables----------------------------
IF EXISTS
    (
    SELECT name FROM sys.objects WHERE name = N'DictionaryItems'
	)
DROP TABLE DictionaryItems;

IF EXISTS
    (
    SELECT name FROM sys.objects WHERE name = N'Dictionary'
	)
DROP TABLE Dictionary;

IF EXISTS
    (
    SELECT name FROM sys.objects WHERE name = N'Users'
	)
DROP TABLE Users;

--IF EXISTS
--  (
--    SELECT name FROM sys.objects WHERE name = N'UsersDictionary'
--	)
--DROP TABLE UsersDictionary;

--IF EXISTS
--  (
--    SELECT name FROM sys.objects WHERE name = N'ServiceUsers'
--	)
--DROP TABLE ServiceUsers;



IF EXISTS
    (
    SELECT name FROM sys.objects WHERE name = N'Translate'
	)
DROP TABLE Translate;

IF EXISTS
    (
    SELECT name FROM sys.objects WHERE name = N'Words'
	)
DROP TABLE Words;

IF EXISTS
    (
    SELECT name FROM sys.objects WHERE name = N'Languages'
	)
DROP TABLE Languages;

--IF EXISTS
--    (
--    SELECT name FROM sys.objects WHERE name = N'AllWords'
--	)
--DROP TABLE AllWords;

--IF EXISTS
--    (
--    SELECT name FROM sys.objects WHERE name = N'LanguageList'
--	)
--DROP TABLE LanguageList;

IF EXISTS
    (
    SELECT name FROM sys.objects WHERE name = N'Subtitles'
	)
DROP TABLE Subtitles;

IF EXISTS
    (
    SELECT name FROM sys.objects WHERE name = N'MediaContent'
	)
DROP TABLE MediaContent;

--IF EXISTS
--    (
--    SELECT name FROM sys.objects WHERE name = N'MediaContext'
--	)
--DROP TABLE MediaContext;
--GO
