/****** Object:  Database [Manifest]    Script Date: 04/15/2014 21:16:56 ******/
/*
CREATE DATABASE [Manifest] ON  PRIMARY 
( NAME = N'Manifest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Manifest.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Manifest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Manifest_1.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Manifest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Manifest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Manifest] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Manifest] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Manifest] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Manifest] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Manifest] SET ARITHABORT OFF
GO
ALTER DATABASE [Manifest] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Manifest] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Manifest] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Manifest] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Manifest] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Manifest] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Manifest] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Manifest] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Manifest] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Manifest] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Manifest] SET  DISABLE_BROKER
GO
ALTER DATABASE [Manifest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Manifest] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Manifest] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Manifest] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Manifest] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Manifest] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Manifest] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Manifest] SET  READ_WRITE
GO
ALTER DATABASE [Manifest] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Manifest] SET  MULTI_USER
GO
ALTER DATABASE [Manifest] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Manifest] SET DB_CHAINING OFF
GO

ALTER DATABASE Manifest SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
ALTER DATABASE Manifest SET READ_COMMITTED_SNAPSHOT ON;
ALTER DATABASE Manifest SET MULTI_USER;

GO
--DBCC useroptions	 -- to see that it was enabled
*/

USE [Manifest]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsLoginEnabled] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[Email] [varchar](100) NULL,
	[PasswordHash] [char](68) NOT NULL,
	[DateRegistered] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parameters]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parameters](
	[Key] [varchar](512) NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_Parameters] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Statusables]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statusables](
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Statusables] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rateables]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rateables](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[StatusableID] [int] NOT NULL,
 CONSTRAINT [PK_Rateables] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[StatusableID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusChanges]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusChanges](
	[Status] [tinyint] NOT NULL,
	[StatusableID] [int] NOT NULL,
	[ChangerID] [int] NOT NULL,
	[DateChanged] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[RateableID] [int] NOT NULL,
	[VoterID] [int] NOT NULL,
	[Result] [tinyint] NOT NULL,
 CONSTRAINT [PK_Voters] PRIMARY KEY CLUSTERED 
(
	[RateableID] ASC,
	[VoterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleVersions]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleVersions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[SourceVersionID] [int] NULL,
	[ReviewRateableID] [int] NOT NULL,
	[PublicationRateableID] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[StatusableID] [int] NOT NULL,
	[PublicationStatus] [tinyint] NOT NULL,
	[PublicationStatusableID] [int] NOT NULL,
	[VersionString] [nvarchar](10) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[TextWithMarkup] [nvarchar](max) NOT NULL,
	[SourceTextWithMarkup] [nvarchar](max) NULL,
	[DateOfReviewEnding] [datetime2](7) NULL,
	[DateOfAltering] [datetime2](7) NULL,
 CONSTRAINT [PK_ArticleVersions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alterations]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alterations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleVersionID] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[StatusableID] [int] NOT NULL,
	[RateableID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
	[Text] [nvarchar](2000) NOT NULL,
	[Justification] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_Alterations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  View [dbo].[vArticleCurrentSummaries]    Script Date: 04/15/2014 21:16:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vArticleCurrentSummaries]
AS
SELECT
			 a.ID as ArticleID
			,a.[Status] as ArticleStatus
			,a.Title
			,vCur.ID AS CurrentID
			,vCur.[Status] AS CurrentStatus
			,vCur.VersionString AS CurrentVersionString
			,vCur.DateOfAltering AS CurrentDateOfAltering
			--,vCur.PublicationRateableID AS CurrentPublicationRateableID
			,vNew.ID AS [NewID]
			,vNew.[Status] AS NewStatus
			,vNew.VersionString AS NewVersionString
			,vNew.ReviewRateableID AS NewReviewRateableID
			,vNew.DateOfReviewEnding AS NewDateOfReviewEnding
			,(SELECT COUNT(*)
			  FROM dbo.ArticleVersions v
			  WHERE v.ArticleID = a.ID 
				AND v.Status = 2	
				AND v.ID > vCur.ID)	-- Rejected
			  AS RejectedCount
FROM		dbo.Articles AS a
LEFT JOIN   dbo.ArticleVersions AS vCur ON a.ID = vCur.ArticleID 
                                       AND vCur.[Status] IN (3,4)	-- Current, BeingAltered
LEFT JOIN   dbo.ArticleVersions AS vNew ON a.ID = vNew.ArticleID
                                       AND vNew.[Status] IN (0,1)	-- BeingEdited, BeingReviewed
GO

/*** Object: Inline TVF [dbo].[fAlterationsWithVotes] ***/
CREATE FUNCTION [dbo].[fAlterationsWithVotes]
    ( @voterID int )
    
RETURNS TABLE 
RETURN

SELECT       a.*
			,u.Name as AuthorName
			,r.Status AS RateableStatus
			,(SELECT Count(*)
			  FROM dbo.Votes AS v
			  WHERE v.RateableID = a.RateableID
			    AND v.Result = 0) -- Accept
			  AS TotalAcceptVotes 
			,(SELECT Count(*)
			  FROM dbo.Votes AS v
			  WHERE v.RateableID = a.RateableID
			    AND v.Result = 1) -- Reject
			  AS TotalRejectVotes
			,@voterID as VoterID
			,v.Result AS VoteResult

FROM		dbo.Alterations AS a
LEFT JOIN   dbo.Users AS u ON u.ID = a.AuthorID
LEFT JOIN	dbo.Rateables AS r ON r.ID = a.RateableID
LEFT JOIN	dbo.Votes AS v ON v.RateableID = r.ID 
                          AND v.VoterID = @voterID
GO

/*** Object: Inline TVF [dbo].[fArticleCurrentSummariesWithVotes] ***/
CREATE FUNCTION [dbo].[fArticleCurrentSummariesWithVotes]
    ( @voterID int )
    
RETURNS TABLE 
RETURN

SELECT
			 a.ID as ArticleID
			,a.[Status] as ArticleStatus
			,a.Title
			,vCur.ID AS CurrentID
			,vCur.[Status] AS CurrentStatus
			,vCur.VersionString AS CurrentVersionString
			,vCur.DateOfAltering AS CurrentDateOfAltering
			--,vCur.PublicationRateableID AS CurrentPublicationRateableID
			,vNew.ID AS [NewID]
			,vNew.[Status] AS NewStatus
			,vNew.VersionString AS NewVersionString
			,vNew.ReviewRateableID AS NewReviewRateableID
			,vNew.DateOfReviewEnding AS NewDateOfReviewEnding
			,(SELECT COUNT(*)
			  FROM dbo.ArticleVersions v
			  WHERE v.ArticleID = a.ID 
				AND v.Status = 2	
				AND v.ID > vCur.ID)	-- Rejected
			  AS RejectedCount
			,r.Status AS NewReviewRateableStatus
			,(SELECT Count(*)
			  FROM dbo.Votes AS v
			  WHERE v.RateableID = vNew.ReviewRateableID
			    AND v.Result = 0) -- Accept
			  AS NewReviewTotalAcceptVotes
			,(SELECT Count(*)
			  FROM dbo.Votes AS v
			  WHERE v.RateableID = vNew.ReviewRateableID
			    AND v.Result = 1) -- Reject
			  AS NewReviewTotalRejectVotes
			,@voterID as NewReviewVoterID
			,v.Result AS NewReviewVoteResult

FROM		dbo.Articles AS a
LEFT JOIN   dbo.ArticleVersions AS vCur ON a.ID = vCur.ArticleID 
                                       AND vCur.[Status] IN (3,4)	-- Current, BeingAltered
LEFT JOIN   dbo.ArticleVersions AS vNew ON a.ID = vNew.ArticleID
                                       AND vNew.[Status] IN (0,1)	-- BeingEdited, BeingReviewed
LEFT JOIN	dbo.Rateables AS r ON r.ID = vNew.ReviewRateableID
LEFT JOIN	dbo.Votes AS v ON v.RateableID = r.ID 
                          AND v.VoterID = @voterID
GO

/****** Object:  View [dbo].[vAlterationsWithVotes]    Script Date: 04/17/2014 04:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAlterationsWithVotes]
AS
SELECT       a.*
			--,r.Status AS RateableStatus
			--,(SELECT Count(*)
			--  FROM dbo.Votes AS v
			--  WHERE v.RateableID = a.RateableID
			--    AND v.Result = 0) -- Accept
			--  AS TotalAcceptVotes 
			--,(SELECT Count(*)
			--  FROM dbo.Votes AS v
			--  WHERE v.RateableID = a.RateableID
			--    AND v.Result = 1) -- Reject
			--  AS TotalRejectVotes 
FROM		dbo.Alterations AS a
--LEFT JOIN	dbo.Rateables AS r ON r.ID = a.RateableID
GO

/****** Object:  View [dbo].[vArticleCurrentSummariesWithVotes]    Script Date: 04/17/2014 04:05:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vArticleCurrentSummariesWithVotes]
AS
SELECT       
			 a.*
			--,r.Status AS NewReviewRateableStatus
			--,(SELECT Count(*)
			--  FROM dbo.Votes AS v
			--  WHERE v.RateableID = a.NewReviewRateableID
			--    AND v.Result = 0) -- Accept
			--  AS NewReviewTotalAcceptVotes 
			--,(SELECT Count(*)
			--  FROM dbo.Votes AS v
			--  WHERE v.RateableID = a.NewReviewRateableID
			--    AND v.Result = 1) -- Reject
			--  AS NewReviewTotalRejectVotes 
FROM		dbo.vArticleCurrentSummaries AS a
--LEFT JOIN	dbo.Rateables AS r ON r.ID = a.NewReviewRateableID
GO

/****** Object:  ForeignKey [FK_Rateables_Statusables]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[Rateables]  WITH CHECK ADD  CONSTRAINT [FK_Rateables_Statusables] FOREIGN KEY([StatusableID])
REFERENCES [dbo].[Statusables] ([ID])
GO
ALTER TABLE [dbo].[Rateables] CHECK CONSTRAINT [FK_Rateables_Statusables]
GO
/****** Object:  ForeignKey [FK_Articles_Statusables]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Statusables] FOREIGN KEY([StatusableID])
REFERENCES [dbo].[Statusables] ([ID])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Statusables]
GO
/****** Object:  ForeignKey [FK_StatusChanges_Statusables]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[StatusChanges]  WITH CHECK ADD  CONSTRAINT [FK_StatusChanges_Statusables] FOREIGN KEY([StatusableID])
REFERENCES [dbo].[Statusables] ([ID])
GO
ALTER TABLE [dbo].[StatusChanges] CHECK CONSTRAINT [FK_StatusChanges_Statusables]
GO
/****** Object:  ForeignKey [FK_Voters_Rateables]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Voters_Rateables] FOREIGN KEY([RateableID])
REFERENCES [dbo].[Rateables] ([ID])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Voters_Rateables]
GO
/****** Object:  ForeignKey [FK_Voters_Users]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Voters_Users] FOREIGN KEY([VoterID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Voters_Users]
GO
/****** Object:  ForeignKey [FK_ArticleVersions_Articles]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[ArticleVersions]  WITH CHECK ADD  CONSTRAINT [FK_ArticleVersions_Articles] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Articles] ([ID])
GO
ALTER TABLE [dbo].[ArticleVersions] CHECK CONSTRAINT [FK_ArticleVersions_Articles]
GO
/****** Object:  ForeignKey [FK_ArticleVersions_ArticleVersions]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[ArticleVersions]  WITH CHECK ADD  CONSTRAINT [FK_ArticleVersions_ArticleVersions] FOREIGN KEY([SourceVersionID])
REFERENCES [dbo].[ArticleVersions] ([ID])
GO
ALTER TABLE [dbo].[ArticleVersions] CHECK CONSTRAINT [FK_ArticleVersions_ArticleVersions]
GO
/****** Object:  ForeignKey [FK_ArticleVersions_Rateables]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[ArticleVersions]  WITH CHECK ADD  CONSTRAINT [FK_ArticleVersions_Rateables] FOREIGN KEY([ReviewRateableID])
REFERENCES [dbo].[Rateables] ([ID])
GO
ALTER TABLE [dbo].[ArticleVersions] CHECK CONSTRAINT [FK_ArticleVersions_Rateables]
GO
/****** Object:  ForeignKey [FK_ArticleVersions_Rateables1]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[ArticleVersions]  WITH CHECK ADD  CONSTRAINT [FK_ArticleVersions_Rateables1] FOREIGN KEY([PublicationRateableID])
REFERENCES [dbo].[Rateables] ([ID])
GO
ALTER TABLE [dbo].[ArticleVersions] CHECK CONSTRAINT [FK_ArticleVersions_Rateables1]
GO
/****** Object:  ForeignKey [FK_ArticleVersions_Statusables]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[ArticleVersions]  WITH CHECK ADD  CONSTRAINT [FK_ArticleVersions_Statusables] FOREIGN KEY([StatusableID])
REFERENCES [dbo].[Statusables] ([ID])
GO
ALTER TABLE [dbo].[ArticleVersions] CHECK CONSTRAINT [FK_ArticleVersions_Statusables]
GO
/****** Object:  ForeignKey [FK_ArticleVersions_Statusables1]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[ArticleVersions]  WITH CHECK ADD  CONSTRAINT [FK_ArticleVersions_Statusables1] FOREIGN KEY([PublicationStatusableID])
REFERENCES [dbo].[Statusables] ([ID])
GO
ALTER TABLE [dbo].[ArticleVersions] CHECK CONSTRAINT [FK_ArticleVersions_Statusables1]
GO
/****** Object:  ForeignKey [FK_Alterations_ArticleVersions]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[Alterations]  WITH CHECK ADD  CONSTRAINT [FK_Alterations_ArticleVersions] FOREIGN KEY([ArticleVersionID])
REFERENCES [dbo].[ArticleVersions] ([ID])
GO
ALTER TABLE [dbo].[Alterations] CHECK CONSTRAINT [FK_Alterations_ArticleVersions]
GO
/****** Object:  ForeignKey [FK_Alterations_Rateables]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[Alterations]  WITH CHECK ADD  CONSTRAINT [FK_Alterations_Rateables] FOREIGN KEY([RateableID])
REFERENCES [dbo].[Rateables] ([ID])
GO
ALTER TABLE [dbo].[Alterations] CHECK CONSTRAINT [FK_Alterations_Rateables]
GO
/****** Object:  ForeignKey [FK_Alterations_Statusables]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[Alterations]  WITH CHECK ADD  CONSTRAINT [FK_Alterations_Statusables] FOREIGN KEY([StatusableID])
REFERENCES [dbo].[Statusables] ([ID])
GO
ALTER TABLE [dbo].[Alterations] CHECK CONSTRAINT [FK_Alterations_Statusables]
GO
/****** Object:  ForeignKey [FK_Alterations_Users]    Script Date: 04/15/2014 21:16:56 ******/
ALTER TABLE [dbo].[Alterations]  WITH CHECK ADD  CONSTRAINT [FK_Alterations_Users] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Alterations] CHECK CONSTRAINT [FK_Alterations_Users]
GO


