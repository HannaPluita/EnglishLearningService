USE EngServiceDB
GO
----------------------Create Tables---------------------------------
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Users')
CREATE TABLE Users 
(
    Id BIGINT IDENTITY(1,1) NOT NULL
	    CONSTRAINT PK_Users PRIMARY KEY  CLUSTERED, 
	Login varchar(80) NOT NULL UNIQUE
);
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Languages')
CREATE TABLE Languages
(
	Id bigint NOT NULL,
	Name nvarchar(50) NOT NULL
	CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED (Id)
);
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='MediaContent')
CREATE TABLE MediaContent
(
	Id bigint NOT NULL,
	Type tinyint NOT NULL,
	Path nvarchar(1024) NOT NULL,
	CONSTRAINT PK_MediaContent PRIMARY KEY CLUSTERED (Id)
);
GO

---------------Subtitles--------------------------------------
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Subtitles')
CREATE TABLE Subtitles
(
	Id bigint NOT NULL,
	IdMedia bigint NOT NULL,
	IdText bigint NOT NULL,
	CONSTRAINT PK_Subtitles PRIMARY KEY CLUSTERED (Id),
    CONSTRAINT FK_MediaContent FOREIGN KEY (IdMedia) REFERENCES MediaContent(Id)
	    ON UPDATE NO ACTION  --CASCADE
	    ON DELETE NO ACTION, --CASCADE,
	CONSTRAINT FK_Subtitles FOREIGN KEY (IdText) REFERENCES MediaContent(Id)
	    ON UPDATE NO ACTION --CASCADE
	    ON DELETE NO ACTION --CASCADE                                 
);
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Words')
CREATE TABLE Words
(
	Id bigint NOT NULL CONSTRAINT PK_AllWords PRIMARY KEY CLUSTERED (Id),
	Value nvarchar(100) NOT NULL UNIQUE,
	IdLanguage bigint NOT NULL, 
	IdAudioProponciation bigint UNIQUE,
	CONSTRAINT FK_Language FOREIGN KEY(IdLanguage) REFERENCES Languages(Id)
	    ON UPDATE CASCADE
	    ON DELETE CASCADE,
	CONSTRAINT FK_AudioProponciation FOREIGN KEY(IdAudioProponciation) REFERENCES MediaContent(Id)
	    ON UPDATE CASCADE
	    ON DELETE CASCADE,
);
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Dictionary')
CREATE TABLE Dictionary
(
	IdUsers bigint NOT NULL,
	Name nvarchar(70) NOT NULL,
	Id bigint NOT NULL,
	CONSTRAINT PK_Dictionary PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Users FOREIGN KEY (IdUsers) REFERENCES Users(Id)
	    ON UPDATE CASCADE
	    ON DELETE CASCADE     
);
GO

-----------------Translate----------------------------------------
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Translate')
CREATE TABLE Translate
(
	IdFirst bigint NOT NULL,
	IdSecond bigint NOT NULL,
	Id bigint NOT NULL,
	CONSTRAINT PK_Translate PRIMARY KEY CLUSTERED (Id),
    CONSTRAINT FK_IdFirst FOREIGN KEY (IdFirst) REFERENCES Words(Id)
	    ON UPDATE NO ACTION --CASCADE
	    ON DELETE NO ACTION, --CASCADE,
	CONSTRAINT FK_IdSecond FOREIGN KEY (IdSecond) REFERENCES Words(Id)
	    ON UPDATE CASCADE
	    ON DELETE CASCADE
	                                 --ON UPDATE NO ACTION  
	                                 --ON DELETE NO ACTION                                 
)
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DictionaryItems')
CREATE TABLE DictionaryItems
(
	Id bigint NOT NULL,
	Comment nvarchar(200) NOT NULL,
	IdTranslate bigint NOT NULL,
	IdDictionary bigint NOT NULL,
	IdContent bigint NOT NULL,
	CONSTRAINT PK_DictionaryItems  PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Translate FOREIGN KEY (IdTranslate) REFERENCES Translate(Id)
	    ON UPDATE CASCADE -- ON UPDATE NO ACTION
	    ON DELETE CASCADE, --, CASCADE,
	CONSTRAINT FK_Dictionary FOREIGN KEY (IdDictionary) REFERENCES Dictionary(Id)
	    ON UPDATE CASCADE
	    ON DELETE CASCADE,
	CONSTRAINT FK_Content FOREIGN KEY (IdContent) REFERENCES MediaContent(Id)
	    ON UPDATE NO ACTION  --CASCADE
	    ON DELETE NO ACTION  --CASCADE                                                                
)
GO




