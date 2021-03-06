USE [master]
GO
/****** Object:  Database [SES2]    Script Date: 22/03/2022 04:57:33 ******/
CREATE DATABASE [SES2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SES2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SES2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SES2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SES2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SES2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SES2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SES2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SES2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SES2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SES2] SET ARITHABORT OFF 
GO
ALTER DATABASE [SES2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SES2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SES2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SES2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SES2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SES2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SES2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SES2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SES2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SES2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SES2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SES2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SES2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SES2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SES2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SES2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SES2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SES2] SET RECOVERY FULL 
GO
ALTER DATABASE [SES2] SET  MULTI_USER 
GO
ALTER DATABASE [SES2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SES2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SES2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SES2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SES2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SES2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SES2', N'ON'
GO
ALTER DATABASE [SES2] SET QUERY_STORE = OFF
GO
USE [SES2]
GO
/****** Object:  Table [dbo].[Curr_Sub]    Script Date: 22/03/2022 04:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curr_Sub](
	[CurrID] [nvarchar](50) NOT NULL,
	[SubCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curriculum]    Script Date: 22/03/2022 04:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curriculum](
	[CurrID] [nvarchar](50) NOT NULL,
	[CurrName] [nvarchar](max) NOT NULL,
	[CurrDesc] [nvarchar](max) NULL,
	[TotalCredit] [int] NOT NULL,
 CONSTRAINT [PK_Curriculum] PRIMARY KEY CLUSTERED 
(
	[CurrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 22/03/2022 04:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialDesc] [nvarchar](max) NOT NULL,
	[SubCode] [nvarchar](50) NOT NULL,
	[ForTeacher] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 22/03/2022 04:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_User]    Script Date: 22/03/2022 04:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_User](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 22/03/2022 04:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessID] [int] NOT NULL,
	[Topic] [nvarchar](max) NULL,
	[SubCode] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 22/03/2022 04:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubCode] [nvarchar](50) NOT NULL,
	[SubName] [nvarchar](50) NOT NULL,
	[SubDesc] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubNeedToLearn]    Script Date: 22/03/2022 04:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubNeedToLearn](
	[PreRequitesite] [nvarchar](50) NULL,
	[SubCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22/03/2022 04:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'MLN111')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'MLN131')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'HCM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'VNR202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'SYB302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'SSG103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'SSL101c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'ITA203c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'MLN111')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'MLN122')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'MLN131')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'HCM202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'VNR202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'SYB302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'SSG103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'SSL101c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'ENW492c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'JPD113')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'JPD123')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_GD', N'OJT202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'VOV114')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'CEA201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'CSI104')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'MAE101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'PFP191')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'PRF192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'SSL101c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'VOV124')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'MAD101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'NWC203c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'OSG202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'PRO192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'SSG103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'VOV134')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'CSD201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'DBI202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'JPD113')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'LAB211')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'PRP201c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'AIG201c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'IOT102')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'JPD123')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'MAI391')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'MAS291')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'AIL302m')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'AIP391')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'CSD301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'DGT301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'ITE302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'OJT202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'SYB302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'ENW492c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'IMP301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'NLP301c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'MLN111')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'MLN122')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'PMG202c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'AIP490')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'HCM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'MLN131')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_AI', N'VNR202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'VOV114')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'CEA201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'CSI104')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'MAE101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'PRF192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'SSL101c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'VOV124')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'MAD101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'NWC203c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'OSG202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'PRO192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'SSG103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'VOV134')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'CSD201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'DBI202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'IAO201c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'JPD113')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'LAB211')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'IOT102')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'ITE302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'JPD123')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'MAS291')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'OSP201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'CRY303c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'FRS301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'IAA202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'IAM302')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'OJT202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'SYB302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'ENW492c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'HOD401')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'IAP301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'MLN111')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'MLN122')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'PMG202c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'HCM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'IAP491')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'IAR401')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'MLN131')
GO
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IA', N'VNR202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'VOV114')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'CEA201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'CSI104')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'MAE101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'PRF192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'SSL101c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'VOV124')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'MAD101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'NWC203c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'OSG202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'PRO192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'SSG103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'VOV134')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'CSD201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'DBI202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'JPD113')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'LAB211')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'WED201c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'IOT102')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'JPD123')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'MAS291')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'PRJ301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'SWE201c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'ITE302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'PRN211')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'SWP391')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'SWR302')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'SWT301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'OJT202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'SYB302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'ENW492c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'PRM391')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'PRN221')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'PRU211c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'SWD391')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'MLN111')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'MLN122')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'PMG202c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'WDU203c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'HCM202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'MLN131')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'SEP490')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_SE', N'VNR202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'VOV114')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'CEA201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'CSI104')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'MAE101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'PRF192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'SSL101c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'VOV124')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'MAD101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'NWC203c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'OSG202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'PRO192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'SSG103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'VOV134')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'CSD201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'DBI202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'ITA203c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'JPD113')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'LAB211')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'IOT102')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'ITA301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'JPD123')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'MAS291')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'SWE201c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'DBD301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'ISM301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'ISP391')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'ITE302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'PRJ301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'OJT202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'SYB302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'ENW492c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'ISC301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'ITB301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'MLN111')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'MLN122')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'PMG202c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'HCM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'ISP490')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'MLN131')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IS', N'VNR202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'VOV114')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'CEA201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'CSI104')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'MAE101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'PRF192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'SSL101c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'VOV124')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'MAD101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'NWC203c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'OSG202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'PRO192')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'SSG103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'VOV134')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'CSD201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'DBI202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'JPD113')
GO
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'LAB211')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'IOT102')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'JPD123')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'MAS291')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'PRJ301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'SWE201c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'ESP301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'IOP391')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'ITE302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'MCP301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'PRC391')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'OJT202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'SYB302c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'BDP301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'ENW492c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'PRM391')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'MLN111')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'MLN122')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'PMG202c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'HCM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'IOP490')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'MLN131')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'VNR202')
GO
INSERT [dbo].[Curriculum] ([CurrID], [CurrName], [CurrDesc], [TotalCredit]) VALUES (N'BBA_MKT', N'Business Administration_Marketing', N'<p>Curriculum for Bachelor of Business Administration - Marketing, applied for intakes 15D and after, from SP2021.<br />
Chương tr&igrave;nh đ&agrave;o tạo cử nh&acirc;n ng&agrave;nh Quản trị Kinh doanh - Marketing, &aacute;p dụng cho K15D v&agrave; c&aacute;c kh&oacute;a tiếp theo, từ kỳ SP2021.<br />
<br />
The objective of the Bachelor of Business Administration &ndash; Marketing program of FPT University is to train students into specialists in marketing management, managers, and entrepreneurs. Students will be equipped with all essential knowledge and skills to work in the field of marketing and in an international working environment, or to continue into the next higher level of education.<br />
<br />
The program consists of four main modules:<br />
&bull; General knowledge and skills (12 subjects &ndash; 32 credits): Provide the general knowledge of political, cultural and social issues, and all essential skills to study and work in an active and changing environment.<br />
&bull; Major knowledge and skills (16 subjects &ndash; 55 credits): Provide the basic knowledge of the business administration major; and all essential skills and attitudes to become specialists in the business administration field.<br />
&bull; Specialized knowledge and skills (10 subjects &ndash; 37 credits): Provide the general knowledge of marketing, including behavior, services, integrated marketing, branding, and marketing in the internet era. Equip students with all the tools for marketing, selling, brand developing activities, and independent research in marketing field.<br />
&bull; Elective combo (5 subjects &ndash; 15 credits for each combo): Provide in-depth knowledge and skills in two minors: Digital marketing tools and Brand and event management.<br />
<br />
Upon graduation, students can build their career in the fields of digital marketing, market research, advertising and public relations, event organizing, sales, marketing management, and start-up.<br />
<br />
Mục ti&ecirc;u tổng thể của chương tr&igrave;nh cử nh&acirc;n Quản trị Kinh doanh (QTKD) Trường Đại học FPT nhằm đ&agrave;o tạo người học th&agrave;nh c&aacute;c nh&agrave; chuy&ecirc;n m&ocirc;n trong c&aacute;c lĩnh vực quản trị kinh doanh, nh&agrave; quản l&yacute;, doanh nh&acirc;n tiềm năng năng động v&agrave; s&aacute;ng tạo l&agrave;m việc được trong m&ocirc;i trường quốc tế, tạo tiền đề cho việc học tập, nghi&ecirc;n cứu ở bậc học cao hơn.<br />
<br />
<br />
Chương tr&igrave;nh bao gồm bốn khối kiến thức lớn:<br />
&bull; Kiến thức kỹ năng chung (12 m&ocirc;n &ndash; 32 t&iacute;n chỉ): Cung cấp cho người học c&aacute;c kiến thức chung về ch&iacute;nh trị, văn h&oacute;a, x&atilde; hội; v&agrave; c&aacute;c kỹ năng cần thiết để học tập v&agrave; l&agrave;m việc trong m&ocirc;i trường năng động lu&ocirc;n thay đổi.<br />
&bull; Kiến thức kỹ năng ng&agrave;nh (16 m&ocirc;n &ndash; 55 t&iacute;n chỉ): Cung cấp c&aacute;c kiến thức cơ sở ng&agrave;nh quản trị kinh doanh; c&aacute;c kỹ năng v&agrave; th&aacute;i độ cần thiết để trở th&agrave;nh c&aacute;c nh&agrave; chuy&ecirc;n m&ocirc;n trong lĩnh vực quản trị kinh doanh.<br />
&bull; Kiến thức kỹ năng chuy&ecirc;n ng&agrave;nh (10 m&ocirc;n &ndash; 37 t&iacute;n chỉ): Cung cấp c&aacute;c kiến thức chung về c&aacute;c lĩnh vực marketing gồm h&agrave;nh vi, dịch vụ, marketing t&iacute;ch hợp, thương hiệu v&agrave; marketing thời đại internet. Trang bị cho người học c&aacute;c c&ocirc;ng cụ phục vụ hoạt động marketing, b&aacute;n h&agrave;ng, ph&aacute;t triển thương hiệu, v&agrave; nghi&ecirc;n cứu độc lập trong lĩnh vực marketing.<br />
&bull; Lựa chọn (5 m&ocirc;n &ndash; 15 t&iacute;n chỉ cho mỗi lựa chọn): Cung cấp c&aacute;c kiến thức v&agrave; kỹ năng chuy&ecirc;n s&acirc;u về hai lĩnh vực: C&ocirc;ng cụ marketing số v&agrave; quản trị thương hiệu v&agrave; sự kiện.<br />
<br />
Sau khi tốt nghiệp, sinh vi&ecirc;n c&oacute; thể l&agrave;m việc trong c&aacute;c lĩnh vực về marketing số, nghi&ecirc;n cứu thị trường, quảng c&aacute;o v&agrave; quan hệ c&ocirc;ng ch&uacute;ng, tổ chức sự kiện, b&aacute;n h&agrave;ng, c&aacute;c vị tr&iacute; quản trị về marketing, v&agrave; khởi nghiệp.</p>
', 155)
INSERT [dbo].[Curriculum] ([CurrID], [CurrName], [CurrDesc], [TotalCredit]) VALUES (N'BIT_AI', N'Artificial intelligence', N'<p>1. Training Objectives<br />
1.1 General objective:<br />
Training Information Technology (IT)/Artificial Intelligence (AI) specialty engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implement and promote the creativity in jobs related to the trained specialties as well as pursue further education and research.<br />
The training program aims to:<br />
a) To equip students with fundamental knowledge of mathematics and the IT industry together with fundamental and specialized methodologies, technologies related to AI and Data science;<br />
b) Train students the necessary virtues and skills in the professional working environment, know how to apply specialized knowledge of AI specialty into practical work<br />
c) Provide students with a strong foundation in foreign languages, science, culture and society, promoting their autonomy and creativity in study, work and life<br />
1.2 Specific objectives:<br />
Graduates of the IT training program/AI specialty must demonstrate the following:<br />
PO1. Having basic knowledge of social sciences, politics and law, security and defense, foundational knowledge of the IT industry &amp; in-depth knowledge of the specialized training: techniques, methods, technologies, in-depth application areas; development trends in the world; at the same time understand the overall market, context, functions and tasks of the professions in the specialized training.<br />
PO2. Be able to work as a full member of a professional team in the field of training: participate in designing, selecting techniques and technologies in line with development trends, solving technical problems; understand technology trends and user requirements; can do the complete solution development plan; performance management and change management in his or her part of the job; understand state policies in specialized fields.<br />
PO3. Mastering professional skills and soft skills of 21st century citizens (thinking skills, work skills, skills in using work tools, life skills in a global society);<br />
PO4. Can use English well in study and work and a second foreign language in normal communication.<br />
PO5. Honesty, high discipline in study and work, know how to work effectively in groups; know how to behave culturally at work and in society; dynamic, creative and willing to learn constantly. Demonstrate professional attitude and behavior with the ability to conceive of ideas, design, implement and operate systems in the context of corporation and society.<br />
Job positions after graduation<br />
Graduates of the AI specialty have diverse job opportunities with a number of typical positions such as:<br />
✔ AI application development engineer;<br />
✔ Automation system operation and robot development engineer;<br />
✔ Data architect;<br />
✔ AI lecturers at universities;<br />
✔ Researchers in the Artificial Intelligence field;<br />
✔ Experts in consulting solutions to AI application in production and business;<br />
✔ Pursue further education after graduating;<br />
✔ Start-up.<br />
<br />
2. Program Learning Outcomes<br />
<br />
3. Volume of learning of the course: 145 credits, excluding Preparation English, Military Training, compulsory and elective training activities.<br />
<br />
4. Enrollment object<br />
✔ In accordance with regulations on formal university enrollment; college enrollment of the Ministry of Education and Training.<br />
✔ In accordance with regulations on enrollment of FPT university.<br />
<br />
5. Training process, graduating conditions<br />
✔ In accordance with regulations on formal university and college training of the Ministry of Education and Training.<br />
✔ In accordance with regulations on training of FPT University.<br />
<br />
6. Evaluation method<br />
✔ In accordance with regulations on examination and assessment in the training regulations of FPT University.<br />
<br />
1. Mục ti&ecirc;u đ&agrave;o tạo<br />
1.1. Mục ti&ecirc;u chung:<br />
Đ&agrave;o tạo kỹ sư ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin (CNTT) chuy&ecirc;n ng&agrave;nh Tr&iacute; tuệ nh&acirc;n tạo (TTNT) c&oacute; nh&acirc;n c&aacute;ch v&agrave; năng lực đ&aacute;p ứng nhu cầu thực tế của x&atilde; hội, nắm vững kiến thức chuy&ecirc;n m&ocirc;n v&agrave; thực h&agrave;nh, c&oacute; khả năng tổ chức, thực hiện v&agrave; ph&aacute;t huy s&aacute;ng tạo trong c&aacute;c c&ocirc;ng việc li&ecirc;n quan đến lĩnh vực TTNT, c&oacute; khả năng theo đuổi việc học tập, nghi&ecirc;n cứu ở bậc học cao hơn.<br />
Chương tr&igrave;nh đ&agrave;o tạo nhằm:<br />
a) Trang bị cho sinh vi&ecirc;n kiến thức cơ bản về to&aacute;n học v&agrave; CNTT c&ugrave;ng c&aacute;c phương ph&aacute;p luận, c&ocirc;ng nghệ nền tảng v&agrave; chuy&ecirc;n s&acirc;u về TTNT, Khoa học dữ liệu (KHDL);<br />
b) R&egrave;n luyện cho sinh vi&ecirc;n những đức t&iacute;nh, kỹ năng cần thiết qua m&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp, biết vận dụng c&aacute;c kiến thức chuy&ecirc;n ng&agrave;nh TTNT v&agrave;o c&ocirc;ng việc thực tế;<br />
c) Cung cấp cho sinh vi&ecirc;n một nền tảng vững chắc về ngoại ngữ, khoa học, văn h&oacute;a, x&atilde; hội, ph&aacute;t huy t&iacute;nh chủ động, s&aacute;ng tạo trong học tập, c&ocirc;ng việc v&agrave; cuộc sống.<br />
1.2. Mục ti&ecirc;u cụ thể:<br />
Sinh vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo ng&agrave;nh CNTT chuy&ecirc;n ng&agrave;nh TTNT phải thể hiện được những điều sau đ&acirc;y:<br />
PO1. C&oacute; kiến thức cơ bản về khoa học x&atilde; hội, ch&iacute;nh trị ph&aacute;p luật, an ninh quốc ph&ograve;ng, kiến thức nền tảng của ng&agrave;nh CNTT &amp; kiến thức chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: kỹ thuật, phương ph&aacute;p, c&ocirc;ng nghệ, c&aacute;c lĩnh vực ứng dụng chuy&ecirc;n s&acirc;u; xu hướng ph&aacute;t triển tr&ecirc;n thế giới; đồng thời hiểu biết tổng thể thị trường, bối cảnh, chức năng, nhiệm vụ của c&aacute;c ng&agrave;nh nghề thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo.<br />
PO2. C&oacute; thể l&agrave;m việc được như một th&agrave;nh vi&ecirc;n ch&iacute;nh thức trong nh&oacute;m chuy&ecirc;n m&ocirc;n thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: tham gia thiết kế, lựa chọn kỹ thuật v&agrave; c&ocirc;ng nghệ ph&ugrave; hợp với xu hướng ph&aacute;t triển, giải quyết c&aacute;c vấn đề kỹ thuật; nắm được xu hướng c&ocirc;ng nghệ v&agrave; y&ecirc;u cầu người d&ugrave;ng; c&oacute; thể l&agrave;m kế hoạch ph&aacute;t triển ho&agrave;n thiện giải ph&aacute;p; quản l&yacute; thực hiện v&agrave; quản l&yacute; thay đổi trong phần c&ocirc;ng việc của m&igrave;nh; hiểu được c&aacute;c ch&iacute;nh s&aacute;ch nh&agrave; nước về lĩnh vực chuy&ecirc;n ng&agrave;nh.<br />
PO3. Th&agrave;nh thạo được c&aacute;c kỹ năng nghề nghiệp v&agrave; c&aacute;c kỹ năng mềm của c&ocirc;ng d&acirc;n thế kỷ 21 (kỹ năng tư duy, kỹ năng l&agrave;m việc, kỹ năng sử dụng c&aacute;c c&ocirc;ng cụ l&agrave;m việc, kỹ năng sống trong x&atilde; hội to&agrave;n cầu);<br />
PO4. Sử dụng được tốt tiếng Anh trong học tập v&agrave; c&ocirc;ng việc v&agrave; một ngoại ngữ thứ hai trong giao tiếp th&ocirc;ng thường.<br />
PO5. Trung thực, kỷ luật cao trong học tập v&agrave; c&ocirc;ng việc, biết l&agrave;m việc nh&oacute;m một c&aacute;ch hiệu quả; biết ứng xử văn h&oacute;a trong c&ocirc;ng việc v&agrave; x&atilde; hội; năng động, s&aacute;ng tạo v&agrave; c&oacute; &yacute; ch&iacute; học tập kh&ocirc;ng ngừng. Thể hiện th&aacute;i độ v&agrave; h&agrave;nh vi chuy&ecirc;n nghiệp với năng lực h&igrave;nh th&agrave;nh &yacute; tưởng, thiết kế, thực hiện v&agrave; vận h&agrave;nh hệ thống trong bối cảnh doanh nghiệp v&agrave; x&atilde; hội.<br />
1.3. Vị tr&iacute; việc l&agrave;m sau khi tốt nghiệp:<br />
Sinh vi&ecirc;n tốt nghiệp chuy&ecirc;n ng&agrave;nh Tr&iacute; tuệ nh&acirc;n tạo c&oacute; cơ hội việc l&agrave;m đa dạng với một số vị tr&iacute; điển h&igrave;nh như:<br />
✔ Kỹ sư ph&aacute;t triển ứng dụng TTNT;<br />
✔ Kỹ sư ph&aacute;t triển vận h&agrave;nh hệ thống tự động h&oacute;a/Robot ứng dụng TTNT;<br />
✔ Kiến tr&uacute;c sư dữ liệu;<br />
✔ Giảng vi&ecirc;n giảng dạy AI tại c&aacute;c trường đại học;<br />
✔ Chuy&ecirc;n gia nghi&ecirc;n cứu về AI trong c&aacute;c viện nghi&ecirc;n cứu;<br />
✔ Chuy&ecirc;n gia tư vấn giải ph&aacute;p ứng dụng TTNT trong sản xuất kinh doanh;<br />
✔ Tiếp tục c&aacute;c chương tr&igrave;nh học tập sau đại học;<br />
✔ Khởi nghiệp.<br />
<br />
2. Chuẩn đầu ra<br />
<br />
3. Khối lượng kiến thức to&agrave;n kh&oacute;a<br />
<br />
4. Đối tượng tuyển sinh<br />
✔ Theo quy chế tuyển sinh đại học, cao đẳng hệ ch&iacute;nh quy của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo.<br />
✔ Theo quy chế tuyển sinh của trường Đại học FPT.<br />
<br />
5. Quy tr&igrave;nh đ&agrave;o tạo, điều kiện tốt nghiệp<br />
✔ Thực hiện theo quy chế đ&agrave;o tạo đại học, cao đẳng hệ ch&iacute;nh quy của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo.<br />
✔ Theo quy chế đ&agrave;o tạo của trường Đại học FPT.<br />
<br />
6. C&aacute;ch thức đ&aacute;nh gi&aacute;<br />
✔ Theo quy định về kiểm tra v&agrave; đ&aacute;nh gi&aacute; học phần trong quy chế đ&agrave;o tạo của trường Đại học FPT.</p>
', 148)
INSERT [dbo].[Curriculum] ([CurrID], [CurrName], [CurrDesc], [TotalCredit]) VALUES (N'BIT_GD', N'Bachelor Program of Information Technology, Digital Art & Design Major', N'<p>1. Training Objectives<br />
General objective: Training Bachelor of Information Technology, Digital Art &amp; Design specialty with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implement and promote the creativity in jobs related to the trained specialty, being able to work in the international environment, and laying the foundation to pursue further study and research in Digital Art &amp; Design.<br />
Specific objectives:<br />
PO1: Develop physically, mentally, intellectually, morally and deepen national pride by equipping students with general knowledge of politics, law, economy, society, physical education, music and national defense education.<br />
PO2: Provide students with fundamental knowledge of the IT industry as well as methodologies and in-depth technologies of the Digital Art &amp; Design major.<br />
PO3: Help students use modern digital-oriented tools, equipment and softwares proficiently. Train students to flexibly apply knowledge and skills in the visual arts and come up with effective and appropriate visual communication solutions.<br />
PO4: Shape the right attitudes and work ethics, abilities to think creatively, work well in groups and independently and abilities to solve problems related to digital art and design effectively, and be capable of lifelong learning for personal and professional development.<br />
PO5: Help students use English fluently and a second language at a basic level.<br />
Job positions after graduation:<br />
Graduates of the Digital Art &amp; Design major can take charge of the following position:<br />
- Designer of the company, the design dew, advertising agencies, marketing, television, games (games).<br />
- Expert 2D, 3D, visual effects, sound effects.<br />
- User experience design experts.<br />
- Design team leader.<br />
- Creative director.<br />
- Researchers / Lecturers / Postgraduates: can carry out research activities in centers that conduct research in the field of digital art and design.<br />
1. Mục ti&ecirc;u đ&agrave;o tạo<br />
Mục ti&ecirc;u chung: Đ&agrave;o tạo cử nh&acirc;n ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin (CNTT), chuy&ecirc;n ng&agrave;nh Thiết kế mỹ thuật số c&oacute; nh&acirc;n c&aacute;ch v&agrave; năng lực đ&aacute;p ứng nhu cầu thực tế của x&atilde; hội, nắm vững kiến thức chuy&ecirc;n m&ocirc;n v&agrave; thực h&agrave;nh, c&oacute; khả năng tổ chức, thực hiện v&agrave; ph&aacute;t huy s&aacute;ng tạo trong c&aacute;c c&ocirc;ng việc li&ecirc;n quan đến chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo, l&agrave;m việc được trong m&ocirc;i trường quốc tế, tạo tiền đề cho việc học tập, nghi&ecirc;n cứu ở bậc học cao hơn về chuy&ecirc;n ng&agrave;nh TKMTS.<br />
Mục ti&ecirc;u cụ thể:<br />
PO1: Ph&aacute;t triển về thể chất, tinh thần, tr&iacute; tuệ, nh&acirc;n sinh quan, l&ograve;ng tự h&agrave;o d&acirc;n tộc th&ocirc;ng qua trang bị cho người học những kiến thức tổng qu&aacute;t về l&yacute; luận ch&iacute;nh trị, ph&aacute;p luật, kinh tế, x&atilde; hội, gi&aacute;o dục thể chất, &acirc;m nhạc, gi&aacute;o dục quốc ph&ograve;ng.<br />
PO2: Cung cấp cho người học những kiến thức cơ bản của ng&agrave;nh c&ugrave;ng c&aacute;c phương ph&aacute;p luận, c&ocirc;ng nghệ nền tảng v&agrave; chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh Thiết kế mỹ thuật số.<br />
PO3: Gi&uacute;p người học sử dụng th&agrave;nh thạo c&aacute;c c&ocirc;ng cụ, thiết bị, phần mềm hiện đại theo định hướng kỹ thuật số. Đồng thời, ứng dụng linh hoạt kiến thức, kỹ năng về nghệ thuật thị gi&aacute;c, đưa ra giải ph&aacute;p truyền th&ocirc;ng thị gi&aacute;c hiệu quả v&agrave; ph&ugrave; hợp với thời đại.<br />
PO4: H&igrave;nh th&agrave;nh cho người học th&aacute;i độ v&agrave; đạo đức nghề nghiệp đ&uacute;ng đắn, c&oacute; khả năng tư duy s&aacute;ng tạo, l&agrave;m việc nh&oacute;m, l&agrave;m việc độc lập v&agrave; c&oacute; năng lực giải quyết c&aacute;c vấn đề li&ecirc;n quan tới thiết kế mỹ thuật số một c&aacute;ch hiệu quả, c&oacute; khả năng tự học tập suốt đời để ph&aacute;t triển bản th&acirc;n v&agrave; c&ocirc;ng việc,<br />
PO5: Gi&uacute;p người học sử dụng th&agrave;nh thạo tiếng Anh v&agrave; một ngoại ngữ hai ở mức cơ bản.<br />
Vị tr&iacute; việc l&agrave;m sau khi tốt nghiệp:<br />
Sinh vi&ecirc;n tốt nghiệp chuy&ecirc;n ng&agrave;nh Thiết kế Mỹ thuật số c&oacute; th&ecirc;̉ đảm nhi&ecirc;̣m m&ocirc;̣t s&ocirc;́ c&ocirc;ng vi&ecirc;̣c sau:<br />
- Họa sĩ thi&ecirc;́t k&ecirc;́ trong các c&ocirc;ng ty, các xưởng thi&ecirc;́t k&ecirc;́, c&ocirc;ng ty quảng cáo, marketing, truy&ecirc;̀n hình, trò chơi (game).<br />
- Chuy&ecirc;n gia 2D, 3D, hi&ecirc;̣u ứng hình ảnh, &acirc;m thanh.<br />
- Chuy&ecirc;n gia thiết kế trải nghiệm người d&ugrave;ng (UX).<br />
- Trưởng nhóm thi&ecirc;́t k&ecirc;́.<br />
- Giám đ&ocirc;́c sáng tạo.<br />
- Nghi&ecirc;n cứu vi&ecirc;n/ Giảng vi&ecirc;n/ học sau đại học: C&oacute; thể thực hiện nhiệm vụ nghi&ecirc;n cứu tại c&aacute;c trung t&acirc;m, đơn vị c&oacute; nghi&ecirc;n cứu về lĩnh vực TKMTS.</p>
', 146)
INSERT [dbo].[Curriculum] ([CurrID], [CurrName], [CurrDesc], [TotalCredit]) VALUES (N'BIT_IA', N'Information Assurance', N'<p>1. TRAINING OBJECTIVES<br />
<br />
1.1 General objectives:<br />
<br />
Training Information Technology (IT) engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implement and promote the creativity in jobs related to the trained specialties.<br />
The training program aims to:<br />
a) To equip students with fundamental knowledge of the IT industry together with fundamental and specialized methodologies, technologies related to the trained specialties;<br />
b) Train students the necessary virtues and skills in the professional working environment, know how to apply fundamental knowledge and specialized knowledge into practical work;<br />
c) Provide students with a strong foundation in foreign languages, science, culture and society, promoting their autonomy and creativity in study, work and life.<br />
<br />
1.2 Specific objectives:<br />
<br />
Graduates of an IT training program must demonstrate the following:<br />
<br />
PO1. Having basic knowledge of social sciences, politics and law, security and defense, foundational knowledge of the IT industry &amp; in-depth knowledge of specialized training: techniques, methods, technologies, in-depth application areas; development trends in the world; at the same time understand the overall market, context, functions and tasks of the professions in the specialized training.<br />
PO2. Be able to work as a full member of a professional team in the field of training: participate in designing, selecting techniques and technologies in line with development trends, solving technical problems; understand technology trends and user requirements; can do the complete solution development plan; performance management and change management in his or her part of the job; Understand state policies in specialized fields.<br />
PO3. Mastering professional skills and soft skills of 21st century citizens (thinking skills, work skills, skills in using work tools, life skills in a global society);<br />
PO4. Can use English well in study and work and a second foreign language in normal communication.<br />
PO5. Honesty, high discipline in study and work, know how to work effectively in groups; know how to behave culturally at work and in society; Dynamic, creative and willing to learn constantly. Demonstrate professional attitude and behavior with the ability to conceive of ideas, design, implement and operate systems in corporate and social contexts.<br />
<br />
- Job placement after graduation:<br />
Information security graduates can work with some typical job positions such as:<br />
+ Network security and database management experts<br />
+ Experts specialing in checking, assessing information security for networks and systems<br />
+ Experts specialing in reviewing vulnerabilities, weaknesses and handling information security incidents<br />
+ Application developers, programmers ensuring information security<br />
+ Analysts, consultants, designers of information system<br />
<br />
1. MỤC TI&Ecirc;U Đ&Agrave;O TẠO<br />
<br />
1.1 Mục ti&ecirc;u chung:<br />
<br />
Đ&agrave;o tạo kỹ sư ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin (CNTT) c&oacute; nh&acirc;n c&aacute;ch v&agrave; năng lực đ&aacute;p ứng nhu cầu thực tế của x&atilde; hội, nắm vững kiến thức chuy&ecirc;n m&ocirc;n v&agrave; thực h&agrave;nh, c&oacute; khả năng tổ chức, thực hiện v&agrave; ph&aacute;t huy s&aacute;ng tạo trong c&aacute;c c&ocirc;ng việc li&ecirc;n quan đến c&aacute;c chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo (Kỹ thuật phần mềm (KTPM), Hệ thống th&ocirc;ng tin (HTTT), An to&agrave;n th&ocirc;ng tin (ATTT), Internet vạn vật (IoT), Tr&iacute; tuệ nh&acirc;n tạo (TTNT).<br />
Chương tr&igrave;nh đ&agrave;o tạo nhằm:<br />
a) Trang bị cho sinh vi&ecirc;n kiến thức cơ bản của ng&agrave;nh CNTT c&ugrave;ng c&aacute;c phương ph&aacute;p luận, c&ocirc;ng nghệ nền tảng v&agrave; chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh;<br />
b) R&egrave;n luyện cho sinh vi&ecirc;n những đức t&iacute;nh, kỹ năng cần thiết qua m&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp, biết vận dụng c&aacute;c kiến thức ng&agrave;nh CNTT v&agrave; c&aacute;c kiến thức chuy&ecirc;n ng&agrave;nh v&agrave;o c&ocirc;ng việc thực tế;<br />
c) Cung cấp cho sinh vi&ecirc;n một nền tảng vững chắc về ngoại ngữ, khoa học, văn h&oacute;a, x&atilde; hội, ph&aacute;t huy t&iacute;nh chủ động, s&aacute;ng tạo trong học tập, c&ocirc;ng việc v&agrave; cuộc sống.<br />
<br />
1.2 Mục ti&ecirc;u cụ thể:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo CNTT phải thể hiện được những điều sau đ&acirc;y:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo CNTT phải thể hiện được những điều sau đ&acirc;y:<br />
PO1. C&oacute; kiến thức cơ bản về khoa học x&atilde; hội, ch&iacute;nh trị ph&aacute;p luật, an ninh quốc ph&ograve;ng, kiến thức nền tảng của ng&agrave;nh CNTT &amp; kiến thức chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: kỹ thuật, phương ph&aacute;p, c&ocirc;ng nghệ, c&aacute;c lĩnh vực ứng dụng chuy&ecirc;n s&acirc;u; xu hướng ph&aacute;t triển tr&ecirc;n thế giới; đồng thời hiểu biết tổng thể thị trường, bối cảnh, chức năng, nhiệm vụ của c&aacute;c ng&agrave;nh nghề thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo.<br />
PO2. C&oacute; thể l&agrave;m việc được như một th&agrave;nh vi&ecirc;n ch&iacute;nh thức trong nh&oacute;m chuy&ecirc;n m&ocirc;n thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: tham gia thiết kế, lựa chọn kỹ thuật v&agrave; c&ocirc;ng nghệ ph&ugrave; hợp với xu hướng ph&aacute;t triển, giải quyết c&aacute;c vấn đề kỹ thuật; nắm được xu hướng c&ocirc;ng nghệ v&agrave; y&ecirc;u cầu người d&ugrave;ng; c&oacute; thể l&agrave;m kế hoạch ph&aacute;t triển ho&agrave;n thiện giải ph&aacute;p; quản l&yacute; thực hiện v&agrave; quản l&yacute; thay đổi trong phần c&ocirc;ng việc của m&igrave;nh; hiểu được c&aacute;c ch&iacute;nh s&aacute;ch nh&agrave; nước về lĩnh vực chuy&ecirc;n ng&agrave;nh.<br />
PO3. Th&agrave;nh thạo được c&aacute;c kỹ năng nghề nghiệp v&agrave; c&aacute;c kỹ năng mềm của c&ocirc;ng d&acirc;n thế kỷ 21 (kỹ năng tư duy, kỹ năng l&agrave;m việc, kỹ năng sử dụng c&aacute;c c&ocirc;ng cụ l&agrave;m việc, kỹ năng sống trong x&atilde; hội to&agrave;n cầu);<br />
PO4. Sử dụng được tốt tiếng Anh trong học tập v&agrave; c&ocirc;ng việc v&agrave; một ngoại ngữ thứ hai trong giao tiếp th&ocirc;ng thường.<br />
PO5. Trung thực, kỷ luật cao trong học tập v&agrave; c&ocirc;ng việc, biết l&agrave;m việc nh&oacute;m một c&aacute;ch hiệu quả; biết ứng xử văn h&oacute;a trong c&ocirc;ng việc v&agrave; x&atilde; hội; năng động, s&aacute;ng tạo v&agrave; c&oacute; &yacute; ch&iacute; học tập kh&ocirc;ng ngừng. Thể hiện th&aacute;i độ v&agrave; h&agrave;nh vi chuy&ecirc;n nghiệp với năng lực h&igrave;nh th&agrave;nh &yacute; tưởng, thiết kế, thực hiện v&agrave; vận h&agrave;nh hệ thống trong bối cảnh doanh nghiệp v&agrave; x&atilde; hội.<br />
<br />
- Vị tr&iacute; việc l&agrave;m sau khi tốt nghiệp:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chuy&ecirc;n ng&agrave;nh An to&agrave;n th&ocirc;ng tin c&oacute; thể l&agrave;m việc với một số vị tr&iacute; c&ocirc;ng việc điển h&igrave;nh như:<br />
+ Chuy&ecirc;n vi&ecirc;n quản trị an ninh mạng, cơ sở dữ liệu;<br />
+ Chuy&ecirc;n vi&ecirc;n kiểm tra, đ&aacute;nh gi&aacute; an to&agrave;n th&ocirc;ng tin cho mạng v&agrave; hệ thống;<br />
+ Chuy&ecirc;n gia r&agrave; so&aacute;t lỗ hổng, điểm yếu v&agrave; xử l&yacute; sự cố an to&agrave;n th&ocirc;ng tin;<br />
+ Chuy&ecirc;n gia lập tr&igrave;nh v&agrave; ph&aacute;t triển ứng dụng đảm bảo an to&agrave;n th&ocirc;ng tin;<br />
+ Chuy&ecirc;n vi&ecirc;n ph&acirc;n t&iacute;ch, tư vấn, thiết kế hệ thống th&ocirc;ng tin đảm bảo an to&agrave;n.<br />
<br />
2. KHỐI LƯỢNG KIẾN THỨC TO&Agrave;N KHO&Aacute;: 145 t&iacute;n chỉ, chưa kể Tiếng Anh chuẩn bị, Gi&aacute;o dục Quốc ph&ograve;ng, c&aacute;c hoạt động r&egrave;n luyện bắt buộc v&agrave; tự chọn.<br />
<br />
3. ĐỐI TƯỢNG TUYỂN SINH<br />
<br />
- Theo quy chế tuyển sinh đại học, cao đẳng hệ ch&iacute;nh quy của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo.<br />
- Theo quy chế tuyển sinh của trường Đại học FPT.<br />
<br />
4. QUY TR&Igrave;NH Đ&Agrave;O TẠO, ĐIỀU KIỆN TỐT NGHIỆP<br />
<br />
Quy tr&igrave;nh đ&agrave;o tạo v&agrave; điều kiện tốt nghiệp được quy định theo &ldquo;Quy chế đ&agrave;o tạo hệ đại học ch&iacute;nh quy theo hệ thống t&iacute;n chỉ&rdquo; hiện h&agrave;nh của Đại học FPT.<br />
<br />
5. C&Aacute;CH THỨC Đ&Aacute;NH GI&Aacute;<br />
<br />
C&aacute;ch thức đ&aacute;nh gi&aacute; được quy định theo &ldquo;Quy chế đ&agrave;o tạo hệ đại học ch&iacute;nh quy theo hệ thống t&iacute;n chỉ&rdquo; hiện h&agrave;nh của Đại học FPT.</p>
', 145)
INSERT [dbo].[Curriculum] ([CurrID], [CurrName], [CurrDesc], [TotalCredit]) VALUES (N'BIT_IoT', N'Internet of things', N'<p>1. TRAINING OBJECTIVES<br />
<br />
1.1 General objectives:<br />
<br />
Training Information Technology (IT) engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implement and promote the creativity in jobs related to the trained specialties.<br />
The training program aims to:<br />
a) To equip students with fundamental knowledge of the IT industry together with fundamental and specialized methodologies, technologies related to the trained specialties;<br />
b) Train students the necessary virtues and skills in the professional working environment, know how to apply fundamental knowledge and specialized knowledge into practical work;<br />
c) Provide students with a strong foundation in foreign languages, science, culture and society, promoting their autonomy and creativity in study, work and life.<br />
<br />
1.2 Specific objectives:<br />
<br />
Graduates of an IT training program must demonstrate the following:<br />
<br />
PO1. Having basic knowledge of social sciences, politics and law, security and defense, foundational knowledge of the IT industry &amp; in-depth knowledge of specialized training: techniques, methods, technologies, in-depth application areas; development trends in the world; at the same time understand the overall market, context, functions and tasks of the professions in the specialized training.<br />
PO2. Be able to work as a full member of a professional team in the field of training: participate in designing, selecting techniques and technologies in line with development trends, solving technical problems; understand technology trends and user requirements; can do the complete solution development plan; performance management and change management in his or her part of the job; Understand state policies in specialized fields.<br />
PO3. Mastering professional skills and soft skills of 21st century citizens (thinking skills, work skills, skills in using work tools, life skills in a global society);<br />
PO4. Can use English well in study and work and a second foreign language in normal communication.<br />
PO5. Honesty, high discipline in study and work, know how to work effectively in groups; know how to behave culturally at work and in society; Dynamic, creative and willing to learn constantly. Demonstrate professional attitude and behavior with the ability to conceive of ideas, design, implement and operate systems in corporate and social contexts.<br />
<br />
- Job placement after graduation:<br />
Some positions that IoT graduates can choose after completing the program:<br />
+ IOT application development specialists<br />
+ Software development specialists, embedded system expertss<br />
+ System integrators for systems ranging from simple to complex one.<br />
<br />
1. MỤC TI&Ecirc;U Đ&Agrave;O TẠO<br />
<br />
1.1 Mục ti&ecirc;u chung:<br />
<br />
Đ&agrave;o tạo kỹ sư ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin (CNTT) c&oacute; nh&acirc;n c&aacute;ch v&agrave; năng lực đ&aacute;p ứng nhu cầu thực tế của x&atilde; hội, nắm vững kiến thức chuy&ecirc;n m&ocirc;n v&agrave; thực h&agrave;nh, c&oacute; khả năng tổ chức, thực hiện v&agrave; ph&aacute;t huy s&aacute;ng tạo trong c&aacute;c c&ocirc;ng việc li&ecirc;n quan đến c&aacute;c chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo (Kỹ thuật phần mềm (KTPM), Hệ thống th&ocirc;ng tin (HTTT), An to&agrave;n th&ocirc;ng tin (ATTT), Internet vạn vật (IoT), Tr&iacute; tuệ nh&acirc;n tạo (TTNT).<br />
Chương tr&igrave;nh đ&agrave;o tạo nhằm:<br />
a) Trang bị cho sinh vi&ecirc;n kiến thức cơ bản của ng&agrave;nh CNTT c&ugrave;ng c&aacute;c phương ph&aacute;p luận, c&ocirc;ng nghệ nền tảng v&agrave; chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh;<br />
b) R&egrave;n luyện cho sinh vi&ecirc;n những đức t&iacute;nh, kỹ năng cần thiết qua m&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp, biết vận dụng c&aacute;c kiến thức ng&agrave;nh CNTT v&agrave; c&aacute;c kiến thức chuy&ecirc;n ng&agrave;nh v&agrave;o c&ocirc;ng việc thực tế;<br />
c) Cung cấp cho sinh vi&ecirc;n một nền tảng vững chắc về ngoại ngữ, khoa học, văn h&oacute;a, x&atilde; hội, ph&aacute;t huy t&iacute;nh chủ động, s&aacute;ng tạo trong học tập, c&ocirc;ng việc v&agrave; cuộc sống.<br />
<br />
1.2 Mục ti&ecirc;u cụ thể:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo CNTT phải thể hiện được những điều sau đ&acirc;y:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo CNTT phải thể hiện được những điều sau đ&acirc;y:<br />
PO1. C&oacute; kiến thức cơ bản về khoa học x&atilde; hội, ch&iacute;nh trị ph&aacute;p luật, an ninh quốc ph&ograve;ng, kiến thức nền tảng của ng&agrave;nh CNTT &amp; kiến thức chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: kỹ thuật, phương ph&aacute;p, c&ocirc;ng nghệ, c&aacute;c lĩnh vực ứng dụng chuy&ecirc;n s&acirc;u; xu hướng ph&aacute;t triển tr&ecirc;n thế giới; đồng thời hiểu biết tổng thể thị trường, bối cảnh, chức năng, nhiệm vụ của c&aacute;c ng&agrave;nh nghề thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo.<br />
PO2. C&oacute; thể l&agrave;m việc được như một th&agrave;nh vi&ecirc;n ch&iacute;nh thức trong nh&oacute;m chuy&ecirc;n m&ocirc;n thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: tham gia thiết kế, lựa chọn kỹ thuật v&agrave; c&ocirc;ng nghệ ph&ugrave; hợp với xu hướng ph&aacute;t triển, giải quyết c&aacute;c vấn đề kỹ thuật; nắm được xu hướng c&ocirc;ng nghệ v&agrave; y&ecirc;u cầu người d&ugrave;ng; c&oacute; thể l&agrave;m kế hoạch ph&aacute;t triển ho&agrave;n thiện giải ph&aacute;p; quản l&yacute; thực hiện v&agrave; quản l&yacute; thay đổi trong phần c&ocirc;ng việc của m&igrave;nh; hiểu được c&aacute;c ch&iacute;nh s&aacute;ch nh&agrave; nước về lĩnh vực chuy&ecirc;n ng&agrave;nh.<br />
PO3. Th&agrave;nh thạo được c&aacute;c kỹ năng nghề nghiệp v&agrave; c&aacute;c kỹ năng mềm của c&ocirc;ng d&acirc;n thế kỷ 21 (kỹ năng tư duy, kỹ năng l&agrave;m việc, kỹ năng sử dụng c&aacute;c c&ocirc;ng cụ l&agrave;m việc, kỹ năng sống trong x&atilde; hội to&agrave;n cầu);<br />
PO4. Sử dụng được tốt tiếng Anh trong học tập v&agrave; c&ocirc;ng việc v&agrave; một ngoại ngữ thứ hai trong giao tiếp th&ocirc;ng thường.<br />
PO5. Trung thực, kỷ luật cao trong học tập v&agrave; c&ocirc;ng việc, biết l&agrave;m việc nh&oacute;m một c&aacute;ch hiệu quả; biết ứng xử văn h&oacute;a trong c&ocirc;ng việc v&agrave; x&atilde; hội; năng động, s&aacute;ng tạo v&agrave; c&oacute; &yacute; ch&iacute; học tập kh&ocirc;ng ngừng. Thể hiện th&aacute;i độ v&agrave; h&agrave;nh vi chuy&ecirc;n nghiệp với năng lực h&igrave;nh th&agrave;nh &yacute; tưởng, thiết kế, thực hiện v&agrave; vận h&agrave;nh hệ thống trong bối cảnh doanh nghiệp v&agrave; x&atilde; hội.<br />
<br />
- Vị tr&iacute; việc l&agrave;m sau khi tốt nghiệp:<br />
Một số vị tr&iacute; c&ocirc;ng việc sinh vi&ecirc;n tốt nghiệp chuy&ecirc;n ng&agrave;nh IoT c&oacute; thể lựa chọn:<br />
+ Chuy&ecirc;n vi&ecirc;n ph&aacute;t triển ứng dụng IOT;<br />
+ Chuy&ecirc;n vi&ecirc;n ph&aacute;t triển phần mềm, hệ thống nh&uacute;ng;<br />
+ Chuy&ecirc;n gia t&iacute;ch hợp hệ thống th&ocirc;ng minh từ đơn giản đến phức tạp.<br />
<br />
2. KHỐI LƯỢNG KIẾN THỨC TO&Agrave;N KHO&Aacute;: 145 t&iacute;n chỉ, chưa kể Tiếng Anh chuẩn bị, Gi&aacute;o dục Quốc ph&ograve;ng, c&aacute;c hoạt động r&egrave;n luyện bắt buộc v&agrave; tự chọn.<br />
<br />
3. ĐỐI TƯỢNG TUYỂN SINH<br />
<br />
- Theo quy chế tuyển sinh đại học, cao đẳng hệ ch&iacute;nh quy của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo.<br />
- Theo quy chế tuyển sinh của trường Đại học FPT.<br />
<br />
4. QUY TR&Igrave;NH Đ&Agrave;O TẠO, ĐIỀU KIỆN TỐT NGHIỆP<br />
<br />
Quy tr&igrave;nh đ&agrave;o tạo v&agrave; điều kiện tốt nghiệp được quy định theo &ldquo;Quy chế đ&agrave;o tạo hệ đại học ch&iacute;nh quy theo hệ thống t&iacute;n chỉ&rdquo; hiện h&agrave;nh của Đại học FPT.<br />
<br />
5. C&Aacute;CH THỨC Đ&Aacute;NH GI&Aacute;<br />
<br />
C&aacute;ch thức đ&aacute;nh gi&aacute; được quy định theo &ldquo;Quy chế đ&agrave;o tạo hệ đại học ch&iacute;nh quy theo hệ thống t&iacute;n chỉ&rdquo; hiện h&agrave;nh của Đại học FPT.</p>
', 145)
INSERT [dbo].[Curriculum] ([CurrID], [CurrName], [CurrDesc], [TotalCredit]) VALUES (N'BIT_IS', N'Information System', N'<p>1. TRAINING OBJECTIVES<br />
<br />
1.1 General objectives:<br />
<br />
Training Information Technology (IT) engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implement and promote the creativity in jobs related to the trained specialties.<br />
The training program aims to:<br />
a) To equip students with fundamental knowledge of the IT industry together with fundamental and specialized methodologies, technologies related to the trained specialties;<br />
b) Train students the necessary virtues and skills in the professional working environment, know how to apply fundamental knowledge and specialized knowledge into practical work;<br />
c) Provide students with a strong foundation in foreign languages, science, culture and society, promoting their autonomy and creativity in study, work and life.<br />
<br />
1.2 Specific objectives:<br />
<br />
Graduates of an IT training program must demonstrate the following:<br />
<br />
PO1. Having basic knowledge of social sciences, politics and law, security and defense, foundational knowledge of the IT industry &amp; in-depth knowledge of specialized training: techniques, methods, technologies, in-depth application areas; development trends in the world; at the same time understand the overall market, context, functions and tasks of the professions in the specialized training.<br />
PO2. Be able to work as a full member of a professional team in the field of training: participate in designing, selecting techniques and technologies in line with development trends, solving technical problems; understand technology trends and user requirements; can do the complete solution development plan; performance management and change management in his or her part of the job; Understand state policies in specialized fields.<br />
PO3. Mastering professional skills and soft skills of 21st century citizens (thinking skills, work skills, skills in using work tools, life skills in a global society);<br />
PO4. Can use English well in study and work and a second foreign language in normal communication.<br />
PO5. Honesty, high discipline in study and work, know how to work effectively in groups; know how to behave culturally at work and in society; Dynamic, creative and willing to learn constantly. Demonstrate professional attitude and behavior with the ability to conceive of ideas, design, implement and operate systems in corporate and social contexts.<br />
<br />
- Job placement after graduation:<br />
Graduates of Information Systems have diverse employment opportunities with some typical job positions such as:<br />
+ Administrators of the database systems<br />
+ Information system designers, analysts, consultants<br />
+ Specialists developing applications for information systems<br />
+ Experts specializing in deploying and operating ERP and CRM systems<br />
+ Managers of information/knowledge systems<br />
<br />
1. MỤC TI&Ecirc;U Đ&Agrave;O TẠO<br />
<br />
1.1 Mục ti&ecirc;u chung:<br />
<br />
Đ&agrave;o tạo kỹ sư ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin (CNTT) c&oacute; nh&acirc;n c&aacute;ch v&agrave; năng lực đ&aacute;p ứng nhu cầu thực tế của x&atilde; hội, nắm vững kiến thức chuy&ecirc;n m&ocirc;n v&agrave; thực h&agrave;nh, c&oacute; khả năng tổ chức, thực hiện v&agrave; ph&aacute;t huy s&aacute;ng tạo trong c&aacute;c c&ocirc;ng việc li&ecirc;n quan đến c&aacute;c chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo (Kỹ thuật phần mềm (KTPM), Hệ thống th&ocirc;ng tin (HTTT), An to&agrave;n th&ocirc;ng tin (ATTT), Internet vạn vật (IoT), Tr&iacute; tuệ nh&acirc;n tạo (TTNT).<br />
Chương tr&igrave;nh đ&agrave;o tạo nhằm:<br />
a) Trang bị cho sinh vi&ecirc;n kiến thức cơ bản của ng&agrave;nh CNTT c&ugrave;ng c&aacute;c phương ph&aacute;p luận, c&ocirc;ng nghệ nền tảng v&agrave; chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh;<br />
b) R&egrave;n luyện cho sinh vi&ecirc;n những đức t&iacute;nh, kỹ năng cần thiết qua m&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp, biết vận dụng c&aacute;c kiến thức ng&agrave;nh CNTT v&agrave; c&aacute;c kiến thức chuy&ecirc;n ng&agrave;nh v&agrave;o c&ocirc;ng việc thực tế;<br />
c) Cung cấp cho sinh vi&ecirc;n một nền tảng vững chắc về ngoại ngữ, khoa học, văn h&oacute;a, x&atilde; hội, ph&aacute;t huy t&iacute;nh chủ động, s&aacute;ng tạo trong học tập, c&ocirc;ng việc v&agrave; cuộc sống.<br />
<br />
1.2 Mục ti&ecirc;u cụ thể:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo CNTT phải thể hiện được những điều sau đ&acirc;y:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo CNTT phải thể hiện được những điều sau đ&acirc;y:<br />
PO1. C&oacute; kiến thức cơ bản về khoa học x&atilde; hội, ch&iacute;nh trị ph&aacute;p luật, an ninh quốc ph&ograve;ng, kiến thức nền tảng của ng&agrave;nh CNTT &amp; kiến thức chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: kỹ thuật, phương ph&aacute;p, c&ocirc;ng nghệ, c&aacute;c lĩnh vực ứng dụng chuy&ecirc;n s&acirc;u; xu hướng ph&aacute;t triển tr&ecirc;n thế giới; đồng thời hiểu biết tổng thể thị trường, bối cảnh, chức năng, nhiệm vụ của c&aacute;c ng&agrave;nh nghề thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo.<br />
PO2. C&oacute; thể l&agrave;m việc được như một th&agrave;nh vi&ecirc;n ch&iacute;nh thức trong nh&oacute;m chuy&ecirc;n m&ocirc;n thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: tham gia thiết kế, lựa chọn kỹ thuật v&agrave; c&ocirc;ng nghệ ph&ugrave; hợp với xu hướng ph&aacute;t triển, giải quyết c&aacute;c vấn đề kỹ thuật; nắm được xu hướng c&ocirc;ng nghệ v&agrave; y&ecirc;u cầu người d&ugrave;ng; c&oacute; thể l&agrave;m kế hoạch ph&aacute;t triển ho&agrave;n thiện giải ph&aacute;p; quản l&yacute; thực hiện v&agrave; quản l&yacute; thay đổi trong phần c&ocirc;ng việc của m&igrave;nh; hiểu được c&aacute;c ch&iacute;nh s&aacute;ch nh&agrave; nước về lĩnh vực chuy&ecirc;n ng&agrave;nh.<br />
PO3. Th&agrave;nh thạo được c&aacute;c kỹ năng nghề nghiệp v&agrave; c&aacute;c kỹ năng mềm của c&ocirc;ng d&acirc;n thế kỷ 21 (kỹ năng tư duy, kỹ năng l&agrave;m việc, kỹ năng sử dụng c&aacute;c c&ocirc;ng cụ l&agrave;m việc, kỹ năng sống trong x&atilde; hội to&agrave;n cầu);<br />
PO4. Sử dụng được tốt tiếng Anh trong học tập v&agrave; c&ocirc;ng việc v&agrave; một ngoại ngữ thứ hai trong giao tiếp th&ocirc;ng thường.<br />
PO5. Trung thực, kỷ luật cao trong học tập v&agrave; c&ocirc;ng việc, biết l&agrave;m việc nh&oacute;m một c&aacute;ch hiệu quả; biết ứng xử văn h&oacute;a trong c&ocirc;ng việc v&agrave; x&atilde; hội; năng động, s&aacute;ng tạo v&agrave; c&oacute; &yacute; ch&iacute; học tập kh&ocirc;ng ngừng. Thể hiện th&aacute;i độ v&agrave; h&agrave;nh vi chuy&ecirc;n nghiệp với năng lực h&igrave;nh th&agrave;nh &yacute; tưởng, thiết kế, thực hiện v&agrave; vận h&agrave;nh hệ thống trong bối cảnh doanh nghiệp v&agrave; x&atilde; hội.<br />
<br />
- Vị tr&iacute; việc l&agrave;m sau khi tốt nghiệp:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chuy&ecirc;n ng&agrave;nh Hệ thống th&ocirc;ng tin c&oacute; cơ hội việc l&agrave;m rất đa dạng với một số vị tr&iacute; c&ocirc;ng việc điển h&igrave;nh như:<br />
+ Quản trị vi&ecirc;n c&aacute;c hệ cơ sở dữ liệu;<br />
+ Chuy&ecirc;n vi&ecirc;n ph&acirc;n t&iacute;ch, tư vấn, thiết kế hệ thống th&ocirc;ng tin;<br />
+ Chuy&ecirc;n vi&ecirc;n ph&aacute;t triển ứng dụng cho hệ thống th&ocirc;ng tin;<br />
+ Chuy&ecirc;n vi&ecirc;n triển khai, vận h&agrave;nh c&aacute;c hệ thống ERP, CRM;<br />
+ Quản trị hệ thống th&ocirc;ng tin v&agrave; tri thức.<br />
<br />
2. KHỐI LƯỢNG KIẾN THỨC TO&Agrave;N KHO&Aacute;: 145 t&iacute;n chỉ, chưa kể Tiếng Anh chuẩn bị, Gi&aacute;o dục Quốc ph&ograve;ng, c&aacute;c hoạt động r&egrave;n luyện bắt buộc v&agrave; tự chọn.<br />
<br />
3. ĐỐI TƯỢNG TUYỂN SINH<br />
<br />
- Theo quy chế tuyển sinh đại học, cao đẳng hệ ch&iacute;nh quy của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo.<br />
- Theo quy chế tuyển sinh của trường Đại học FPT.<br />
<br />
4. QUY TR&Igrave;NH Đ&Agrave;O TẠO, ĐIỀU KIỆN TỐT NGHIỆP<br />
<br />
Quy tr&igrave;nh đ&agrave;o tạo v&agrave; điều kiện tốt nghiệp được quy định theo &ldquo;Quy chế đ&agrave;o tạo hệ đại học ch&iacute;nh quy theo hệ thống t&iacute;n chỉ&rdquo; hiện h&agrave;nh của Đại học FPT.<br />
<br />
5. C&Aacute;CH THỨC Đ&Aacute;NH GI&Aacute;<br />
<br />
C&aacute;ch thức đ&aacute;nh gi&aacute; được quy định theo &ldquo;Quy chế đ&agrave;o tạo hệ đại học ch&iacute;nh quy theo hệ thống t&iacute;n chỉ&rdquo; hiện h&agrave;nh của Đại học FPT.</p>
', 145)
INSERT [dbo].[Curriculum] ([CurrID], [CurrName], [CurrDesc], [TotalCredit]) VALUES (N'BIT_SE', N'Software Engineering', N'<p>1. TRAINING OBJECTIVES<br />
<br />
1.1 General objectives:<br />
<br />
Training Information Technology (IT) engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implement and promote the creativity in jobs related to the trained specialties.<br />
The training program aims to:<br />
a) To equip students with fundamental knowledge of the IT industry together with fundamental and specialized methodologies, technologies related to the trained specialties;<br />
b) Train students the necessary virtues and skills in the professional working environment, know how to apply fundamental knowledge and specialized knowledge into practical work;<br />
c) Provide students with a strong foundation in foreign languages, science, culture and society, promoting their autonomy and creativity in study, work and life.<br />
<br />
1.2 Specific objectives:<br />
<br />
Graduates of an IT training program must demonstrate the following:<br />
<br />
PO1. Having basic knowledge of social sciences, politics and law, security and defense, foundational knowledge of the IT industry &amp; in-depth knowledge of specialized training: techniques, methods, technologies, in-depth application areas; development trends in the world; at the same time understand the overall market, context, functions and tasks of the professions in the specialized training.<br />
PO2. Be able to work as a full member of a professional team in the field of training: participate in designing, selecting techniques and technologies in line with development trends, solving technical problems; understand technology trends and user requirements; can do the complete solution development plan; performance management and change management in his or her part of the job; Understand state policies in specialized fields.<br />
PO3. Mastering professional skills and soft skills of 21st century citizens (thinking skills, work skills, skills in using work tools, life skills in a global society);<br />
PO4. Can use English well in study and work and a second foreign language in normal communication.<br />
PO5. Honesty, high discipline in study and work, know how to work effectively in groups; know how to behave culturally at work and in society; Dynamic, creative and willing to learn constantly. Demonstrate professional attitude and behavior with the ability to conceive of ideas, design, implement and operate systems in corporate and social contexts.<br />
<br />
- Job placement after graduation:<br />
Graduates of Software Engineering can choose for themselves the following jobs:<br />
+ Application development programmers<br />
+ Business analysts<br />
+ Software quality assurance engineers<br />
+ Software process engineers<br />
+ Software project administrators<br />
<br />
1. MỤC TI&Ecirc;U Đ&Agrave;O TẠO<br />
<br />
1.1 Mục ti&ecirc;u chung:<br />
<br />
Đ&agrave;o tạo kỹ sư ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin (CNTT) c&oacute; nh&acirc;n c&aacute;ch v&agrave; năng lực đ&aacute;p ứng nhu cầu thực tế của x&atilde; hội, nắm vững kiến thức chuy&ecirc;n m&ocirc;n v&agrave; thực h&agrave;nh, c&oacute; khả năng tổ chức, thực hiện v&agrave; ph&aacute;t huy s&aacute;ng tạo trong c&aacute;c c&ocirc;ng việc li&ecirc;n quan đến c&aacute;c chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo (Kỹ thuật phần mềm (KTPM), Hệ thống th&ocirc;ng tin (HTTT), An to&agrave;n th&ocirc;ng tin (ATTT), Internet vạn vật (IoT), Tr&iacute; tuệ nh&acirc;n tạo (TTNT).<br />
Chương tr&igrave;nh đ&agrave;o tạo nhằm:<br />
a) Trang bị cho sinh vi&ecirc;n kiến thức cơ bản của ng&agrave;nh CNTT c&ugrave;ng c&aacute;c phương ph&aacute;p luận, c&ocirc;ng nghệ nền tảng v&agrave; chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh;<br />
b) R&egrave;n luyện cho sinh vi&ecirc;n những đức t&iacute;nh, kỹ năng cần thiết qua m&ocirc;i trường l&agrave;m việc chuy&ecirc;n nghiệp, biết vận dụng c&aacute;c kiến thức ng&agrave;nh CNTT v&agrave; c&aacute;c kiến thức chuy&ecirc;n ng&agrave;nh v&agrave;o c&ocirc;ng việc thực tế;<br />
c) Cung cấp cho sinh vi&ecirc;n một nền tảng vững chắc về ngoại ngữ, khoa học, văn h&oacute;a, x&atilde; hội, ph&aacute;t huy t&iacute;nh chủ động, s&aacute;ng tạo trong học tập, c&ocirc;ng việc v&agrave; cuộc sống.<br />
<br />
1.2 Mục ti&ecirc;u cụ thể:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo CNTT phải thể hiện được những điều sau đ&acirc;y:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo CNTT phải thể hiện được những điều sau đ&acirc;y:<br />
PO1. C&oacute; kiến thức cơ bản về khoa học x&atilde; hội, ch&iacute;nh trị ph&aacute;p luật, an ninh quốc ph&ograve;ng, kiến thức nền tảng của ng&agrave;nh CNTT &amp; kiến thức chuy&ecirc;n s&acirc;u của chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: kỹ thuật, phương ph&aacute;p, c&ocirc;ng nghệ, c&aacute;c lĩnh vực ứng dụng chuy&ecirc;n s&acirc;u; xu hướng ph&aacute;t triển tr&ecirc;n thế giới; đồng thời hiểu biết tổng thể thị trường, bối cảnh, chức năng, nhiệm vụ của c&aacute;c ng&agrave;nh nghề thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo.<br />
PO2. C&oacute; thể l&agrave;m việc được như một th&agrave;nh vi&ecirc;n ch&iacute;nh thức trong nh&oacute;m chuy&ecirc;n m&ocirc;n thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo: tham gia thiết kế, lựa chọn kỹ thuật v&agrave; c&ocirc;ng nghệ ph&ugrave; hợp với xu hướng ph&aacute;t triển, giải quyết c&aacute;c vấn đề kỹ thuật; nắm được xu hướng c&ocirc;ng nghệ v&agrave; y&ecirc;u cầu người d&ugrave;ng; c&oacute; thể l&agrave;m kế hoạch ph&aacute;t triển ho&agrave;n thiện giải ph&aacute;p; quản l&yacute; thực hiện v&agrave; quản l&yacute; thay đổi trong phần c&ocirc;ng việc của m&igrave;nh; hiểu được c&aacute;c ch&iacute;nh s&aacute;ch nh&agrave; nước về lĩnh vực chuy&ecirc;n ng&agrave;nh.<br />
PO3. Th&agrave;nh thạo được c&aacute;c kỹ năng nghề nghiệp v&agrave; c&aacute;c kỹ năng mềm của c&ocirc;ng d&acirc;n thế kỷ 21 (kỹ năng tư duy, kỹ năng l&agrave;m việc, kỹ năng sử dụng c&aacute;c c&ocirc;ng cụ l&agrave;m việc, kỹ năng sống trong x&atilde; hội to&agrave;n cầu);<br />
PO4. Sử dụng được tốt tiếng Anh trong học tập v&agrave; c&ocirc;ng việc v&agrave; một ngoại ngữ thứ hai trong giao tiếp th&ocirc;ng thường.<br />
PO5. Trung thực, kỷ luật cao trong học tập v&agrave; c&ocirc;ng việc, biết l&agrave;m việc nh&oacute;m một c&aacute;ch hiệu quả; biết ứng xử văn h&oacute;a trong c&ocirc;ng việc v&agrave; x&atilde; hội; năng động, s&aacute;ng tạo v&agrave; c&oacute; &yacute; ch&iacute; học tập kh&ocirc;ng ngừng. Thể hiện th&aacute;i độ v&agrave; h&agrave;nh vi chuy&ecirc;n nghiệp với năng lực h&igrave;nh th&agrave;nh &yacute; tưởng, thiết kế, thực hiện v&agrave; vận h&agrave;nh hệ thống trong bối cảnh doanh nghiệp v&agrave; x&atilde; hội.<br />
<br />
- Vị tr&iacute; việc l&agrave;m sau khi tốt nghiệp:<br />
<br />
Sinh vi&ecirc;n tốt nghiệp chuy&ecirc;n ng&agrave;nh Kỹ thuật phần mềm c&oacute; thể lựa chọn cho m&igrave;nh những c&ocirc;ng việc như:<br />
+ Lập tr&igrave;nh vi&ecirc;n ph&aacute;t triển ứng dụng;<br />
+ Chuy&ecirc;n vi&ecirc;n ph&acirc;n t&iacute;ch nghiệp vụ;<br />
+ Kỹ sư đảm bảo chất lượng phần mềm;<br />
+ Kỹ sư quy tr&igrave;nh sản xuất phần mềm;<br />
+ Quản trị vi&ecirc;n dự &aacute;n phần mềm.<br />
<br />
2. KHỐI LƯỢNG KIẾN THỨC TO&Agrave;N KHO&Aacute;: 145 t&iacute;n chỉ, chưa kể Tiếng Anh chuẩn bị, Gi&aacute;o dục Quốc ph&ograve;ng, c&aacute;c hoạt động r&egrave;n luyện bắt buộc v&agrave; tự chọn.<br />
<br />
3. ĐỐI TƯỢNG TUYỂN SINH<br />
<br />
- Theo quy chế tuyển sinh đại học, cao đẳng hệ ch&iacute;nh quy của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo.<br />
- Theo quy chế tuyển sinh của trường Đại học FPT.<br />
<br />
4. QUY TR&Igrave;NH Đ&Agrave;O TẠO, ĐIỀU KIỆN TỐT NGHIỆP<br />
<br />
Quy tr&igrave;nh đ&agrave;o tạo v&agrave; điều kiện tốt nghiệp được quy định theo &ldquo;Quy chế đ&agrave;o tạo hệ đại học ch&iacute;nh quy theo hệ thống t&iacute;n chỉ&rdquo; hiện h&agrave;nh của Đại học FPT.<br />
<br />
5. C&Aacute;CH THỨC Đ&Aacute;NH GI&Aacute;<br />
<br />
C&aacute;ch thức đ&aacute;nh gi&aacute; được quy định theo &ldquo;Quy chế đ&agrave;o tạo hệ đại học ch&iacute;nh quy theo hệ thống t&iacute;n chỉ&rdquo; hiện h&agrave;nh của Đại học FPT.</p>
', 145)
GO
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Sách giáo trình: Kỹ thuật Vovinam - Việt Võ Đạo', N'VOV114', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Computer Organization and Architecture: Design for Performance 978-0132936330 (9th), 978-0134101613 (10th) William Stallings Prentice Hall 2012 9th (or 10th)', N'CEA201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'powerpoint in CD + Powerpoint prepared by previous lecturers (PP)., Calculus for engineers, Linear Algebra with applications, Essential Calculus', N'MAE101', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Course slides (.pptx), Python Programming An Introduction to Computer Science, Python for Everybody Exploring Data Using Python 3', N'PFP191', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Foundations of Programming Using C, BTP100: http://cs.senecac.on.ca/~btp100/pages/welco.html, FU Presentation Powerpoints (.zip),FU CMS at http://cms.fpt.edu.vn .', N'PRF192', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Online Spec: https://www.coursera.org/specializations/academic-skills; University of Sydney', N'SSL101c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Sách giáo trình: Kỹ thuật Vovinam - Việt Võ Đạo', N'VOV124', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Discrete Mathematics and its applications, Powerpoint image in CD + Powerpoint prepared by previous lecturers (PP), Computerized tools (for example C programming tools, Maxima http://maxima.sourceforge.net/) (CT), Adam Drozdek. Data structure and Algorithms in Java. 3rd Edition.', N'MAD101', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/computer-communications?', N'NWC203c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Modern Operating Systems (4th edition or 3rd or 2nd), Course slides (.pptx), Understanding operating systems, Connecting with Computer Science', N'OSG202', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Java 8 Specification', N'PRO192', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Working in Groups, Business Communication', N'SSG103', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Sách giáo trình: Kỹ thuật Vovinam - Việt Võ Đạo', N'VOV134', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Michaelt T. Goodrich, Roberto Tamassia, Michael H. Goldwasser: Data Structures and Algorithms in Java, 6th Edition, 2014 (ebook), FU slides (ppt), FU exercises (pdf)', N'CSD201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'First Course in Database Systems, Database Management System, Database Management System (DBMS): A Practical Approach, Course slides (.pptx)', N'DBI202', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Dekiru Nihongo - Beginner Level: Main textbook (quyển đỏ), 4) Audio CD đi kèm Main textbook (CMS), Teacher''s Presentation Powerpoints (CMS)', N'JPD113', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lab Room Regulations (For Students), Mentor guide For Lab (For Mentors only), Evaluation Templates (For Mentors only)', N'LAB211', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/learn/python?specialization=python', N'PRP201c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/ai-foundations-for-everyone', N'AIG201c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Free Hardware and IoT Ebooks_ OReilly Media, Introduction to Arduino', N'IOT102', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Dekiru Nihongo - Beginner Level (Quyển đỏ): Main textbook Dekiru Nihongo - Beginner Level: A Supplementary Textbook on Vocabulary Dekiru Nihongo - Beginner Level: A Supplementary Textbook on Grammar', N'JPD123', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Mathematics for Machine Learning CUP PDF Slides Machine Learning cơ bản Multivariate Calculus Mathematics for machine learning YB Linear Algebra Done Right', N'MAI391', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/learn/machine-learning', N'AIL302m', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/learn/promote-ethical-data-driven-technologies?specialization=certified-ethical-emerging-technologist', N'ITE302c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/business-entrepreneurship', N'SYB302c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/academic-english', N'ENW492c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Introduction to Algorithms,', N'CSD301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Hướng dẫn quản lý thực tập', N'OJT202', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Digital Image Processing Instructor''s Manual and Homework Problem Solutions', N'IMP301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/natural-language-processing', N'NLP301c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'PMG202c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'AIP490', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/intro-cyber-security', N'IAO201c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/applied-crypto', N'CRY303c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Course Presentation Power Points Beginning Android Web Apps Development: Develop for Android using HTML5, CSS3, and JavaScript', N'PRM391', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/web-design', N'WED201c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Text book 1: Professional Java® forWebApplications', N'PRJ301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Foundations Of Computer Science, Fundamentals of Information Systems Security, Computer architecture : A quantitative approach', N'CSI104', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'1) Montgomery D.C. & Runger G.C., Applied Statistics and Probability for Engineers Powerpoint slides (PP). Computerized tools (for example Excel and DDXL add-ons) (CT) Elementary Statistics Using Excel, 3/E,', N'MAS291', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Template AIP391 Python artificial intelligence projects for beginners: Get up and running with artificial intelligence using 8 smart and exciting AI applications. Practical Machine Learning and Image Processing: For Facial Recognition, Object Detection, and Pattern Recognition Using Python', N'AIP391', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Digital Signal Processing http://www.pearsonhighered.com/educator/product/Digital-Signal-Processing-4E/9780131873742.page The Scientist and Engineer''s Guide to Digital Signal Processing. Information website:', N'DGT301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Giáo trình Triết học Mác-Lênin, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Giáo trình Triết học Mác-Lênin, dùng cho sinh viên đại học hệ chuyên lý luận chính trị Giáo trình Triết học Mác-Lênin C. Mác và Ph. Ăngghen: Toàn tập V.I. Lênnin: Toàn tập Giáo trình Triết học Mác-Lênin', N'MLN111', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Giáo trình Kinh tế chính trị Mác-Lênin, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Giáo trình Kinh tế chính trị Mác - Leenin, dùng cho sinh viên đại học hệ chuyên lý luận chính trị               Văn kiện Đại hội Đảng toàn quốc lần thứ VI, VII, VIII, IX, X, XI, XII, XIII C. Mác và Ph. Ăngghen: Toàn tập, t4,8,12,13,18,20,23,25. 46 V.I. Lênnin: Toàn tập, t3, 27, 45', N'MLN122', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Bộ Giáo dục và Đào tạo, Giáo trình Tư tưởng Hồ Chí Minh, dùng cho sinh viên Đại học và cao đẳng khối không chuyên ngành Mác- Lênin, tư tưởng Hồ Chí Minh. Hội đồng Trung ương biên soạn giáo trình Quốc gia các môn học Mác - Lênin và Tư tưởng Hồ Chí Minh, Giáo trình Tư tưởng Hồ Chí Minh', N'HCM201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Giáo trình Chủ nghĩa xã hội khoa học, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Giáo trình Chủ nghĩa xã hội khoa học, dùng cho sinh viên đại học hệ chuyên lý luận chính trị Giáo trình Chủ nghĩa xã hội khoa học C. Mác và Ph. Ăngghen: Toàn tập V.I. Lênnin: Toàn tập', N'MLN131', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Giáo trình Lịch sử Đảng Cộng sản Việt Nam (Dành cho sinh viên đại học, cao đẳng khối không chuyên ngành Mác – Lênin, tư tưởng Hồ Chí Minh) Giáo trình Lịch sử Đảng Cộng sản Việt Nam (Dành cho sinh viên đại học, cao đẳng chuyên ngành Mác – Lênin, tư tưởng Hồ Chí Minh) Hồ Chí Minh toàn tập, tập 1 đến tập 15 Lịch sử Đảng Cộng sản Việt Nam, tập 1 Chiến tranh cách mạng Việt Nam 1945-1975, thắng lợi và bài học Báo cáo tổng kết một số vấn đề lý luận thực tiễn qua 30 năm đổi mới Văn kiện Đại hội đại biểu toàn quốc lần thứ XII', N'VNR202', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Security Strategies In Linux Platforms And Applications Linux Operations and Administration Hacking Linux Exposed Linux: The Complete Reference Linux Hardening in Hostile Networks: Server Security from TLS to Tor Linux Security Lecture slides, Lab manual, supplementary material', N'OSP201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lecture slides, Lab manual, supplementary material Information Security Risk Analysis Security Controls Evaluation, Testing, and Assessment Handbook Measuring and Managing Information Risk: A FAIR Approach Information Security Management Metrics: A Definitive Guide to Effective Security Monitoring and Measurement Computer Security Handbook Managing Risk In Information Systems', N'IAA202', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'SWP391-AppDevProject_Backlog Template Learn SQL Database Programming', N'SWP391', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/software-development-lifecycle', N'SWE201c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Software Requirements More About Software Requirements: Thorny Issues and Practical Advice', N'SWR302', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Agile Testing: A Practical Guide for Testers and Agile Teams Foundations of Software Testing: ISTQB Certification', N'SWT301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/michiganux', N'WDU203c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lecture slides, Lab manual (ppt) https://samsclass.info/126/126_S17.shtml Malware Forensics: Investigating and Analyzing Malicious Code (online: http://library.fpt.edu.vn/book24x7.html). Introduction to Malware Analysis (whitepaper) Malware Analyst’s Cookbook and DVD: Tools and Techniques for fighting malicious code', N'IAM302', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Information Security Policy Development for Compliance: ISO/IEC 27001, NIST SP 800-53, HIPAA Standard, PCI DSS V2.0, and AUP V5.0 Protecting Controlled Unclassified Information in Nonfederal Systems and Organizations Computer Security Handbook Security Policies and Implementation Issues', N'IAP301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lecture slides, Lab-Projects. Digital Forensics Processing and Procedures: Meeting the Requirements of ISO 17020, ISO 17025, ISO 27001 and Best Practice Requirements Digital Forensics Trial Graphics: Teaching the Jury Though Effective Use of Visuals Guide to Computer Forensics and Investigations Processing Digital Evidence The Basics of Digital Forensics: The Primer for Getting Started in Digital Forensics', N'FRS301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lecture slides, Lab Manual Hacking Exposed 7: Network Security Secrets and Solutions Certified Ethical Hacker version 9 Hacker Techniques, Tools, and Incident Handling Hands-On Ethical Hacking and Network Defense (online http://library.books24x7.com/toc.aspx?bookid=80730).', N'HOD401', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Intergrated Security System Design Systems Analysis and Design Cybersecurity Policies and Strategies for Cyberwarfare Prevention Managing Risk in Information Systems The Student’s Guide of Capstone Project Document for the FPT University Students (For IA program)', N'IAP491', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Software Architecture and Design Illuminated', N'SWD391', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'SEP490', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/information-systems', N'ITA203c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'ITA301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Datasheet of ARM Cotex Mx, PLCs', N'ISP391', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Electronic Commerce 2012: A Managerial Perspective Electronic Commerce 2018: A Managerial and Social Networks Perspective', N'ISC301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Concepts in Enterprise Resource Planning', N'ISM301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Database Systems A practical approach to design, implemarntation, and management Powerpoint Slides', N'DBD301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'ITB301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'ISP490', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'IOP391', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Cloud Computing Bible', N'PRC391', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/emerging-technologies', N'EDT202c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'MCP301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'ESP301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'BDP301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'n/a', N'IOP490', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Sách giáo trình: Kỹ thuật Vovinam - Việt Võ Đạo', N'VOV114', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Computer Organization and Architecture: Design for Performance 978-0132936330 (9th), 978-0134101613 (10th) William Stallings Prentice Hall 2012 9th (or 10th)', N'CEA201', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Foundations Of Computer Science, Fundamentals of Information Systems Security, Computer architecture : A quantitative approach', N'CSI104', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'powerpoint in CD + Powerpoint prepared by previous lecturers (PP)., Calculus for engineers, Linear Algebra with applications, Essential Calculus', N'MAE101', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Course slides (.pptx), Python Programming An Introduction to Computer Science, Python for Everybody Exploring Data Using Python 3', N'PFP191', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Foundations of Programming Using C, BTP100: http://cs.senecac.on.ca/~btp100/pages/welco.html, FU Presentation Powerpoints (.zip),FU CMS at http://cms.fpt.edu.vn .', N'PRF192', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Online Spec: https://www.coursera.org/specializations/academic-skills; University of Sydney', N'SSL101c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Sách giáo trình: Kỹ thuật Vovinam - Việt Võ Đạo', N'VOV124', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Software Architecture and Design Illuminated', N'SWD391', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/information-systems', N'ITA203c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Datasheet of ARM Cotex Mx, PLCs', N'ISP391', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Electronic Commerce 2012: A Managerial Perspective Electronic Commerce 2018: A Managerial and Social Networks Perspective', N'ISC301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Concepts in Enterprise Resource Planning', N'ISM301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Database Systems A practical approach to design, implemarntation, and management Powerpoint Slides', N'DBD301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Discrete Mathematics and its applications, Powerpoint image in CD + Powerpoint prepared by previous lecturers (PP), Computerized tools (for example C programming tools, Maxima http://maxima.sourceforge.net/) (CT), Adam Drozdek. Data structure and Algorithms in Java. 3rd Edition.', N'MAD101', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/computer-communications?', N'NWC203c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Modern Operating Systems (4th edition or 3rd or 2nd), Course slides (.pptx), Understanding operating systems, Connecting with Computer Science', N'OSG202', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Java 8 Specification', N'PRO192', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Working in Groups, Business Communication', N'SSG103', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Sách giáo trình: Kỹ thuật Vovinam - Việt Võ Đạo', N'VOV134', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Michaelt T. Goodrich, Roberto Tamassia, Michael H. Goldwasser: Data Structures and Algorithms in Java, 6th Edition, 2014 (ebook), FU slides (ppt), FU exercises (pdf)', N'CSD201', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'First Course in Database Systems, Database Management System, Database Management System (DBMS): A Practical Approach, Course slides (.pptx)', N'DBI202', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Dekiru Nihongo - Beginner Level: Main textbook (quyển đỏ), 4) Audio CD đi kèm Main textbook (CMS), Teacher''s Presentation Powerpoints (CMS)', N'JPD113', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lab Room Regulations (For Students), Mentor guide For Lab (For Mentors only), Evaluation Templates (For Mentors only)', N'LAB211', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/learn/python?specialization=python', N'PRP201c', 1)
GO
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/ai-foundations-for-everyone', N'AIG201c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Free Hardware and IoT Ebooks_ OReilly Media, Introduction to Arduino', N'IOT102', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Dekiru Nihongo - Beginner Level (Quyển đỏ): Main textbook Dekiru Nihongo - Beginner Level: A Supplementary Textbook on Vocabulary Dekiru Nihongo - Beginner Level: A Supplementary Textbook on Grammar', N'JPD123', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Mathematics for Machine Learning CUP PDF Slides Machine Learning cơ bản Multivariate Calculus Mathematics for machine learning YB Linear Algebra Done Right', N'MAI391', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/learn/machine-learning', N'AIL302m', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/learn/promote-ethical-data-driven-technologies?specialization=certified-ethical-emerging-technologist', N'ITE302c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/business-entrepreneurship', N'SYB302c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/academic-english', N'ENW492c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'1) Montgomery D.C. & Runger G.C., Applied Statistics and Probability for Engineers Powerpoint slides (PP). Computerized tools (for example Excel and DDXL add-ons) (CT) Elementary Statistics Using Excel, 3/E,', N'MAS291', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Template AIP391 Python artificial intelligence projects for beginners: Get up and running with artificial intelligence using 8 smart and exciting AI applications. Practical Machine Learning and Image Processing: For Facial Recognition, Object Detection, and Pattern Recognition Using Python', N'AIP391', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Introduction to Algorithms,', N'CSD301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Digital Signal Processing http://www.pearsonhighered.com/educator/product/Digital-Signal-Processing-4E/9780131873742.page The Scientist and Engineer''s Guide to Digital Signal Processing. Information website:', N'DGT301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Hướng dẫn quản lý thực tập', N'OJT202', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Digital Image Processing Instructor''s Manual and Homework Problem Solutions', N'IMP301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/natural-language-processing', N'NLP301c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/intro-cyber-security', N'IAO201c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/applied-crypto', N'CRY303c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Course Presentation Power Points Beginning Android Web Apps Development: Develop for Android using HTML5, CSS3, and JavaScript', N'PRM391', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/web-design', N'WED201c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Text book 1: Professional Java® forWebApplications', N'PRJ301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'SWP391-AppDevProject_Backlog Template Learn SQL Database Programming', N'SWP391', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/software-development-lifecycle', N'SWE201c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Giáo trình Triết học Mác-Lênin, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Giáo trình Triết học Mác-Lênin, dùng cho sinh viên đại học hệ chuyên lý luận chính trị Giáo trình Triết học Mác-Lênin C. Mác và Ph. Ăngghen: Toàn tập V.I. Lênnin: Toàn tập Giáo trình Triết học Mác-Lênin', N'MLN111', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Giáo trình Kinh tế chính trị Mác-Lênin, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Giáo trình Kinh tế chính trị Mác - Leenin, dùng cho sinh viên đại học hệ chuyên lý luận chính trị               Văn kiện Đại hội Đảng toàn quốc lần thứ VI, VII, VIII, IX, X, XI, XII, XIII C. Mác và Ph. Ăngghen: Toàn tập, t4,8,12,13,18,20,23,25. 46 V.I. Lênnin: Toàn tập, t3, 27, 45', N'MLN122', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Bộ Giáo dục và Đào tạo, Giáo trình Tư tưởng Hồ Chí Minh, dùng cho sinh viên Đại học và cao đẳng khối không chuyên ngành Mác- Lênin, tư tưởng Hồ Chí Minh. Hội đồng Trung ương biên soạn giáo trình Quốc gia các môn học Mác - Lênin và Tư tưởng Hồ Chí Minh, Giáo trình Tư tưởng Hồ Chí Minh', N'HCM201', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Giáo trình Chủ nghĩa xã hội khoa học, dùng cho sinh viên đại học hệ không chuyên lý luận chính trị Giáo trình Chủ nghĩa xã hội khoa học, dùng cho sinh viên đại học hệ chuyên lý luận chính trị Giáo trình Chủ nghĩa xã hội khoa học C. Mác và Ph. Ăngghen: Toàn tập V.I. Lênnin: Toàn tập', N'MLN131', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Giáo trình Lịch sử Đảng Cộng sản Việt Nam (Dành cho sinh viên đại học, cao đẳng khối không chuyên ngành Mác – Lênin, tư tưởng Hồ Chí Minh) Giáo trình Lịch sử Đảng Cộng sản Việt Nam (Dành cho sinh viên đại học, cao đẳng chuyên ngành Mác – Lênin, tư tưởng Hồ Chí Minh) Hồ Chí Minh toàn tập, tập 1 đến tập 15 Lịch sử Đảng Cộng sản Việt Nam, tập 1 Chiến tranh cách mạng Việt Nam 1945-1975, thắng lợi và bài học Báo cáo tổng kết một số vấn đề lý luận thực tiễn qua 30 năm đổi mới Văn kiện Đại hội đại biểu toàn quốc lần thứ XII', N'VNR202', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Security Strategies In Linux Platforms And Applications Linux Operations and Administration Hacking Linux Exposed Linux: The Complete Reference Linux Hardening in Hostile Networks: Server Security from TLS to Tor Linux Security Lecture slides, Lab manual, supplementary material', N'OSP201', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lecture slides, Lab manual, supplementary material Information Security Risk Analysis Security Controls Evaluation, Testing, and Assessment Handbook Measuring and Managing Information Risk: A FAIR Approach Information Security Management Metrics: A Definitive Guide to Effective Security Monitoring and Measurement Computer Security Handbook Managing Risk In Information Systems', N'IAA202', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lecture slides, Lab manual (ppt) https://samsclass.info/126/126_S17.shtml Malware Forensics: Investigating and Analyzing Malicious Code (online: http://library.fpt.edu.vn/book24x7.html). Introduction to Malware Analysis (whitepaper) Malware Analyst’s Cookbook and DVD: Tools and Techniques for fighting malicious code', N'IAM302', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Information Security Policy Development for Compliance: ISO/IEC 27001, NIST SP 800-53, HIPAA Standard, PCI DSS V2.0, and AUP V5.0 Protecting Controlled Unclassified Information in Nonfederal Systems and Organizations Computer Security Handbook Security Policies and Implementation Issues', N'IAP301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lecture slides, Lab-Projects. Digital Forensics Processing and Procedures: Meeting the Requirements of ISO 17020, ISO 17025, ISO 27001 and Best Practice Requirements Digital Forensics Trial Graphics: Teaching the Jury Though Effective Use of Visuals Guide to Computer Forensics and Investigations Processing Digital Evidence The Basics of Digital Forensics: The Primer for Getting Started in Digital Forensics', N'FRS301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Software Requirements More About Software Requirements: Thorny Issues and Practical Advice', N'SWR302', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Agile Testing: A Practical Guide for Testers and Agile Teams Foundations of Software Testing: ISTQB Certification', N'SWT301', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/michiganux', N'WDU203c', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Lecture slides, Lab Manual Hacking Exposed 7: Network Security Secrets and Solutions Certified Ethical Hacker version 9 Hacker Techniques, Tools, and Incident Handling Hands-On Ethical Hacking and Network Defense (online http://library.books24x7.com/toc.aspx?bookid=80730).', N'HOD401', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Intergrated Security System Design Systems Analysis and Design Cybersecurity Policies and Strategies for Cyberwarfare Prevention Managing Risk in Information Systems The Student’s Guide of Capstone Project Document for the FPT University Students (For IA program)', N'IAP491', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Cloud Computing Bible', N'PRC391', 1)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/emerging-technologies', N'EDT202c', 1)
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'student')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'teacher')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'staff')
GO
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (1, 3)
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (3, 1)
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (4, 4)
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (6, 4)
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu và phân tích kỹ thuật bộ đá:
	Introduce and analyse kick techniques:
	+ Kỹ thuật đá thẳng
	Straight kick technique
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu và phân tích kỹ thuật đá cạnh.
	Introduce and analyze crescent kick technique.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Hoàn thiện kỹ thuật đá cạnh.
	Improve crescent kick technique.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu và phân tích kỹ thuật đá tạt.
	Introduce and analyze roundhouse kick techniques.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Hoàn thiện kỹ thuật đá tạt.
	Improve roundhouse kick technique.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu và phân tích kỹ thuật đá đạp.
	Introduce and analyse side kick technique.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Hoàn thiện kỹ thuật đá đạp.
	Improve side kick technique.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Hệ thống kỹ thuật bộ đá.
	Review kick techniques.
	* Bài tập thể lực linh hoạt.
	Flexible exercises on physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu và phân tích kỹ thuật phản đòn đấm thẳng phải
	Introduce and analyze technique on counter attack straight right punch.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Hoàn thiện kỹ thuật phản đòn đấm thẳng phải
	Improve technique on counter attack straight right punch.
	"* Bài tập ghép đôi, chia nhóm"
	"Pair exercises, group exercise"
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu và phân tích kỹ thuật phản đòn đấm lao phải.
	Introduce and analyse technique on counter attack long right punch.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Hoàn thiện kỹ thuật phản đòn đấm lao phải
	Improve technique on counter attack long right punch
	"* Bài tập ghép đôi, chia nhóm"
	"Pair exercises, group exercise"
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu và phân tích kỹ thuật phản đòn đấm múc phải
	Introduce and analyze technique on counter attack right uppercut punch.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'	* Tổng ôn nội dung thi.
	Review', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'	Final Exam', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'	Refinal exam', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	Introduction to the course
	Chapter 1: Introduction
	1.1 Organization and Architecture
	1.2 Structure and Function', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	Assessing exercises of chapter 1
	Chapter 2: Computer Evolution and Performance
	2.1 A Brief History of Computers
	2.2 Designing for Performance', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	Chapter 2 contd.
	"2.3 Multicore, MICs, and GPGPUs"
	2.6 Performance Assessment', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Hoàn thiện kỹ thuật phản đòn đấm múc phải
	Improve technique on counter attack right uppercut punch.
	"* Bài tập ghép đôi, chia nhóm"
	"Pair exercises, group exercise"
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	* Làm quen với môn học:
	Familiarize students with the subject:
	* Giới thiệu cho sinh viên sơ lược về sự hình thành và phát triển môn võ Vovinam
	Briefly introduce the formation and development of Vovinam.
	- Việt võ đạo trong nước và thế giới.
	Vovinam in Vietnam and in the world.
	* Giới thiệu về các quy định và nghi lễ trong môn học Vovinam tại trường Đại học FPT.
	Introducce regulations of the subject of Vovinam at FPT University.
	* Hướng dẫn các kỹ thuật khởi động cơ bản.
	Instruct basic warm-up techniques.
	* Giới thiệu kỹ thuật tay quyền và tay chưởng.
	Introduce fist and open-hand techniques.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	* Ôn tập kỹ thuật tay quyền - tay chưởng.
	Review fist and open-hand techniques.
	* Giới thiệu kỹ thuật tấn:
	Introduce stance techniques:
	+ Trung bình tấn;
	Middle stance
	+ Cung tiễn tấn;
	Bow stance
	+ Kiềm dương mã tấn
	Horse stance
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	* Ôn tập kỹ thuật tay quyền - tay chưởng.
	Review fist and open-hand techniques.
	* Giới thiệu kỹ thuật tấn:
	Introduce stance techniques:
	+ Đinh tấn;
	Front stance;
	+ Tam giác tấn;
	Triangle stance;
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	* Ôn tập và hoàn thiện kỹ thuật tấn đã học.
	Review and improve stance techniques that have been learned.
	* Giới thiệu kỹ thuật bộ chém:
	Introduce cutting edge technique:
	+ Chém số 1;
	Cutting edge 1;
	+ Chêm số 2.
	Cutting edge 2;
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	* Ôn tập và hoàn thiện kỹ thuật tấn đã học.
	Review and improve stance techniques that have been learned.
	* Giới thiệu kỹ thuật bộ chém:
	Introduce cutting edge technique:
	+ Chém số 3;
	Cutting edge 3;
	+ Chêm số 4.
	Cutting edge 4;
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu kỹ thuật bộ đấm:
	Introduce punch techniques:
	+ Đấm thẳng;
	Straight punch;
	+ Đấm thấp;
	Low punch;
	+ Đấm lao.
	Long punch.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu kỹ thuật bộ đấm:
	Introduce punch techniques:
	+ Đấm móc;
	Hook punch;
	+ Đấm múc;
	Upper Cut punch;
	* Thể lực.
	Physical strength', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve basic techniques that have been learned.
	* Giới thiệu kỹ thuật bộ đấm:
	Introduce punch techniques:
	+ Đấm bật ngược;
	Back punch;
	+ Đấm phạt ngang;
	Hammer punch;
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve basic techniques that have been learned.
	*Giới thiệu kỹ thuật bộ gạt:
	Introduce block techniques:
	+ Gạt số 1;
	Block 1
	+ Gạt số 2.
	Block 2
	* Thể lực.
	Physical strength', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve basic techniques that have been learned.
	*Giới thiệu kỹ thuật bộ gạt:
	Introduce block techniques:
	+ Gạt số 3;
	Block 3
	+ Gạt số 3.
	Block 4
	* Thể lực.
	Physical strength', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	Assessing exercises of chapter 2
	Chapter 3 A Top-Level View of Computer Function and Interconnection
	3.1 Computer Components
	3.2 Computer Function', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	Chapter 3 contd.
	3.3 Interconnection Structures
	3.4 Bus Interconnection', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	Assessing exercises of chapter 3
	Chapter 4 Cache Memory
	4.1 Computer Memory System Overview
	4.2 Cache Memory Principles', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	*Giới thiệu kỹ thuật bộ chỏ:
	Introduce elbow techniques:
	+ Chỏ số 1;
	Elbow strike 1;
	+ Chỏ số 2.
	Elbow strike 2.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	*Giới thiệu kỹ thuật bộ chỏ:
	Introduce elbow techniques:
	+ Chỏ số 3;
	Elbow strike 3;
	+ Chỏ số 4.
	Elbow strike 4.
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	* Ôn tập và hoàn thiện kỹ thuật đã học.
	Review and improve techniques that have been learned.
	* Giới thiệu và phân tích kỹ thuật bộ đá:
	Introduce and analyse kick techniques:
	+ Kỹ thuật đá thẳng
	Straight kick technique
	* Thể lực.
	Physical strength.', N' VOV114')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	Chapter 4 contd.
	4.3 Elements of Cache Design', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	Assessing exercises of chapter 4
	Chapter 5 Internal Memory
	5.1 Semiconductor Main Memory
	5.2 Error Correction', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	Chapter 5 contd.
	5.3 Advanced Dram Organization', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	Assessing exercises of chapter 5
	Chapter 6 External Memory
	6.1 Magnetic Disk
	6.2 Raid', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	Chapter 6 External Memory contd.
	6.2 Raid contd
	6.3 Solid State Drives', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	Assessing exercises of chapter 6
	Chapter 7 Input/Output
	7.1 External Devices
	7.2 I/O Modules
	7.3 Programmed I/O', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	Chapter 7 Input/Output contd.
	7.4 Interrupt-Driven I/O
	7.5 Direct Memory Access
	7.6 I/O Channels and Processors', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	Assessing exercises of chapter 7
	Chapter 8 Operating System Support
	8.1 Operating System Overview', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	Chapter 8 Operating System Support contd.
	8.2 Scheduling
	8.3 Memory Management', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'	Assessing exercises of chapter 8
	Chapter 11 Digital Logic
	11.1- Boolean Algebra
	11.2-Gates
	11.3- Combinational Circuit', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'	Assessing exercises of chapter 9
	Chapter 12 Instruction Sets: Characteristics and Functions
	12.1 Machine Instruction Characteristics
	12.2 Types of Operands', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'	Chapter 12 Instruction Sets: Characteristics and Functions cont.
	12.4 Types of Operations', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'	Assessing exercises of chapter 12
	Chapter 13 Instruction Sets: Addressing Modes and Formats
	13.1 Addressing Modes
	13.3 Instruction Formats
	13.5 Assembly Language', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'	Practical Assembly Laguage', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'	Practical Assembly Laguage', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'	Practical Assembly Laguage', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'	Practical Assembly Laguage
	Assignment introduction (2 programs)', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'	Assessing exercises of chapter 13
	Chapter 14 Processor Structure and Function
	14.1 Processor Organization
	14.2 Register Organization', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'	Chapter 14 Processor Structure and Function contd.
	14.3 Instruction Cycle
	14.4 Instruction Pipelining', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'	Assessing exercises of chapter 14
	Chapter 15 Reduced Instruction Set Computers
	15.1 Instruction Execution Characteristics
	15.2 The Use of a Large Register File
	15.3 Compiler-Based Register Optimization
	15.4 Reduced Instruction Set Architecture', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'	Assessing exercises of chapter 15
	Chapter 16 Instruction-Level Parallelism and Superscalar Processors
	16.1 Overview
	16.2 Design Issues', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'	Assessing exercises of chapter 16
	Chapter 17 Parallel Processing
	17.1 Multiple Processor Organizations
	17.2 Symmetric Multiprocessors
	17.3 Cache Coherence and the MESI Protocol
	17.4 Multithreading and Chip Multiprocessors', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'	Assessing exercises of chapter 16
	Chapter 18 Multicore Computers
	18.1 Hardware Performance Issues
	18.2 Software Performance Issues
	18.3 Multicore Organization', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'	Assessing assigments
	Review', N' CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	Introduction to the Course
	1.Computer Organization
	1.1 Von Neumann model
	1.2 Computer generations', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	1.3 Subsystems and the role of subsystems
	1.4 Central Processing Unit', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	1.5 Memory: main memory and cache memory', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	1.6 Input/Output subsystems
	1.7 Different architectures', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	2. Numbering systems
	2.1 Introduction
	2.2 Positional Number Systems
	2.3 Conversion', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	Lab 1: Guide
	Introduction to presentation 1', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	3.Data storage and Operations on Data
	3.1 Storing Numbers
	"3.2 Storing Text, Media, Image, Video"', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	"3.3 Logic, Shift, Arithmetic operations"', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	4. Computer Networks and Internet
	4.1 Overview
	4.1.1 LAN & WAN
	4.1.2 TCP/IP protocol
	4.2 layers in netwoking', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	5. Operating System
	5.1 Introduction
	5.2 Evolution
	"5.3 Components of OS: UI, memory manager, process manager, file manager, device manager"', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	"5.3 Components of OS: UI, memory manager, process manager, file manager, device manager (continue)"', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	Progress test 1', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	6. Algorithms
	"6.1 Concepts: input, output, processing"
	6.2 Three basic constructs', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	6.3 Algorithm representation
	"6.4 Search Algorithms: linear, binary"', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	Presentations 1', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'	7. Programming
	7.1 translation
	7.2 programming paradigms
	7.2common concepts', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'	Lab 2: Guide
	Introduction to presentation 2', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'	8.Software engineering
	8.1 The software lifecycle
	8.2 Analysis phase
	8.3 Design phase', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'	8.4 Implementation phase
	8.5 Testing phase', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'	9. Data structures
	9.1 Arrays
	9.2 Records
	9.3 Linked List', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'	"9.4 Introduction: Stack, Queue, Tree, graph"', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'	Presentation 2', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'	10.File structure
	10.1 Text versus Binary
	10.2 access methods', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'	11. Database
	11.1 Itroduction
	11.2 Database architecture', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'	11.3 Database model
	11.4 The relationship database model', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'	11.5 Database design
	11.6 Guide do practice set (database)', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'	12. Security and Ethical Issues
	12.1 Introduction
	12.2 Confidentiality
	12.3 Ethical Principles', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'	12.4 Privacy
	12.5 Hackers', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'	Progress test 2', N' CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'	Review', N' CSI104')
GO
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'AIG201c', N'Artificial Intellegence', N'<p>This specialization is designed for those with little or no background in AI, whether you have technology background or not, and does not require any programming skills. It is designed to give learners a firm understanding of what is AI, its applications and use cases across various industries. Learners will become acquainted with terms like Machine Learning, Deep Learning and Neural Networks.</p>

<p>Furthermore, it will familiarize learners with IBM Watson AI services that enable any business to quickly and easily employ pre-built AI smarts to their products and solutions. Learners will also learn about creating intelligent virtual assistants and how they can be leveraged in different scenarios.</p>

<p>By the end of this specialization, learners will have had hands-on interactions with several AI environments and applications, and have built and deployed an AI enabled chatbot on a website &ndash; without any coding.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'AIL302m', N'Machine Learning', N'<p>Machine learning is the science of getting computers to act without being explicitly programmed. In the past decade, machine learning has given us self-driving cars, practical speech recognition, effective web search, and a vastly improved understanding of the human genome. Machine learning is so pervasive today that you probably use it dozens of times a day without knowing it. Many researchers also think it is the best way to make progress towards human-level AI.<br />
<br />
This course provides a broad introduction to machine learning, datamining, and statistical pattern recognition. Topics include: (i) Supervised learning (parametric/non-parametric algorithms, support vector machines, kernels, neural networks). (ii) Unsupervised learning (clustering, dimensionality reduction, recommender systems, deep learning). (iii) Best practices in machine learning (bias/variance theory; innovation process in machine learning and AI). The course will also draw from numerous case studies and applications, so that you&#39;ll also learn how to apply learning algorithms to building smart robots (perception, control), text understanding (web search, anti-spam), computer vision, medical informatics, audio, database mining, and other areas.<br />
<br />
This course will be implemented through online mode. Students will learn officially the online course &quot;Machine Learning&quot; on Coursera. During the online learning process, students will be guided by teachers-tutors through some offline sessions on the campus, and through emails</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'AIP391', N'AI programming project', N'<p>The initial course for students to become familiar with AI problems. Through sample tutorials, students can understand the practical application of AI, how to perform step-by-step, the knowledge to equip the field of AI (computer vision, natural language processing, data science, robotics..).<br />
The Project provides students, working in groups, with a significant project experience in which they can integrate much of the material they have learned in their program, including matters relating to introduction, design, human factors, professionalism, and project management.<br />
Students will be guided to develop a software system, employing knowledge gained from courses throughout the program.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'AIP490', N'AI Capstone Project', N'Capstone Project')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'BDP301', N'Blockchain Basics', N'<p>The Blockchain basics is the first course of the Blockchain development in Finance program. The course aim to equip students with: development history, fundamental concepts, structure and operational principles of blockchain technology platform; definitions, structure, operational principles of Ethereum blockchain; security mechanisms, transaction authentication, block authentication, blockchain data integrity protection, trust elements and consensus mechanisms and protocols in the blockchain (Consensus). Students are guided to learn and practice with the Ethereum blockchain system</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'CEA201', N'Computer Organization and Architecture', N'<p>This course in an introduction to computer architecture and organization. It will cover topics in both the physical design of the computer (organization) and the logical design of the computer (architecture). The main contents include the organization of a simple stored-program computer: CPU, busses and memory; Instruction sets, machine code, and assembly language; Conventions for assembly language generated by compilers; Floating-point number representation; Hardware organization of simple processors; Address translation and virtual memory; Very introductory examples of input/output devices, interrupt handling and multi-tasking systems.<br />
Chapter covered: Computer Evolution and Performance; A Top-Level View of Computer Function and Interconnection; Cache Memory; Internal Memory; External Memory; Input/Output; Operating System Support; Instruction Sets: Characteristics and Functions; Processor Structure and Function; Reduced Instruction Set Computers; Instruction-Level Parallelism and Superscalar Processors; Parallel Processing; Multicore Computers.<br />
<br />
Assessment scheme:<br />
<br />
1) On-going asessment:<br />
- 4 Exercises: 30%<br />
- 02 Assignment: (2 Assembly programs) 30%<br />
2) Final exam: 40%<br />
3) Final result: 100%<br />
Completion Criteria:<br />
1) Every on-going assessment component &gt;0<br />
2) Final Exam Score &gt;=4 &amp; Final Result &gt;=5</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'CRY303c', N'Applied Cryptography', N'<p>This course is an introduction to applied cryptography and its relationship to secure systems. Students will learn making, breaking codes and ciphers. They can have a good understanding of major concepts in applied cryptography: plain text, encryption, cipher text, block ciphers, decryption, public-key cryptosystems, hash functions, digital signatures, authentication, key management, and cryptographic protocols as a part of securing digital systems.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'CSD201', N'Data Structures and Algorithm', N'<p>Upon finishing the course, students can:<br />
1) Knowledge: Understand (ABET e)<br />
- the connection between data structures and their algorithms, including an analysis of algorithms&#39; complexity;<br />
- data structurre in the context of object-oriented program design;<br />
- how data structure are implemented in an OO programming language such as Java<br />
2) Able to (ABET e)<br />
- organize and manipulate basic structures: array, linked list, tree, heap, hash<br />
- use algorithms for traversing, sorting, searching on studying structures<br />
- select a suitable algorithm to solve a practical problem<br />
3) Able to (ABET k)<br />
- use JAVA programming language for solving some problems<br />
- use Eclipse tool for developing programs in JAVA<br />
- Implement some programs in JAVA to solve practical problems based on the studying algorithms<br />
4) Others: (ABET i)<br />
- Improve study skills (academic reading, information searching, ...)<br />
<br />
Assessment scheme:<br />
<br />
1) On-going Assessment<br />
- 2 Assignments: 20%<br />
- At least 2 progress tests: 20%<br />
- 1 Practical Exam (PE) 30%<br />
2) 1 Final Exam: 30%<br />
3) Final Result 100%<br />
Completion Criteria:<br />
1) Every on-going assessment component &gt; 0<br />
2) Practical Exam &gt; 0<br />
3) Final Exam Score &gt;= 4 &amp; Final Result &gt;= 5</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'CSD301', N'Advanced Algorithms', N'<p>This course cover the following topics:<br />
1. Divide-and-Conquer &amp; Recursive strategies in algorithm<br />
2. Probabilistic Analysis and Randomized Algorithms<br />
3. Medians and Order Statistics<br />
4. Advanced data structures like Red-Black Trees, B-Trees, Fibonacci Heaps and Strategies to Augmenting Data Structures<br />
5. Dynamic Programming<br />
6. Greedy Algorithms<br />
7. Amortized Analysis<br />
8. Data Structures for Disjoint Sets<br />
9. Multithreaded Algorithms<br />
10. Linear Programming<br />
11. Computational Geometry<br />
12. Approximation Algorithms</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'CSI104', N'Introduction to Computer Science', N'<p>This course provides an overview of computer Fundamentals. Topics cover all areas of computer science in breadth such as computer organization, network, operating system, data structure , file structure, social and ethical issues.<br />
Major Instructional Areas<br />
- Introduction to Von Neumann Model and computer components<br />
- Numbering system &amp; data representation<br />
- Different data types and operations on data<br />
- The concepts of computer networking and internet<br />
- Operating system<br />
- Introduction to basic algorithms and algorithms representation<br />
- Introduction to Data structure and File structure<br />
- The concepts of database<br />
- software engineering<br />
- Computing Security &amp; Ethics<br />
<br />
Assessment structure:<br />
<br />
1) Ongoing assessment: 60%:<br />
02 progress tests: 30%<br />
02 labs 20%<br />
02 Presentations 10%<br />
2) Final Exam: 40%<br />
3) Final result 100%<br />
<br />
Completion Criteria:<br />
1) Every on-going assessment component &gt; 0<br />
2) Final Exam Score &gt;= 4 &amp; Final Result &gt;= 5</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'DBD301', N'Advanced Databases', N'<p>The course is to provide students with some most advantage knowledge in DataBase field:<br />
- Conceptual Database Design (review)<br />
- Methodology &ndash; Logical Database Design for the Relational Model (review)<br />
- Methodology &ndash; Physical Database Design for Relational Databases (review)<br />
- Distributed DBMSs &ndash; Concepts and Design<br />
- Overview of Networking<br />
- Functions and Architectures of a Distributed DBMSs<br />
- Object-Oriented DBMSs &ndash; Concepts and Design<br />
- Weakness of Relational DBMSs<br />
- Storing Objects in a Relational Database<br />
- Issues in Object Oriented DBMSs<br />
- Advantages and Disadvantages of Object Oriented DBMSs<br />
- Object Data Standard ODMG 3.0<br />
- Object-Relational DBMSs<br />
- Security and Administration<br />
- Transaction Management<br />
- Query Processing<br />
- Introduce to Data mining and Data Warehousing<br />
This course will also first step introduce to students using Oracle (10g version) like DBMS on work.<br />
&nbsp;</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'DBI202', N'Database Systems', N'<p>- Knowledge about database systems has become an essential part of an education in computer science because database management has evolved from a specialized computer application to a central component of a modern computing environment.<br />
- The content of this course includes aspects of database management basic concepts, database design, database languages, and database-system implementation. Basing on these contents, the course emphasizes on how to organize, maintain and retrieve efficiently data and information from a DBMS.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'DGT301', N'Digital Signal Processing', N'<p>The course is to provide students with knowledge in Digital Signal Processing. The course focus on DSP theory and the practical applications of DSP. The course has following contents:<br />
1. Introduction to DSP<br />
2. Discrete-Time Signals &amp; Systems<br />
3. Tools and Softwares for Digital Signal Processing<br />
4. z-Transform<br />
5. Frequency Analysis of Signals &amp; Systems<br />
6. Discrete Fourier Transform<br />
7. Efficient Computation of DFT: Fast Fourier Transform<br />
8. Implementation of Discrete-Time Systems<br />
9. Design of Digital Filters<br />
10. Sampling &amp; Reconstruction of Signals<br />
11. Multirate Digital Signal Processing<br />
12. Power Spectrum Estimation<br />
13. Introduction DS Processor &amp; Realisation of FIR filter on the hardware<br />
<br />
Assessment scheme:<br />
<br />
1) On-going asessment:<br />
- 01 Assignment: 20%<br />
- 02 quizzes: 2x15%=30%<br />
- exercises: 10%<br />
2) Final Exam: 40%<br />
3) Final Result: 100%<br />
<br />
Completion Criteria:<br />
1) Every on-going assessment component &gt;0<br />
2) Final Exam Score &gt;=4 &amp; Final Result &gt;=5</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'EDT202c', N'Emerging Digital Technologies', N'<p>This course is intended for researchers and business experts seeking state-of-the-art knowledge in advanced science and technology. The course covers details on Big Data (Hadoop, Spark, Storm), Smartphones, Smart Watches, Android, iOS, CPU/GPU/SoC, Mobile Communications (1G to 5G), Sensors, IoT, Wi-Fi, Bluetooth, LP-WAN, Cloud Computing, AR (Augmented Reality), Skype, YouTube, H.264/MPEG-4 AVC, MPEG-DASH, CDN, and Video Streaming Services. The Specialization includes projects on Big Data using IBM SPSS Statistics, AR applications, Cloud Computing using AWS (Amazon Web Service) EC2 (Elastic Compute Cloud), and Smartphone applications to analyze mobile communication, Wi-Fi, and Bluetooth networks.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ENW492c', N'Academic Writing Skills', N'<p>The skills taught in this Specialization will empower you to succeed in any college-level course or professional field. You&rsquo;ll learn to conduct rigorous academic research and to express your ideas clearly in an academic format. In the final Capstone Project, all the knowledge that you&rsquo;ve gained over the span of these courses will culminate into an academic research paper on an issue of your choice.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ESP301', N'Embedded system programming', N'<p>Speaking skill Upon completion of the course, students should be able to:<br />
- Make a good impression - Solve problems<br />
- Understand announcements and signs/ understand and use gesture - Understand crime and punishment/ solve crimes - Understand school system - Remember things - Understand people, languages and customs - Understand and use technology - Stay healthy - Cope with stress - Understand and describe weather events<br />
- Understand friendship and personality<br />
- Understand qualities in making a good impression<br />
- Manage their lives<br />
- Understand travel/ Describe vacations<br />
- Use the phone<br />
- Understand jobs</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'FRS301', N'Digital Forensics', N'<p>This course addresses the comprehension and application of Digital Forensic Investigations. Students will evaluate and synthesize technical and legal issues in relation to digital evidence. Students will apply various skills and techniques, combined with numerous investigative software tools to analyze seized electronic media. Students subject to background investigation prior to admittance.<br />
<br />
Assessment scheme:<br />
<br />
1) On-going Assessment<br />
- 01 Midterm Progress Test: 20%<br />
- Participation in Discussions: 10%<br />
- 14 Lab-Projects: 40%<br />
2) 01 Final Exam: 30%<br />
3) Final Result 100%<br />
Completion Criteria:<br />
1) Every on-going assessment component &gt;0<br />
2) Average Lab Score &gt;= 4<br />
3) Final Exam Score &gt;=4 &amp; Final Result &gt;=5</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HCM201', N'Ho Chi Minh Ideology', N'<p>Cung cấp cho sinh vi&ecirc;n những kiến thức cơ bản của Tư tưởng Hồ Ch&iacute; Minh về những vấn đề cơ bản của c&aacute;ch mạng Việt Nam. Nội dung gồm 8 chương: Chương mở đầu (nhập m&ocirc;n), chương 1:Cơ sở, qu&aacute; tr&igrave;nh h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển tư tưởng Hồ Ch&iacute; Minh. chương 2: Tư tưởng Hồ Ch&iacute; Minh về vấn đề d&acirc;n tộc v&agrave; c&aacute;ch mạng giải ph&oacute;ng d&acirc;n tộc, chương 3:Tưởng Hồ Ch&iacute; Minh về chủ nghĩa x&atilde; hội v&agrave; con đường qu&aacute; độ l&ecirc;n chủ nghĩa x&atilde; hội ở Việt nam, chương 4:Tưởng Hồ Ch&iacute; Minh về Đảng cộng sản Việt Nam, chương 5:Tưởng Hồ Ch&iacute; Minh về đại đo&agrave;n kết d&acirc;n tộc v&agrave; đo&agrave;n kết quốc tế, chương 6:Tưởng Hồ Ch&iacute; Minh về vấn đề d&acirc;n chủ v&agrave; x&acirc;y dựng nh&agrave; nước của d&acirc;n, do d&acirc;n v&agrave; v&igrave; d&acirc;n, chương 7:Tưởng Hồ Ch&iacute; Minh về văn h&oacute;a, đạo đức v&agrave; x&acirc;y dựng con người mới.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HCM202', N'HCM Ideology', N'Giới thiệu môn học: Tư tưởng Hồ Chí Minh là kết tinh của truyền thống hàng nghìn năm dựng nước và giữ nước của dân tộc Việt Nam. Trên nền tảng đó, tư tưởng Hồ Chí Minh đã gạn lọc các hạt giống trí tuệ của phương Đông, phương Tây, vận dụng sáng tạo và phát triển chủ nghĩa Mác - Lênin vào điều kiện cụ thể của nước ta. Dưới góc độ triết học, tư tưởng Hồ Chí Minh là hệ thống các quan điểm toàn diện, sâu sắc về những vấn đề cơ bản của cách mạng Việt Nam. Mục tiêu của tư tưởng Hồ Chí Minh là hướng tới giải phóng giai cấp, giải phóng dân tộc và giải phóng con người. Do đó, tư tưởng Hồ Chí Minh đã trở thành tài sản tinh thần vô giác và là ngọn cờ dẫn dắt cách mạng Việt Nam đi từ thắng lợi này đến thắng lợi khác.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HOD401', N'Ethical Hacking and Offensive Security', N'<p>This course is an introduction to the fundamentals of ethical hacking.<br />
Students will learn how hackers attack computers and networks, and how to protect Windows and Linux systems.<br />
Legal restrictions and ethical guidelines will be taught and enforced.<br />
Students will perform many hands-on labs, both attacking and defending, using port scans, footprinting, buffer overflow exploits, SQL injection, privilege escalation, Trojans, and backdoors.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IAA202', N'Risk Management in Information Systems', N'<p>The course provides a comprehensive view of managing risk in information systems.<br />
It covers the fundamentals of risk and risk management and also includes in-depth details on more comprehensive risk management topics.<br />
Areas of instruction include how to assess and manage risk based on defining an acceptable level of risk for information systems. Elements of a business impact analysis (BIA), business continuity plan (BCP), disaster recovery plan (DRP) and computer incident response team (CIRT) plan are also discussed.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IAM302', N'Malware Analysis and Reverse Engineering', N'<p>Information Assurance (IA) is a primary example of a field that can benefit greatly from malware analysis. IA aims to protect and defend information and information systems by ensuring their confidentiality, integrity, authentication, availability, and nonrepudiation. This is mostly based on designing measures that would ensure the protection of such systems and their associated data. This makes malware analysis an essential component of IA.<br />
This course provides students with an effective immersion into the realm of Malware Analysis and Reverse Engineering. It follows a progressive approach that introduces relevant concepts and techniques while preparing students to become effective malware analysts that can use a standard methodology for detecting, analyzing, reverse engineering and eradicating malware.<br />
Some of the key aspects of this course include reverse engineering malware from various sources and using various programming languages, including Web-based languages such as JavaScript as well as Document-based ones such as VBScript. This is accomplished by using a standard methodology that involves setting up an inexpensive laboratory, isolating it from production environments, and utilizing a selected set of forensic tools in order to dissect the malware, discover its characteristics, and neutralize its effects.<br />
Scope: The scope of this course includes:<br />
1. Introduction to Malware Analysis.<br />
2. Malware Analysis Labs<br />
3. Methodology to detect, analyze, reverse-engineer, and eradicate malware.<br />
4. Malware Analysis Applications.<br />
5. Forensics tools used for Malware Analysis.<br />
Course Objectives: This course will equip students with the necessary background knowledge in order to become effective Malware Analysis &amp; Reverse Engineering practitioners.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IAO201c', N'Introduction to Information Assurance', N'<p>This course will introduce fundamental modern information and system protection technology and methods, develop a lifelong passion and appreciation for cyber security.<br />
<br />
Final Exam is included of Final Theory Exam (TE) &amp; Final Practical Exam (PE): 100%<br />
Student gets 0.25 bonus points for each course completed on time. The total bonus point is not greater than 1.<br />
Completion Criteria: Final TE Score &gt;=4 &amp; Final PE Score &gt;=4 &amp; ((Final TE Score + Final PE Score)/2 + bonus) &gt;= 5<br />
In the case: (5 &gt; Final TE Score &gt;=4) &amp; (5 &gt; Final PE Score &gt;=4) &amp; ((Final TE Score + Final PE Score)/2 + bonus) &lt; 5, the student can choose to take the resit of both TE &amp; PE OR just either TE or PE.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IAP301', N'Policy Development in Information Assurance', N'<p>This course delivers a logical sequence of discussions about major concepts and issues related to information assurance policy implementation. Organizational objectives,, threats, risk mitigation and cost-benefit analysis will be explored. The student will utilize industry accepted methodologies to create practical security policy that will communicate the organization&rsquo;s asset protection objectives.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IAP491', N'IA Capstone Project', N'<p>The Capptone Project provides students, working in groups, with a significant project experience in which they can integrate much of the material they have learned in their program, including matters relating to requirements, design, human factors, professionalism, and project management.<br />
Students will be guided to Develop an IA solution, employing knowledge gained from courses throughout the program. It includes development of risk assessement, analysis and management, implementation, and quality assurance. Students may follow any suitable process model, must pay attention to quality issues, and must manage the project themselves, following all appropriate project management techniques. Success of the project is determined in large part by whether students have adequately solved their customer&rsquo;s problem.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IAR401', N'Incident Response', N'<p>This course will introduce the student to the essential aspects of information security and<br />
incident response (IR). The student will be provided with the tools, techniques and industry accepted methodologies so that upon completion of the course the student will be able to describe key concepts of network security and incident response and how those concepts apply to themselves and their organization.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IMP301', N'Image processing', N'<p>This course provides an introduction to basic concepts and methodologies applicable to digital image processing, and to develop a foundation that can be used as the basis for further study and research in this field.<br />
To achieve these objectives, this course focused again on material that is fundamental and whose scope of application is not limited to the solution of specialized problems.<br />
The mathematical complexity in this course remains at a level well within the grasp of college seniors and first-year graduate students who have introductory preparation in mathematical analysis, vectors, matrices, probability, statistics, linear systems, and computer programming.<br />
The course provides tutorials to support students needing a review of this background material.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IOP391', N'IoT application development project', N'n/a')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IOP490', N'IoT Capstone Project', N'IoT Capstone Project')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IOT102', N'Internet of Things', N'<p>This is a 3-credit course. This course has two parts online and offline.<br />
The content includes basic concepts and applications of IoT, practical exercises on the learning KIT.<br />
Students are taught how to learn online, and practice some parts at home. Q &amp; A sessions, the Guidance for important issues, as well as performance assessments, will be conducted in the classroom.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ISC301', N'E-Commerce', N'<p>By the end of the course, students will be able to understand:<br />
- E-Commerce and E-Marketplaces<br />
- Internet Consumer Retailing<br />
- Social media and commerce topics<br />
- Business-to-Business E-Commerce<br />
- Other EC Models and Application<br />
- EC Support Services<br />
- EC Strategy and Implementation<br />
- Launching a Successful Online Business</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ISM301', N'Enterprise Resource Planning (ERP)', N'<p>* Describes basic business function area and explain how they are related.<br />
* Illustrates how unintergrated information system fail to support business functions and business processes that cut across functional area boundaries.<br />
* Demonstrated how intergrated information system can help a company prosper by improving business processes and by providing business managerswith accurate, consistent, and current data.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ISP391', N'Integrated System Project', N'<p>The course is designed as a project-based learning course where students could apply fully-equipped knowledges to design simple real systems based on KITs from manufacturers such as Free Scales, Nouvoton and Phoenix. Students can select one of seven different projects for students to practice in team. Names of projects:<br />
1. Monitoring and controlling room temperature based on ARM Freescale<br />
2. Monitoring and controlling room temperature based on ARM Nuvoton<br />
3.Monitoring and controlling room temperature based on PLC<br />
4. Main Controller for Smarthome based on ARM.<br />
5. Game Controller based on ARM.<br />
6. Traffic light Controller based on PLC.<br />
7. Home weather station based on ARM<br />
A programmable logic controller (PLC) is an electronic device used in many industries to monitor and control building systems and production processes. Unlike PCs and smartphones, which are designed to perform any number of roles, a PLC is designed to perform a single set of tasks, except under real-time constraints and with superior reliability and performance.<br />
To meet the demands of harsh industrial environments, PLCs are designed to be extremely robust, often capable of withstanding extreme temperatures, humidity, vibration, and electrical noise. Logic controllers are commonly tasked with monitoring and controlling a very large number of sensors and actuators, and are therefore distinct from other computer systems in their extensive input/output (I/O) arrangements.<br />
The ARM Cortex-M is a group of 32-bit RISC ARM processor cores licensed by ARM Holdings. The cores are intended for microcontroller use, and consist of the Cortex-M0, M0+, M1, M3, M4, and M7. ARM core processors can support powerful peripherals and connectivity</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ISP490', N'IS Capstone Project', N' IS Capstone Project')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ITA203c', N'Information System Overview', N'<p>This intensive and hands-on series of courses gives you the skills to utilize conceptual frameworks to align IT investments with business strategy, assess the fit between business requirements and enterprise systems features, specify business requirements as information system specifications and evaluate technological alternatives for developing the IT infrastructure for the organization.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ITA301', N'Information System Design & Analysis', N'n/a')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ITB301', N'Business Intelligence (BI)', N'n/a')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ITE302c', N'Ethics in IT', N'<p>Organizations and governments are seeking out ethics professionals to minimize risk and guide their decision-making about the design of inclusive, responsible, and trusted technology. An algorithm not designed and assessed in alignment with ethical standards can create further inequity across race, gender and marginalized populations. The reputational and financial impact of an ethics violation can devastate a company. Knowledgeable ethics leaders are needed who can navigate through the more than 160 frameworks and guidelines to select and implement the best strategy to promote fairness and minimize risk for their organization. This specialization is designed for learners who want to create and lead initiatives that prioritize ethical integrity within emerging data-driven technology fields such as artificial intelligence and data science and will be prepared to bridge the gap between theory and practice.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'JPD113', N'Elementary Japanese 1- A1.1', N'<p>Nội dung học bao gồm:<br />
1) Nhập m&ocirc;n tiếng Nhật: Chữ c&aacute;i; ch&agrave;o hỏi cơ bản...<br />
- Chữ mềm (hiragana)<br />
- Chữ cứng (katakana)<br />
- C&aacute;c c&acirc;u ch&agrave;o hỏi cơ bản hay sử dụng h&agrave;ng ng&agrave;y<br />
- Số<br />
2) C&aacute;c b&agrave;i học ch&iacute;nh (b&agrave;i 1 đến 3) (gi&aacute;o tr&igrave;nh Dekiru Nihongo - Beginner)<br />
- Từ v&agrave; mẫu c&acirc;u mới<br />
- Luyện tập cơ bản<br />
- Luyện tập ứng dụng<br />
- Luyện tập hội thoại<br />
- Nghe hiểu<br />
- Chữ H&aacute;n (Kanji): c&aacute;ch viết, c&aacute;ch đọc, c&aacute;ch gh&eacute;p...<br />
- Đọc hiểu<br />
3) Mở rộng, n&acirc;ng cao:<br />
- Luyện nghe, n&oacute;i<br />
- Luyện tập thi theo h&igrave;nh thức JLPT (N5)</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'JPD123', N'Elementary Japanese 1-A1.2', N'<p>Nội dung học bao gồm:<br />
1) C&aacute;c b&agrave;i học ch&iacute;nh (b&agrave;i 4 đến 7) (gi&aacute;o tr&igrave;nh Dekiru Nihongo - Beginner)<br />
- Từ v&agrave; mẫu c&acirc;u mới<br />
- Luyện tập cơ bản<br />
- Luyện tập ứng dụng<br />
- Luyện tập hội thoại<br />
- Nghe hiểu<br />
- Chữ H&aacute;n (Kanji): c&aacute;ch viết, c&aacute;ch đọc, c&aacute;ch gh&eacute;p...<br />
- Đọc hiểu<br />
2) Mở rộng, n&acirc;ng cao:<br />
- Luyện nghe, n&oacute;i<br />
- Luyện tập thi theo h&igrave;nh thức JLPT (N5)</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'LAB211', N'OOP with Java Lab', N'<p>This course focuses on basic problems related to Java programming skills. Students are required to implement all assignments by him/her self in lab rooms.<br />
Each assignment must be completed continuosly in the defined time.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MAD101', N'Discrete mathematics', N'<p>Upon finishing the course, students must acquire:<br />
1. the following knowledge: (ABET a.1)<br />
&bull; Concepts of logical expressions &amp; predicate logic.<br />
&bull; The method of induction and recursive definition.<br />
&bull; Concepts of algorithms, recursive algorithms, the complexity.<br />
&bull; Recurrence relations and divide-and-conquer algorithms.<br />
&bull; Application of integers and congruence in information technology.<br />
&bull; Set structure and map, counting principles and combinatorics concepts.<br />
&bull; The terminologies and properties of graphs &amp; trees &amp; weighted graphs.<br />
&bull; The applications of graphs, trees and weighted graphs in information technology.<br />
<br />
2. the following skills: (ABET a.2)<br />
&bull; Manipulate logical expressions &amp; produce equivalent logical expressions.<br />
&bull; Produce proof of simple mathematical propositions, including applying induction method.<br />
&bull; Evaluate complexity of algorithms.<br />
&bull; Solving simple congruence equations.<br />
&bull; Apply counting techniques in evaluating various set cardinalities.<br />
&bull; Solve counting problems, apply in analyze algorithms.<br />
&bull; Apply graph&rsquo;s algorithms to solve problems related to graph theory.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MAE101', N'Mathematics for Engineering', N'Calculus')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MAI391', N'Mathematics for Machine Learning', N'<p>This course introduces the mathematical concepts and foundations needed to talk about the three main components of a machine learning system: data, models, and learning. Upon this course, students will be able to understand:<br />
&bull; Fundamental concepts about matrices and matrix decomposition.<br />
&bull; Concepts of gradients.<br />
&bull; The basics of probability and some distributions.<br />
&bull; Optimization to find maxima/minima of functions.<br />
&bull; Dimensionality reduction using principal component analysis.<br />
&bull; Classification in the context of support vector machines.<br />
Method of teaching and learning: Lecture and project-based learning</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MAS291', N'Statistics & Probability', N'<p>Upon finishing the course, students must acquire:<br />
1. the following knowledge:(ABET a1)<br />
&bull; The fundamental principles of probability and their applications<br />
&bull; The frequently used probability distributions.<br />
&bull; The basics of descriptive statistics<br />
&bull; The inferences of statistics: parameter estimations, hypothesis testing, regressions &amp; correlations.<br />
2. the following skills: (ABET a2)<br />
&bull; Recognize simple statistical models and applied them to solve engineering problems.<br />
&bull; Use at least one statistical software (Excel, Maxima) for problem solving.<br />
&bull; Self-study skill. (ABET i)</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MCP301', N'Micro-controller and embedded programming', N'n/a')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MLN111', N'Philosophy of Marxism – Leninism', N'<p>Giới thiệu m&ocirc;n học: Triết học M&aacute;c - L&ecirc;nin nghi&ecirc;n cứu những quan điểm duy vật biện chứng về tự nhi&ecirc;n, x&atilde; hội, tư duy v&agrave; nhờ đ&oacute; thế giới quan duy vật biện chứng trở th&agrave;nh to&agrave;n diện v&agrave; triệt để. &Aacute;p dụng v&agrave; mở rộng quan điểm duy vật biện chứng v&agrave;o nghi&ecirc;n cứu x&atilde; hội, M&aacute;c đ&atilde; đưa ra được quan niệm duy vật về lịch sử, chỉ ra con đường nghi&ecirc;n cứu những quy luật của sự ph&aacute;t triển x&atilde; hội, cũng như sự ph&aacute;t triển của tự nhi&ecirc;n, kh&ocirc;ng phải do &yacute; muốn chủ quan m&agrave; do những quy luật kh&aacute;ch quan quyết định. Sự ra đời của Triết học M&aacute;c - L&ecirc;nin đ&atilde; đặt cơ sở cho việc nghi&ecirc;n cứu lịch sử v&agrave; đời sống x&atilde; hội thực sự c&oacute; t&iacute;nh chất khoa học.<br />
Course introduction: Philosophy of Marxism &ndash; Leninism studies dialectical materialistic views on nature, society, and the mind, making the worldview of dialectical materialism becomes comprehensive. Applying and expanding the dialectical materialist perspective to social research, Marx has introduced historical materialism and pointed out the way to study the laws of social development and natural development governed by objective laws rather than subjective factors. The development of Marxism &ndash; Leninism philosophy has laid the foundation for the study of history and social life in a scientific way.<br />
<br />
M&ocirc;n học Triết học M&aacute;c-L&ecirc;nin nhằm gi&uacute;p cho sinh vi&ecirc;n: X&aacute;c lập cơ sở l&yacute; luận cơ bản nhất để từ đ&oacute; c&oacute; thể tiếp cận được nội dung m&ocirc;n học Kinh tế ch&iacute;nh trị M&aacute;c-L&ecirc;nin, Chủ nghĩa x&atilde; hội khoa học,Tư tưởng Hồ Ch&iacute; Minh v&agrave; Lịch sử Đảng Cộng sản Việt Nam, hiểu biết nền tảng tư tưởng của Đảng. X&acirc;y dựng niềm tin, l&yacute; tưởng c&aacute;ch mạng cho sinh vi&ecirc;n. Từng bước x&aacute;c lập thế giới quan, nh&acirc;n sinh quan v&agrave; phương ph&aacute;p luận chung nhất để tiếp cận c&aacute;c khoa học chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo.<br />
Philosophy of Marxism &ndash; Leninism course aims to help students: Form the theoretical framework to acquire knowledge of Political economics of Marxism-Leninism, Scientific socialism, Ho Chi Minh ideology, and History of Vietnamese Communist Party, understand the ideological foundation of the Party. Build trust, revolutionary ideals for students. Gradually build a worldview, philosophy of life, and the most general methodology to access specialized training courses.<br />
<br />
Nội dung m&ocirc;n học bao gồm c&aacute;c chương: Chương 1: Tr&igrave;nh b&agrave;y những n&eacute;t kh&aacute;i qu&aacute;t nhất về triết học, triết học M&aacute;c &ndash; L&ecirc;nin v&agrave; vai tr&ograve; của triết học M&aacute;c &ndash; L&ecirc;nin trong đời sống x&atilde; hội. Chương 2: Tr&igrave;nh b&agrave;y những nội dung cơ bản của chủ nghĩa duy vật biện chứng, gồm vấn đề vật chất v&agrave; &yacute; thức; ph&eacute;p biện chứng duy vật; l&yacute; luận nhận thức của chủ nghĩa duy vật biện chứng. Chương 3: Tr&igrave;nh b&agrave;y những nội dung cơ bản của chủ nghĩa duy vật lịch sử, gồm vấn đề h&igrave;nh th&aacute;i kinh tế - x&atilde; hội; giai cấp v&agrave; d&acirc;n tộc; nh&agrave; nước v&agrave; c&aacute;ch mạng; &yacute; thức x&atilde; hội; triết học về con người.<br />
The course includes chapters: Chapter 1: Present an overview of philosophy, Marxism &ndash; Leninism philosophy, and the role of Marxist-Leninist philosophy in social life. Chapter 2: Present basic issues of dialectical materialism including matter and consciousness; materialistic dialectics; cognition theory of dialectical materialism. Chapter 3: Present basic issues of historical materialism including the theory of socio-economic forms, class and peoples; state and revolution; social consciousness; philosophical theory of humans.<br />
<br />
Phương ph&aacute;p dạy học: Thuyết giảng v&agrave; kết hợp tr&igrave;nh chiếu c&aacute;c slide b&agrave;i giảng . Hướng dẫn, giao b&agrave;i tập đề t&agrave;i theo nh&oacute;m. Tổ chức v&agrave; hướng dẫn sinh vi&ecirc;n thảo luận nh&oacute;m.<br />
Teaching method: Giving lectures and slide presentations. Guiding and assigning group work assignments. Organizing and guiding students to discuss in groups.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MLN122', N'Political economics of Marxism', N'<p>Giới thiệu m&ocirc;n học:&nbsp;Kinh tế ch&iacute;nh trị M&aacute;c - L&ecirc;nin hay kinh tế ch&iacute;nh trị học M&aacute;c - L&ecirc;nin l&agrave; một l&yacute; thuyết kinh tế v&agrave; l&agrave; m&ocirc;n khoa học về kinh tế ch&iacute;nh trị do C. M&aacute;c , Ăngghen v&agrave; sau n&agrave;y l&agrave; L&ecirc;nin ph&aacute;t triển trong giai đoạn mới, c&oacute; đối tượng nghi&ecirc;n cứu l&agrave; phương thức sản xuất tư bản chủ nghĩa v&agrave; những quan hệ sản xuất v&agrave; trao đổi th&iacute;ch ứng với phương thức sản xuất tư bản chủ nghĩa. Qua đ&oacute; vạch r&otilde; bản chất, hiện tượng của c&aacute;c qu&aacute; tr&igrave;nh kinh tế để c&oacute; cơ sở giải quyết c&aacute;c mối quan hệ li&ecirc;n quan đến học thuyết của chủ nghĩa M&aacute;c - L&ecirc;nin. Cốt l&otilde;i của kinh tế ch&iacute;nh trị M&aacute;c - L&ecirc;nin l&agrave; học thuyết gi&aacute; trị thặng dư của C&aacute;c M&aacute;c.<br />
Course introduction: Political economics of Marxism &ndash; Leninism is an economic theory and scientific discipline on political economy developed by C. Marx, Engels and later Lenin in a new period, focusing on the capitalist mode of production and the production and economic exchange relations consistent with the capitalist mode of production, thereby clarifying the nature and phenomena of economic processes, laying a foundation to solve matters related to theories of Marxism - Leninism. The core of the Marxist-Leninist political economy is the surplus value theory of Marx.<br />
<br />
Mục ti&ecirc;u m&ocirc;n học:<br />
+ Người học nắm được một c&aacute;ch hệ thống kiến thức cơ bản, cốt l&otilde;i của kinh tế ch&iacute;nh trị M&aacute;c &ndash; L&ecirc;nin bao gồm: C&aacute;c kh&aacute;i niệm, phạm tr&ugrave;, quy luật kinh tế chủ yếu của kinh tế thị trường; những vấn đề kinh tế - ch&iacute;nh trị của thời kỳ qu&aacute; độ l&ecirc;n CNXH ở Việt Nam.<br />
+ X&aacute;c lập được phương ph&aacute;p luận khoa học để ph&acirc;n t&iacute;ch, đ&aacute;nh gi&aacute; được c&aacute;c vấn đề kinh tế trong nền kinh tế thị trường hiện nay. Vận dụng kiến thức của m&ocirc;n học v&agrave;o việc tiếp cận c&aacute;c m&ocirc;n khoa học chuy&ecirc;n ng&agrave;nh v&agrave; hoạt động thực tiễn của bản th&acirc;n, hiểu r&otilde; v&agrave; thực hiện tốt chủ trương, đường lối, ch&iacute;nh s&aacute;ch kinh tế của Đảng v&agrave; Nh&agrave; nước.<br />
Course objectives:<br />
+ Help students systematically grasp fundamental and core knowledge of Marxist-Leninist political economy including Concepts, categories and economic laws of Marxist-Leninist political economy; economic-political issues in the period of transition to socialism in Vietnam.<br />
+ Help students establish a scientific methodology to analyze and evaluate economic issues in the current market economy. Apply knowledge of the course to access specialized scientific subjects and practical activities, understand and well follow economic guidelines and policies of the Party and State.<br />
<br />
Nội dung m&ocirc;n học: Kinh tế ch&iacute;nh trị M&aacute;c-L&ecirc;nin tập trung nghi&ecirc;n cứu c&aacute;c quan hệ kinh tế trong l&ograve;ng x&atilde; hội tư bản v&agrave; nghi&ecirc;n cứu s&acirc;u về c&aacute;c quy luật của nền sản xuất n&agrave;y, cụ thể l&agrave;:<br />
+ Đề cập về h&agrave;ng h&oacute;a, sản xuất h&agrave;ng h&oacute;a v&agrave; c&aacute;c quy luật kinh tế của sản xuất h&agrave;ng h&oacute;a (trong chủ nghĩa Tư bản)<br />
+ Tập trung mổ xẻ quy luật kinh tế cơ bản của chủ nghĩa tư bản m&agrave; cốt l&otilde;i l&agrave; việc sản xuất gi&aacute; trị thặng dư<br />
Ph&acirc;n t&iacute;ch sự vận động của tư bản c&aacute; biệt v&agrave; t&aacute;i sản xuất tư bản x&atilde; hội<br />
+ Xem x&eacute;t c&aacute;c h&igrave;nh th&aacute;i tư bản v&agrave; c&aacute;c h&igrave;nh thức biểu hiện của gi&aacute; trị thặng dư<br />
Nghi&ecirc;n cứu về chủ nghĩa tư bản độc quyền v&agrave; chủ nghĩa tư bản độc quyền nh&agrave; nước<br />
Phương ph&aacute;p dạy học: Thuyết giảng v&agrave; kết hợp tr&igrave;nh chiếu c&aacute;c slide b&agrave;i giảng . Hướng dẫn, giao b&agrave;i tập đề t&agrave;i theo nh&oacute;m. Tổ chức v&agrave; hướng dẫn sinh vi&ecirc;n thảo luận nh&oacute;m.<br />
Content of the course: Political economics of Marxism &ndash; Leninism focuses on investigating economic relations in capitalist society and in-depth studies on laws of this economy, namely:<br />
+ Mention about commodities, commodity production and economic laws of commodity production (in capitalist social system)<br />
+ Cncentrate on analyzing basic economic laws of capitalism wth thmain focus is surplus value production<br />
Analysis of the movement of spcific capitalist social system and social capital reproduction<br />
+ Consider forms of capitalism and forms of surplus value<br />
Study monopoly capitalism and State monopoly capitalism<br />
Teaching method: Giving lectures and slide presentations. Guiding and assigning groupwork assignments. Organizing and guiding students to discuss in groups.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MLN131', N'Scientific socialism', N'<p>Giới thiệu m&ocirc;n học: Chủ nghĩa x&atilde; hội khoa học l&agrave; một trong ba bộ phận của chủ nghĩa Marx-Lenin. Chủ nghĩa x&atilde; hội khoa học đ&atilde; dựa tr&ecirc;n phương ph&aacute;p luận triết học duy vật biện chứng v&agrave; duy vật lịch sử, đồng thời cũng dựa tr&ecirc;n những cơ sở l&yacute; luận khoa học về c&aacute;c quy luật kinh tế, quan hệ kinh tế để luận giải một c&aacute;ch khoa học về qu&aacute; tr&igrave;nh nảy sinh c&aacute;ch mạng x&atilde; hội chủ nghĩa, h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển h&igrave;nh th&aacute;i kinh tế - x&atilde; hội cộng sản chủ nghĩa, gắn liền với sứ mệnh lịch sử của giai cấp c&ocirc;ng nh&acirc;n, nhằm giải ph&oacute;ng con người, giải ph&oacute;ng x&atilde; hội.<br />
Course introduction: Scientific socialism is one of the three parts of Marxism-Leninism. Scientific socialism is based on the philosophical methodology of dialectical materialism and historical materialism as well as scientific theoretical foundations of economic laws and economic relations to scientifically explain the advent of scientific socialism socialist revolution, the formation and development of the communist socio-economic form, associated with the historical mission of the working class, to liberate people and society.<br />
<br />
M&ocirc;n học Chủ nghĩa x&atilde; hội khoa học nhằm gi&uacute;p cho sinh vi&ecirc;n: Nắm được những kiến thức cơ bản, cốt l&otilde;i nhất, mở rộng v&agrave; chuy&ecirc;n s&acirc;u về Chủ nghĩa x&atilde; hội khoa học, hiểu biết nền tảng tư tưởng của Đảng. X&acirc;y dựng niềm tin, l&yacute; tưởng c&aacute;ch mạng cho sinh vi&ecirc;n. Từng bước x&aacute;c lập thế giới quan, nh&acirc;n sinh quan v&agrave; phương ph&aacute;p luận chung nhất để tiếp cận c&aacute;c khoa học chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo.<br />
The course Scientific socialism aims to help students: Acquire the most basic, extensive and in-depth knowledge of Scientific socialism, understand the Party&#39;s ideological foundation. Build trust, revolutionary ideals for students. Gradually build a worldview, philosophy of life, and the most general methodology to access specialized training courses.<br />
<br />
Nội dung m&ocirc;n học bao gồm c&aacute;c chương: gồm 7 chương: chương 1, tr&igrave;nh b&agrave;y những vấn đề cơ bản c&oacute; t&iacute;nh nhập m&ocirc;n của Chủ nghĩa x&atilde; hội khoa học (qu&aacute; tr&igrave;nh h&igrave;nh th&agrave;nh, ph&aacute;t triển của Chủ nghĩa x&atilde; hội khoa học); từ chương 2 đến chương 7 tr&igrave;nh b&agrave;y những nội dung cơ bản của Chủ nghĩa x&atilde; hội khoa học nhằm l&agrave;m s&aacute;ng tỏ những quy luật kh&aacute;ch quan của qu&aacute; tr&igrave;nh c&aacute;ch mạng x&atilde; hội chủ nghĩa.<br />
The course includes 7 chapters: Chapter 1: present basic introductory issues of Scientific socialism (the advent and development of Scientific socialism); Chapter 2 to chapter 7: present the basic knowledge of Scientific socialism to clarify the objective laws of the socialist revolution process.<br />
<br />
Phương ph&aacute;p dạy học: Thuyết giảng v&agrave; kết hợp tr&igrave;nh chiếu c&aacute;c slide b&agrave;i giảng. Hướng dẫn, giao b&agrave;i tập đề t&agrave;i theo nh&oacute;m. Tổ chức v&agrave; hướng dẫn sinh vi&ecirc;n thảo luận nh&oacute;m.<br />
Teaching method: Giving lectures and slide presentations. Guiding and assigning group work assignments. Organizing and guiding students to discuss in groups.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'NLP301c', N'Natural Language Processing', N'<p>Natural Language Processing (NLP) uses algorithms to understand and manipulate human language. This technology is one of the most broadly applied areas of machine learning. As AI continues to expand, so will the demand for professionals skilled at building models that analyze speech and language, uncover contextual patterns, and produce insights from text and audio.<br />
By the end of this Specialization, students will be ready to design NLP applications that perform question-answering and sentiment analysis, create tools to translate languages and summarize text, and even build chatbots.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'NWC203c', N'Computer Networking', N'<p>This specialization is developed for seniors and fresh graduate students to understand fundamental network architecture concepts and their impacts on cyber security, to develop skills and techniques required for network protocol design, and prepare for a future of constant change through exposure to network design alternatives. Students will require a prior knowledge of C programming, an understanding of math probability and a computer science background is a plus.<br />
<br />
Final Exam is included of Final Theory Exam (TE) &amp; Final Practical Exam (PE): 100%<br />
Student gets 0.25 bonus points for each course completed on time. The total bonus point is not greater than 1.<br />
Completion Criteria: Final TE Score &gt;=4 &amp; Final PE Score &gt;=4 &amp; ((Final TE Score + Final PE Score)/2 + bonus) &gt;= 5<br />
In the case: (5 &gt; Final TE Score &gt;=4) &amp; (5 &gt; Final PE Score &gt;=4) &amp; ((Final TE Score + Final PE Score)/2 + bonus) &lt; 5, the student can choose to take the resit of both TE &amp; PE OR just either TE or PE.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'OJT202', N'On-the-job training', N'<p>Mục ti&ecirc;u:<br />
- Tạo điều kiện cho sinh vi&ecirc;n tiếp x&uacute;c với m&ocirc;i trường l&agrave;m việc thực tế trước khi ho&agrave;n th&agrave;nh chương tr&igrave;nh học tập;<br />
- Gi&uacute;p sinh vi&ecirc;n kh&aacute;m ph&aacute; v&agrave; mở rộng hiểu biết về những vấn đề đ&atilde; được học ở một g&oacute;c nh&igrave;n rộng hơn;<br />
- Gi&uacute;p sinh vi&ecirc;n c&oacute; những trải nghiệm học tập phong ph&uacute; trong m&ocirc;i trường c&ocirc;ng nghiệp, to&agrave;n cầu h&oacute;a.<br />
H&igrave;nh thức triển khai:<br />
Sinh vi&ecirc;n được đ&agrave;o tạo thực h&agrave;nh tại doanh nghiệp đ&atilde; c&oacute; k&iacute; kết với Nh&agrave; trường. Qu&aacute; tr&igrave;nh đ&agrave;o tạo c&oacute; sự kết hợp chặt chẽ giữa đơn vị tiếp nhận đ&agrave;o tạo v&agrave; đại diện Nh&agrave; trường (Ph&ograve;ng C&ocirc;ng t&aacute;c sinh vi&ecirc;n). Tại m&ocirc;i trường doanh nghiệp, sinh vi&ecirc;n được giao nhiệm vụ, c&oacute; người trực tiếp quản l&iacute;, theo d&otilde;i, đ&aacute;nh gi&aacute; về tinh thần, th&aacute;i độ cũng như khả năng l&agrave;m việc của sinh vi&ecirc;n. Kết th&uacute;c m&ocirc;n học, sinh vi&ecirc;n được doanh nghiệp đ&aacute;nh gi&aacute; v&agrave; c&oacute; phản hồi về m&ocirc;i trường l&agrave;m việc.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'OSG202', N'Operating System', N'<p>At the end of this course, students will be able to perceive:<br />
1) Background knowledge: (ABET e)<br />
-The role of operating system,<br />
- important OS concepts,<br />
- the mechanism of operating system, and<br />
- main problems of Operating system.<br />
2) Practice skills: (ABET k)<br />
- Using basic shell command in Linux system fluently.<br />
- Fundamental of shell, C language on Linux.<br />
- Main problems of Operating system through some simulative exercises.<br />
3) Information searching, reading and selection skills (ABET i)<br />
4) Working in group, documenting and presenation skills (ABET g)</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'OSP201', N'Open Source Platform and Network Administration', N'<p>This course is an introduction to open source client/server networking, basic information<br />
security and assurance concepts. Focusing on Linux as a platform and server operating system, the course introduces various concepts related to the security of Linux platforms and applications. It identifies and examines methods to secure Linux platforms and applications. It also explains how these methods can be implemented.<br />
The course covers threats to Linux operating systems and other open source applications and mitigation of risks. It explains user account management and software management plans. The course also focuses on the various components of the Linux kernel and highlights several ways to address security breaches.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PFP191', N'Programming Fundamentals with Python', N'<p>- Knowledge about programming language has become an essential part of an education in computer science because the realization of ideas, approaches, models, and algorithms is extremely important for the field of education and research as well as production. In order to deploy from an idea to a product, programming language tools are required.<br />
- In recent years, python has emerged as a popular, powerful, multitasking and widely applicable 3rd generation language, especially in some new technology fields such as AI, Fintech, Data Science, IoT, and so on.<br />
- The content of this course includes aspects of programming basic concepts, coding design, python programming languages, and product implementation. Basing on these contents, the course emphasizes on how to develop a program by using python language.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PMG202c', N'Project Management', N'n/a')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PRC391', N'Cloud Computing', N'<p>This course will help students master the skills of designing and building cloud-native applications on AWS. They will be introduced to several AWS compute services, different storage and database offerings that AWS provides, AWS&rsquo; networking capabilities, monitoring capabilities and the AWS IAM service; how to build an API driven application using Amazon API Gateway for serverless API hosting, AWS Lambda for serverless computing and Amazon Cognito for serverless authentication.<br />
<br />
Modern applications require a modern database. Hence, they will dive deep into Amazon DynamoDB topics such as recovery, SDKs, partition keys, security and encryption, global tables, stateless applications, streams, and best practices. DynamoDB is a key-value and document database that delivers single-digit millisecond performance at any scale.<br />
<br />
Finally, students&rsquo;ll learn how to use Amazon CodeGuru Reviewer to detect issues and identify recommendations to improve the quality and security of your code.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PRF192', N'Programming Fundamentals', N'<p>Understand basics of information theory, computer system and methods of software development, focus on function-oriented programming design, coding, testing and discipline in programming.<br />
Explain basic concepts of programming, function-oriented programming design, modularity, understand and coding programs using C<br />
Upon completing the course, student should have:<br />
1. Knowledge: (ABET e)<br />
- Explain the way to solve a real problem using computer .<br />
- Understand the basic concepts of information theory, computer system, and software development.<br />
- Understand the basic concepts of programming, focus on procedure programming, testing and debugging, unit testing<br />
2. Skills in programming: (ABET k)<br />
- Read and understand the simple C programs;<br />
- Solve real problems using C<br />
3. Apply learning methods effectively: (ABET i)<br />
- academic reading<br />
- individual and team work behaviors</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PRJ301', N'Java Web Application Development', N'<p>By the end of this course Students will be able to:<br />
a) Knowledge: (what will students know?)<br />
&bull; Understand the core technologies of Java web programming:<br />
- Servlet and JSP<br />
- Scope of sharing state (session, application, request,page)<br />
- JSP Tags, JSTL, Customtags<br />
- Filtering<br />
&bull; Know how to develop and deploy your own websites using Java<br />
&bull; Understand and be able to apply MVC architecture for the web<br />
b) Skills: (what will students be able to do?)<br />
&bull; Basic Web application development applying MVC Design Pattern using Servlet/Filter as Controller</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PRM391', N'Mobile Programming', N'<p>This course providing enough basic knoweledge of Android programming for student to be able to developing useful apps as well as further self-studying more easily. This course also providing basic knowledge of HTML5 programming, and developing Hybrid mobile apps for Android devices. This also covering problem solving and troubleshooting for mobile development.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PRN211', N'Basis Cross-Platform App Programming With .NET', N'<p>Upon completion of this course students should:<br />
1. Understand the followings:<br />
&bull; C# language for developing .NET applications;<br />
&bull; Fundamental concepts of .NET Platform<br />
&bull; Basic knowledge of Window Forms in .NET<br />
&bull; Basic knowledge of ASP.NET Core MVC<br />
&bull; Basic knowledge of RESTful API .NET<br />
2. Be able to:<br />
&bull; Develop Cross-platform Desktop applications and support for user experience ( UI &amp; UX )<br />
&bull; Develop Back-end applications by ASP.NET Core Web API<br />
&bull; Develop Distributed applications by Windows Forms and REST APIs<br />
&bull; Develop Distributed applications by ASP.NET MVC Core and REST APIs<br />
3. Be able to work in a team and present group&#39;s results</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PRN221', N'Advanced Cross-Platform App Programming With .NET', N'<p>Upon completion of this course students should:<br />
1. Understand the followings:<br />
&bull; Apply C# language for developing Desktop and Web applications;<br />
&bull; Fundamental concepts of .NET Core Platform<br />
&bull; Basic knowledge of Windows Presentation Foundation (WPF) and ASP.NET Core Razor Page application<br />
&bull; Basic knowledge of RESTful API .NET , Signal-R and apply into ASP.NET Core application<br />
&bull; Basic knowledge of Asynchronous and Parallel Programming in .NET Core application<br />
&bull; Basic knowledge of Dependency Injection apply into .NET Core applications<br />
&bull; Basic knowledge of Worker Service and apply to implement Background Tasks<br />
2. Be able to:<br />
&bull; Develop Cross - platform Web applications by ASP.NET Core Razor Page<br />
&bull; Develop Cross - platform Desktop applications by WPF and support for user experience ( UI &amp; UX )<br />
&bull; Implement Real-time applications by Signal R and ASP.NET Core<br />
&bull; Implement Background Tasks with Worker Service<br />
3. Be able to work in a team and present group&#39;s results</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PRO192', N'Object-Oriented Programming', N'<p>-This subject introduces the student to object-oriented programming. The student learns to build reusable objects, encapsulate data and logic within a class, inherit one class from another and implement polymorphism.<br />
- Compose technical documentation of a Java program using internal comments<br />
- Adhere to object-oriented programming principles including encapsulation, polymorphism and inheritance when writing program code<br />
- Trace the execution of Java program logic to determine what a program does or to validate the correctness of a program &nbsp;</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PRP201c', N'Python programming', N'<p>This course will introduce fundamental programming concepts including data structures, networked application program interfaces, and databases, using the Python programming language. In the Capstone Project, students&rsquo;ll use the technologies learned throughout the course to design and create your own applications for data retrieval, processing, and visualization.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PRU211c', N'(Combo .Net: Option 3) C# Programming and Unity', N'<p>In this course, students will learn core programming concepts that apply to lots of programming languages, including C#. They will build their foundational C# and Unity knowledge by exploring C# and Unity topics. They will also learn how to apply that knowledge for developing and completing some their games.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SEP490', N'SE Capstone Project', N'n/a')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SSG103', N'Communication and In-group working skills', N'<p>This course will cover both working in groups and communication skills.<br />
<br />
Assessment structure:<br />
* On-going Assessment:<br />
- Activity: 10%<br />
- Quiz: 15%<br />
- Group Assignment : 15%<br />
- Group Project : 30%<br />
* Final Exam: 30%<br />
* Completion Criteria: Every on-going assessment component &gt; 0, Final Exam &gt;=4, Final Result &gt;=5</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SSL101c', N'Academic Skills for University Success', N'<p>Upon finishing the course, students can:<br />
1) Knowledge: Understand<br />
- Method to develop your Information &amp; Digital Literacy Skills<br />
- Method to develop your Problem Solving and Creativity Skills<br />
- How to develop your Critical Thinking Skills<br />
- How to develop your Communication Skills<br />
2) Able to (ABET)<br />
- Access, search, filter, manage and organize Information by using a variety of digital tools, from wide variety of source for use in academic study.<br />
- Critically evaluate the reliability of sources and use digital tools for referencing in order to avoid plagiarism.<br />
- Demonstrate awareness of ethical issues related to academic integrity surrounding the access and use of information<br />
- Develop a toolkit to be able to identify real problems and goals within ill-defined problem &amp; Recognize and apply analytical &amp; creative problem solving technique<br />
- Use a variety of thinking tools to improve critical thinking<br />
- Identify types of argument, and bias within arguments<br />
- Demonstrate, negotiate, and further understanding through spoken, written, visual, and conversational modes<br />
- Effectively formulate arguments and communicate research findings through the process of researching, composing, and editing<br />
3) Others: (ABET)<br />
- Improve study skills (academic reading, information searching, ...)</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SWD391', N'SW Architecture and Design', N'<p>This course covers a set of important software design methodologies, architectural styles, design guidelines and design tools. Java is used to explain design principles and present case studies.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SWE201c', N'Introduction to Software Engineering', N'<p>SWE201c is for people who are new to software engineering. It&#39;s also for those who have already developed software, but wish to gain a deeper understanding of the underlying context and theory of software development practices.<br />
<br />
At the end of this course, we expect learners to be able to:<br />
<br />
1.) Build high-quality and secure software using SDLC methodologies such as agile, lean, and traditional/waterfall.<br />
<br />
2.) Analyze a software development team&#39;s SDLC methodology and make recommendations for improvements.<br />
<br />
3.) Compare and contrast software development methodologies with respect to environmental, organizational, and product constraints.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SWP391', N'Software development project', N'<p>This course focuses on basic problems related to Java or .NET web programming skills (just based on the basic Java or .NET technologies to build MVC code framework, using the available MVC frameworks is not allowed). Students are required to implement the project in the lab rooms as assigned by the teacher (mentor). The team size limits at 3-4 students, appointed by the teacher (mentor)<br />
After 30 slots in SWP391, students will be able to achieve Java or .NET web programing proficiency with the following skills by practicing with other members in the assigned team<br />
- Proficiency in common web techniques and basic Java Web skills (JSP, Servlet, JDBC) or .NET Web skills (ASP.NET, ADO.NET)<br />
- Proficiency in front end skills (HTML, CSS, JS) require for industry<br />
- Proficiency in SQL skills require for industry<br />
- Analyze &amp; design the solution following the object oriented models<br />
- Co-ordinate with the team to complete the works in the form of a project<br />
Details could be found in the &quot;Appendix 2&quot; sheet (Course Learning Outcomes)</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SWR302', N'Software Requirement', N'<p>This course is a model-based introduction to RE, providing the conceptual background and terminology on RE, addressing a variety of techniques for requirements development including Analysis and Requirements Elicitation; Requirements Evaluation; Requirements Specification and Documentation; Requirements Quality Assurance. To implement these frameworks, student will be learnt how to find appropriate customer representatives, elicit requirements from them, and document user requirements, business rules, functional requirements, data requirements, and nonfunctional requirements.<br />
The numerous visual models that will be represented to illustrate the requirements from various perspectives to supplement natural-language text. Other contents recommend the most effective requirements approaches for various specific classes of projects: agile projects developing products of any type, enhancement and replacement projects, projects that incorporate packaged solutions, outsourced projects, business process automation projects, business analytics projects, and embedded and other real-time systems.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SWT301', N'Software Testing', N'<p>&bull; General concepts about software testing<br />
&bull; Testing techniques aimed at assuring that appropriate functionality has been implemented correctly in the software system or product, including: a) black box or functional testing, b) clear box or structural testing, c) usage-based statistical testing.<br />
These testing techniques are organized by their underlying models, including lists, partitions and equivalent classes, finite-state machines.<br />
&bull; Test activities, management, and related issues, such as testing sub-phases, team organization, testing process, people&#39;s roles and responsibilities, test automation, etc., will also be discussed.<br />
&bull; Other testing, verification and validation techniques&hellip;</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SYB302c', N'Entrepreneurship ', N'<p>The Entrepreneurship Specialization examines the entrepreneurial mindset and skill sets, indicators of innovation opportunities, critical steps to bring innovations to the marketplace, and innovation strategies to establish and maintain a competitive advantage. Fundamentals of new venture financing are explored with attention to capital structures for new ventures, term sheets and how to negotiate them, and the differences between early-stage versus later-stage financing. You will develop an understanding of how to develop winning investor pitches, who and when to pitch, how to avoid common mistakes, and how to &lsquo;get to the close&rsquo;. In the final Capstone Project, you will apply the tools and concepts from the specialization courses by crafting a comprehensive, customer-validated business model, and creating a business plan and investor pitch.<br />
Note: Student gets 0.25 bonus points for each course completed on time.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'VNR202', N'History of CPV', N'<p>Giới thiệu m&ocirc;n học:&nbsp;Lịch sử Đảng Cộng sản Việt Nam l&agrave; một chuy&ecirc;n ng&agrave;nh, một bộ phận của khoa học lịch sử. Chủ tịch Hồ Ch&iacute; Minh đ&atilde; khẳng định Lịch sử Đảng Cộng sản Việt Nam l&agrave; cả một pho lịch sử bằng v&agrave;ng. Đ&oacute; ch&iacute;nh l&agrave; t&iacute;nh khoa học, c&aacute;ch mạng, gi&aacute; trị thực tiễn s&acirc;u sắc trong Cương lĩnh, đường lối của Đảng; l&agrave; sự l&atilde;nh đạo đ&uacute;ng đắn, đ&aacute;p ứng kịp thời những y&ecirc;u cầu, nhiệm vụ do lịch sử đặt ra; những kinh nghiệm, b&agrave;i học c&oacute; t&iacute;nh quy luật, l&yacute; luận của c&aacute;ch mạng Việt Nam v&agrave; những truyền thống vẻ vang của Đảng.<br />
Nghi&ecirc;n cứu, học tập lịch sử Đảng kh&ocirc;ng chỉ nắm vững những sự kiện, cột mốc lịch sử m&agrave; cần thấu hiểu những vấn đề phong ph&uacute; đ&oacute; trong qu&aacute; tr&igrave;nh l&atilde;nh đạo v&agrave; đấu tranh, để vận dụng, ph&aacute;t triển trong thời kỳ đổi mới to&agrave;n diện, đẩy mạnh c&ocirc;ng nghiệp h&oacute;a, hiện đại h&oacute;a đất nước v&agrave; hội nhập quốc tế hiện nay.<br />
Course introduction: History of CPV is a major and a division of historical science. President Ho Chi Minh affirmed that the history of the Communist Party of Vietnam is golden pages. That is scientific, revolutionary and profound practical value in the Party&#39;s platforms and guidelines, is proper leadership and timely response to requirements and missions set by the history; is the normative and theoretical experiences and lessons of Vietnamese revolution and the glorious traditions of the Party.<br />
Researching and studying history of CPV not only requires mastering historical events and milestones but also understanding those issues in the process of leading and struggling; thereby applying and developing in the current period of comprehensive renovation and accelerating industrialization and modernization and international integration.<br />
<br />
Mục ti&ecirc;u m&ocirc;n học:<br />
- Về nội dung: Cung cấp những tri thức c&oacute; t&iacute;nh hệ thống, cơ bản về sự ra đời của Đảng Cộng sản Việt Nam (1920- 1930), sự l&atilde;nh đạo của Đảng đối với c&aacute;ch mạng Việt Nam trong thời kỳ đấu tranh gi&agrave;nh ch&iacute;nh quyền (1930- 1945), trong hai cuộc kh&aacute;ng chiến chống thực d&acirc;n Ph&aacute;p v&agrave; đế quốc Mỹ x&acirc;m lược (1945- 1975), trong sự nghiệp x&acirc;y dựng, bảo vệ Tổ quốc thời kỳ cả nước qu&aacute; độ l&ecirc;n chủ nghĩa x&atilde; hội, tiến h&agrave;nh c&ocirc;ng cuộc đổi mới (1975- 2018).<br />
- Về tư tưởng: Th&ocirc;ng qua c&aacute;c sự kiện lịch sử v&agrave; c&aacute;c kinh nghiệm về sự l&atilde;nh đạo của Đảng để x&acirc;y dựng &yacute; thức t&ocirc;n trọng sự thật kh&aacute;ch quan, n&acirc;ng cao l&ograve;ng tự h&agrave;o, niềm tin của sinh vi&ecirc;n v&agrave;o sự l&atilde;nh đạo của Đảng trong qu&aacute; khứ v&agrave; hiện tại.<br />
- Về kỹ năng: Trang bị phương ph&aacute;p tư duy khoa học về lịch sử, kỹ năng lựa chọn t&agrave;i liệu nghi&ecirc;n cứu, học tập m&ocirc;n học v&agrave; khả năng vận dụng nhận thức lịch sử v&agrave;o c&ocirc;ng t&aacute;c thực tiễn, ph&ecirc; ph&aacute;n quan niệm sai tr&aacute;i về lịch sử của Đảng.<br />
Course objectives: Provide basic and systematic knowledge of the Party establishment (1920- 1930), the process of Party&#39;s leading the rise to power (1930-1945), leading two resistance wars against French colonialist and American imperialist invasions, completing national liberation and reunion (1945 - 1975), leading the national transition to socialism and carrying out the Doi moi (1975-2018).<br />
- In terms of ideology: Build a sense of respect for objective truth, deepen students&#39; pride and confidence in the leadership of the Party in the past and present through historical events and experiences on the leadership of the Party<br />
- In terms of skills: Equip students with scientific thinking methods on history, selecting research and learning materials skill, and the ability to apply awareness of history to practices, criticize the wrong perception of the Party&#39;s history.<br />
<br />
Nội dung m&ocirc;n học:<br />
M&ocirc;n học trang bị cho sinh vi&ecirc;n những hiểu biết cơ bản về đối tượng, mục đ&iacute;ch, nhiệm vụ, phương ph&aacute;p nghi&ecirc;n cứu, học tập m&ocirc;n học Lịch sử Đảng Cộng sản Việt Nam; những kiến thức cơ bản, cốt l&otilde;i, c&oacute; hệ thống về sự ra đời của Đảng (1920 - 1930), về qu&aacute; tr&igrave;nh Đảng l&atilde;nh đạo c&aacute;ch mạng Việt Nam từ năm 1930 cho đến nay, từ đ&oacute;, khẳng định c&aacute;c th&agrave;nh c&ocirc;ng, n&ecirc;u l&ecirc;n c&aacute;c hạn chế, tổng kết những kinh nghiệm về sự l&atilde;nh đạo trong thực tiễn c&aacute;ch mạng.<br />
Ngo&agrave;i Chương nhập m&ocirc;n, nội dung m&ocirc;n học được bố cục gồm 3 chương:<br />
- Chương 1: Đảng Cộng sản Việt Nam ra đời v&agrave; l&atilde;nh đạo đấu tranh gi&agrave;nh ch&iacute;nh quyền (1930 - 1945);<br />
- Chương II: Đảng l&atilde;nh đạo hai cuộc kh&aacute;ng chiến, ho&agrave;n th&agrave;nh giải ph&oacute;ng d&acirc;n tộc, thống nhất đất nước (1945 - 1975);<br />
- Chương III: Đảng l&atilde;nh đạo cả nước qu&aacute; độ l&ecirc;n Chủ nghĩa x&atilde; hội v&agrave; tiến h&agrave;nh c&ocirc;ng cuộc đổi mới (1975 - 2018).<br />
This course provides students with basic knowledge of objects, purposes, tasks, research and study methods of the History of CPV; the basic, core, systematic knowledge of the Party establishment (1920 - 1930), the process of the Party&#39;s leading the Vietnamese revolution from 1930 to the present, thereby, by affirming the successes, listing the limitations and summarizing experience of the Party&rsquo;s leadership in revolutionary practices.<br />
In addition to the introductory chapter, the course content includes three chapters:<br />
- Chapter 1: The Communist Party of Vietnam was founded and led the rise to power (1930-1945);<br />
- Chapter II: The Party led two resistance wars, completing national liberation and reunion (1945 - 1975);<br />
- Chapter III: The Party led the national transition to socialism and carrying out the Doi moi (1975-2018).<br />
<br />
Phương ph&aacute;p dạy học: Thuyết giảng v&agrave; kết hợp tr&igrave;nh chiếu c&aacute;c slide b&agrave;i giảng. Hướng dẫn, giao b&agrave;i tập đề t&agrave;i theo nh&oacute;m. Tổ chức v&agrave; hướng dẫn sinh vi&ecirc;n thảo luận nh&oacute;m.<br />
Content of the course:<br />
Teaching method: Giving lectures and slide presentations. Guiding and assigning groupwork assignments. Organizing and guiding students to discuss in groups.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'VOV114', N'Vovinam 1', N'<p>Tấn ph&aacute;p: Trung b&igrave;nh tấn; cung tiễn tấn; kiềm dương m&atilde; tấn; đinh tấn; tam gi&aacute;c tấn.<br />
Stances: Middle stance, bow stance, horse stance, front stance, triangle stance.<br />
Kỹ thuật tay:<br />
Hand techniques:<br />
* 4 lối ch&eacute;m cạnh tay;<br />
4 cutting edge techniques;<br />
* 7 lối đấm;<br />
7 punch techniques;<br />
* 4 lối gạt cạnh tay;<br />
4 hand parry techniques;<br />
* 4 lối chỏ;<br />
4 elbow techniques;<br />
Kỹ thuật ch&acirc;n: Đ&aacute; thẳng; đ&aacute; cạnh; đ&aacute; tạt; đ&aacute; đạp;<br />
Leg techniques: Straight kick; crescent kick; roundhouse kick; side kick;<br />
Phản đ&ograve;n: Phản đ&ograve;n đấm thẳng phải; phản đ&ograve;n đấm lao phải; phản đ&ograve;n đấm m&uacute;c phải.<br />
Counter attack techniques: counter attack straight right punch; counter attack long right punch; counter attack right uppercut punch.<br />
Thể lực chung.<br />
Physical strength.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'VOV124', N'Vovinam 2', N'<p>* Chiến lược: Từ 1 - 10<br />
Attacking combos: From 1 - 10<br />
* Bài quyền: Nhập m&ocirc;n quyền<br />
Kata lessons: Nhap Mon Form<br />
* Thể lực chuy&ecirc;n m&ocirc;n<br />
Physical strength</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'VOV134', N'Vovinam 3', N'<p>* C&aacute;c kỹ thuật kh&oacute;a gỡ: Nắm t&oacute;c trước số 1; Kỹ thuật hai tay nắm hai tay trước<br />
Self-defense techniques: Front hair grab 1; Two hands grab two front wrists technique.<br />
* Kỹ thuật tự vệ s&aacute;ng tạo.<br />
Creative self-defense techniques.<br />
* X&acirc;y dựng b&agrave;i đa luyện cuối kh&oacute;a.<br />
Build multi-activity performances at the end of the course.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'WDU203c', N'UI/UX Design', N'<p>Integrate UX Research and UX Design to create great products through understanding user needs, rapidly generating prototypes, and evaluating design concepts. Students will gain hands-on experience with taking a product from initial concept, through user research, ideation and refinement, formal analysis, prototyping, and user testing, applying perspectives and methods to ensure a great user experience at every step. This course concludes with a capstone project, in which learners will incorporate UX Research and Design principles to design a complete product, taking it from an initial concept to an interactive prototype.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'WED201c', N'Web Design', N'<p>Upon finishing the course, students can:<br />
1) Knowledge: Understand (ABET e)<br />
- The concepts of HTML, CSS3, JavaScript, Interactivity with JavaScript, Advanced Styling with Responsive Design<br />
- Web page structure.<br />
- Web site structure.<br />
- Demonstrate the ability to design and implement a responsive site for three platforms.<br />
- The way a web page is presented in browsers.<br />
<br />
2) Able to (ABET k)<br />
- Add interacitivity to web pages with Javascript<br />
- Apply responsive design to enable page to be viewed by various devices<br />
- Describe the basics of Cascading Style Sheets (CSS3)<br />
- Use the Document Object Model (DOM) to modify pages<br />
3) Others: (ABET i)<br />
- Improve study skills (academic reading, information searching, ...)</p>
')
GO
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'VOV114', N'VOV124')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'PRF192', N'PRO192')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'VOV124', N'VOV134')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'PRO192', N'CSD201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'PRO192', N'LAB211')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'JPD113', N'JPD123')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'MAE101', N'MAI391')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'MAE101', N'MAS291')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'MAS291', N'AIL302m')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'AIG201c, PRP201c', N'AIP391')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'CSD202', N'CSD301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'DGT201 or DGT202', N'DGT301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'MLN111, MLN122', N'HCM202')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'MLN101', N'HCM201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'MLN111, MLN122', N'MLN131')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'MLN111, MLN122', N'VNR202')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'NWC203c', N'OSP201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'MAD101', N'CRY303c')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'NWC203c', N'FRS301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'IAO201c', N'IAA202')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'ITE302c, PRO192', N'IAM302')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'ITE302c, OSP201', N'HOD401')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'IAA202', N'IAP301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'FRS401', N'IAR401')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'DBI202', N'PRJ301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'PRO192', N'SWE201c')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'PRO192, DBI201', N'PRN211')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'PRJ301', N'SWP391')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'SWE201c', N'SWR302')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'SWE201c', N'SWT301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'PRO192', N'PRM391')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'PRN211', N'PRN221')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'SWE201c', N'SWD391')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'DBI202', N'DBD301')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (1, N'admin', N'admin', NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (2, N'teacher', N'teacher', NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (3, N'user', N'user', NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (4, N'staff.IT', N'staff', NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (6, N'staff.EN', N'staff', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Curr_Sub]  WITH CHECK ADD  CONSTRAINT [FK_Curr_Sub_Curriculum] FOREIGN KEY([CurrID])
REFERENCES [dbo].[Curriculum] ([CurrID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Curr_Sub] CHECK CONSTRAINT [FK_Curr_Sub_Curriculum]
GO
ALTER TABLE [dbo].[Curr_Sub]  WITH CHECK ADD  CONSTRAINT [FK_Curr_Sub_Subject] FOREIGN KEY([SubCode])
REFERENCES [dbo].[Subject] ([SubCode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Curr_Sub] CHECK CONSTRAINT [FK_Curr_Sub_Subject]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Subject] FOREIGN KEY([SubCode])
REFERENCES [dbo].[Subject] ([SubCode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Subject]
GO
ALTER TABLE [dbo].[Role_User]  WITH CHECK ADD  CONSTRAINT [FK_Role_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Role_User] CHECK CONSTRAINT [FK_Role_User_Role]
GO
ALTER TABLE [dbo].[Role_User]  WITH CHECK ADD  CONSTRAINT [FK_Role_User_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Role_User] CHECK CONSTRAINT [FK_Role_User_User]
GO
USE [master]
GO
ALTER DATABASE [SES2] SET  READ_WRITE 
GO