/****** Object:  Table [dbo].[Users]    Script Date: 04/15/2014 21:18:19 ******/
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([ID], [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (1, N'System'    , 0, 1, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF

/****** Object:  Table [dbo].[Parameters]    Script Date: 04/15/2014 21:18:19 ******/
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'DaysBeforeAltering', N'90')
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'DaysBeforeReviewEnding', N'30')
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'MathAlterationAcceptConsensus', N'0.75')
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'MathAlterationAcceptYesQuorum', N'10')
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'MathAlterationRejectConsensus', N'0.5')
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'MathAlterationSandboxYesNoQuorum', N'5')
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'MathReviewAcceptConsensus', N'0.75')
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'MathReviewAcceptYesQuorum', N'10')
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'MathReviewRejectConsensus', N'0.5')
INSERT [dbo].[Parameters] ([Key], [Value]) VALUES (N'MathReviewSandboxYesNoQuorum', N'5')

/* Test Users (to login as them via "NextUser" button) and Virtual Users (to batch votes) */
/*
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser1' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser2' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser3' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser4' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser5' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser6' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser7' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser8' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser9' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'TestUser10', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))

INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser1' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser2' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser3' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser4' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser5' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser6' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser7' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser8' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser9' , 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser10', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser11', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser12', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser13', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser14', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser15', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser16', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser17', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser18', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser19', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser20', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser21', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser22', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser23', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser24', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser25', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser26', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser27', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser28', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser29', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
INSERT [dbo].[Users] (      [Name], [IsLoginEnabled], [IsAdmin], [Email], [PasswordHash], [DateRegistered]) VALUES (   N'VirtualUser30', 1, 0, NULL, N'                                                                    ', CAST(0x07000000000007240B AS DateTime2))
*/