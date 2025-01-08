USE [master]
GO
/****** Object:  Database [EMS]    Script Date: 1/8/2025 11:13:15 PM ******/
CREATE DATABASE [EMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EMS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EMS] SET  MULTI_USER 
GO
ALTER DATABASE [EMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [EMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EMS]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/8/2025 11:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[ManagerId] [uniqueidentifier] NOT NULL,
	[Budget] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[LastUpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/8/2025 11:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[LastUpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerformanceReview]    Script Date: 1/8/2025 11:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerformanceReview](
	[PerformanceReviewId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[ReviewDate] [date] NOT NULL,
	[ReviewScore] [int] NOT NULL,
	[ReviewNote] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[LastUpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_PerformanceReview] PRIMARY KEY CLUSTERED 
(
	[PerformanceReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ManagerId], [Budget], [CreatedAt], [LastUpdatedAt]) VALUES (N'502ecbf9-471f-40d8-ace1-13ad7b69a59f', N'dd', N'71e9ecdb-9f4a-45eb-b4b8-62cde1d55e45', CAST(323.00 AS Decimal(18, 2)), CAST(N'2025-01-07T22:13:04.743' AS DateTime), NULL)
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ManagerId], [Budget], [CreatedAt], [LastUpdatedAt]) VALUES (N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'Web Team', N'47f5ee65-ec7b-42b7-8be0-b47598bbc531', CAST(12.00 AS Decimal(18, 2)), CAST(N'2025-01-06T23:59:53.093' AS DateTime), NULL)
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ManagerId], [Budget], [CreatedAt], [LastUpdatedAt]) VALUES (N'26621df4-4882-4233-aab9-3c8aec51a33c', N'xx', N'954708f5-798b-4ebc-8d74-63b0e3c3bee6', CAST(213.00 AS Decimal(18, 2)), CAST(N'2025-01-07T22:06:33.070' AS DateTime), NULL)
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ManagerId], [Budget], [CreatedAt], [LastUpdatedAt]) VALUES (N'470a37e4-0ac7-4edd-a4cc-64eab26dd874', N'223', N'71e9ecdb-9f4a-45eb-b4b8-62cde1d55e45', CAST(3232.00 AS Decimal(18, 2)), CAST(N'2025-01-07T22:13:18.297' AS DateTime), NULL)
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ManagerId], [Budget], [CreatedAt], [LastUpdatedAt]) VALUES (N'9975f8b1-bfba-40a4-8745-beaa39afc0cb', N'App Dept', N'954708f5-798b-4ebc-8d74-63b0e3c3bee6', CAST(124.00 AS Decimal(18, 2)), CAST(N'2025-01-08T14:48:51.713' AS DateTime), CAST(N'2025-01-08T14:48:51.713' AS DateTime))
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ManagerId], [Budget], [CreatedAt], [LastUpdatedAt]) VALUES (N'b8a5bb3d-ff36-402c-b6ed-d5ada37a22cc', N'techub', N'954708f5-798b-4ebc-8d74-63b0e3c3bee6', CAST(7600.00 AS Decimal(18, 2)), CAST(N'2025-01-08T14:42:54.557' AS DateTime), CAST(N'2025-01-08T14:42:54.557' AS DateTime))
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'4b725682-6b4e-48c5-bb26-20ff5e3cb664', N'test1', N'qqq@gmail.com', N'1112233', N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'1121', CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0, CAST(N'2025-01-07T18:12:59.787' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'6bb7e450-5b72-4871-90c2-226392078f3a', N'Rafi Samnan', N'rafi@gmail.com', N'01934857332', N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'Software Engineer', CAST(N'2025-01-06T04:01:04.937' AS DateTime), 1, CAST(N'2025-01-06T04:01:04.937' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'188981f3-f96d-4d2b-bd5a-52906ee57439', N'Added', N'add@gmail.com', N'3233', N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'33', CAST(N'2025-01-08T00:00:00.000' AS DateTime), 0, CAST(N'2025-01-07T20:55:13.000' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'71e9ecdb-9f4a-45eb-b4b8-62cde1d55e45', N'qqq', N'qq@gmail.com', N'12345678901', N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'ee', CAST(N'2025-01-07T00:00:00.000' AS DateTime), 1, CAST(N'2025-01-07T17:42:36.250' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'954708f5-798b-4ebc-8d74-63b0e3c3bee6', N'ww22q', N'ww@gmail.com', N'2134', N'26621df4-4882-4233-aab9-3c8aec51a33c', N'1212', CAST(N'2025-01-08T00:00:00.000' AS DateTime), 1, CAST(N'2025-01-07T18:11:17.747' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'0fbf5a3f-5ff7-4cde-98ac-6b6e6a9eaba3', N'hhh', N'111@info.com', N'123324', N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'App', CAST(N'2025-01-09T00:00:00.000' AS DateTime), 1, CAST(N'2025-01-07T17:45:00.083' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'fe5f7704-3d81-4705-a7cd-8286b8b23944', N'Rafi2', N'rafi2@info.com', N'01934857332', N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'Software Engineer', CAST(N'2025-01-06T04:01:04.937' AS DateTime), 1, CAST(N'2025-01-06T04:01:04.937' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'03b942d9-0574-4372-b319-aa61909d99f0', N'Toast', N'toast@info.com', N'1223233', N'9975f8b1-bfba-40a4-8745-beaa39afc0cb', N'Developer', CAST(N'2025-01-07T00:00:00.000' AS DateTime), 1, CAST(N'2025-01-07T17:52:34.053' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'47f5ee65-ec7b-42b7-8be0-b47598bbc531', N'Rafi', N'rafi@info.com', N'01934857332', N'502ecbf9-471f-40d8-ace1-13ad7b69a59f', N'Software Engineer', CAST(N'2025-01-08T00:00:00.000' AS DateTime), 1, CAST(N'2025-01-06T04:01:04.937' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'ae959783-7496-4955-a52c-dfadc45efe20', N'qqq', N'www@gmail.com', N'11111', N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'111', CAST(N'2025-01-08T00:00:00.000' AS DateTime), 1, CAST(N'2025-01-07T18:13:30.143' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'e7ecd4c1-8bd8-4459-83f8-e9adefa2e20d', N'zzz', N'zz@gmail.com', N'121212', N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'111', CAST(N'2025-01-08T00:00:00.000' AS DateTime), 1, CAST(N'2025-01-07T18:09:34.087' AS DateTime), NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Phone], [DepartmentId], [Position], [JoiningDate], [Status], [CreatedAt], [LastUpdatedAt]) VALUES (N'e7484eb5-44d6-48ba-b158-f6e5ce9df5d9', N'BB', N'BB@gmail.com', N'111', N'a6ad4242-ff93-48e6-bed8-1d68ab05689c', N'11', CAST(N'2025-01-07T00:00:00.000' AS DateTime), 1, CAST(N'2025-01-07T17:56:55.770' AS DateTime), NULL)
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'09050ac9-6ac8-4f9d-b804-0cd9ee238cb6', N'188981f3-f96d-4d2b-bd5a-52906ee57439', CAST(N'2025-01-09' AS Date), 9, N'887', CAST(N'2025-01-08T00:41:19.623' AS DateTime), CAST(N'2025-01-08T00:41:19.623' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'edb9fd03-a3c6-4353-967e-126f23648df7', N'188981f3-f96d-4d2b-bd5a-52906ee57439', CAST(N'2025-01-15' AS Date), 7, N'6767', CAST(N'2025-01-08T00:44:09.643' AS DateTime), CAST(N'2025-01-08T00:44:09.643' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'193f3f2f-ad73-4f5c-93ee-140485c3f66b', N'6bb7e450-5b72-4871-90c2-226392078f3a', CAST(N'2025-01-09' AS Date), 10, N'Good', CAST(N'2025-01-08T00:34:06.910' AS DateTime), CAST(N'2025-01-08T00:34:06.910' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'35c4aff9-ba22-4c9e-b45b-1f1928e085fd', N'71e9ecdb-9f4a-45eb-b4b8-62cde1d55e45', CAST(N'2025-01-08' AS Date), 6, N'iok', CAST(N'2025-01-08T14:43:24.697' AS DateTime), CAST(N'2025-01-08T14:43:24.697' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'a95f718e-fbef-48df-8715-23cf0f18bd77', N'ae959783-7496-4955-a52c-dfadc45efe20', CAST(N'2025-01-23' AS Date), 8, N'789gjgh', CAST(N'2025-01-08T16:10:29.113' AS DateTime), CAST(N'2025-01-08T16:10:29.113' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'0348150c-d451-44df-9fff-57e793931247', N'e7484eb5-44d6-48ba-b158-f6e5ce9df5d9', CAST(N'2025-01-23' AS Date), 10, N'bbbbbbb', CAST(N'2025-01-08T16:06:43.403' AS DateTime), CAST(N'2025-01-08T16:06:43.403' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'1f0d6176-7f1d-4f10-87be-63e098de7e14', N'188981f3-f96d-4d2b-bd5a-52906ee57439', CAST(N'2025-01-09' AS Date), 9, N'www', CAST(N'2025-01-08T00:49:31.987' AS DateTime), CAST(N'2025-01-08T00:49:31.987' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'0890fb8c-6e2e-429d-b14c-83f1697c4cfa', N'03b942d9-0574-4372-b319-aa61909d99f0', CAST(N'2025-01-23' AS Date), 8, N'435345', CAST(N'2025-01-08T16:07:21.223' AS DateTime), CAST(N'2025-01-08T16:07:21.223' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'a892ce83-6fbc-4535-8cd7-9205ee86a5fb', N'188981f3-f96d-4d2b-bd5a-52906ee57439', CAST(N'2025-01-15' AS Date), 9, N'that''s good', CAST(N'2025-01-08T14:43:55.163' AS DateTime), CAST(N'2025-01-08T14:43:55.163' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'e784a31b-43e6-458a-b752-a17a5e3fdaaf', N'954708f5-798b-4ebc-8d74-63b0e3c3bee6', CAST(N'2025-01-10' AS Date), 10, N'101010', CAST(N'2025-01-08T16:06:30.587' AS DateTime), CAST(N'2025-01-08T16:06:30.587' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'a2b1b1b8-8ec7-40b5-a70c-b63852dca89c', N'188981f3-f96d-4d2b-bd5a-52906ee57439', CAST(N'2025-01-09' AS Date), 7, N'6767', CAST(N'2025-01-08T00:42:13.887' AS DateTime), CAST(N'2025-01-08T00:42:13.887' AS DateTime))
GO
INSERT [dbo].[PerformanceReview] ([PerformanceReviewId], [EmployeeId], [ReviewDate], [ReviewScore], [ReviewNote], [CreatedAt], [LastUpdatedAt]) VALUES (N'51883e67-95b2-4c00-a804-eafc43653b3c', N'fe5f7704-3d81-4705-a7cd-8286b8b23944', CAST(N'2025-01-15' AS Date), 9, N'mnmm', CAST(N'2025-01-08T14:45:36.490' AS DateTime), CAST(N'2025-01-08T14:45:36.490' AS DateTime))
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[PerformanceReview] ADD  CONSTRAINT [DF_PerformanceReview_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Employee] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Department_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Department_DepartmentId]
GO
ALTER TABLE [dbo].[PerformanceReview]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[PerformanceReview] CHECK CONSTRAINT [FK_Employee_EmployeeId]
GO
/****** Object:  StoredProcedure [dbo].[AveragePerformanceScore]    Script Date: 1/8/2025 11:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec AveragePerformanceScore 1 , 10
CREATE PROCEDURE [dbo].[AveragePerformanceScore] 
@page  int=1,
@per_page int=10
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT 
	COUNT(*) OVER() AS TotoalRecords,
    d.DepartmentName,
    AVG(pr.ReviewScore) AS AverageScore
FROM 
    Department d
INNER JOIN 
    Employee e ON d.DepartmentId = e.DepartmentId
INNER JOIN 
    PerformanceReview pr ON e.EmployeeId = pr.EmployeeId
GROUP BY 
    d.DepartmentName
ORDER BY 
    AverageScore DESC
OFFSET (@per_page*(@page-1)) ROWS  FETCH NEXT @per_page ROWS ONLY;

END
GO
USE [master]
GO
ALTER DATABASE [EMS] SET  READ_WRITE 
GO
