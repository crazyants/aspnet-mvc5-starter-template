/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Database Engine Edition : Microsoft Azure SQL Database Edition
    Target Database Engine Type : Microsoft Azure SQL Database
*/
/****** Object:  Table [dbo].[Alerts]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alerts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UTCCreation] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[UTCRead] [datetime2](7) NULL,
	[ActionUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Alerts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Blobs]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blobs](
	[Id] [uniqueidentifier] NOT NULL,
	[Folder] [nvarchar](10) NOT NULL,
	[Extension] [nvarchar](10) NOT NULL,
	[ContentType] [nvarchar](100) NOT NULL,
	[ContentLength] [bigint] NOT NULL,
	[SourceFileName] [nvarchar](1000) NOT NULL,
	[UTCCreated] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsPurged] [bit] NOT NULL,
 CONSTRAINT [PK_Blobs_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[EventBlobs]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventBlobs](
	[EventId] [int] NOT NULL,
	[BlobId] [uniqueidentifier] NOT NULL,
	[OrderIndex] [int] NOT NULL,
	[Label] [nvarchar](75) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_EventBlobs] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC,
	[BlobId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Events]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UTCCreation] [datetime2](7) NOT NULL,
	[Name] [nvarchar](175) NOT NULL,
	[Color] [varchar](25) NOT NULL,
	[StartDate] [datetimeoffset](7) NOT NULL,
	[EndDate] [datetimeoffset](7) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TimeZoneId] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Properties] [nvarchar](max) NULL,
	[UTCCreation] [datetime2](7) NOT NULL,
	[ActivityId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[UserAlerts]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAlerts](
	[UserId] [int] NOT NULL,
	[AlertId] [int] NOT NULL,
 CONSTRAINT [PK_UserAlerts] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[AlertId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[UserBlobs]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBlobs](
	[UserId] [int] NOT NULL,
	[BlobId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserBlobs] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[BlobId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[UserEvents]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEvents](
	[UserId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
 CONSTRAINT [PK_UserEvents] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[EventId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[UserRealms]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRealms](
	[UserId] [int] NOT NULL,
	[Realm] [int] NOT NULL,
 CONSTRAINT [PK_UserRealms] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Realm] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[Role] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Role] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[UTCCreation] [datetime2](7) NOT NULL,
	[MobilePhone] [nvarchar](30) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[MobilePhoneConfirmed] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetimeoffset](7) NULL,
	[AccessFailedCount] [tinyint] NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[CultureId] [nvarchar](10) NOT NULL,
	[UICultureId] [nvarchar](10) NOT NULL,
	[TimeZoneId] [nvarchar](100) NOT NULL,
	[PictureBlobId] [uniqueidentifier] NULL,
	[ScreenAutoLockMinutes] [int] NOT NULL,
 CONSTRAINT [PK__UserEnti__3214EC070425A276] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
ALTER TABLE [dbo].[Alerts] ADD  CONSTRAINT [DF_Alerts_UTCCreation]  DEFAULT (getutcdate()) FOR [UTCCreation]
GO
ALTER TABLE [dbo].[Alerts] ADD  CONSTRAINT [DF_Alerts_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Blobs] ADD  CONSTRAINT [DF_Blobs_UTCCreated]  DEFAULT (getutcdate()) FOR [UTCCreated]
GO
ALTER TABLE [dbo].[Blobs] ADD  CONSTRAINT [DF_Blobs_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Blobs] ADD  CONSTRAINT [DF_Blobs_IsPurged]  DEFAULT ((0)) FOR [IsPurged]
GO
ALTER TABLE [dbo].[EventBlobs] ADD  CONSTRAINT [DF_EventBlobs_OrderIndex]  DEFAULT ((0)) FOR [OrderIndex]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_Events_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_Events_UTCCreation]  DEFAULT (getutcdate()) FOR [UTCCreation]
GO
ALTER TABLE [dbo].[Logs] ADD  CONSTRAINT [DF_Logs_UTCCreation]  DEFAULT (getutcdate()) FOR [UTCCreation]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UTCCreation]  DEFAULT (getutcdate()) FOR [UTCCreation]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LockoutEnabled_1]  DEFAULT ((0)) FOR [LockoutEnabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_TwoFactorEnabled_1]  DEFAULT ((0)) FOR [TwoFactorEnabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_MobilePhoneConfirmed_1]  DEFAULT ((0)) FOR [MobilePhoneConfirmed]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_AccessFailedCount_1]  DEFAULT ((0)) FOR [AccessFailedCount]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_EmailConfirmed]  DEFAULT ((0)) FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CultureId]  DEFAULT (N'en-US') FOR [CultureId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UICultureId]  DEFAULT (N'en-US') FOR [UICultureId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_TimeZoneId]  DEFAULT (N'UTC') FOR [TimeZoneId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ScreenAutoLockMinutes]  DEFAULT ((0)) FOR [ScreenAutoLockMinutes]
GO
ALTER TABLE [dbo].[EventBlobs]  WITH CHECK ADD  CONSTRAINT [FK_EventBlobs_Blobs] FOREIGN KEY([BlobId])
REFERENCES [dbo].[Blobs] ([Id])
GO
ALTER TABLE [dbo].[EventBlobs] CHECK CONSTRAINT [FK_EventBlobs_Blobs]
GO
ALTER TABLE [dbo].[EventBlobs]  WITH CHECK ADD  CONSTRAINT [FK_EventBlobs_Events] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[EventBlobs] CHECK CONSTRAINT [FK_EventBlobs_Events]
GO
ALTER TABLE [dbo].[UserAlerts]  WITH CHECK ADD  CONSTRAINT [FK_UserAlerts_Alerts] FOREIGN KEY([AlertId])
REFERENCES [dbo].[Alerts] ([Id])
GO
ALTER TABLE [dbo].[UserAlerts] CHECK CONSTRAINT [FK_UserAlerts_Alerts]
GO
ALTER TABLE [dbo].[UserAlerts]  WITH CHECK ADD  CONSTRAINT [FK_UserAlerts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserAlerts] CHECK CONSTRAINT [FK_UserAlerts_Users]
GO
ALTER TABLE [dbo].[UserBlobs]  WITH CHECK ADD  CONSTRAINT [FK_UserBlobs_Blobs] FOREIGN KEY([BlobId])
REFERENCES [dbo].[Blobs] ([Id])
GO
ALTER TABLE [dbo].[UserBlobs] CHECK CONSTRAINT [FK_UserBlobs_Blobs]
GO
ALTER TABLE [dbo].[UserBlobs]  WITH CHECK ADD  CONSTRAINT [FK_UserFiles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserBlobs] CHECK CONSTRAINT [FK_UserFiles_Users]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo_UserClaims_dbo_Users_User_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_dbo_UserClaims_dbo_Users_User_Id]
GO
ALTER TABLE [dbo].[UserEvents]  WITH CHECK ADD  CONSTRAINT [FK_UserEvents_Events] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[UserEvents] CHECK CONSTRAINT [FK_UserEvents_Events]
GO
ALTER TABLE [dbo].[UserEvents]  WITH CHECK ADD  CONSTRAINT [FK_UserEvents_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserEvents] CHECK CONSTRAINT [FK_UserEvents_Users]
GO
ALTER TABLE [dbo].[UserRealms]  WITH CHECK ADD  CONSTRAINT [FK_UserRealms_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRealms] CHECK CONSTRAINT [FK_UserRealms_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo_UserRoles_dbo_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo_UserRoles_dbo_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Blobs] FOREIGN KEY([PictureBlobId])
REFERENCES [dbo].[Blobs] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Blobs]
GO
/****** Object:  StoredProcedure [dbo].[AlertsInsert]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AlertsInsert]

	@Type tinyint,
	@Message nvarchar(max),
	@ActionUrl nvarchar(max) = null
	
AS
BEGIN

	INSERT INTO [Alerts]
	(
		[Type],
		[Message],
		[ActionUrl]
	)
	VALUES
	(
		@Type,
		@Message,
		@ActionUrl
	)

	SELECT SCOPE_IDENTITY() as Id
	
END


GO
/****** Object:  StoredProcedure [dbo].[AlertsSelect]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AlertsSelect]

	@UserId int = null,
	@AlertId int = null

AS
BEGIN

	DECLARE @AlertIds TABLE (AlertId int)

	INSERT INTO @AlertIds
		SELECT
			Id
		FROM 
			[Alerts] A
			INNER JOIN [UserAlerts] UA ON (UA.AlertId = A.Id)
		WHERE 
			A.IsDeleted = 0
			AND UA.UserId = CASE WHEN(@UserId IS NULL) THEN UA.UserId ELSE @UserId END
			AND A.Id = CASE WHEN(@AlertId IS NULL) THEN A.Id ELSE @AlertId END

	SELECT
		A.*
	FROM 
		Alerts A
	WHERE
		A.Id IN (SELECT AlertId FROM @AlertIds)
	ORDER BY
		A.Id

	SELECT
		UA.*
	FROM 
		[UserAlerts] UA
	WHERE 
		UA.[AlertId] IN (SELECT AlertId FROM @AlertIds)
					
END


GO
/****** Object:  StoredProcedure [dbo].[AlertsUpdate]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AlertsUpdate]

	@Id int,
	@Type tinyint,
	@Message nvarchar(max)
	
AS
BEGIN

	UPDATE
		[Alerts]
	SET
		[Type] = @Type,
		[Message] = @Message
	WHERE
		Id = @Id
	
END






GO
/****** Object:  StoredProcedure [dbo].[BlobsInsert]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BlobsInsert]

	@Id uniqueidentifier,
	@Folder nvarchar(10),
	@Extension nvarchar(10),
	@ContentType nvarchar(max),
	@ContentLength bigint,
	@SourceFileName nvarchar(max),
	@UTCCreated datetime2,
	@UserId int
	
AS
BEGIN

	INSERT INTO [Blobs]
	(
		[Id],
		[Folder],
		[Extension],
		[ContentType],
		[ContentLength],
		[SourceFileName],
		[UTCCreated]
	)
	VALUES
	(
		@Id,
		@Folder,
		@Extension,
		@ContentType,
		@ContentLength,
		@SourceFileName,
		@UTCCreated
	)
	
	-- INSERT BLOB x USER RELATION
		
	INSERT INTO [UserBlobs]
	(
		[UserId],
		[BlobId]
	)
	VALUES
	(
		@UserId,
		@Id
	)
	
END

GO
/****** Object:  StoredProcedure [dbo].[EventBlobsInsert]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EventBlobsInsert]

	@EventId int,
	@BlobId uniqueidentifier,
	@OrderIndex int,
	@Label nvarchar(75),
	@Description nvarchar(max)
	
AS
BEGIN

	INSERT INTO [EventBlobs]
	(
		[EventId],
		[BlobId],
		[OrderIndex],
		[Label],
		[Description]
	) 
	VALUES
	(
		@EventId, 
		@BlobId,
		@OrderIndex,
		@Label,
		@Description
	)
	
END




GO
/****** Object:  StoredProcedure [dbo].[EventsInsert]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EventsInsert]

	@Name nvarchar(175),
	@Color varchar(25),
	@StartDate datetimeoffset(7),
	@EndDate datetimeoffset(7),
	@Description nvarchar(max) = null,
	@TimeZoneId nvarchar(100),

	@UserId int = null
	
AS
BEGIN

	DECLARE @EventId int = 0

	--
	INSERT INTO [Events]
	(
		[Name],
		[Color],
		[StartDate],
		[EndDate],
		[Description],
		[TimeZoneId]
	)
	VALUES
	(
		@Name,
		@Color,
		@StartDate,
		@EndDate,
		@Description,
		@TimeZoneId
	)

	SET @EventId = SCOPE_IDENTITY()

	--
	IF (@UserId IS NOT NULL)
	BEGIN

		INSERT INTO [UserEvents]
		(
			UserId,
			EventId
		)
		VALUES
		(
			@UserId,
			@EventId
		)

	END

	SELECT @EventId AS Id
	
END




GO
/****** Object:  StoredProcedure [dbo].[EventsSelect]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EventsSelect]

	@UserId int = null,
	@EventId int = null

AS
BEGIN

	-- Returns a multi result set with the events related data

	DECLARE @EventIds TABLE (EventId int)

	INSERT INTO @EventIds
		SELECT
			Id
		FROM 
			[Events] E
			INNER JOIN [UserEvents] UE ON (UE.EventId = E.Id)
		WHERE 
			E.IsDeleted = 0
			AND UE.UserId = CASE WHEN(@UserId IS NULL) THEN UE.UserId ELSE @UserId END
			AND E.Id = CASE WHEN(@EventId IS NULL) THEN E.Id ELSE @EventId END

	-- Events query
	SELECT
		*
	FROM
		[Events] E
	WHERE
		E.Id IN (SELECT EventId FROM @EventIds)
	ORDER BY
		E.Id

	-- Event Images query
	SELECT
		B.*,
		EB.EventId,
		EB.[Label],
		EB.[Description]
	FROM 
		[Blobs] B 
		INNER JOIN [EventBlobs] EB ON (B.Id = EB.BlobId)
	WHERE 
		EB.[EventId] IN (SELECT EventId FROM @EventIds)
	ORDER BY 
		EB.OrderIndex
	
					
END




GO
/****** Object:  StoredProcedure [dbo].[EventsUpdate]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EventsUpdate]

	@Id int,
	@Name nvarchar(175),
	@Color varchar(25),
	@StartDate datetimeoffset(7),
	@EndDate datetimeoffset(7) = null,
	@Description nvarchar(max) = null,
	@TimeZoneId nvarchar(100)
	
AS
BEGIN

	UPDATE
		[Events]
	SET
		[Name] = @Name,
		[Color] = @Color,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[Description] = @Description,
		[TimeZoneId] = @TimeZoneId
	WHERE
		Id = @Id
	
END




GO
/****** Object:  StoredProcedure [dbo].[LogsInsert]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LogsInsert]

	@Type nvarchar(50),
	@Message nvarchar(max),
	@Properties nvarchar(max),
	@ActivityId uniqueidentifier = null
	
AS
BEGIN

	INSERT INTO [Logs]
	(
		[Type],
		[Message],
		[Properties],
		[ActivityId]
	)
	VALUES
	(
		@Type,
		@Message,
		@Properties,
		@ActivityId
	)
	
END


GO
/****** Object:  StoredProcedure [dbo].[LogsSelect]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LogsSelect]

	@Id int = null,
	@Top int = 1000

AS
BEGIN

	SELECT TOP(@Top)
		*
	FROM 
		[Logs] L
	WHERE
		L.Id = CASE WHEN(@Id IS NULL) THEN L.Id ELSE @Id END
	ORDER BY
		[UTCCreation] DESC
					
END


GO
/****** Object:  StoredProcedure [dbo].[UsersManagementInsert]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersManagementInsert]

	@LockoutEnabled bit,
	@EmailConfirmed bit,
	@PasswordHash nvarchar(max),
	@SecurityStamp nvarchar(max),
	@UserName nvarchar(256),
	@FullName nvarchar(256),
	@Email nvarchar(256)

AS
BEGIN

	-- USER
	INSERT INTO [Users]
	(
		[LockoutEnabled],
		[EmailConfirmed],
		[PasswordHash],
		[SecurityStamp],
		[UserName],
		[FullName],
		[Email]
	)
	VALUES
	(
		@LockoutEnabled,
		@EmailConfirmed,
		@PasswordHash,
		@SecurityStamp,
		@UserName,
		@FullName,
		@Email
	)

	SELECT SCOPE_IDENTITY() AS Id

END

GO
/****** Object:  StoredProcedure [dbo].[UsersManagementSelect]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersManagementSelect]

	@Id int = null,
	@Email nvarchar(256) = null,
	@UserName nvarchar(256) = null

AS
BEGIN

	DECLARE @UserIds TABLE (UserId int)

	INSERT INTO @UserIds
		SELECT
			Id
		FROM 
			[Users] U
		WHERE 
			U.Id = CASE WHEN(@Id IS NULL) THEN U.Id ELSE @Id END
			AND U.Email = CASE WHEN(@Email IS NULL) THEN U.Email ELSE @Email END
			AND U.UserName = CASE WHEN(@UserName IS NULL) THEN U.UserName ELSE @UserName END

	-- Users
	SELECT
		U.*,
		B.*
	FROM
		[Users] U
		LEFT JOIN Blobs B ON (B.Id = U.PictureBlobId)
	WHERE
		U.Id IN (SELECT UserId FROM @UserIds)
	ORDER BY
		U.Id

	-- Claims
	SELECT [UC].* FROM [UserClaims] [UC] WHERE [UC].UserId IN (SELECT UserId FROM @UserIds)

	-- Realms
	SELECT [URM].* FROM [UserRealms] [URM] WHERE [URM].UserId IN (SELECT UserId FROM @UserIds)

	-- Roles
	SELECT [URL].* FROM [UserRoles] [URL] WHERE [URL].UserId IN (SELECT UserId FROM @UserIds)
					
END

GO
/****** Object:  StoredProcedure [dbo].[UsersManagementUpdate]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersManagementUpdate]

	@Id int,
	@IsBlocked bit,
	@SecurityStamp nvarchar(max)
	
AS
BEGIN

	UPDATE
		[Users]
	SET
		[IsBlocked] = @IsBlocked,
		[SecurityStamp] = @SecurityStamp
	WHERE
		Id = @Id
	
END

GO
/****** Object:  StoredProcedure [dbo].[UsersWithAdminProfileInsert]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersWithAdminProfileInsert]

	@MobilePhone nvarchar(30),
	@LockoutEnabled bit,
	@TwoFactorEnabled bit,
	@MobilePhoneConfirmed bit,
	@LockoutEndDateUtc datetimeoffset,
	@AccessFailedCount tinyint,
	@EmailConfirmed bit,
	@PasswordHash nvarchar(max),
	@SecurityStamp nvarchar(max),
	@UserName nvarchar(256),
	@FullName nvarchar(256),
	@Email nvarchar(256),
	@CultureId nvarchar(10) = null,
	@UICultureId nvarchar(10) = null,
	@TimeZoneId nvarchar(100) = null

AS
BEGIN

	-- USER
	INSERT INTO [Users]
	(
		[MobilePhone],
		[LockoutEnabled],
		[TwoFactorEnabled],
		[MobilePhoneConfirmed],
		[LockoutEndDateUtc],
		[AccessFailedCount],
		[EmailConfirmed],
		[PasswordHash],
		[SecurityStamp],
		[UserName],
		[FullName],
		[Email],
		[CultureId],
		[UICultureId],
		[TimeZoneId]
	)
	VALUES
	(
		@MobilePhone,
		@LockoutEnabled,
		@TwoFactorEnabled,
		@MobilePhoneConfirmed,
		@LockoutEndDateUtc,
		@AccessFailedCount,
		@EmailConfirmed,
		@PasswordHash,
		@SecurityStamp,
		@UserName,
		@FullName,
		@Email,
		@CultureId,
		@UICultureId,
		@TimeZoneId
	)
	
	SELECT SCOPE_IDENTITY() AS Id

END

GO
/****** Object:  StoredProcedure [dbo].[UsersWithAdminProfileSelect]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersWithAdminProfileSelect]

	@Id int = null,
	@Email nvarchar(256) = null,
	@UserName nvarchar(256) = null

AS
BEGIN

	DECLARE @UserIds TABLE (UserId int)

	INSERT INTO @UserIds
		SELECT
			Id
		FROM 
			[Users] U
		WHERE 
			U.Id = CASE WHEN(@Id IS NULL) THEN U.Id ELSE @Id END
			AND U.Email = CASE WHEN(@Email IS NULL) THEN U.Email ELSE @Email END
			AND U.UserName = CASE WHEN(@UserName IS NULL) THEN U.UserName ELSE @UserName END

	-- Users
	SELECT
		U.*,
		B.*
	FROM
		[Users] U
		LEFT JOIN Blobs B ON (B.Id = U.PictureBlobId)
	WHERE
		U.Id IN (SELECT UserId FROM @UserIds)
	ORDER BY
		U.Id

	-- Claims
	SELECT [UC].* FROM [UserClaims] [UC] WHERE [UC].UserId IN (SELECT UserId FROM @UserIds)

	-- Realms
	SELECT [URM].* FROM [UserRealms] [URM] WHERE [URM].UserId IN (SELECT UserId FROM @UserIds)

	-- Roles
	SELECT [URL].* FROM [UserRoles] [URL] WHERE [URL].UserId IN (SELECT UserId FROM @UserIds)
					
END

GO
/****** Object:  StoredProcedure [dbo].[UsersWithAdminProfileUpdate]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersWithAdminProfileUpdate]

	@Id int,
	@UserName nvarchar(256),
	@FullName nvarchar(256),
	@Email nvarchar(256),
	@CultureId nvarchar(10),
	@UICultureId nvarchar(10),
	@TimeZoneId nvarchar(100),
	@ScreenAutoLockMinutes int,
	@PictureBlobId uniqueidentifier = null
	
AS
BEGIN

	UPDATE
		[Users]
	SET
		[UserName] = @UserName,
		[FullName] = @FullName,
		[Email] = @Email,
		[CultureId] = @CultureId,
		[UICultureId] = @UICultureId,
		[TimeZoneId] = @TimeZoneId,
		[PictureBlobId] = @PictureBlobId,
		[ScreenAutoLockMinutes] = @ScreenAutoLockMinutes
	WHERE
		Id = @Id
	
END

GO
/****** Object:  StoredProcedure [dbo].[UsersWithIdentityUpdate]    Script Date: 10/6/2017 7:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersWithIdentityUpdate]

	@Id int,
	@IsBlocked bit,
	@MobilePhone nvarchar(30),
	@LockoutEnabled bit,
	@TwoFactorEnabled bit,
	@MobilePhoneConfirmed bit,
	@LockoutEndDateUtc datetimeoffset,
	@AccessFailedCount tinyint,
	@EmailConfirmed bit,
	@PasswordHash nvarchar(max),
	@SecurityStamp nvarchar(max),
	@UserName nvarchar(256),
	@FullName nvarchar(256),
	@Email nvarchar(256)
	
AS
BEGIN

	UPDATE
		[Users]
	SET
		[IsBlocked] = @IsBlocked,
		[MobilePhone] = @MobilePhone,
		[LockoutEnabled] = @LockoutEnabled,
		[TwoFactorEnabled] = @TwoFactorEnabled,
		[MobilePhoneConfirmed] = @MobilePhoneConfirmed,
		[LockoutEndDateUtc] = @LockoutEndDateUtc,
		[AccessFailedCount] = @AccessFailedCount,
		[EmailConfirmed] = @EmailConfirmed,
		[PasswordHash] = @PasswordHash,
		[SecurityStamp] = @SecurityStamp,
		[UserName] = @UserName,
		[FullName] = @FullName,
		[Email] = @Email
	WHERE
		Id = @Id
	
END

GO
