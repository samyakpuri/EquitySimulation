USE [master]
GO
/****** Object:  Database [External-Database]    Script Date: 6/22/2017 16:07:57 ******/
CREATE DATABASE [External-Database]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [External-Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [External-Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [External-Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [External-Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [External-Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [External-Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [External-Database] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [External-Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [External-Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [External-Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [External-Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [External-Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [External-Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [External-Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [External-Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [External-Database] SET  ENABLE_BROKER 
GO
ALTER DATABASE [External-Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [External-Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [External-Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [External-Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [External-Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [External-Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [External-Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [External-Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [External-Database] SET  MULTI_USER 
GO
ALTER DATABASE [External-Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [External-Database] SET DB_CHAINING OFF 
GO
USE [External-Database]
GO
/****** Object:  Table [dbo].[ServiceRequests]    Script Date: 6/22/2017 16:07:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[BlockID] [bigint] NOT NULL,
	[TraderID] [bigint] NOT NULL,
	[Symbol] [varchar](5) NOT NULL,
	[QtyRequested] [bigint] NOT NULL,
	[QtyAllocated] [bigint] NOT NULL,
	[Type] [varchar](15) NOT NULL,
	[Side] [varchar](5) NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ServiceRequests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/22/2017 16:07:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [smallint] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockDatas]    Script Date: 6/22/2017 16:07:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockDatas](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Symbol] [varchar](5) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[QuantityAvailable] [bigint] NOT NULL,
	[MarketPrice] [int] NOT NULL,
 CONSTRAINT [PK_StockDatas] PRIMARY KEY CLUSTERED 
(
	[Symbol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 6/22/2017 16:07:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [bigint] IDENTITY(1,1) NOT NULL,
	[BlockID] [bigint] NOT NULL,
	[TraderID] [bigint] NOT NULL,
	[Symbol] [varchar](5) NOT NULL,
	[QtyRequested] [bigint] NOT NULL,
	[QtyAllocated] [bigint] NOT NULL,
	[Type] [varchar](15) NOT NULL,
	[Side] [varchar](5) NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/22/2017 16:07:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Status] ON 
GO
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'PartiallyFilled')
GO
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Expired')
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[StockDatas] ON 
GO
INSERT [dbo].[StockDatas] ([ID], [Symbol], [Name], [QuantityAvailable], [MarketPrice]) VALUES (1, N'INFY', N'Infosys', 1000, 432)
GO
INSERT [dbo].[StockDatas] ([ID], [Symbol], [Name], [QuantityAvailable], [MarketPrice]) VALUES (3, N'ONG', N'ONGC', 1200, 280)
GO
INSERT [dbo].[StockDatas] ([ID], [Symbol], [Name], [QuantityAvailable], [MarketPrice]) VALUES (2, N'RIL', N'Reliance', 15000, 164)
GO
SET IDENTITY_INSERT [dbo].[StockDatas] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Name], [CreateDate]) VALUES (1, N'abc', N'123', N'ABC', CAST(N'2017-05-30T01:52:20.080' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Name], [CreateDate]) VALUES (2, N'suri', N'1234qwert', N'Suri', CAST(N'2017-05-30T01:53:13.373' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_FK_ServiceRequest_Status]    Script Date: 6/22/2017 16:07:57 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ServiceRequest_Status] ON [dbo].[ServiceRequests]
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_ServiceRequest_StockData]    Script Date: 6/22/2017 16:07:57 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ServiceRequest_StockData] ON [dbo].[ServiceRequests]
(
	[Symbol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Transactions_Status]    Script Date: 6/22/2017 16:07:57 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Transactions_Status] ON [dbo].[Transactions]
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Transactions_StockData]    Script Date: 6/22/2017 16:07:57 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Transactions_StockData] ON [dbo].[Transactions]
(
	[Symbol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServiceRequests]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[ServiceRequests] CHECK CONSTRAINT [FK_ServiceRequest_Status]
GO
ALTER TABLE [dbo].[ServiceRequests]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_StockData] FOREIGN KEY([Symbol])
REFERENCES [dbo].[StockDatas] ([Symbol])
GO
ALTER TABLE [dbo].[ServiceRequests] CHECK CONSTRAINT [FK_ServiceRequest_StockData]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Status]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_StockData] FOREIGN KEY([Symbol])
REFERENCES [dbo].[StockDatas] ([Symbol])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_StockData]
GO
USE [master]
GO
ALTER DATABASE [External-Database] SET  READ_WRITE 
GO
