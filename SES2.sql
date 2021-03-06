USE [master]
GO
/****** Object:  Database [SES2]    Script Date: 22.03.2022 08:20:48 ******/
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
ALTER DATABASE [SES2] SET QUERY_STORE = OFF
GO
USE [SES2]
GO
/****** Object:  Table [dbo].[Curr_Sub]    Script Date: 22.03.2022 08:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curr_Sub](
	[CurrID] [nvarchar](50) NOT NULL,
	[SubCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curriculum]    Script Date: 22.03.2022 08:20:48 ******/
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
/****** Object:  Table [dbo].[Material]    Script Date: 22.03.2022 08:20:48 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 22.03.2022 08:20:48 ******/
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
/****** Object:  Table [dbo].[Role_User]    Script Date: 22.03.2022 08:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_User](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 22.03.2022 08:20:48 ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 22.03.2022 08:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubCode] [nvarchar](50) NOT NULL,
	[SubName] [nvarchar](max) NOT NULL,
	[SubDesc] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubNeedToLearn]    Script Date: 22.03.2022 08:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubNeedToLearn](
	[PreRequitesite] [nvarchar](50) NULL,
	[SubCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22.03.2022 08:20:48 ******/
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
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'IBI101')
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
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'MKT205c')
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
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'HMO102')
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
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'HOM202')
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
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BIT_IoT', N'LAB211')
GO
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
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'OJT202')
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
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'WDU203c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'IBI101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'IBC201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'SCM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MKT205c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'ECO201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'HMO102')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'HOM202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'FBM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'GEM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'HOM301c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'ADI201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'TTM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'VNC103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'TTM202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'TTM203')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'SSB201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MAS202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'ECO111')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'ECO121')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'ACC101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'FIN202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MKT101')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'OBE102c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MGT103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'PMG201c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'HRM201c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'LAW102')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'ENM301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'ENM401')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'EVN201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'FIN201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'FIN301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'FIN303')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'ACC305')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'RMB302')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'DTG102')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MKT301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MKT202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MKT304')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MKT318m')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MKT328m')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MKT201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'MKT208c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'SAL301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'GRM491')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'BRA301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'
BBA_MKT', N'CCM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'FBM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'GEM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'ADI201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'TTM201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'VNC103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'TTM203')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'SSB201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'MAS202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'FIN202')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'OBE102c')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'MGT103')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'LAW102')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'EVN201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'FIN303')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'ACC305')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'MKT301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'MKT328m')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'MKT201')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'SAL301')
INSERT [dbo].[Curr_Sub] ([CurrID], [SubCode]) VALUES (N'BBA_MKT', N'BRA301')
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
INSERT [dbo].[Curriculum] ([CurrID], [CurrName], [CurrDesc], [TotalCredit]) VALUES (N'BEN_K15A', N'Bachelor of English Studies', N'<p>1. General objective:<br />
The program of Bachelor of English Studies aims to train proficient bachelors with personality and capacity to meet the needs of society; be able to use English fluently at a minimum level equivalent to level 5 according to the 6-level Foreign Language Proficiency Framework for Vietnam or level C1 according to the Common European Framework of Reference for Languages (CEFR); have specialized knowledge about languages and cultures of English-speaking countries, have knowledge and skills needed to work in the fields related to the specialty. Students have a high spirit of self-study, are capable of self-training and gaining professional knowledge, qualities and skills to pursue further study and research or to become experts in their professional fields, and be able to work flexibly in the domestic and international environment.<br />
2. Specific objectives:<br />
PO1: Help students develop physically, mentally, intellectually, morally and deepen national pride by equipping them with general knowledge of politics, law, economy, society, physical education, music and national defence education.<br />
PO2: Provide students with foundational and in-depth knowledge of the English language and countries, cultures and people of English-speaking countries.<br />
PO3: Train students to have language skills together with communication, study and research skills, being proactive and flexible in studying and working in a multicultural environment.<br />
PO4: Orientate students towards the right attitudes and work ethics, abilities to think creatively, work well in groups and independently and abilities to solve problems related to jobs and industries using English and combining knowledge of International Business, Communication or Language Teaching effectively, and be capable of lifelong learning for personal and professional development.<br />
PO5: Help students use English fluently and use Chinese as the second language at a basic level.<br />
3. Job positions after graduation:<br />
Graduates of the English Studies major can work for domestic enterprises, foreign-invested enterprises, representative offices, international organizations, domestic, international and regional organizations on the economy, finance and technology related to some fields such as education, business, import and export, media, aviation, banking, audit, management and research. Graduates can also take charge of some of the following positions:<br />
- English lecturer, English teacher;<br />
- Translator and interpreter;<br />
- R&amp;D specialist;<br />
- Sales and business development staff;<br />
- Assistant to (general) director, project director;<br />
- Project specialist;<br />
- Publishing and communication specialist;<br />
- International news reporter;<br />
- Jobs related to language and the use of the English language.</p>
', 145)
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
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'International Business Asia, International Business: The Challenges of Globalization, Global Strategy', N'IBI101', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/international-marketing', N'MKT205c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Introduction to Hospitality GE', N'HMO102', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Hotel Operations Management', N'HOM202', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Food and Beverage Management', N'FBM201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Guest Service in the Hospitality Industry', N'GEM201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Designing Brand Identity: An Essential Guide for the Whole Branding Team.', N'ADI201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Tourism, Transport and Travel Management', N'TTM201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Cơ sở văn hóa Việt Nam - Trần Ngọc Thêm', N'VNC103', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Consumer behaviour in tourism', N'TTM203', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Business communication for success', N'SSB201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Basic business statistics: concepts and applications', N'MAS202', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Fundamentals of Corporate Finance', N'FIN202', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/specializations/hr-management-leadership', N'OBE102c', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Fundamentals of Management', N'MGT103', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'John D. Ashcroft, Jane E. Ashcroft, 2018, Law for Business, 19th edition, Cengage Publication', N'LAW102', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Successful Event Management: A Practical Handbook', N'EVN201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Fundamentals of Corporate Finance ', N'FIN303', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Financial statement analysis', N'ACC305', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Essentials of Marketing Research ', N'MKT301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'https://www.coursera.org/learn/marketing-channels/home/welcome', N'MKT328m', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Consumer Behavior: Buying, Having, and Being', N'MKT201', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'The Selling and Sales Management ', N'SAL301', 0)
INSERT [dbo].[Material] ([MaterialDesc], [SubCode], [ForTeacher]) VALUES (N'Strategic Brand Management: Building, Measuring, and Managing Brand Equity. ', N'BRA301', 0)
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'student')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'teacher')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'staff')
GO
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (3, 3)
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (4, 4)
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (6, 4)
INSERT [dbo].[Role_User] ([UserId], [RoleId]) VALUES (7, 4)
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
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'	Assessing exercises of chapter 16
	Chapter 17 Parallel Processing
	17.1 Multiple Processor Organizations
	17.2 Symmetric Multiprocessors
	17.3 Cache Coherence and the MESI Protocol
	17.4 Multithreading and Chip Multiprocessors', N' CEA201')
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
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	<p>Introduction to java web application<br />
+ The core and basic of Java web server technologies<br />
+ Web design vs server technologies<br />
Setup Environment :<br />
JDK: 1.7 or higher<br />
Servlet container: Tomcat 7, Glassfish 4.1, etc.<br />
Intergrate Netbeans 8. with the web container.<br />
Creating/Building the first application:<br />
Learn to create Servlet<br />
Learn to create JSP<br />
Deploy the web application</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>Introduction to java web application<br />
+ The core and basic of Java web server technologies<br />
+ Web design vs server technologies<br />
Setup Environment :<br />
JDK: 1.7 or higher<br />
Servlet container: Tomcat 7, Glassfish 4.1, etc.<br />
Intergrate Netbeans 8. with the web container.<br />B2
Creating/Building the first application:<br />
Learn to create Servlet<br />
Learn to create JSP<br />
Deploy the web application</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>Wiritting the First Servlet<br />
Create a servlet<br />
+ Create a servlet class<br />
+ Configure servlet for deployment<br />
Work with request and response objects<br />
+ Understanding DoGet and DoPost<br />
+ Using parameter to accept form submition &amp; query string<br />
+ Response text content to client<br />
+ Forward and Redirect to another servlet<br />
Using init parameters<br />
Practice Classwork 1</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>Wiritting the First Servlet<br />
Create a servlet<br />
+ Create a servlet class<br />
+ Configure servlet for deployment<br />
Work with request and response objects<br />
+ Understanding DoGet and DoPost<br />
+ Using parameter to accept form submition &amp; query string<br />
+ Response text content to client<br />
+ Forward and Redirect to another servlet<br />
Using init parameters<br />
Practice Classwork 1</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>Wiritting the First Servlet<br />
Create a servlet<br />
+ Create a servlet class<br />
+ Configure servlet for deployment<br />
Work with request and response objects<br />
+ Understanding DoGet and DoPost<br />
+ Using parameter to accept form submition &amp; query string<br />
+ Response text content to client<br />
+ Forward and Redirect to another servlet<br />
Using init parameters<br />
Practice Classwork 1</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>Web Application Interacting with Database<br />
+ JDBC Introduction<br />
+ Types of JDBC Drivers<br />
+ JDBC Basics: Processing SQL Statements<br />
+ Implement CRUD application using MS SQL Server 2008 R2<br />
Practice Classwork 4</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>Web Application Interacting with Database<br />
+ JDBC Introduction<br />
+ Types of JDBC Drivers<br />
+ JDBC Basics: Processing SQL Statements<br />
+ Implement CRUD application using MS SQL Server 2008 R2<br />
Practice Classwork 4</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>Web Application Interacting with Database<br />
+ JDBC Introduction<br />
+ Types of JDBC Drivers<br />
+ JDBC Basics: Processing SQL Statements<br />
+ Implement CRUD application using MS SQL Server 2008 R2<br />
Practice Classwork 4</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>Web Application Interacting with Database<br />
+ JDBC Introduction<br />
+ Types of JDBC Drivers<br />
+ JDBC Basics: Processing SQL Statements<br />
+ Implement CRUD application using MS SQL Server 2008 R2<br />
Practice Classwork 4</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>Web Application Interacting with Database<br />
+ JDBC Introduction<br />
+ Types of JDBC Drivers<br />
+ JDBC Basics: Processing SQL Statements<br />
+ Implement CRUD application using MS SQL Server 2008 R2<br />
Practice Classwork 4</p>', N'	PRJ301')
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>Using JSP to display content<br />
Create JSP?<br />
+ Why use JSP?<br />
3 Ways to use JSP<br />
+ Only HTML in a JSP file<br />
+ Only JSP code in a JSP file<br />
+A mixture of JSP code with HTML text in a JSP file<br />
Using the Implicit variables in a Jsp<br />
Configuring JSP properties in the web.xml<br />
Combining JSP and Servlet<br />
Practice Classwork 2</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>Using JSP to display content<br />
Create JSP?<br />
+ Why use JSP?<br />
3 Ways to use JSP<br />
+ Only HTML in a JSP file<br />
+ Only JSP code in a JSP file<br />
+A mixture of JSP code with HTML text in a JSP file<br />
Using the Implicit variables in a Jsp<br />
Configuring JSP properties in the web.xml<br />
Combining JSP and Servlet<br />
Practice Classwork 2</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>Using JSP to display content<br />
Create JSP?<br />
+ Why use JSP?<br />
3 Ways to use JSP<br />
+ Only HTML in a JSP file<br />
+ Only JSP code in a JSP file<br />
+A mixture of JSP code with HTML text in a JSP file<br />
Using the Implicit variables in a Jsp<br />
Configuring JSP properties in the web.xml<br />
Combining JSP and Servlet<br />
Practice Classwork 2</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	<p>Introduction to MVC Architecture<br />
+ General of Java Application Design<br />
+ MVC Pattern<br />
+ How to apply MVC in Java Web Application</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	<p>Introduction to MVC Architecture<br />
+ General of Java Application Design<br />
+ MVC Pattern<br />
+ How to apply MVC in Java Web Application</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'	<p>Introduction to MVC Architecture<br />
+ General of Java Application Design<br />
+ MVC Pattern<br />
+ How to apply MVC in Java Web Application</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'	<p>Maintaining state using session and cookie<br />
+ Explain why session is nessesary<br />
+ How session and cookie work<br />
+ Store and Retreive data to session and cookie<br />
Practice Classwork 3</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'	<p>Maintaining state using session and cookie<br />
+ Explain why session is nessesary<br />
+ How session and cookie work<br />
+ Store and Retreive data to session and cookie<br />
Practice Classwork 3</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'	<p>Expression Language<br />
What and Why use Expression Language<br />
How to write with the EL syntax<br />
+ Immediate evaluation , [ ] operator,array, Arithmetic EL,Relational EL, Static Field<br />
+ EL functions<br />
+ Collections<br />
How to use scoped variables in EL expressions<br />
+ pageContext<br />
+ requestScope<br />
+ sessionScope<br />
+ applicationScope<br />
Implicit Variables in EL<br />
Practice Classwork 5</p>
', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'	<p>Expression Language<br />
What and Why use Expression Language<br />
How to write with the EL syntax<br />
+ Immediate evaluation , [ ] operator,array, Arithmetic EL,Relational EL, Static Field<br />
+ EL functions<br />
+ Collections<br />
How to use scoped variables in EL expressions<br />
+ pageContext<br />
+ requestScope<br />
+ sessionScope<br />
+ applicationScope<br />
Implicit Variables in EL<br />
Practice Classwork 5</p>
', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'	', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'	<p>Using Java Standard Tag Lib<br />
+ Guide to work with core tag lib and internalization + formating tag lib<br />
+ Introduction to Dataacess &amp; XML tag libs<br />
Practice Classwork 6</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'	<p>Using Custom tag<br />
+ Guide to create a simple user custom tag<br />
+ Tag lib descriptor<br />
Practice Classwork 7</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'	<p>Using Custom tag<br />
+ Guide to create a simple user custom tag<br />
+ Tag lib descriptor<br />
Practice Classwork 7</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'	<p>Introduction to Filter<br />
+ Understand the purpose of Filter<br />
+ Create, Declaring and Mapping Filter<br />
+ Ordering Filter Properly<br />
Practice Classwork 8</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'	<p>Introduction to Filter<br />
+ Understand the purpose of Filter<br />
+ Create, Declaring and Mapping Filter<br />
+ Ordering Filter Properly<br />
Practice Classwork 8</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'	<p>Introduction to Event Listener<br />
+ ServletContextEvent<br />
+ HttpSessionEvent<br />
+ ServletRequestEvent<br />
+ ServletContext AttributeEvent<br />
+ HttpSessionBindingEvent<br />
+ ServletRequestAttributeEvent</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'	<p>Assignment Evaluation<br />
Course Summary for Final Exam</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'	<p>Assignment Evaluation<br />
Course Summary for Final Exam</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'	<p>Assignment Evaluation<br />
Course Summary for Final Exam</p>', N'	PRJ301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'	<p>Ch╞░╞íng 3: Chß╗º ngh─⌐a duy vß║¡t lß╗ïch sß╗¡<br />
Hß╗ìc thuyß║┐t h&igrave;nh th&aacute;i kinh tß║┐-x&atilde; hß╗Öi<br />
(Presentation)<br />
Chapter 3: Historical materialism<br />
The theory of socio-economic forms<br />
(Presentation)</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'	<p>Ch╞░╞íng 3: Chß╗º ngh─⌐a duy vß║¡t lß╗ïch sß╗¡<br />
Hß╗ìc thuyß║┐t h&igrave;nh th&aacute;i kinh tß║┐-x&atilde; hß╗Öi<br />
(Presentation)<br />
Chapter 3: Historical materialism<br />
The theory of socio-economic forms<br />
(Presentation)</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'	Review Chapter 1,2,3', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Ch╞░╞íng 1: Kh&aacute;i luß║¡n vß╗ü triß║┐t hß╗ìc v&agrave; triß║┐t hß╗ìc M&aacute;c-L&ecirc;nin<br />
Triß║┐t hß╗ìc v&agrave; vß║Ñn ─æß╗ü c╞í bß║ún cß╗ºa triß║┐t hß╗ìc<br />
Chapter 1: An overview of philosophy, Marxism &ndash; Leninism philosophy<br />
Philosophy and basic issues of philosophy</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>Ch╞░╞íng 1: Kh&aacute;i luß║¡n vß╗ü triß║┐t hß╗ìc v&agrave; triß║┐t hß╗ìc M&aacute;c-L&ecirc;nin<br />
Triß║┐t hß╗ìc v&agrave; vß║Ñn ─æß╗ü c╞í bß║ún cß╗ºa triß║┐t hß╗ìc<br />
Chapter 1: An overview of philosophy, Marxism &ndash; Leninism philosophy<br />
Philosophy and basic issues of philosophy</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>Ch╞░╞íng 2: Chß╗º ngh─⌐a duy vß║¡t biß╗çn chß╗⌐ng<br />
Vß║¡t chß║Ñt v&agrave; &yacute; thß╗⌐c<br />
Assignment: Presentation<br />
Chapter 2: Dialectical materialism<br />
Matter and consciousness<br />
Assignment: Presentation</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>Ch╞░╞íng 2: Chß╗º ngh─⌐a duy vß║¡t biß╗çn chß╗⌐ng<br />
Vß║¡t chß║Ñt v&agrave; &yacute; thß╗⌐c<br />
Assignment: Presentation<br />
Chapter 2: Dialectical materialism<br />
Matter and consciousness<br />
Assignment: Presentation</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>Ch╞░╞íng 2: Chß╗º ngh─⌐a duy vß║¡t biß╗çn chß╗⌐ng<br />
Vß║¡t chß║Ñt v&agrave; &yacute; thß╗⌐c<br />
Assignment: Presentation<br />
Chapter 2: Dialectical materialism<br />
Matter and consciousness<br />
Assignment: Presentation</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>Ch╞░╞íng 2: Chß╗º ngh─⌐a duy vß║¡t biß╗çn chß╗⌐ng<br />
Vß║¡t chß║Ñt v&agrave; &yacute; thß╗⌐c<br />
Assignment: Presentation<br />
Chapter 2: Dialectical materialism<br />
Matter and consciousness<br />
Assignment: Presentation</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>Ch╞░╞íng 2: Chß╗º ngh─⌐a duy vß║¡t biß╗çn chß╗⌐ng<br />
Vß║¡t chß║Ñt v&agrave; &yacute; thß╗⌐c<br />
Assignment: Presentation<br />
Chapter 2: Dialectical materialism<br />
Matter and consciousness<br />
Assignment: Presentation</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>Ch╞░╞íng 2: Chß╗º ngh─⌐a duy vß║¡t biß╗çn chß╗⌐ng<br />
Vß║¡t chß║Ñt v&agrave; &yacute; thß╗⌐c<br />
Assignment: Presentation<br />
Chapter 2: Dialectical materialism<br />
Matter and consciousness<br />
Assignment: Presentation</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>Review Chapter 1,2<br />
Progress test 1</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>Ch╞░╞íng 3: Chß╗º ngh─⌐a duy vß║¡t lß╗ïch sß╗¡<br />
Hß╗ìc thuyß║┐t h&igrave;nh th&aacute;i kinh tß║┐-x&atilde; hß╗Öi<br />
(Presentation)<br />
Chapter 3: Historical materialism<br />
The theory of socio-economic forms<br />
(Presentation)</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>Ch╞░╞íng 3: Chß╗º ngh─⌐a duy vß║¡t lß╗ïch sß╗¡<br />
Hß╗ìc thuyß║┐t h&igrave;nh th&aacute;i kinh tß║┐-x&atilde; hß╗Öi<br />
(Presentation)<br />
Chapter 3: Historical materialism<br />
The theory of socio-economic forms<br />
(Presentation)</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>Ch╞░╞íng 3: Chß╗º ngh─⌐a duy vß║¡t lß╗ïch sß╗¡<br />
Hß╗ìc thuyß║┐t h&igrave;nh th&aacute;i kinh tß║┐-x&atilde; hß╗Öi<br />
(Presentation)<br />
Chapter 3: Historical materialism<br />
The theory of socio-economic forms<br />
(Presentation)</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>Ch╞░╞íng 3: Chß╗º ngh─⌐a duy vß║¡t lß╗ïch sß╗¡<br />
Hß╗ìc thuyß║┐t h&igrave;nh th&aacute;i kinh tß║┐-x&atilde; hß╗Öi<br />
(Presentation)<br />
Chapter 3: Historical materialism<br />
The theory of socio-economic forms<br />
(Presentation)</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	<p>Ch╞░╞íng 3: Chß╗º ngh─⌐a duy vß║¡t lß╗ïch sß╗¡<br />
Hß╗ìc thuyß║┐t h&igrave;nh th&aacute;i kinh tß║┐-x&atilde; hß╗Öi<br />
(Presentation)<br />
Chapter 3: Historical materialism<br />
The theory of socio-economic forms<br />
(Presentation)</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	<p>Ch╞░╞íng 3: Chß╗º ngh─⌐a duy vß║¡t lß╗ïch sß╗¡<br />
Hß╗ìc thuyß║┐t h&igrave;nh th&aacute;i kinh tß║┐-x&atilde; hß╗Öi<br />
(Presentation)<br />
Chapter 3: Historical materialism<br />
The theory of socio-economic forms<br />
(Presentation)</p>', N'	MLN111')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	<p>Ch╞░╞íng 1: ─Éß╗æi t╞░ß╗úng, ph╞░╞íng ph&aacute;p nghi&ecirc;n cß╗⌐u v&agrave; chß╗⌐c n─âng cß╗ºa kinh tß║┐ ch&iacute;nh trß╗ï M&aacute;c - L&ecirc;nin<br />
Chapter 1: Objects, research methods and fundamental functions of Marxist-Leninist political economy</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>Ch╞░╞íng 2: H&agrave;ng h&oacute;a, thß╗ï tr╞░ß╗¥ng v&agrave; vai tr&ograve; cß╗ºa c&aacute;c chß╗º thß╗â tham gia thß╗ï tr╞░ß╗¥ng<br />
2.1. L&yacute; luß║¡n cß╗ºa C. M&aacute;c vß╗ü h&agrave;ng h&oacute;a v&agrave; sß║ún xuß║Ñt h&agrave;ng h&oacute;a<br />
Chapter 2: Commodities, markets and participants&rsquo; roles in the market<br />
2.1. Marx&#39;s theory of commodities and commodity production</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>Ch╞░╞íng 2: H&agrave;ng h&oacute;a, thß╗ï tr╞░ß╗¥ng v&agrave; vai tr&ograve; cß╗ºa c&aacute;c chß╗º thß╗â tham gia thß╗ï tr╞░ß╗¥ng<br />
2.2. Thß╗ï tr╞░ß╗¥ng v&agrave; nß╗ün kinh tß║┐ thß╗ï tr╞░ß╗¥ng<br />
2.3. Vai tr&ograve; cß╗ºa mß╗Öt sß╗æ chß╗º thß╗â tham gia thß╗ï tr╞░ß╗¥ng<br />
(Assignment: Presentation)<br />
Chapter 2: Commodities, markets and participants&rsquo; roles in the market<br />
2.2. Market and the market economy<br />
2.3. Participants&rsquo; roles in the market<br />
(Assignment: Presentation)</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>Ch╞░╞íng 3: Gi&aacute; trß╗ï thß║╖ng d╞░ trong nß╗ün kinh tß║┐ thß╗ï tr╞░ß╗¥ng<br />
3.1. L&yacute; luß║¡n cß╗ºa C. M&aacute;c vß╗ü gi&aacute; trß╗ï thß║╖ng d╞░<br />
3.2. T&iacute;ch l┼⌐y t╞░ bß║ún<br />
(Presentation)<br />
Chapter 3: Surplus values in the market economy<br />
3.1. Marx&#39;s theory of surplus values<br />
3.2. Capital accumulation<br />
(Presentation)</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>Ch╞░╞íng 3: Gi&aacute; trß╗ï thß║╖ng d╞░ trong nß╗ün kinh tß║┐ thß╗ï tr╞░ß╗¥ng<br />
3.3. C&aacute;c h&igrave;nh thß╗⌐c biß╗âu hiß╗çn cß╗ºa gi&aacute; trß╗ï thß║╖ng d╞░ trong nß╗ün kinh tß║┐ thß╗ï tr╞░ß╗¥ng<br />
(Presentation)<br />
Progress Test 1<br />
Chapter 3: Surplus values in the market economy<br />
3.3. Manifestations of surplus value in the market economy<br />
(Presentation)<br />
Progress Test 1</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>Ch╞░╞íng 4: Cß║ính tranh v&agrave; ─æß╗Öc quyß╗ün trong nß╗ün kinh tß║┐ thß╗ï tr╞░ß╗¥ng<br />
4.1. Cß║ính tranh ß╗ƒ cß║Ñp ─æß╗Ö ─æß╗Öc quyß╗ün trong nß╗ün kinh tß║┐ thß╗ï tr╞░ß╗¥ng<br />
4.2. L&yacute; luß║¡n cß╗ºa V. I . L&ecirc;nin vß╗ü ─æß║╖c ─æiß╗âm kinh tß║┐ cß╗ºa ─æß╗Öc quyß╗ün v&agrave; ─æß╗Öc quyß╗ün nh&agrave; n╞░ß╗¢c trong nß╗ün kinh tß║┐ thß╗ï tr╞░ß╗¥ng t╞░ bß║ún chß╗º ngh─⌐a<br />
(Presentation)<br />
Chapter 4: Competition and monopoly in the market economy<br />
4.1. Competition at monopoly level in the market economy<br />
4.2. Theory of VI. Lenin on economic features of monopoly and state monopoly in the capitalist market economy<br />
(Presentation)</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>Ch╞░╞íng 4: Cß║ính tranh v&agrave; ─æß╗Öc quyß╗ün trong nß╗ün kinh tß║┐ thß╗ï tr╞░ß╗¥ng<br />
4.3. Biß╗âu hiß╗çn mß╗¢i cß╗ºa ─æß╗Öc quyß╗ün, ─æß╗Öc quyß╗ün nh&agrave; n╞░ß╗¢c trong ─æiß╗üu kiß╗çn ng&agrave;y nay; Vai tr&ograve; lß╗ïch sß╗¡ cß╗ºa chß╗º ngh─⌐a t╞░ bß║ún<br />
(Presentation)<br />
Chapter 4: Competition and monopoly in the market economy<br />
4.3. Nmanifestations of monopoly and state monopoly in current condition. Historical significance of capitalism<br />
(Presentation)</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>Ch╞░╞íng 5: Kinh tß║┐ thß╗ï tr╞░ß╗¥ng ─æß╗ïnh h╞░ß╗¢ng x&atilde; hß╗Öi chß╗º ngh─⌐a v&agrave; c&aacute;c quan hß╗ç lß╗úi &iacute;ch kinh tß║┐ ß╗ƒ Viß╗çt Nam<br />
5.1. Kinh tß║┐ thß╗ï tr╞░ß╗¥ng ─æß╗ïnh h╞░ß╗¢ng x&atilde; hß╗Öi chß╗º ngh─⌐a ß╗ƒ Viß╗çt Nam<br />
5.2. Ho&agrave;n thiß╗çn thß╗â chß║┐ kinh tß║┐ thß╗ï tr╞░ß╗¥ng ─æß╗ïnh h╞░ß╗¢ng x&atilde; hß╗Öi chß╗º ngh─⌐a ß╗ƒ Viß╗çt Nam<br />
(Presentation)<br />
Chapter 5: Socialist-oriented market economy and economic interest relationship in Vietnam<br />
5.1. Socialist-oriented market economy in Vietnam<br />
5.2. Perfect the system of institutions of socialist oriented market economy in Vietnam<br />
(Presentation)</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Introduction to User Experience Principles and Processes<br />
- What is UX? What are UX Research and Design?<br />
- UX Design Overview<br />
- How Do People Perceive Information?</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>- How Do People Act in the World?<br />
- Design Heuristics<br />
- Heuristic Evaluation and Course Wrap-up<br />
Offline: Course 1 Review</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Understanding User Needs<br />
- Introduction and Qualitative Research Overview<br />
- Interview Protocols</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>- Interviews, Observation, and Data Extraction<br />
- Affinity Walls and Analysis<br />
- Conclusion</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Evaluating Designs with Users<br />
- What is User Testing?<br />
- User Test Basics<br />
- Getting More Out of User Testing<br />
- Analysis and Reporting<br />
- User Test Report<br />
Offline: Course 2, 3 Review</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>UX Design: From Concept to Prototype<br />
- Introduction to the Design Process<br />
- Ideation<br />
- Design Constraints and Making Choices</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>- Building Blocks of User Interaction<br />
- Low to Hi-Fidelity Prototyping<br />
- Conceptual Issues in Prototyping and Design<br />
Offline: Course 4 Review</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>UX Research at Scale: Surveys, Analytics, Online Testing<br />
- When and How to Use Surveys<br />
- Asking the Right People (Coverage Error)<br />
- Getting Answers (Nonresponse error)<br />
- Writing Questions (Measurement Error)<br />
(Week 7 or Week 8) 1st Evaluation (For students completed &amp; got Coursera&#39;s specialization certificates) (Option)</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>- About Research at Scale<br />
- Behavioral Analytics<br />
- Remote Testing<br />
- A/B Testing and Preference Testing<br />
Offline: Course 5 Review</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>UX (User Experience) Capstone<br />
- Introduction &amp; Milestone 1<br />
- MILESTONE 2<br />
- MILESTONE 3<br />
- MILESTONE 4<br />
- MILESTONE 5<br />
Offline: Course 6 Introduction</p>', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'FINAL REPORT', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'FINAL REPORT (cont.)', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'FINAL REPORT (cont.)', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'2nd Evaluation (For students completed & got Coursera''s specialization certificates)', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'3rd Evaluation (For students completed & got Coursera''s specialization certificates)', N'WDU203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Specialization Introduction<br />
Software Development Processes and Methodologies:<br />
- Software development processes: Part 1</p>', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'Software Development Processes : Part 2', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'Software Development Models: Traditional Models', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'Software Development Models: Agile and Lean
Course 1 Review', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Agile Software Development:<br />
- Agile Fundamentals<br />
- Requirements and Planning</p>', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>- Scrum<br />
- XP and Course Wrap-up<br />
Course 2 Review</p>', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Lean Software Development:<br />
- Lean Fundamentals<br />
- Kanban, Value Steam Mapping and Kaizen</p>', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>- Lean Startup<br />
- Design Thinking<br />
Course 3 Review<br />
Week 8 or 9: 1st Evaluation (For students completed &amp; got Coursera&#39;s specialization certificates) (Option)</p>', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Engineering Practices for Building Quality Software:<br />
- Introduction to Quality Software<br />
- Quality in Design</p>', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'Quality in Architecture', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'Quality in Implementation', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'Quality in Testing and Deployment
Course 4 Review', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'2nd Evaluation (For students completed & got Coursera''s specialization certificates)', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'3rd Evaluation (For students completed & got Coursera''s specialization certificates)', N'SWE201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Course Introduction<br />
Topic 1. Fundamentals of testing<br />
1.1 Why is testing necessary?<br />
1.2 What is testing?</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>1.3 Testing principles<br />
Guiding Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Review Problems<br />
1.4 Fundamental test process<br />
1.5 The psychology of testing</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Requirements elicitation<br />
- Requirements elicitation techniques: Interviews, workshops, Focus groups, Observations, Questionaires, System interface analysis, User Interface Analysis, Document Analysis<br />
- Planning and Preparing for elicitation on your project<br />
- Performing elicitation activities<br />
- Follow up after elicitation<br />
- Classifying customer input<br />
- Some cautions about elicitation<br />
- Assumed and implied requirements<br />
- Finding missing requirements</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>Understanding user requirements<br />
- Use cases and user stories<br />
- The use case approach<br />
- Benefits of usage-centric requirements</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Playing by the rules<br />
- A business rules taxonomy<br />
- Documenting business rules<br />
- Discovering business rules<br />
- Business rules and requirements<br />
- Tying everything together<br />
Progress test 1 and Review</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>Documenting the requirements<br />
- The software requirements specification<br />
- A software requirements specification template<br />
- Requirements specification on agile projects</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Writing excellent requirements<br />
- Characteristics of excellent requirements<br />
- Guidelines for writing requirements<br />
- Sample requirements, before and after<br />
A picture is worth 1024 words<br />
- Data flow diagram; Swimlane diagram; State-transition diagram and state table ; Dialog map</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'<p>A picture is worth 1024 words (con&#39;t)<br />
- Decision tables and decision trees; Event-response tables ; Modeling on agile projects</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Specifying data requirements<br />
- Modeling data relationships<br />
- The data dictionary<br />
- Data analysis<br />
- Specifying reports</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>Beyond functionality<br />
- Software quality attributes<br />
- Exploring quality attributes<br />
- Defining quality requirements<br />
- Specifying quality requirements with Planguage<br />
- Quality attribute trade-offs<br />
- Implementing quality attribute requirements<br />
- Constraint<br />
- Handling quality attributes on agile projects</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'<p>Risk reduction through prototyping<br />
- Prototyping: What and why<br />
- Mock-ups and proofs of concept<br />
- Throwaway and evolutionary prototypes<br />
- Paper and electronic prototypes<br />
- Working with prototypes<br />
- Prototype evaluation<br />
- Risks of prototyping<br />
- Prototyping success factors</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>First things first: Setting requirement priorities<br />
- Why prioritize requirements?<br />
- Some prioritization pragmatics<br />
- Games people play with priorities<br />
- Some prioritization techniques<br />
- Prioritization based on value, cost, and risk</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>Validating the requirements<br />
- Validation and verification<br />
- Reviewing requirements<br />
- Prototyping requirements<br />
- Testing the requirements<br />
- Validating requirements with acceptance criteria</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>Exercises (can be interspersed with the lecture)<br />
Discuss and/or present on Chapter 6</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>Requirements reuse<br />
- Why reuse requirements?<br />
- Dimensions of requirements reuse<br />
- Types of requirements information to reuse<br />
- Common reuse scenarios<br />
- Requirement patterns<br />
- Tools to facilitate reuse<br />
- Making requirements reusable<br />
- Requirements reuse barriers and success factors<br />
Beyond requirements development<br />
- Estimating requirements effort<br />
- From requirements to project plans,designs and code, tests, success<br />
Assignment 1 Review and Evaluation</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'<p>Assignment 2 Introduction<br />
Progress test 2 and Review</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>2.4 Maintenance testing<br />
Guiding Problems<br />
Guiding Lab 1</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Progress test and/or<br />
Review Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'<p>Agile projects<br />
- Limitations of the waterfall<br />
- The agile development approach<br />
- Essential aspects of an agile approach to requirements<br />
- Adapting requirements practices to agile projects<br />
- Transitioning to agile: Now what?<br />
Enhancement and replacement projects<br />
- Expected challenges<br />
- Requirements techniques when there is an existing system<br />
- Prioritizing by using business objectives<br />
- When old requirements don&rsquo;t exist<br />
- Encouraging new system adoption</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'<p>Packaged solution projects<br />
- Requirements for selecting packaged solutions<br />
- Requirements for implementing packaged solutions<br />
- Common challenges with packaged solution<br />
Outsourced projects<br />
- Appropriate levels of requirements detail<br />
- Acquirer-supplier interactions<br />
- Change management<br />
- Acceptance criteria</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'<p>Group discussion<br />
Summary and Exercises</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'Assignment 2 supporting', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>Requirements management practices<br />
- Requirements management process<br />
- The requirements baseline<br />
- Requirements version control<br />
- Requirement attributes<br />
- Tracking requirements status<br />
- Resolving requirements issues<br />
- Measuring requirements effort<br />
- Managing requirements on agile projects</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'<p>Change happens<br />
- Change control policy<br />
- Basic concepts of the change control process<br />
- A change control process description<br />
- The change control board<br />
- Change control tools<br />
- Measuring change activity<br />
- Change impact analysis<br />
- Change management on agile projects</p>', N'SWR302')
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>Links in the requirements chain<br />
- Tracing requirements<br />
- Motivations for tracing requirements<br />
- The requirements traceability matrix<br />
- Tools for requirements tracing<br />
- A requirements tracing procedure</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>Tools for requirements engineering (self-study)<br />
Improving your requirements processes<br />
- How requirements relate to other project processes<br />
- Requirements and various stakeholder groups<br />
- Gaining commitment to change<br />
- Fundamentals of software process improvement<br />
- Root cause analysis<br />
- The process improvement cycle<br />
- Requirements engineering process assets<br />
- Creating a requirements process improvement road map<br />
Software requirements and risk management<br />
- Fundamentals of software risk management<br />
- Requirements-related risks<br />
- Risk management is your friendc</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'<p>Progress test 3<br />
Assignment 2 evaluation</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'<p>Progress test 3<br />
Assignment 2 evaluation</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>Topic 3. Static techniques<br />
3.1 Reviews and the test process<br />
3.2 Review process<br />
Guiding Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Lab 1 Assitant<br />
Review Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'3.3 Static analysis by tools', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Guiding Problems<br />
Guiding Lab 2<br />
Review Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>Topic 4. Test design techniques<br />
4.1 The test development process<br />
4.2 Categories of test design techniques<br />
4.3 Specification-based or black-box techniques</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'<p>Guiding Problems<br />
Lab 2 Assitant</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>Automation Test Tool<br />
(Use tools: NUnit, JUnit, Selenium .. )<br />
Defect Management System: Mantis, bugzilla,&hellip;</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>Automation Test Tool<br />
(Use tools: NUnit, JUnit, Selenium .. )<br />
Defect Management System: Mantis, bugzilla,&hellip; (cont.)</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>Review Problems4.4 Structure-based or white-box techniques<br />
4.5 Experience-based techniques</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>4.6 Choosing a test technique<br />
Guiding Problems<br />
Guiding Lab 3</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'<p>Progress test and/or<br />
Review Problems<br />
Topic 5. Test management<br />
5.1 Test organization<br />
5.2 Test plans, estimates, and strategies</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'<p>5.3 Test progress monitoring and control<br />
Guiding Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'<p>Lab 3 Assitant<br />
Review Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'<p>5.4 Configuration management<br />
5.5 Risk and testing<br />
5.6 Incident management</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'<p>Guiding Problems<br />
Guiding Lab 4<br />
Review Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>Topic 6. Tool support for testing<br />
6.1 Types of test tool<br />
6.2 Effective use of tools: Potential benefits and risks<br />
6.3 Introducing a tool into an organization</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'<p>Guiding Problems<br />
Lab 4 Assitant</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>Progress test and/or<br />
Review Problems<br />
Topic 7. ISTQB Foundation Exam<br />
7.1 Preparing for the exam</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>7.2 Taking the exam<br />
7.3 Mock exam<br />
Guiding Problems<br />
Review Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'<p>Topic 8. Agile Testing<br />
8.1 What is Agile Testing<br />
8.2 Test Plan for Agile<br />
8.3 Agile Testing Strategies<br />
8.4 QA challenges with agile software development<br />
8.5 Risk of Automation in Agile Process</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Review', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>Ch╞░╞íng 5: Kinh tß║┐ thß╗ï tr╞░ß╗¥ng ─æß╗ïnh h╞░ß╗¢ng x&atilde; hß╗Öi chß╗º ngh─⌐a v&agrave; c&aacute;c quan hß╗ç lß╗úi &iacute;ch kinh tß║┐ ß╗ƒ Viß╗çt Nam<br />
5.3. C&aacute;c quan hß╗ç lß╗úi &iacute;ch kinh tß║┐ ß╗ƒ Viß╗çt Nam<br />
Progress Test 2<br />
Chapter 5: Socialist-oriented market economy and economic interest relationship in Vietnam<br />
5.3. Economic interest relationship in Vietnam<br />
Progress Test 2</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>Ch╞░╞íng 6: C&ocirc;ng nghiß╗çp h&oacute;a, hiß╗çn ─æß║íi h&oacute;a v&agrave; hß╗Öi nhß║¡p kinh tß║┐ quß╗æc tß║┐ cß╗ºa Viß╗çt Nam<br />
6.1. C&ocirc;ng nghiß╗çp h&oacute;a, hiß╗çn ─æß║íi h&oacute;a ß╗ƒ Viß╗çt Nam<br />
(Presentation)<br />
Chapter 6: Vietnam&#39;s process of industrialization, modernization and international economic integration<br />
6.1. Industrialization and modernization in Vietnam<br />
(Presentation)</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>Ch╞░╞íng 6: C&ocirc;ng nghiß╗çp h&oacute;a, hiß╗çn ─æß║íi h&oacute;a v&agrave; hß╗Öi nhß║¡p kinh tß║┐ quß╗æc tß║┐ cß╗ºa Viß╗çt Nam<br />
6.2. Hß╗Öi nhß║¡p kinh tß║┐ quß╗æc tß║┐ cß╗ºa Viß╗çt Nam<br />
Chapter 6: Vietnam&#39;s process of industrialization, modernization and international economic integration<br />
6.2. Vietnam&#39;s international economic integration</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>Tß╗òng kß║┐t ch╞░╞íng 1, 2, 3, 4, 5, 6<br />
Review Chapter 1, 2, 3, 4, 5, 6</p>', N'	MLN122')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	Chapter 1: Introduction to Scientific socialism', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>Chapter 2: The historical mission of the working class<br />
Fundamental viewpoints of Marxism-Leninism on the working class and the historical mission of the working class<br />
The working class and the implementation of the historical mission of the current working class</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>Chapter 2: The historical mission of the working class<br />
Fundamental viewpoints of Marxism-Leninism on the working class and the historical mission of the working class<br />
The working class and the implementation of the historical mission of the current working class</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>Chapter 3: Socialism and the transitional period to socialism<br />
Socialism<br />
The transition period to socialism<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>Chapter 3: Socialism and the transitional period to socialism<br />
Socialism<br />
The transition period to socialism<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>Chapter 4: Socialist democracy and socialist state<br />
Democracy and socialist democracy<br />
Socialist state<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>Chapter 4: Socialist democracy and socialist state<br />
Democracy and socialist democracy<br />
Socialist state<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>Review Chapter 1,2,3,4<br />
Progress test 1</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>Chapter 5: Social-class structure and alliances of class in the transition to socialism<br />
Social-class structure in the transition to socialism<br />
Alliances of class in the transition to socialism<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>Chapter 5: Social-class structure and alliances of class in the transition to socialism<br />
Social-class structure in the transition to socialism<br />
Alliances of class in the transition to socialism<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>Chapter 6: Ethnicity, religion issues in the transition to socialism<br />
Ethnicity issues in the transition to socialism<br />
Religion issues in the transition to socialism<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>Chapter 6: Ethnicity, religion issues in the transition to socialism<br />
Ethnicity issues in the transition to socialism<br />
Religion issues in the transition to socialism<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>Chapter 7: Family problems in the transition to socialism<br />
The concept, position and function of the family<br />
Basis for building a family in the transition to socialism<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	<p>Chapter 7: Family problems in the transition to socialism<br />
The concept, position and function of the family<br />
Basis for building a family in the transition to socialism<br />
(Presentation)</p>', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	Review Chapter 1,2,3,4,5,6,7', N'	MLN131')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	Chapter 1: Concept, object, research methods and meaningful learning of the course Ho Chi Minh ideology', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>Chapter 2: The basis and the formation and development of Ho Chi Minh ideology<br />
2.1. The basis for the formation of Ho Chi Minh ideology<br />
2.2. The formation and development of Ho Chi Minh ideology</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>Chapter 2: The basis and the formation and development of Ho Chi Minh ideology<br />
2.3. Ideological values ΓÇïΓÇïof Ho Chi Minh<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>Chapter 3: Ho Chi Minh ideology on national independence and socialism<br />
3.1. Ho Chi Minh ideology on national independence<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>Chapter 3: Ho Chi Minh ideology on national independence and socialism<br />
3.2. Ho Chi Minh ideology on socialism and the road of transition to socialism in Vietnam<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>Chapter 3: Ho Chi Minh ideology on national independence and socialism<br />
3.3. Apply Ho Chi Minh ideology on the relationship between national independence and socialism<br />
3.4. Apply Ho Chi Minh ideology on national independence associated with socialism in the current revolutionary practices of Vietnam<br />
Progress test 1<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>Chapter 4: Ho Chi Minh ideology on the Communist Party of Vietnam and the State of the people, by the people, for the people<br />
4.1. Ho Chi Minh ideology on the Communist Party of Vietnam<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>Chapter 4: Ho Chi Minh ideology on the Communist Party of Vietnam and the State of the people, by the people, for the people<br />
4.2. Ho Chi Minh ideology on the State of the people, by the people, for the people<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>Chapter 4: Ho Chi Minh ideology on the Communist Party of Vietnam and the State of the people, by the people, for the people<br />
4.3. Apply Ho Chi Minh ideology in building the Communist Party and the State<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>Chapter 5: Ho Chi Minh ideology on the great unity bloc and international solidarity<br />
5.1. Ho Chi Minh ideology on the great unity bloc<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>Chapter 5: Ho Chi Minh ideology on the great unity bloc and international solidarity<br />
5.2. Ho Chi Minh ideology on international solidarity<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>Chapter 5: Ho Chi Minh ideology on the great unity bloc and international solidarity<br />
5.3. Apply Ho Chi Minh ideology on the great unity bloc and international solidarity in the current practices<br />
(Presentation)<br />
Progress Test 2</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>Chapter 6: Ho Chi Minh ideology on culture, human<br />
6.1. Ho Chi Minh ideology on culture<br />
6.2. Ho Chi Minh ideology on human<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	<p>Chapter 6: Ho Chi Minh ideology on culture, human<br />
6.3. Build Vietnamese culture and human according to Ho Chi Minh ideology<br />
(Presentation)</p>', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	Summary', N'	HCM202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	Introductory chapter: Objects, purposes, tasks, research and study methods of the History of CPV', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>Chapter 1: The Communist Party of Vietnam was founded and led the rise to power (1930 - 1945)<br />
1.1. The Communist Party of Vietnam was founed and the Party&#39;s first Political Platform ( (February 1930)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>Chapter 1: The Communist Party of Vietnam was founded and led the rise to power (1930 - 1945)<br />
1.2. The Party&#39;s leading the rise to power (1930 - 1945) (part 1)<br />
1.2.1. Revolutionary movements of 1930-1931 and restoring revolutionary movements 1932 - 1935<br />
1.2.2. The Democratic Movement 1936-1939<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>Chapter 1: The Communist Party of Vietnam was founded and led the rise to power (1930 - 1945)<br />
1.2. The Party&#39;s leading the rise to power (1930 - 1945) (part 1)<br />
1.2.1. Revolutionary movements of 1930-1931 and restoring revolutionary movements 1932 - 1935<br />
1.2.2. The Democratic Movement 1936-1939<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>Chapter 1: The Communist Party of Vietnam was founded and led the rise to power (1930 - 1945)<br />
1.2. The Party&#39;s leading the rise to power (1930 - 1945) (part 3)<br />
1.2.4. The nature, significance and experience of the August Revolution of 1945<br />
(Presentation)<br />
Progresstest 1</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>Chapter 2: The Party led two resistance wars, completed the national liberation and reunion (1945 - 1975)<br />
2.1. The Party led the construction and defense of the revolutionary government and the resistance war against the French colonialists (part 1)<br />
2.1.1. The construction and defense of the revolutionary government 1945 - 1946<br />
2.1.2. Guidelines on national resistance war against French colonialists and its implementation from 1946 to 1950<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>Chapter 2: The Party led two resistance wars, completed the national liberation and reunion (1945 - 1975)<br />
2.1. The Party led the construction and defense of the revolutionary government and the resistance war against the French colonialists (part 2)<br />
2.1.3. Stepping up the resistance war against the invasion of French colonialists and American intervention to victory 1951 - 1954<br />
2.1.4. Historical significance and experience of the Party in leading the resistance war against French colonialism and American imperialism invasions<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>Chapter 2: The Party led two resistance wars, completed the national liberation and reunion (1945 - 1975)<br />
2.2. Leading the construction of socialism in the North and resistance war against American imperialist invasion, liberating the South and reuniting the country (1954 - 1975) (part 1)<br />
2.2.1. Leading the revolution of the two regions in the period 1954 - 1965<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>Chapter 2: The Party led two resistance wars, completed the national liberation and reunion (1945 - 1975)<br />
2.2. Leading the construction of socialism in the North and resistance war against American imperialist invasion, liberating the South and reuniting the country (1954 - 1975) (part 2)<br />
2.2.2. Leading the national revolution in the period 1965 - 1975<br />
2.2.3. The significance of the Party&#39;s leadership experience in the resistance wars against American imperialist invasion 1954 - 1975<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>Chapter 3: The Party led the national transition to socialism and carried out the Doi moi (1975-2018)<br />
3.1. The Party led whole country in building socialism and defending the country (1975 - 1986) (part 1)<br />
3.1.1. Building socialism and defending the country 1975 - 1981<br />
Progress test 2<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>Chapter 3: The Party led the national transition to socialism and carried out the Doi moi (1975-2018)<br />
3.1. The Party led whole country in building socialism and defending the country (1975 - 1986) (part 2)<br />
3.1.2. The 5th National Congress of the Communist Party of Vietnam and breakthroughs in economic renewal 1982 - 1986<br />
3.2. Leading the innovation process, promoting industrialization, modernization and international integration (1986 - 2018) (part 1)<br />
3.2.1. Comprehensive renovation, bringing the country out of the socio-economic crisis 1986 - 1996<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>Chapter 3: The Party led the national transition to socialism and carried out the Doi moi (1975-2018)<br />
3.2. Leading the innovation process, promoting industrialization, modernization and international integration (1986 - 2018) (part 2)<br />
3.2.2. Continuing the renovation, accelerating industrialization, modernization and international integration 1996 - 2018 (from the VIII to the X National Congress)<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>Chapter 3: The Party led the national transition to socialism and carried out the Doi moi (1975-2018)<br />
3.2. Leading the innovation process, promoting industrialization, modernization and international integration (1986 - 2018) (part 2)<br />
3.2.2. Continuing the renovation, accelerating industrialization, modernization and international integration 1996 - 2018 (from the VIII to the X National Congress)<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	<p>Chapter 3: The Party led the national transition to socialism and carried out the Doi moi (1975-2018)<br />
3.2. Leading the innovation process, promoting industrialization, modernization and international integration (1986 - 2018) (part 2)<br />
3.2.2. Continuing the renovation, accelerating industrialization, modernization and international integration 1996 - 2018 (from the VIII to the X National Congress)<br />
(Presentation)</p>', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	Review introductory chapter and chapter 1, 2, 3', N'	VNR202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	<p>Module 1: Introduction to Innovation and Entrepreneurship<br />
Lesson 1: Preview of the Course<br />
Lesson 2: Introduction to the course<br />
Lesson 3: What is entrepreneurship?<br />
Lesson 4: Who is an entrepreneur?<br />
Lesson 5: Entrepreneurship, creativity, &amp; innovation<br />
Lesson 6: The world&#39;s most innovative companies<br />
Lesson 7: Types of innovation<br />
Lesson 8: Entrepreneurs and strategic decisions<br />
Lesson 9: The opportunity analysis canvas</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>Module 2: Entrepreneurial Mindset, Motivations, and Behaviors<br />
Lesson 1: Introduction to entrepreneurial mindset, motivations, and behaviors<br />
Lesson 2: Entrepreneurial mindset<br />
Lesson 3: Guest Lecture with Alexa von Tobel, Founder and CEO of LearnVest.com<br />
Lesson 4: Entrepreneurial motivations<br />
Lesson 5: Guest Lecture with Penny Pritzker, U.S. Secretary of Commerce Penny Pritzker - How did you decide to become an entrepreneur?<br />
Lesson 6: Entrepreneurial behaviors<br />
Lesson 7: Risk taking in entrepreneurial decision-making<br />
Lesson 8: Risk, uncertainty, and stakeholder involvement<br />
Module 3: Industry Understanding<br />
Lesson 1: Introduction to industry understanding<br />
Lesson 2: Knowledge conditions<br />
Lesson 3: Demand conditions<br />
Lesson 4: Industry lifecycle<br />
Lesson 5: Industry structure<br />
Lesson 6: Competitive advantage<br />
Lesson 7: Learning curve<br />
Lesson 8: Complementary assets<br />
Lesson 9: Reputation effects</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>Module 4: Customer Understanding and Business Modeling<br />
Lesson 1: Introduction to customer understanding<br />
Lesson 2: Macro changes that increase new venture opportunities<br />
Lesson 3: Guest Lecture with U.S. Secretary of Commerce Penny Pritzker - How Can Government and Entrepreneurs Work Together?<br />
Lesson 4: Guest Lecture with U.S. Secretary of Commerce Penny Pritzker - Why Is Skills Training and Development Important For Entrepreneurs and Government?<br />
Lesson 5: Exploring real market needs<br />
Lesson 6: Satisfying real market needs<br />
Lesson 7: Strategic positioning<br />
Lesson 8: Strategic planning<br />
Lesson 9: Value innovation<br />
Lesson 10: Opportunity identification<br />
Lesson 11: Bonus Lecture: Business Models from the Classroom</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	Review Course 1', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>Module 1: Introduction<br />
Lesson 1: Preview of the Course<br />
Lesson 2: Introduction to the Course<br />
Lesson 3: Guest Lecture with U.S. Secretary of Commerce Penny Pritzker - What Does Innovation Mean to You?<br />
Lesson 4: What are entrepreneurial opportunities?<br />
Lesson 5: What factors influence the feasibility of an innovation?<br />
Lesson 6: Which innovation strategy: technology-push or market-pull?<br />
Lesson 7: Product-market fit<br />
Lesson 8: How do you develop a business model<br />
Lesson 9: Walkthrough of the business model canvas - Part 1<br />
Lesson 10: Walkthrough of the business model canvas - Part 2</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>Module 2: Customer Discovery and Validation<br />
Lesson 1: What do customers want to know?<br />
Lesson 2: Customer types<br />
Lesson 3: Customer archetypes<br />
Lesson 4: Customer segments and business models<br />
Lesson 5: Customer segments, value propositions, product features<br />
Lesson 6: How to map your value?<br />
Lesson 7: How to interview customers?<br />
Lesson 8: How to get insights from your customers?<br />
Module 3: Product Understanding and Marketing<br />
Lesson 1: Customer value<br />
Lesson 2: The DNA of customer-centricity<br />
Lesson 3: Crossing the chasm<br />
Lesson 4: Qualitative and quantitative marketing research<br />
Lesson 5: Importance and methods of market segmentation<br />
Lesson 6: Focusing on the target market<br />
Lesson 7: Beyond the chasm<br />
Lesson 8: Strategic implications of beyond the chasm<br />
Lesson 9: E-commerce: The internet as a selling platform</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>Module 4: Prototyping and Testing<br />
Lesson 1: Planning for prototyping<br />
Lesson 2: Why and how to prototype<br />
Lesson 3: Rapid prototyping and development<br />
Lesson 4: Lean startup MVPs<br />
Lesson 5: Choosing a wireframing/UX prototyping tool<br />
Lesson 6: Anatomy of an experience map<br />
Lesson 7: What you&#39;ll learn from user testing<br />
Lesson 8: Analytics and insight<br />
Lesson 9: Troubleshooting your customer discovery<br />
Lesson 10: Levels of a product/service<br />
Module 5: Building a Team<br />
Lesson 1: Recruiting people to your cause<br />
Lesson 2: Hiring employees<br />
Lesson 3: Platforms for finding talent<br />
Lesson 4: Cross pollination and team configuration<br />
Lesson 5: Directing the rider<br />
Lesson 6: Motivating the elephant</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	Review Course 2', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>Module 1: The Early Stage Investment Landscape<br />
Lesson 1: Preview of the Course<br />
Lesson 2: Welcome to New Venture Finance<br />
Lesson 3: Special Interview with Andrew Sherman, Attorney and Author<br />
Lesson 4: The investment landscape<br />
Lesson 5: Do you speak the language of raising start-up capital?<br />
Lesson 6: Why should you start with the business plan?<br />
Lesson 7: What do venture capitalists look for in a &quot;good plan&quot;?<br />
Lesson 8: What financial statements do investors want to see?<br />
Lesson 9: How do you develop a balance sheet?<br />
Lesson 10: What should an income statement present?<br />
Lesson 11: What is the purpose of the cash flow statement?<br />
Lesson 12: What corporate structure should I use?<br />
Lesson 13: Special Interview with Michael Labriola, Attorney<br />
Lesson 14: How do investors view your early stage venture?</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>Module 2: Sources of Capital for the Early Stage Company<br />
Lesson 1: Sources of capital<br />
Lesson 2: Where to find investors?<br />
Lesson 3: Why consider friends and family as investors?<br />
Lesson 4: What&rsquo;s bootstrapping?<br />
Lesson 5: Are incubators and accelerators a fit?<br />
Lesson 6: Special Interview with Rick Gordon of Mach37<br />
Lesson 7: What are angel investors?<br />
Lesson 8: Are you ready to raise capital?<br />
Module 3: Getting Funded &ndash; Steps in the Funding Process<br />
Lesson 1: Steps in the funding process<br />
Lesson 2: Special Interview with Jonathan Aberman, Venture Capitalist<br />
Lesson 3: What is due diligence?<br />
Lesson 4: What is your company worth?<br />
Lesson 5: How to negotiate a term sheet?<br />
Lesson 6: How to establish common stock?<br />
Lesson 7: When to use convertible notes?<br />
Lesson 8: What is preferred stock?<br />
Lesson 9: When to use alternative sources of capital?</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>Module 4: Pitching Investors and Closing the Round<br />
Lesson 1: What do investors want to see?<br />
Lesson 2: Guest Lecture with U.S. Secretary of Commerce Penny Pritzker - What are Investors Looking for in a Business Plan?<br />
Lesson 3: How to create the pitch deck?<br />
Lesson 4: How to tell your story?<br />
Lesson 5: What are the do&rsquo;s and don&rsquo;ts of the pitch?<br />
Lesson 6: How to close the round?</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	Review Course 3', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>Module 1: Defining the Opportunity<br />
Lesson 1: Welcome to the Entrepreneurship Capstone<br />
Lesson 2: Guest Lecture with U.S. Secretary of Commerce Penny Pritzker - What Advice Do You Have For Aspiring Entrepreneurs?<br />
Lesson 3: Does your solution create value for your stakeholders?<br />
Lesson 4: What is value innovation?<br />
Lesson 5: Is the problem real?<br />
Lesson 6: Is your advantage superior and sustainable?<br />
Lesson 7: Can you build the right team at the right time?<br />
Lesson 8: Will your business model work?<br />
Lesson 9: Crafting the business model canvas: Part 1<br />
Lesson 10: Crafting the business model canvas: Part 2</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>Module 2: Discovering the Customer<br />
Lesson 1: Customer segments, value propositions, and product features<br />
Lesson 2: Customer types<br />
Lesson 3: Customer segments and business models<br />
Lesson 4: Customer archetypes<br />
Lesson 5: Minimum viable product<br />
Lesson 6: How to interview customers</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>Module 3: Understanding Customers<br />
Lesson 1: Sizing the Opportunity<br />
Lesson 2: Finding Patterns<br />
Lesson 3: Looking for Insights<br />
Module 4: Creating the Marketing and Sales Strategy<br />
Lesson 1: Developing the marketing mix: Part 1<br />
Lesson 2: Developing the marketing mix: Part 2<br />
Lesson 3: Pricing<br />
Lesson 4: Sales forecasting<br />
Lesson 5: Managing the sales pipeline</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>Module 5: Refining the Solution<br />
Lesson 1: Guest Lecture with U.S. Secretary of Commerce Penny Pritzker - What Decisions Did You Make to Get Your Business Off the Ground?<br />
Lesson 2:Product fit<br />
Lesson 3:Building the right revenue model<br />
Lesson 4:Scaling sales<br />
Lesson 5:Building the company<br />
Module 6: Crafting the Business Plan<br />
Lesson 1: Defining the business plan<br />
Lesson 2: Authoring the business plan</p>', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	Review Course 4', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	1st Appraisal Exam', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	 2nd Appraisal Exam', N'	SYB302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	<p>Introduction to the online course SSL101 (offline)</p>

<p><br />
Module 1 (MOOC 1): (online)<br />
- Welcome<br />
- Introduction to Academic Culture &amp; Digital Literacy<br />
- Academic Integrity<br />
- How it Works<br />
- Tool and Tips<br />
<br />
Module 2 (MOOC 1): (online)<br />
- Information Types by Field<br />
- How to Read a Journal Article in the Humanities<br />
- How to Read a Journal Article in the Sciences<br />
- Characteristics of Journal Article Accessing Information<br />
- Accessing &amp; Defining an Information Need<br />
- Developing a Search Strategy<br />
- Documenting and Evaluating the Search Strategy</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>Module 3 (MOOC 1):<br />
- Critically Evaluating Information &amp; Web Resources &amp; Wikipedia<br />
- Establishing Relevance<br />
- Managing Information: Files &amp; Folders<br />
- Processing and Coding</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>Module 4 (MOOC 1): (online)<br />
- Avoiding Plagiarism<br />
- Referencing &amp; Attributing Resources<br />
- Paraphrasing and Summarizing &amp; Referencing Software<br />
- Mendeley, EndNote<br />
<br />
Module 5 (MOOC 1): (online)<br />
- Copyright ; Creative Commons Licensing<br />
- Digital Networks for Learning and Research<br />
- Managing Digital Identity<br />
- Presenting yourself online<br />
- Communicating Online; Emailing Lecturers; Writing an Email<br />
<br />
Review MOOC1 (offline)<br />
<br />
Summative Assessment &amp; Peer-graded Assignment</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>Module 1 &amp; 2 (MOOC 2):<br />
-&nbsp;Introduction to the Course<br />
- Introduction to Problem Solving &amp; Academic Culture<br />
<br />
Module 3 (MOOC 2):<br />
- Strategies for Undemanding and Beginning the Problem5m<br />
- Strategies for Problem-Solving with Specialized Knowledge &amp; Special Cases<br />
- Defining &amp; Categorizing Problems<br />
- Descriptive &amp; Analytical Tasks and Problems<br />
- The Problem Solving Process<br />
2.4b The Problem Solving Process4m</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>Module 4 (MOOC 2): (online)<br />
- Seeking Different Perspectives<br />
- Applying Forms of Reasoning and Thinking<br />
- Questioning Assumptions &amp; Considering Alternatives<br />
- Using Creative Strategies<br />
- Strategies for Evaluating Solutions<br />
<br />
Review MOOC 2 (offline)<br />
<br />
Summative Assessment &amp; Peer-graded Assignment</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>Module 5 ( MOOC2) Communicating Solutions<br />
- Communicating Solutions: in Written &amp; Oral Form, in Exams<br />
- Group Problem Solving<br />
- Group Work at University<br />
- Organization &amp; Time Management</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>Module 1, Module 2 (MOOC 3):<br />
- Introduction to Critical Thinking Dispositions &amp; Habits of Mind for Critical Thinking<br />
- Dispositions &amp; Habits of Mind for Critical Thinking Expert Video<br />
- Argument Spheres &amp; Field<br />
- Questioning in Critical Thinking &amp; a Text<br />
<br />
Module 3, Module 4 (MOOC 3):<br />
- Logic &amp; Reasoning : Formal Logic Structures; Common Fallacies<br />
- Forms of Reasoning<br />
- Applying Systems Thinking<br />
- Claims and Evidence<br />
- Identifying Biases and Assumptions<br />
- Using Critical Thinking &amp; Criteria to Evaluate Arguments<br />
-Types of Argument</p>', N'	SSL101c')
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>Module 5 ( MOOC 3) (online)<br />
- Demonstrating Critical Thinking<br />
- Argument Structures &amp; Chains<br />
- Models for Academic Argumentation<br />
- Critical Thinking, Critique and Reflective Writing<br />
<br />
Review MOOC 3 (offline)</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>Summative Assessment &amp; Peer-graded Assignment<br />
<br />
Module 1, Module 2 (MOOC 4): - Introduce &amp; Participate to Communication in Academic Culture<br />
- Introduction to Academic Culture &amp; Communication<br />
- Resilience &amp; Motivation for University<br />
- Introduction to rhetorical situations at university<br />
- University course outlines &amp; contexts of communication<br />
- Participation &amp; Communication at University<br />
- Participating in Lectures &amp; Tutorials, Online Forums, Group Work</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>Module 3 &amp; 4 (MOOC 4) Interpreting, Researching &amp; Planning Written Assignments; and Writing Effective &amp; Concise Written Assignments<br />
- Understanding Essay Assignments<br />
- Interpreting Essay Questions<br />
- Understanding and Interpreting Reports &amp; Proposals<br />
- Conducting Research for Essays, Reports &amp; Proposals<br />
- Planning Essays, Reports &amp; Proposals<br />
- Drafting Essays, Reports &amp; Proposals<br />
- Coherence &amp; Cohesion for Essays &amp; Reports<br />
- Polishing &amp; Refining Essays, Reports &amp; Proposals<br />
- Incorporating Visual Aids in Written Assignments<br />
- Formatting and Proofreading Written Assignments for Submission</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>Module 5 (MOOC 4) (online)<br />
Giving Persuasive &amp; Engaging Presentations<br />
- Planning Presentations &amp; Preparing Visual Aids<br />
- Writing your Script &amp; Practicing your Script<br />
- Finding your Presentation Style<br />
- Facilitating Audience Interaction and Fielding Questions<br />
<br />
Review MOOC 4 (offline)</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>Module 1 &amp; 2&nbsp;(MOOC 5): (online) Introduction to Capstone &amp; Researching the Current State<br />
- Identifying a Real World Problem<br />
- Causes &amp; Effects<br />
- Writing a Problem Statement<br />
- Searching for, Evaluating &amp; Using Information for the Capstone<br />
- Writing a Background Paragraph<br />
<br />
Review MOOC 5 (offline)</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>Module 3, Module 4 (MOOC 5): Solving the problem ; Write the Project Proposal<br />
- Defining the Desired State<br />
- Evaluating the Actions<br />
- Big Picture &amp; SMART goal &amp; Plan<br />
- Participants &amp; Resources<br />
- Titles &amp; Refining and Polishing</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	<p>Module 5&nbsp;(MOOC 5): Plan, write, and produce the video presentation<br />
- Introduction to the Video Presentation<br />
- Creating the Storyboard<br />
- Writing the Script<br />
- Preparing &amp; Recording the Scrip<br />
<br />
Summative Assessment &amp; Peer-graded Assignment</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	<p>Weeks 14 and 15<br />
Theoretical Exam (TE)<br />
(For students who have completed spec and earned a certificate in time)</p>', N'	SSL101c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'<p>4.6 Balanced Search Trees<br />
4.7 AVL Trees<br />
4.8 Heaps</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'Assignment 1: Group presentation: the group project proposal', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'Progress test 1 and review', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'<p>5.1 Graphs<br />
5.2 Data Structures for Graphs<br />
5.2.1 Edge List Structure<br />
5.2.2 Adjacency List Structure<br />
5.2.3 Adjacency Matrix Structure<br />
5.3 Graph Traversals<br />
5.3.1 Depth-First Search<br />
5.3.3 Breadth-First Search</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>5.4 Shortest Paths<br />
5.4.1 Weighted Graphs<br />
5.4.2 Dijkstra&rsquo;s Algorithm</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>5.5 Minimum Spanning Trees<br />
5.5.1 Prim-Jarn&acute;─▒k Algorithm<br />
5.5.2 Kruskal&rsquo;s Algorithm<br />
5.6. Euler&#39;s tour and Euler&#39;s cycle</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'<p>6.1 Selection-Sort<br />
6.2 Insertion-Sort<br />
6.3 Bubble-sort<br />
6.4 Quick-Sort</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'<p>6.5 Merge-Sort<br />
6.6 Heap-Sort<br />
6.7 Linear-Time Sorting: Bucket-Sort and Radix-Sort<br />
6.8 Comparing Sorting Algorithms</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'Chapter 4: Principles of Business Communication', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'Chapter 6: Message Format', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'Chapter 7: Positive, Neutral and social Business Message', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'Chapter 8: Negative message', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'Chapter 9: Pursuasive message', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'Chapte 10: Business Reseach and Report wrting', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'Chapter 16: The Job search and Resume', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'Chapter 16: The Job search and Resume', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'Chapter 17: Employment Communication and Interviewing', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'Chapter 17: Employment Communication and Interviewing', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'Review Business Communication knowledges. Quiz 2: Knowledges from slot 18 to slot 27 of working in groups', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'Group Project Presentation: Final report of group project', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Group Project Presentation: Final report of group project (continue)', N'SSG103')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>1.6 Input/Output subsystems<br />
1.7 Different architectures</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>2. Numbering systems<br />
2.1 Introduction<br />
2.2 Positional Number Systems<br />
2.3 Conversion</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>7.1 Hash Tables<br />
7.2 Hash Functions<br />
7.3 Collision-Handling<br />
7.4 Load Factors, Rehashing, and Efficiency<br />
7.5 Java Hash Table Implementation</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>8.1 Abundance of Digitized Text<br />
8.2 Pattern-Matching Algorithms<br />
8.2.1 Brute Force<br />
8.2.2 The Knuth-Morris-Pratt Algorithm<br />
8.3 Text Compression<br />
8.3.1 The Huffman Coding Algorithm<br />
8.3.2 The LZW Algorithm<br />
8.3.3 The Run-length Encoding Algorithm</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, NULL, N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Progress test 2 and review', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Chapter 1: Introduction<br />
1.1. What is an operating system<br />
1.2. History of operating system</p>
', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>1.3. Computer hardware review<br />
Chapter 1 Problems</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Overview of Linux Operating system<br />
Overview of Linux Command<br />
Short practice of using Linux OS</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>1.4 The Operating System Zoo<br />
1.5 Operating System Concepts<br />
1.6 System Calls<br />
1.7 Operating System Structure</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>- Chapter 1 Problems<br />
- Guiding Lab 1</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'10.1 Introduction to Trees (11.1)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'10.2 Applications of Trees (11.2)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'10.3 Tree Traversal (11.3)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'10.4 Spanning Trees (11.4)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'10.5 Minimum Spanning Trees (11.5)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Progress Test 3', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>Simple Linear Regression and Correlation<br />
11.3 Properties of the Least Squares Estimators<br />
11.4 Hypothesis Tests in Simple Linear Regression</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>Simple Linear Regression and Correlation<br />
11.8 Correlation</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'Project presentation', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	Introduction to the online course ENW492c', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>MOOC 1:<br />
- Week 1: Course Introduction<br />
- Week 2: Verb Tenses and Conjunctions<br />
- Week 3: Compound and Complex Sentences</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>MOOC 1:<br />
- Week 4: More Commas, Parallel Structure, and Sentence Variety<br />
<br />
MOOC 2:<br />
- Week 1: Course Introduction<br />
- Week 2: Essay Writing</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	Review MOOC1', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	MOOC 2:
- Week 3: Writing Compare/Contrast Essay', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>MOOC 2:<br />
- Week 4: Writing Cause/Effect Essays</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>MOOC 2:<br />
- Week 5: Writing Argument Essays</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	Review MOOC2', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>MOOC 3:<br />
- Week 1: Course Introduction<br />
- Week 2: Advanced Argument Essays</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>MOOC3:<br />
- Week 3: Avoiding Plagiarism<br />
- Week 4: Synthesis Essay<br />
- Week 5: Documented Essay</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	Review MOOC3', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>MOOC 4<br />
- Week 1: Course introduction and Introduction to Research<br />
- Week 2: Doing research and Planning the paper</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>MOOC 4<br />
- Week 3: Language for research writing<br />
- Week 4: More on citing sources and formatting</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	Review MOOC 4', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>MOOC 5:<br />
- Week 1:Getting Started<br />
- Week 2: Research and Annotated Bibliography</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>MOOC 5:<br />
- Week 3: First Draft and Introduction Paragraph</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>MOOC 5:<br />
- Week 4: The Rough Draft</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>MOOC 5:<br />
- Week 5: Revise and Rewrite<br />
- Week 6: The Final Draft</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	Review MOOC 5', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	<p>Appraisal Exam<br />
Theoretical Exam (TE) and Practical Exam (PE)<br />
(For students who have completed spec and earned certificate in time)</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	<p>Appraisal Exam<br />
Theoretical Exam (TE) and Practical Exam (PE)<br />
(For students who have completed spec and earned certificate in time)</p>', N'	ENW492c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	<p>(*) Giß╗¢i thiß╗çu kh&aacute;i qu&aacute;t vß╗ü ch╞░╞íng tr&igrave;nh<br />
(*) Giß╗¢i thiß╗çu vß╗ü tiß║┐ng Nhß║¡t<br />
(*) Hß╗ìc Hiragana:<br />
20 chß╗» ─æß║ºu ti&ecirc;n<br />
(*) Ch&agrave;o hß╗Åi c╞í bß║ún 1</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>(*) Luyß╗çn tß║¡p: Hiragana v&agrave; Ch&agrave;o hß╗Åi c╞í bß║ún 1<br />
(*) Hß╗ìc Hiragana:<br />
26 chß╗» tiß║┐p theo<br />
&Acirc;m ─æß╗Ñc + &Acirc;m b&aacute;n ─æß╗Ñc<br />
(*) Ch&agrave;o hß╗Åi c╞í bß║ún 2</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>(*) Luyß╗çn tß║¡p: Hiragana v&agrave; Ch&agrave;o hß╗Åi c╞í bß║ún 2<br />
(*) Ch&agrave;o hß╗Åi c╞í bß║ún 3<br />
Sß╗æ tß╗½; C&acirc;u d&ugrave;ng trong lß╗¢p hß╗ìc&hellip;</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>(*) Luyß╗çn tß║¡p: Hiragana v&agrave; Ch&agrave;o hß╗Åi c╞í bß║ún 3<br />
(*) Hß╗ìc Hiragana:<br />
&Acirc;m d&agrave;i + &Acirc;m ngß║»t + &Acirc;m gh&eacute;p<br />
(*) Ch&agrave;o hß╗Åi c╞í bß║ún 4</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>(*) Luyß╗çn tß║¡p:<br />
(*) Hß╗ìc Katakana:<br />
20 chß╗» ─æß║ºu ti&ecirc;n</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>(*) Luyß╗çn tß║¡p:<br />
(*) Hß╗ìc Katakana:<br />
26 chß╗» tiß║┐p theo</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Progress Test 3', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Introduction to the Course<br />
1.Computer Organization<br />
1.1 Von Neumann model<br />
1.2 Computer generations</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>1.3 Subsystems and the role of subsystems<br />
1.4 Central Processing Unit</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'1.5 Memory: main memory and cache memory', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>(*) Luyß╗çn tß║¡p:<br />
(*) Hß╗ìc Katakana:<br />
&Acirc;m d&agrave;i + &Acirc;m ngß║»t + &Acirc;m gh&eacute;p<br />
Mß╗Öt sß╗æ quy tß║»c, ch&uacute; &yacute; vß╗¢i Katakana</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>(*) Luyß╗çn tß║¡p:<br />
- to&agrave;n bß╗Ö KANA<br />
- ch&agrave;o hß╗Åi c╞í bß║ún</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>(*) KIß╗éM TRA 1: to&agrave;n bß╗Ö KANA<br />
LESSON 1 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p:<br />
τºüπü»∩╝╗σÉìσëì∩╝╜πüºπüÖ<br />
∩╝╗σ¢╜∩╝╜Σ║║πüºπüÖ<br />
πüèσ¢╜πü»πü⌐πüíπéëπüºπüÖπüï<br />
πüèΣ╗òΣ║ïπü»<br />
∩╝╗Σ╗òΣ║ï∩╝╜πüºπüÖπüï<br />
πü»πüäπÇü∩╝╗Σ╗òΣ║ï∩╝╜πüºπüÖπÇÇπüäπüäπüêπÇü∩╝╗Σ╗òΣ║ï∩╝╜πüÿπéâπüéπéèπü╛πü¢πéô<br />
Nπü«N</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>LESSON 1 - PART 1 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng - Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi - Luyß╗çn nghe</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>LESSON 1 - PART 2:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p:<br />
∩╜₧µ¡│πüºπüÖ<br />
πüäπüñπÇÇ∩╜₧µ£ê∩╜₧µùÑ</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>LESSON 1 - PART 2 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng - Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi - Luyß╗çn nghe<br />
(*) Chß╗» H&aacute;n lß║ºn 1:</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>LESSON 1 - PART 3:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p:<br />
Σ╜òπüºπüÖπüï<br />
Nπü¿N<br />
Nπéé</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	<p>LESSON 1 - PART 3 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng - Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi - Luyß╗çn nghe<br />
(*) Chß╗» H&aacute;n lß║ºn 2:</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	<p>(*) &Ocirc;n luyß╗çn b&agrave;i 1: Chß╗»a b&agrave;i tß║¡p<br />
(*) Luyß╗çn ─æß╗ìc: Enjoyable Reading 55<br />
(*) Luyß╗çn nghe: Mainichi Kikitori (S╞í cß║Ñp)<br />
(*) &Ocirc;n luyß╗çn chß╗» H&aacute;n lß║ºn 1+2:</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'	', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'	<p>LESSON 2 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p:<br />
Σ╜òΘÜÄπüºπüÖπüïπÇÇΘÜÄµò░πü«Φ¿Çπüäµû╣<br />
∩╜₧πü»πü⌐πüôπüºπüÖπüï<br />
πüôπüôπâ╗πü¥πüôπâ╗πüéπü¥πüôπÇÇπüôπüíπéëπâ╗πü¥πüíπéëπâ╗πüéπüíπéë</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'	<p>LESSON 2 - PART 1 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng - Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi - Luyß╗çn nghe<br />
(*) Chß╗» H&aacute;n lß║ºn 3:</p>', N'	JPD113')
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'	<p>LESSON 2 - PART 2:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p:<br />
∩╜₧πü»πüäπüÅπéëπüºπüÖπüïπÇÇπüôπéîπâ╗πü¥πéîπâ╗πüéπéî<br />
πüôπü«Nπâ╗πü¥πü«Nπâ╗πüéπü«N<br />
NπéÆπüÅπüáπüòπüä</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'	<p>LESSON 2 - PART 2 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng - Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi - Luyß╗çn nghe<br />
(*) Chß╗» H&aacute;n lß║ºn 4:</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'	<p>LESSON 2 - PART 3:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p:<br />
Σ╜òπü«N<br />
∩╝╗Φ¿ÇΦ¬₧∩╝╜πüº<br />
πü⌐πüôπü«N<br />
NπéÆ∩╝ê∩╜₧πüñ∩╝ëπüÅπüáπüòπüä<br />
Φ¬░πü«N</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'	<p>LESSON 2 - PART 3 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng - Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi - Luyß╗çn nghe<br />
(*) &Ocirc;n luyß╗çn chß╗» H&aacute;n (lß║ºn 3 + lß║ºn 4)</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'	<p>(*) KIß╗éM TRA 2: B&agrave;i 2 (Ngß╗» ph&aacute;p + Tß╗½ vß╗▒ng + Chß╗» H&aacute;n)<br />
(*) &Ocirc;n luyß╗çn b&agrave;i 2: Chß╗»a b&agrave;i tß║¡p<br />
(*) Luyß╗çn ─æß╗ìc: Enjoyable Reading 55<br />
(*) Luyß╗çn nghe: Mainichi Kikitori (S╞í cß║Ñp)</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'	<p>LESSON 3 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p:<br />
Σ╗èπÇüΣ╜òµÖéπüºπüÖπüïπÇÇπÇÇµÖéΘûôπü«Φ¿Çπüäµû╣<br />
∩╝╗µÖéΘûô∩╝╜πüïπéë∩╝╗µÖéΘûô∩╝╜πü╛πüºπüºπüÖ<br />
Σ╜òµ¢£µùÑπüºπüÖπüïπÇÇµ¢£µùÑπü«Φ¿Çπüäµû╣</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'	<p>LESSON 3 - PART 1 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng - Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi - Luyß╗çn nghe<br />
(*) Chß╗» H&aacute;n lß║ºn 5:</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'	<p>LESSON 3 - PART 2:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p:<br />
Vπü╛πüÖ∩╝êΣ║êσ«Ü∩╝ëπÇÇ∩╜₧πéÆVπü╛πüÖ<br />
∩╝╗σá┤µëÇ∩╝╜πü╕<br />
Vπü╛πü¢πéô<br />
∩╝╗σá┤µëÇ∩╝╜πüº</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'	<p>LESSON 3 - PART 2 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng - Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi - Luyß╗çn nghe<br />
(*) Chß╗» H&aacute;n lß║ºn 6:</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'	<p>LESSON 3 - PART 3:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p:<br />
Vπü╛πüÖ∩╝êτ┐Æµàú∩╝ë<br />
NπéäNπü¬πü⌐<br />
Σ╜òπééVπü╛πü¢πéô<br />
∩╝╗µÖéΘûô∩╝╜πü½<br />
∩╝╗µÖéΘûô∩╝╜πüïπéë∩╝╗µÖéΘûô∩╝╜πü╛πüºVπü╛πüÖ<br />
πü⌐πüôπü╕πééΦíîπüìπü╛πü¢πéô</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'	<p>LESSON 3 - PART 3 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng - Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi - Luyß╗çn nghe<br />
(*) &Ocirc;n luyß╗çn chß╗» H&aacute;n (lß║ºn 5 + lß║ºn 6)</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'	<p>(*) &Ocirc;n luyß╗çn b&agrave;i 3: Chß╗»a b&agrave;i tß║¡p<br />
(*) Luyß╗çn ─æß╗ìc: Enjoyable Reading 55<br />
(*) Luyß╗çn nghe: Mainichi Kikitori (S╞í cß║Ñp)</p>', N'	JPD113')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'	<p>LESSON 4 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 4-1<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'	<p>LESSON 4 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 4-1<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'	<p>LESSON 4 - PART 2:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 4-2<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'	<p>LESSON 4 - PART 2 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng<br />
- Luyß╗çn nghe<br />
(*) Chß╗» H&aacute;n lß║ºn 1: Kanji B&agrave;i 1</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'	<p>LESSON 4 - PART 3:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 4-3<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'	<p>LESSON 4 - PART 3:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 4-3<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'	<p>(*) KIß╗éM TRA 1: B&agrave;i 4 (Ngß╗» ph&aacute;p + Tß╗½ vß╗▒ng + Chß╗» H&aacute;n)<br />
(*) &Ocirc;n luyß╗çn b&agrave;i 4: Chß╗»a b&agrave;i tß║¡p<br />
(*) Luyß╗çn ─æß╗ìc: Enjoyable Reading 55<br />
(*) Luyß╗çn nghe: Mainichi Kikitori (S╞í cß║Ñp)</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'	<p>Lesson 5 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 5-1<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'	<p>Lesson 5 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 5-1<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'	<p>Lesson 5 - PART 2:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 5-2<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'	<p>Lesson 5 - PART 2:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 5-2<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'	<p>Lesson 5 - PART 3:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 5-3<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'	<p>Lesson 5 - PART 3 (tiß║┐p):<br />
(*) Luyß╗çn tß║¡p:<br />
- Check tß╗½ vß╗▒ng<br />
- Luyß╗çn nghe<br />
(*) Chß╗» H&aacute;n lß║ºn 4: Kanji B&agrave;i 2 (Luyß╗çn tß║¡p)</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'	<p>(*) &Ocirc;n luyß╗çn B&agrave;i 5: Chß╗»a b&agrave;i tß║¡p<br />
(*) Luyß╗çn ─æß╗ìc: Enjoyable Reading 55<br />
(*) Luyß╗çn nghe: Mainichi Kikitori (S╞í cß║Ñp)</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'	MIDTERM TEST', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'	<p>Lesson 6 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 6-1<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'	<p>Lesson 6 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 6-1<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'	<p>Lesson 6 - PART 2:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 6-2<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'	<p>Lesson 6 - PART 2:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 6-2<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'	<p>Lesson 6 - PART 3:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 6-3<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'	<p>Lesson 6 - PART 3:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 6-3<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'	<p>(*) KIß╗éM TRA 2: B&agrave;i 6 (Ngß╗» ph&aacute;p + Tß╗½ vß╗▒ng + Chß╗» H&aacute;n)<br />
(*) &Ocirc;n luyß╗çn B&agrave;i 6: Chß╗»a b&agrave;i tß║¡p<br />
(*) Luyß╗çn ─æß╗ìc: Enjoyable Reading 55<br />
(*) Luyß╗çn nghe: Mainichi Kikitori (S╞í cß║Ñp)</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'	<p>Lesson 7 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 7-1<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'	<p>Lesson 7 - PART 1:<br />
(*) Giß║úi th&iacute;ch tß╗½ vß╗▒ng:<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 7-1<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'	<p>Lesson 7 - PART 2:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 7-2<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'	<p>Lesson 7 - PART 2:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 7-2<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'	<p>Lesson 7 - PART 3:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 7-3<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'	<p>Lesson 7 - PART 3:<br />
(*) Check tß╗½ vß╗▒ng<br />
(*) Giß║úi th&iacute;ch ngß╗» ph&aacute;p: Phß║ºn 7-3<br />
- Luyß╗çn mß║½u c&acirc;u<br />
- Luyß╗çn hß╗Öi thoß║íi</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'	<p>(*) &Ocirc;n luyß╗çn B&agrave;i 7: Chß╗»a b&agrave;i tß║¡p<br />
(*) Luyß╗çn ─æß╗ìc: Enjoyable Reading 55<br />
(*) Luyß╗çn nghe: Mainichi Kikitori (S╞í cß║Ñp)</p>', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'	├öN Tß║¼P (Chuß║⌐n bß╗ï thi cuß╗æi kß╗│)', N'	JPD123')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>Chapter 2: Processes and Threads<br />
2.1 Processes<br />
2.2 Threads<br />
2.3 Interprocess Communication</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>- Chapter 2 Problems<br />
- Review Lab 1<br />
- Guiding Lab 2</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>- Chapter 2 Problems<br />
2.4 Scheduling</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>2.5 Classical IPC Problems<br />
- Chapter 2 Problems</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N' Shell programming, Practice shell programming', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'Practice shell programming', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'<p>- Review Lab 2<br />
- Chapter 2 Problems<br />
Chapter 3: Memory management<br />
3.1 No Memory Abstraction<br />
3.2 A Memory Abstraction: Address Spaces</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>3.3 Virtual Memory<br />
3.4 Page Replacement Algorithms</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>Guiding Presentation - topic&#39;s selection<br />
- Chapter 7: Virtuallization and The Cloud<br />
- Chapter 10: CASE STUDY 1: UNIX, LINUX, and ANDROID<br />
- Chapter 11: CASE STUDY 2: WINDOWS 8</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'<p>3.5 Design Issues for Paging Systems<br />
3.6 Implementation Issues<br />
3.7 Segmentation</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>0 Introduction<br />
1.1 Review of Functions<br />
1.2 Basic Classes of Functions<br />
2.1 A Preview of Calculus<br />
2.2 The Limit of a Functions</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>2.3 The Limit Laws<br />
2.4 Continuity</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>3.1 Defining the Derivative<br />
3.2 The Derivative as a Function<br />
3.3 Differentiation Rules<br />
3.4 Derivatives as Rates of Change<br />
3.5 Derivatives of Trigonometric Functions</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>3.6 The Chain Rule<br />
3.8 Implicit Differentiation<br />
3.9 Derivatives of Exponential and Logarithmic Functions</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>4.1 Related Rates<br />
4.2 Linear Approximations and Differentials</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>4.3 Maxima and Minima<br />
4.4 The Mean Value Theorem<br />
4.5 Derivatives and the Shape of a Graph<br />
4.6 Limits at Infinity and Asymptotes</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>4.7 Applied Optimization Problems<br />
4.9 Newton&#39;s Method<br />
4.10 Antiderivatives</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>1.1 Approximating Areas<br />
1.2 The Definite Integral<br />
1.3 The Fundamental Theorem of Calculus</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>1.4 Integration Formulas and the Net Change Theorem<br />
1.5 Substitution<br />
3.1 Integration by Parts</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>3.6 Numerical Integration<br />
3.7 Improper integrals</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'Progress Test 1', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'1.1 Solutions and Elementary Operations', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>1.2 Gaussian Elimination<br />
1.3 Homogeneous Equations</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>2.1 Matrix Addition, Scalar Multiplication, and Transposition<br />
2.2 Equations, Matrices and Transformations</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'<p>2.3 Matrix multiplication<br />
2.4 Matrix Inverses</p>', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'2.6 Linear Transformations', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N' 3.1 The Cofactor Expansion', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'3.2 Determinants and Matrix Inverses', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'3.3 Diagonalization and Eigenvalues', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N' Progress Test 2', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'4.1 Vectors and Lines', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'4.2 Projections and Planes', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N' 4.3 More on the Cross Product', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'4.4 Linear Operations on R^3', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'4.5 An application in Computer Graphics', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'5.1 Subspaces and Spanning', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'5.2 Independence and Dimension', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'5.3 Orthogonality', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'5.4 Rank of a Matrix', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Progress Test 3', N'MAE101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>0 Introduction<br />
1.1 Propositional Logic (1.1 and 1.2, skip the topic on Logic Circuits)<br />
1.2 Propositional Equivalences (1.3, skip the topic on Satisfiability)</p>', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'1.3 Predicates and Quantifiers (1.4)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'1.4 Nested Quantifiers (1.5)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'1.5 Rules of Inference (1.6)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>2.1 Sets<br />
2.2 Set operations</p>', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'2.3 Functions (2.3, skip the topic on Partial Functions)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'2.4 Sequences and Summations (2.4, skip the topic on Recurrence relations)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'Progress Test 1', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'3.1 Algorithms', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>3.2 The Growth of Functions<br />
3.3 Compexity of Algorithms (3.3, skip the topics on Matrix multiplication, Algorithmic Paradigms)</p>', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'3.4 The Integers and Division (4.1, 4.5, and the topic on Classical Cryptography 4.6)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'3.5 Primes and Greatest Common Divisors (4.3)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'3.6 Intergers and Algorithms (4.2)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>4.1 Mathematical Induction (5.1)<br />
4.2 Strong Induction (5.2)</p>', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'4.3 Recursive Definitions and Structural Induction (5.3)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'4.4 Recursive Algorithms (5.4)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>5.1 The Basics of Counting (6.1)<br />
7.1 Recurrence Relations (8.1, skip the topic on Dynamic programming)</p>', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'7.3 Divide-and-Conquer Algorithms and Recurrence Relations (8.3)', N'MAD101')
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'Progress Test 2', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'<p>9.1 Graphs and Graph Models (10.1)<br />
9.2 Graph Terminology and Special Types of Graphs (10.2)</p>', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'9.3 Representing Graphs and Graph Isomorphism (10.3)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'9.4 Connectivity (10.4)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'9.5 Euler and Hamilton Paths (10.5)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'9.6 Shortest-Path Problems (10.6)', N'MAD101')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>The Roles of Statistics in Engineering<br />
1.1 The Engineering Method and Statistical Thinking<br />
1.2 Collecting Engineering Data<br />
1.3 Mechanistic and Empirical Models<br />
1.4 Probability and Probability Models</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Probability<br />
2.1 Sample Spaces and Events<br />
2.2 Interpretations of Probability<br />
2.3 Addition Rules</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Probability<br />
2.4 Conditional Probability<br />
2.5 Multiplication and Total Probability Rules<br />
2.6 Independence<br />
2.7 Bayes&#39; Theorem<br />
2.8 Random Variables</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>Probability<br />
2.7 Bayes&#39; Theorem<br />
2.8 Random Variables</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Discrete Random Variables and Probability Distribution<br />
3.1 Discrete Random Variables<br />
3.2 Probability Distributions and Probability Mass Functions</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>Discrete Random Variables and Probability Distribution<br />
3.3 Cumulative Distribution Functions<br />
3.4 Mean and Variance of a Discrete Random Varibale</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Discrete Random Variables and Probability Distribution<br />
3.5 Discrete Uniform Distribution<br />
3.6 Binomial Distribution<br />
3.7 Geometric and Negative Binomial Distributions</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>Discrete Random Variables and Probability Distribution<br />
3.8 Hypergeometric Distribution<br />
3.9 Poisson Distribution</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'Progress Test 1', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>Continuous Random Variables and Probability Distribution<br />
4.1 Continuous Random Variables<br />
4.2 Probability Distributions and Probability Density Functions<br />
4.3 Cumulative Distribution Functions</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Continuous Random Variables and Probability Distribution<br />
4.4 Mean and Variance of a Continuous Random Variable<br />
4.5 Continuous Uniform Distribution</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'<p>Continuous Random Variables and Probability Distribution<br />
4.6 Normal Distribution</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Continuous Random Variables and Probability Distribution<br />
4.7 Normal Approximation to the Binomial and Poisson Distributions<br />
4.8 Exponential Distribution</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>Descriptive Statistics<br />
6.1 Numerical Summaries<br />
6.2 Stem-and-Leaf Diagrams<br />
6.3 Frequency Distributions and Histograms</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'<p>Descriptive Statistics<br />
6.4 Box Plots<br />
6.5 Time Sequence Plots</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>Sampling Distributions and Point Estimation of Paramaters<br />
7.1 Introduction<br />
7.2 Sampling Distributions and the Central Limit Theorem&quot;</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'Progress Test 2', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>Statistical Intervals for a Single Sample<br />
8.1 Confidence Interval on the Mean of a Normal Distribution, Variance Known</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>Statistical Intervals for a Single Sample<br />
8.2 Confidence Interval on the Mean of a Normal Distribution, Variance Known</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'<p>Statistical Intervals for a Single Sample<br />
8.4 Large-Sample Confidence Interval for a Population Proportion</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'<p>Test of Hypotheses for a Single Sample<br />
9.1 Hypothesis Testing</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'<p>Test of Hypotheses for a Single Sample<br />
9.2 Tests on the Mean of a Normal Distribution, Variance Known</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'<p>Test of Hypotheses for a Single Sample<br />
9.3 Tests on the Mean of a Normal Distribution, Variance Unknown<br />
9.5 Tests on a Population Proportion</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'<p>Statistical Inference for Two Samples<br />
10.1 Inference on the Difference in Means of Two Normal Distributions, Variance Known<br />
10.2 Inference on the Difference in Means of Two Normal Distributions, Variance Unknown</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>Statistical Inference for Two Samples<br />
10.6 Inference on the Two Proportions</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'<p>Simple Linear Regression and Correlation<br />
11.1 Empirical Models<br />
11.2 Simple Linear Regression</p>', N'MAS291')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>Lab 1: Guide<br />
Introduction to presentation 1</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>3.Data storage and Operations on Data<br />
3.1 Storing Numbers<br />
3.2 Storing Text, Media, Image, Video</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'3.3 Logic, Shift, Arithmetic operations', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>4. Computer Networks and Internet<br />
4.1 Overview<br />
4.1.1 LAN &amp; WAN<br />
4.1.2 TCP/IP protocol<br />
4.2 layers in netwoking</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>5. Operating System<br />
5.1 Introduction<br />
5.2 Evolution<br />
5.3 Components of OS: UI, memory manager, process manager, file manager, device manager</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'5.3 Components of OS: UI, memory manager, process manager, file manager, device manager (continue)', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'Progress test 1', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>6. Algorithms<br />
6.1 Concepts: input, output, processing<br />
6.2 Three basic constructs</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>6.3 Algorithm representation<br />
6.4 Search Algorithms: linear, binary</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'Presentations 1', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>7. Programming<br />
7.1 translation<br />
7.2 programming paradigms<br />
7.2common concepts</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>Lab 2: Guide<br />
Introduction to presentation 2</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>8.Software engineering<br />
8.1 The software lifecycle<br />
8.2 Analysis phase<br />
8.3 Design phase</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>8.4 Implementation phase<br />
8.5 Testing phase</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'<p>9. Data structures<br />
9.1 Arrays<br />
9.2 Records<br />
9.3 Linked List</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'9.4 Introduction: Stack, Queue, Tree, graph', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'Presentation 2', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'<p>10.File structure<br />
10.1 Text versus Binary<br />
10.2 access methods</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'<p>11. Database<br />
11.1 Itroduction<br />
11.2 Database architecture</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>11.3 Database model<br />
11.4 The relationship database model</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'<p>11.5 Database design<br />
11.6 Guide do practice set (database)</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>12. Security and Ethical Issues<br />
12.1 Introduction<br />
12.2 Confidentiality<br />
12.3 Ethical Principles</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>12.4 Privacy<br />
12.5 Hackers</p>', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'Progress test 2', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Review', N'CSI104')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Introduction to the course<br />
Chapter 1: Introduction<br />
1.1 Organization and Architecture<br />
1.2 Structure and Function</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Assessing exercises of chapter 1<br />
Chapter 2: Computer Evolution and Performance<br />
2.1 A Brief History of Computers<br />
2.2 Designing for Performance</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Chapter 2 contd.<br />
2.3 Multicore, MICs, and GPGPUs<br />
2.6 Performance Assessment</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>Assessing exercises of chapter 2<br />
Chapter 3 A Top-Level View of Computer Function and Interconnection<br />
3.1 Computer Components<br />
3.2 Computer Function</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Chapter 3 contd.<br />
3.3 Interconnection Structures<br />
3.4 Bus Interconnection</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>Assessing exercises of chapter 3<br />
Chapter 4 Cache Memory<br />
4.1 Computer Memory System Overview<br />
4.2 Cache Memory Principles</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Chapter 4 contd.<br />
4.3 Elements of Cache Design</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>Assessing exercises of chapter 4<br />
Chapter 5 Internal Memory<br />
5.1 Semiconductor Main Memory<br />
5.2 Error Correction</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Chapter 5 contd.<br />
5.3 Advanced Dram Organization</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>Assessing exercises of chapter 5<br />
Chapter 6 External Memory<br />
6.1 Magnetic Disk<br />
6.2 Raid</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Chapter 6 External Memory contd.<br />
6.2 Raid contd<br />
6.3 Solid State Drives</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'<p>Assessing exercises of chapter 6<br />
Chapter 7 Input/Output<br />
7.1 External Devices<br />
7.2 I/O Modules<br />
7.3 Programmed I/O</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Chapter 7 Input/Output contd.<br />
7.4 Interrupt-Driven I/O<br />
7.5 Direct Memory Access<br />
7.6 I/O Channels and Processors</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>Assessing exercises of chapter 7<br />
Chapter 8 Operating System Support<br />
8.1 Operating System Overview</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'<p>Chapter 8 Operating System Support contd.<br />
8.2 Scheduling<br />
8.3 Memory Management</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>Assessing exercises of chapter 8<br />
Chapter 11 Digital Logic<br />
11.1- Boolean Algebra<br />
11.2-Gates<br />
11.3- Combinational Circuit</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>Assessing exercises of chapter 9<br />
Chapter 12 Instruction Sets: Characteristics and Functions<br />
12.1 Machine Instruction Characteristics<br />
12.2 Types of Operands</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'Chapter 12 Instruction Sets: Characteristics and Functions cont.
12.4 Types of Operations', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>Assessing exercises of chapter 12<br />
Chapter 13 Instruction Sets: Addressing Modes and Formats<br />
13.1 Addressing Modes<br />
13.3 Instruction Formats<br />
13.5 Assembly Language</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'Practical Assembly Laguage', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'Practical Assembly Laguage', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'Practical Assembly Laguage', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'Practical Assembly Laguage', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'<p>Assessing exercises of chapter 13<br />
Chapter 14 Processor Structure and Function<br />
14.1 Processor Organization<br />
14.2 Register Organization</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>Chapter 14 Processor Structure and Function contd.<br />
14.3 Instruction Cycle<br />
14.4 Instruction Pipelining</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'<p>Assessing exercises of chapter 14<br />
Chapter 15 Reduced Instruction Set Computers<br />
15.1 Instruction Execution Characteristics<br />
15.2 The Use of a Large Register File<br />
15.3 Compiler-Based Register Optimization<br />
15.4 Reduced Instruction Set Architecture</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>Assessing exercises of chapter 15<br />
Chapter 16 Instruction-Level Parallelism and Superscalar Processors<br />
16.1 Overview<br />
16.2 Design Issues</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>Assessing exercises of chapter 16<br />
Chapter 17 Parallel Processing<br />
17.1 Multiple Processor Organizations<br />
17.2 Symmetric Multiprocessors<br />
17.3 Cache Coherence and the MESI Protocol<br />
17.4 Multithreading and Chip Multiprocessors</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'<p>Assessing exercises of chapter 16<br />
Chapter 18 Multicore Computers<br />
18.1 Hardware Performance Issues<br />
18.2 Software Performance Issues<br />
18.3 Multicore Organization</p>', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Assessing assigments. Review', N'CEA201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'Course Introduction. Getting/Installing Programming Tool', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Module A: Introduction to C programming language<br />
Languages and C Compilers<br />
Introduction to Assignment</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Module B: Computations<br />
Variables<br />
Basic Memory Operations<br />
Expressions<br />
Workshop 1</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'Basic Computations (contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Workshop 1 Evaluation<br />
Module C: Logic constructs:<br />
Logic constructs<br />
Workshop 2</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'Basic Logics (contd.) - Logic constructs', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'Basic Logics (contd.): Program style', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>Workshop 2 Evaluation<br />
Module D: Modularity and Functions<br />
Modules<br />
C-Functions<br />
Scope of a variable<br />
Workshop 3</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'Module and Functions:(contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'Module and Functions:(contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Workshop 3 Evaluation<br />
Pointers<br />
Workshop 4</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'Pointers (contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Review:<br />
Pointers are function&#39;s parameters<br />
Using some C++ Characteristics</p>', N'PRF192')
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>Workshop 4 Evaluation<br />
Module E: Libraries<br />
Libraries<br />
Input and Validation<br />
Output and Formatting<br />
Workshop 5</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'Libraries(contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'Libraries(contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>Progress Test 1<br />
Workshop 5 Evaluation<br />
Review</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>Module F: Arrays<br />
Arrays<br />
Algorithms: Searching, Sorting<br />
Workshop 6</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'Contiguous Storage (contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'Contiguous Storage (contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'<p>Workshop 6 Evaluation<br />
Module G: Strings<br />
String Input<br />
String Functions<br />
Array of Strings<br />
Workshop 7</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'Strings (contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'Strings (contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'<p>Workshop 7 Evaluation<br />
Module H: Files:<br />
What is a file?<br />
File Types<br />
Accessing data in a file<br />
Connecting to a file<br />
File Functions<br />
Workshop 8</p>', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'Files (contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'Files (contd.)', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'Practical Exam', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'Practical Exam Evaluation', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'Progress Test 2 - Assignment Evaluation', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Workshop 8 Evaluation. Course Review', N'PRF192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Introduction:<br />
1.1 Welcome to Object-Oriented<br />
1.2 Object Terminology</p>', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Foundations:<br />
2.1 basic Java language: variable, operators, array and logic instructions</p>', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'2.2 Input and Output (Standard I/O)', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'Lab 1 assistance', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Foundations:<br />
2.3 Exception<br />
2.4 Dynamic Memory</p>', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N' Lab 2 assistance', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Encapsulation<br />
3.1 Classes<br />
3.2 Construction<br />
3.3 The current object</p>', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>3.4 Member functions<br />
3.5 Access modifier</p>', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'Lab 2 assistance', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'Inheritance: 4.1 Derived Classes', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'4.2 Functions in a Hierarchy', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'Lab 3 assistance', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Polymorphism:<br />
5.1 Abstract class</p>', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N' 5.2 Interface', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'5.3 Overview of Polymorphism(overloading, overriding)', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'Lab 4 assistance', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'Progress test 1+ workshop evaluation', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>Array of Objects:<br />
6.1 Basic Operators: add, update, remove, sort, find</p>', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>Array of Objects:<br />
6.1 Basic Operators: add, update, remove, sort, find</p>', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'6.2 Input and Output (File I/O)', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'6.2 Input and Output (File I/O)', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'Lab 5 assistance', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'<p>Collections in Java:<br />
7.1 Overview<br />
7.2 List</p>', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'7.3 Set', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'7.3 Map', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'Lab 6 assistance', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'Progress test 2+ workshop evaluation ', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'Review', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'Assignment Evaluation', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Practical Exam', N'PRO192')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Course Introduction<br />
1.1. Using Arrays<br />
1.2. Singly Linked Lists<br />
1.3. Circularly Linked Lists<br />
1.4. Doubly Linked Lists</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Progress test and/or<br />
Review Exercises<br />
<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>2.1 Stacks<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>2.2 Queues<br />
2.3 Double-Ended Queues (Deque)<br />
2.4 The Priority Queue</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>3.1 Illustrative Examples<br />
3.1.1 The Factorial Function<br />
3.1.2 Binary Search<br />
3.1.3 File Systems<br />
3.2 Analyzing Recursive Algorithms<br />
3.3 Further Examples of Recursion<br />
3.3.1 Linear Recursion<br />
3.3.2 Binary Recursion<br />
3.3.3 Multiple Recursion<br />
3.4 Designing Recursive Algorithms<br />
3.5 Eliminating Tail Recursion</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>4.1 General Trees<br />
4.1.1 Tree Definitions and Properties<br />
4.1.2 The Tree Abstract Data Type<br />
4.2 Binary Trees - . 317<br />
4.2.1 The Binary Tree Abstract Data Type<br />
4.2.2 Properties of Binary Trees<br />
4.3 Implementing Trees<br />
4.4 Tree Traversal Algorithms</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>4.5 Binary Search Trees<br />
4.5.1 Searching Within a Binary Search Tree<br />
4.5.2 Insertions and Deletions</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Progress test and/or<br />
Review Exercises<br />
Guiding Exercises/Assignment</p>', N'CSD201')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>- Chapter 3 Problems<br />
- Guilding lab 3</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>- Chapter 3 Problems<br />
Progress Test 1 and Review<br />
Review Problems</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>Chapter 4: Files<br />
4.1 Files<br />
4.2 Directories<br />
4.3 File System Implementation<br />
4.4 File System Management and Optimization<br />
4.5 Example File Systems</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>- Review Lab 3<br />
- Guiding Lab 4<br />
- Chapter 4 Problems</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'C programming in Linux, Guiding Lab', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'<p>Chapter 5: Input/ Output<br />
5.1 Principles of I/O Hardware<br />
5.2 Principles of I/O Software</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'<p>5.3 I/O Software Layers<br />
5.4 Disks</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'<p>5.5 Clocks<br />
5.6 User Intrefaces: Keyboard, Mouse, Monitor</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'<p>5.7 Thin Clients<br />
5.8 Power Management<br />
- Review lab 4<br />
- Chapter 5 Problems</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>Chapter 6: Deadlock<br />
6.1 Resources<br />
6.2 Introduction to Deadlocks<br />
6.3 The Ostrich Algorithm<br />
6.4 Deadlock Detection and Recovery</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'<p>6.5 Deadlock Avoidance<br />
6.6 Deadlock Prevention<br />
6.7 Other Issues<br />
- Chapter 6 Problems</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>Guiding Problems<br />
Progress Test 2 and Review<br />
Review Problems</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>Chapter 7, 10, 11 Presentation</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'<p>Chapter 7, 10, 11 Presentation</p>', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Discussion of current research areas. Review Course', N'OSG202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Fundamentals of Network Communication:<br />
- Communication Networks and Services<br />
- Layered Architecture<br />
- Socket API &amp; Digital Transmissions<br />
Offline 1: Guide learning &amp; Introduce the spec</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Fundamentals of Network Communication:<br />
- Error Control<br />
- Course Project<br />
Offline 2: Course 1 review</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Peer-to-Peer Protocols and Local Area Networks<br />
- Peer-to-Peer Protocols<br />
- Reliable Services and Data Link Controls</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>Peer-to-Peer Protocols and Local Area Networks<br />
- Medium Access Control<br />
- Local Area Networks</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Peer-to-Peer Protocols and Local Area Networks<br />
- Local Area Networks<br />
- Course Project<br />
Offline 3: Course 2 review</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>Packet Switching Networks and Algorithms<br />
- Frame Switching and Packet Switching</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Packet Switching Networks and Algorithms<br />
- Routing in Packet Networks<br />
- Shortest-Path Routing<br />
<br />
(Week 7 or Week 8) 1st Evaluation (For students completed &amp; got Coursera&#39;s specialization certificates) (Option)</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>Packet Switching Networks and Algorithms<br />
- Traffic Management<br />
- Course Project - Packet Switching Networks and Algorithms<br />
Offline 4: Course 3 Review</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>TCP/IP and Advanced Topics<br />
- The Internet Protocol (IP)</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>TCP/IP and Advanced Topics<br />
- IP Addressing<br />
- Transmission Control Protocol</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>TCP/IP and Advanced Topics<br />
- Advanced Topics<br />
- Course Project<br />
Offline 5: Course 4 Review</p>', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'2nd Evaluation (For students completed & got Coursera''s specialization certificates)', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N' 3rd Evaluation (For students completed & got Coursera''s specialization certificates)', N'NWC203c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'Orientation', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'Mentor review 1/ Assesement 1', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'Mentor review 2/Progress Assessment 2', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'Practice', N'LAB211')
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'Mentor review 3/Progress Assessment 3', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'Mentor review 4/Progress Assessment 4', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Chapter 1. The Worlds of Database Systems<br />
1.1 The Evolution of Database Systems<br />
1.2 Overview of Database Management System<br />
1.3 Outline of Database-System Studies<br />
Assignment Introduction (individual)</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Chapter 2. The Relational Model of Data<br />
2.1 An Overview of Data Models<br />
2.2 Basics of the Relational Model</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'2.4 An Algebraic Query Language', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'Lab1 assistance', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Chapter 3. Design Theory for Relational Databases<br />
3.1 Functional Dependencies<br />
3.2 Rules About Functional Dependencies</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'3.3 Design of Relational Database Schema', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'3.5 Normal Forms', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'Lab 2 assistance', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Progress test 1 (&lt;=30&#39;)<br />
Assignment assistance</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>Chapter 4. High-Level Database Models<br />
4.1 The Entity / Relationship Model<br />
4.2 Design Principles<br />
4.3 Constraints in the E / R Model</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>4.4 Weak Entity Sets<br />
4.5 From E / R Diagrams to Relational Models<br />
4.6 Converting Subclass Structures to Relations</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'Lab 3 assistance', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'Assignment assistance', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>Chapter 6. The Database Language SQL<br />
6.1 Data Definition Lanaguage (DDL)</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'6.2. Implement constraints on attributes with MS SQL Server (Keys and Foreign Keys, UNIQUE, CHECK,..)', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'6.3 DML introduction & Basic of SQL Queries', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'6.4 Query on more one relation', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'6.5 Nested Queries in SQL', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'6.6 Aggregation Queries in SQL', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'6.7 Database Modifications (INSERT, UPDATE, DELETE statement)', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'Chapter 7. Practical Issues of database application
7.1. Index', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'7.2. Transaction, View and Query Optimization', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'Lab 4 assistance', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'Assignment assistance (focus on query)', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>Chapter 8. Constraints and T-SQL Programming<br />
8.1 Triggers<br />
8.2 Constraint with triggers</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'8.3 View, Function', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>8.4 Cursors<br />
8.5 Implement stored procedure with MS SQL Server</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>Progress test 2<br />
Lab 5 assistance</p>', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'Assignment review', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Practical Exam (85'') ', N'DBI202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'Mentor review 5/Progress Assessment 5', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'Practice', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'FE', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'Review/Additional practics (if any)', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'CR', N'LAB211')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Introduction of IoT course<br />
What in the world is the Internet of Things?<br />
Arduino (ATmega328/p) Architecture</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'The ΓÇÿthingsΓÇÖ of the Internet of Things?', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Lab:<br />
Getting Started with Arduino and Genuino UNO<br />
Fritzing_building_circuit<br />
Tinkercad arduino simulator tutorial</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'Networking IoT', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Lab:<br />
Blink an LED - Digital Write<br />
Analog Input - Analog Read<br />
Fading - Analog Write<br />
Give Topics for Presentation</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'Programming IoT', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Lab:<br />
Practice at home by the tutorial: Led array effect.</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'Securing IoT', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Practice at home Evaluation<br />
Lab:<br />
Button - Digital Read<br />
Input Pullup - Serial<br />
State Change Detection for pushbuttons</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'Electrical circuits and electronics', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Lab:<br />
Analog In, Out Serial<br />
Photoresistor - Analog Input<br />
Photoresistor - while loop interation<br />
Ping Ultrasonic Range Finder</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'Project concept planning', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Lab:<br />
Servo Motor - Sweep<br />
Servo Motor - Knob<br />
IR Remote<br />
Progress test 1</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'Presentation', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'Presentation', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>Lab:<br />
Practice at home by the tutorial: Photoresistor - States of lights<br />
Digital Read - Out Serial</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>Practice at home Evaluation<br />
Lab:<br />
Led-7-segment-display<br />
Give Topics for Project</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>Lab:<br />
Practice at home by the tutorial: RGB LED Color Mixing (use tinkercad simulator)<br />
Read ASCII String (use RGB led to indicator)</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>Practice at home Evaluation<br />
Lab:<br />
Temperature sensor LM35<br />
LCD Display 1602</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'<p>Lab:<br />
Practice at home by the tutorial: Smoothing<br />
Graph: Send data to the computer and graph it in Processing.</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'<p>Lab:<br />
SerialEvent<br />
External Interrupts<br />
Timer Interrupts</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'<p>Lab:<br />
Practice at home by the tutorial: Blink Without Delay</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'<p>Practice at home Evaluation<br />
Lab:<br />
Keypad 4x4<br />
EEPROM read / write</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'<p>Lab:<br />
Practice at home by the tutorial: ASCII Table<br />
Serial Input</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>Practice at home Evaluation<br />
Lab:<br />
8x8 LED Matrix<br />
Progress test 2</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'<p>Lab:<br />
Practice at home by the tutorial: Debounce</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>All labs<br />
Self review:<br />
Practice at home by the tutorial: Team work prepares for the final project</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>All labs<br />
Self review:<br />
Practice at home by the tutorial: Team work prepares for the final project</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'<p>Practice at home Evaluation<br />
Check Project</p>
', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'<p>Practice at home Evaluation<br />
Check Project</p>', N'IOT102')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Specialization Introduction<br />
Promote the Ethical Use of Data-Driven Technologies<br />
- Identify Data-Driven Emerging Technologies<br />
- Examine Legal and Ethical Privacy Concepts as they Relate to Data-Driven Technology</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>- Examine Types of Bias<br />
- Examine Common Ethical Theories<br />
- Examine Ethical Principles that Apply to Data-Driven Technology</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>- Apply What You&#39;ve Learned<br />
Offline 1: Course 1 Review</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>Turn Ethical Frameworks into Actionable Steps<br />
- Apply Frameworks to Your Ethical Responsibilities for Data-Driven Technologies<br />
- Apply an Ethical Frameork to Navigate an Ethically Challenging Dilemma<br />
- Follow Regulations and Standards That Have an Impact on Business Strategy<br />
- Reconcile Conflicts Between Ethics, Regulations, Societal Needs, and Business Demands</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>- Apply What You&#39;ve Learned<br />
Offline 2: Course 2 Review</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>Detect and Mitigate Ethical Risks<br />
- Ethical Risk Analysis Fundamentals<br />
- Manage Privacy Risks<br />
- Manage Accountability Risks</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>- Manage Transparency and Explainability Risks<br />
- Manage Fairness and Non-Discrimination Risks<br />
- Manage Safety and Security Risks</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>(WEEK 8 or 9): 1st Evaluation (For students completed &amp; got Coursera&#39;s specialization certificates) (Option)<br />
Apply What You&#39;ve Learned<br />
Offline 3: Course 3 Review</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Communicate Effectively about Ethical Challenges in Data-Driven Technologies<br />
- Communicate the Business Impacts of Ethical Risks to Diverse Stakeholders<br />
- Design Diverse, Equitable, and Inclusive External Communication Strategies<br />
- Manage a Crisis, Communicate Critical Messages, and Ensure Business Continuity<br />
- Manage the Media During an Ethical Crisis</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>- Apply What You&rsquo;ve Learned<br />
Offline 4: Course 4 Review</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Create and Lead an Ethical Data-Driven Organization<br />
- Promote an Ethical Organizational Culture<br />
- Maintain Ethical Considerations in Governance and Policy Making<br />
- Develop and Deploy a Code of Ethics<br />
- Develop and Deploy Ethical Organizational Policies</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'<p>Apply What You&#39;ve Learned<br />
Preparing for Your CertNexus Certification Exam<br />
Offline 5: Course 5, 6 Review</p>', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'2nd Evaluation (For students completed & got Coursera''s specialization certificates)', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'3rd Evaluation (For students completed & got Coursera''s specialization certificates)', N'ITE302c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Mobile Development Overview<br />
About Android &amp; Smartphones future<br />
Android Development Tools (Android Emulator, DDMS, ADB)</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Creating Your First Android Application<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Understanding Activities<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>Linking Activities Using Intents<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Calling Built-In Applications Using Intents<br />
Chapter and Exercises Review + Test 1</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>The Android User Interface (The Android Widget Toolbox)<br />
Understanding the Components of a Screen</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Adapting to Display Orientation<br />
Managing Changes to Screen Orientation<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>Creating the User Interface Programmatically<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Listening for UI Notifications<br />
Chapter and Exercises Review + Start project</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>Designing Your User Interface Using Views<br />
Guide Exercises + practice</p>', N'PRM391')
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Provide Project Documentation and Explain<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'<p>Display Pictures and Menus with Views<br />
Chapter and Exercises Review + Test 2</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Display Pictures and Menus with Views<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>Data Persistence<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'<p>Creating and Using Databases<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>Content Providers<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'<p>Messaging and Networking<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'<p>Maps, Geocoding, and Location-Based Services<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>Accessing Android Hardware<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'<p>Accessing Android Hardware (Cont)<br />
Chapters and Exercises Review<br />
Practical Exam</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'<p>Publishing Android Applications<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'<p>Chapter and Exercises Review<br />
HTML5 programming course introduction</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'<p>New elements in HTML5<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'<p>PhoneGap introduction<br />
Guide Exercises + practice</p>
', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'<p>PhoneGap<br />
Guide Exercises + practice</p>
', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'<p>Chapter Review<br />
Sencha Touch introduction</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'<p>Sencha Touch - GUI controls<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>Sencha Touch - Components / Classes<br />
Guide Exercises + practice</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'<p>Sencha Touch - Layouts / Events<br />
Chapter and Exercises Review + Test 3</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'<p>Project Presentation<br />
Course wrap-up</p>', N'PRM391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'Practice: finalize, integrate and optimize DB, code, debug, self-test, deploy cross-test', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'Practice: finalize, integrate and optimize DB, code, debug, self-test, deploy cross-test (cont.)', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'Practice: finalize, integrate and optimize DB, code, debug, self-test, deploy cross-test (cont.)', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'Team presentation: application demo, lessons learnt,..', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Team presentation: application demo, lessons learnt,.. (cont.)', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'On-the-job training week 1', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'On-the-job training week 2', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'On-the-job training week 3', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'On-the-job training week 4', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'On-the-job training week 5', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'On-the-job training week 6', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'On-the-job training week 7', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'On-the-job training week 8', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'On-the-job training week 9', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'On-the-job training week 10', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'On-the-job training week 11', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'On-the-job training week 12', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'On-the-job training week 13', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Offline: Introduction to the online course WED201c<br />
Module 1 (MOOC 1):<br />
- Welcome<br />
- Introduction to HTML5<br />
- History and Evolution<br />
- How it Works<br />
- Tool and Tips</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Module 2 (MOOC 1):<br />
- The&nbsp;Document&nbsp;Object Model (DOM)<br />
-&nbsp;HTML5 Elements - Tags, Syntax, Semantics, &nbsp;and Templates<br />
- Images, Hyperlinks, Multimedia, Tables</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Module 3 (MOOC 1):<br />
- Accessibility -&nbsp;Human Factors to &nbsp;Consider in Web Design<br />
- Validate your code<br />
-&nbsp;Putting your Code on the Web<br />
- Final Project (MOOC 1)<br />
Offline: Review MOOC1</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>Module 1 &amp; 2 (MOOC 2):<br />
-&nbsp;Getting started with simple styling<br />
- Advanced styling</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Module 3, Module 4 (MOOC 2):<br />
- Psuedo-classes, Pseudo-elements, Transitions, and Positioning<br />
- Putting It All Together<br />
Offline: Review MOOC 2</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>Module 1, Module 2 (MOOC 3): - Introduction to JavaScript<br />
- Reacting to Your Audience</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Module 3, Module 4 (MOOC 3): - Arrays and Looping<br />
- Validating Form Data<br />
Offline: Review MOOC 3</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>Module 1, Module 2 (MOOC 4): - Style with Responsive Design<br />
- Basic Concepts<br />
1st Appraisal Exam (optional)<br />
(For students who have completed spec and earned certificate in advance)</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'<p>Module 3, Module 4 (MOOC 4): - Use Existing Frameworks<br />
- Experiment!<br />
Offline: Review MOOC 4</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'Module 1 (MOOC 5): Introduction', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Module 2&nbsp;(MOOC 5):<br />
Design phase</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'<p>Module 3, Module 4&nbsp;(MOOC 5): - Validation and Review Phase<br />
- Coding Phase</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Module 5&nbsp;(MOOC 5):<br />
Validation and Review Phase</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'<p>Module 6 (MOOC 5):<br />
Revise and Submit Phase: Lesson Choices<br />
Offline: Review MOOC 5<br />
2nd Appraisal Exam<br />
(For students who have completed spec and earned certificate in time)</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'<p>3rd Appraisal Exam<br />
(For students who have completed spec and earned certificate in time )</p>', N'WED201c')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'Select, study & analyze assignments: Q&A, team discussion', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'Design web skeleton (prototype frames for web & admin site)', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'Team discussion & agree on team assignments & schedule', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'Prepare code designs (packages, classes, attributes & methods)', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'Study coding conventions & practices (from Oracle)', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'Review & evaluate the team''s design: web scheleton, code
(Iteration 0 evaluation)', N'	SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'The first iteration planning', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'Practice: design DB, code, debug, self-test, deploy, cross-test', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'Practice: design DB, code, debug, self-test, deploy, cross-test (cont.)', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'Practice: code, debug, self-test, deploy cross-test', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'Practice: code, debug, self-test, deploy cross-test (cont.)', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'Review & evaluate the team''s outputs #1', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'The second iteration planning', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'Practice: design DB, code, debug, self-test, deploy, cross-test', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'Practice: design DB, code, debug, self-test, deploy, cross-test (cont.)', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'The second iteration planning', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'Practice: design DB, code, debug, self-test, deploy, cross-test', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'Review & evaluate the team''s outputs #2', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'The third iteration planning', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'Practice: design DB, code, debug, self-test, deploy, cross-test', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'Practice: design DB, code, debug, self-test, deploy, cross-test', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'Practice: design DB, code, debug, self-test, deploy, cross-test', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'Practice: design DB, code, debug, self-test, deploy, cross-test', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'Review & evaluate the team''s outputs #3', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'The last iteration planning', N'SWP391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'On-the-job training week 14', N'OJT202')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'Course introduction', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'Introduction to Software Architecture', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Guide Exercises<br />
Chapter and Exercises Review</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'Software Architecture Design Space', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Guide Exercises<br />
Guide Design Assignment 1</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>Chapter and Exercises Review<br />
Models for Software Architecture</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'Guide Exercises', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (8, N'<p>Chapter and Exercises Review<br />
Object Oriented Software Design Methodoloy</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (9, N'Guide Exercises', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (10, N'<p>Progress test 1 (Chapters 1, 2, 3, 4)<br />
Chapter and Exercises Review</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (11, N'<p>Data Flow Architecture<br />
Guide Exercises</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (12, N'Chapter and Exercises Review', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (13, N'<p>Models for Software Architecture<br />
Guide Exercises<br />
Guide Design Assignment 2</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (14, N'Chapter and Exercises Review', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (15, N'Hierarchy Architecture', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (16, N'<p>Guide Exercises<br />
Chapter and Exercises Review</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (17, N'Implicit Asynchronous Communication Software Architecture', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (18, N'Guide Exercises', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (19, N'<p>Progress test 2 (Chapters 5,6,7,8)<br />
Chapter and Exercises Review</p>
', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (20, N'<p>Interaction Oriented Software Architecture<br />
Guide Exercises</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (21, N'Chapter and Exercises Review', N'SWD391')
GO
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (22, N'<p>Distributed Architecture<br />
Guide Exercises</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (23, N'Chapter, Exercises, Quiz/Test Review', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (24, N'Component-Based Software Architecture', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (25, N'Guide Exercises', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (26, N'Heterogeneous Architecture', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (27, N'Guide Exercises', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (28, N'<p>Progress test (Chapters 9,10,11, 12)<br />
Chapter and Exercises Review</p>
', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (29, N'<p>Architecture of Graphical User Interfaces<br />
Product Line Architectures</p>', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (30, N'Course wrap-up', N'SWD391')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (1, N'<p>Course Introduction<br />
The essential of software requirement<br />
- Software requirements defined<br />
- Requirements development and management<br />
- When bad requirements happen to good people<br />
- Benefits from a high-quality requirements process</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (2, N'<p>Requirements from the customer&rsquo;s perspective<br />
- Who is the customer?<br />
- The customer-development partnership<br />
- Creating a culture that respects requirement<br />
- Identifying decision makers<br />
- Reaching agreement on requirements<br />
Assignment 1 introduction</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (3, N'<p>Good practices for requirements engineering<br />
- A requirements development process framework<br />
- Requirements elicitation<br />
- Requirements analysis<br />
- Requirements specification<br />
- Requirements validation<br />
- Requirements management</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>Group discussion<br />
Summary and Exercises</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>The business analyst<br />
- The business analyst role<br />
- The business analyst&rsquo;s tasks<br />
- Essential analyst skills<br />
- Essential analyst knowledge<br />
- The making of a business analyst<br />
- The analyst role on agile projects<br />
Establishing the business requirements<br />
- Defining business requirements<br />
- Vision and scope document<br />
- Scope representation techniques</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>Establishing the business requirements (con&#39;t)<br />
- Keeping the scope in focus<br />
- Vision and scope on agile projects<br />
Finding the voice of users<br />
- User classes<br />
- User personal<br />
- Connecting with user representatives<br />
- The product champion<br />
- User representation on agile project<br />
- Resolving conflicting requirements</p>', N'SWR302')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (4, N'<p>1.6 Codes of ethics<br />
Guiding Problems</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (5, N'<p>Review Problems<br />
Topic 2. Testing throughout the software life cycle<br />
2.1 Software development models</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (6, N'<p>2.2 Test levels<br />
Guiding Problems<br />
Project Introduction</p>', N'SWT301')
INSERT [dbo].[Session] ([SessID], [Topic], [SubCode]) VALUES (7, N'<p>Review Problems<br />
2.3 Test types: the targets of testing</p>', N'SWT301')
GO
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'
CCM201', N'	Crisis Communications Management', N'	This course covers crisis communication theory, crisis management approaches, classic cases and the influence of culture on crisis communication. This course will cover the definitions of crisis and how they come about, the importance of working on identifying issues, how they can become crises if not handled properly and how we can address crises in case they happen.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'
DTG102', N'	Visual Design Tools', N'	"<p>The course empowers students to master 3 most common Adobe 2D tools for graphic designers, which are Illustrator, Photoshop, and InDesign, so that they can finalize their 2D designs better.<br />
Through practical assignments, students have chances to apply knowledge on colors, typography etc. in other courses along with computers and tools to create graphic applications.</p>')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ACC101', N'	Principles of Accounting', N'	"<p>Main objectives:<br />
Upon completion of this course, students should:<br />
1. Have clear understanding of ideas, principles, and techniques of accounting<br />
2. Have the knowledge and tools to better understand business performance issues, and the decisions and problems faced by managers;<br />
3. Understand the important role of accounting and finance in all organizations, in all jobs, and its link with the development of increasingly sophisticated IT systems.<br />
Specific objectives :<br />
1. Recognize and organize accounting transactions<br />
2. Classify and calculate correctly in terms of revenue, cost, profit or loss in an account<br />
3. Be able to prepare comprehensive and accurate financial statements<br />
4. Learn how to prepare comprehensive and realistic budget plans.<br />
5. Have the ability to appraise the efficiency of the project<br />
<br />
Description:<br />
The main content is structured into twelve chapters covering Financial Accounting, Management Accounting and Business Finance.<br />
Topics include: business transaction, financial statement format and analysis, inventory and account receivable, type of assets and liability, costing classification, master budget and capital budgeting</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ACC305', N'	Financial Statement Analysis', N'	The course covers the areas of interpretation, analysis and evaluation of financial reports from viewpoints of creditors, owners, investment firms and others concerned with business strengths or weakness. The impact of general business and specific industry situations, behavior of financial markets, credit or lending criteria, and equity investment standards as related to financial statements to determine present and future financial conditions.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ADI201', N'	Brand Identity Design', N'	"<p>Description: &#39;The aim of this course is to equip students with the basic knowledge of Brand Identity Design: Brand basics (what is brand, brand identity, branding; brand strategy...), Brand ideals (flexibility,value, differentiation, sustainability&hellip;), Brand elements (brandmarks, wordmarks, symbol, characters&hellip;), Brand dynamics (Social media, Mobile, &hellip;; Private labeling, Brand licensing, Certification&hellip;); Brand identity design (Logotype + signature, Color, Typography, Trial applications, Presentation&hellip;), Brand book (Standards + guidelines..), (Managing, Measuring, Decision making, Intellectual property, Design management...)<br />
Objectives:<br />
&#39;- The Branding &amp; Identity Design course will prepare students to design and establish visual identities and brand standards across a variety of mediums. The course will help the student look beyond logo design and acquire a fundamental understanding of the aspects of designing a brand system that is scalable and replicable, regardless of application<br />
&#39;- Throughout this course, emphasis will be placed on the use of logo, including its use as a valuable analytical tool for the visual communication professions.<br />
Teaching method:<br />
Under lecturer&rsquo;s instruction, through a series of instruction sessions, researchanalysis and personal exercises, students will be equipped with knowledge and skills to develop and complete a brand identity system</p>
')
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'BRA301', N'	Brand Management', N'	This course is designed to develop knowledge, skills, and perspectives to support the application of managing products and developing brand strategies in the marketing area. It helps students to gain insights into the role of product and brand management in gaining and maintaining customer loyalty.')
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ECO111', N'	Microeconomics', N'	"<p>Economics is the study of how the society manages its scarce resources. Economics has been divided into the subcategories of microeconomics and macroeconomics. While macroeconomics studies aggregate issues related to national and international economic activities, this course - microeconomics - focuses on the behavior of individual economic agents. Microeconomics studies how households (or individuals), business (or firms, enterprises) and the government make decisions, given scarcity of resources. It also studies the interactions among those market members and how these interactions have impacts on their economic benefits and the economy. Because most of these activities occur in the markets, this course also focuses on how the markets work.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ECO121', N'	Macroeconomics', N'	"<p>Economics is the study of how the society manages its scarce resources. Economics has been divided into the subcategories of microeconomics and macroeconomics. While macroeconomics studies aggregate issues related to national and international economic activities, this course - microeconomics - focuses on the behavior of individual economic agents. Microeconomics studies how households (or individuals), business (or firms, enterprises) and the government make decisions, given scarcity of resources. It also studies the interactions among those market members and how these interactions have impacts on their economic benefits and the economy. Because most of these activities occur in the markets, this course also focuses on how the markets work.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ECO201', N'	International Economics', N'	"<p>This course will study the economic relations among nations through analyzing the exchange of goods, services as well as the linkages between trade, labor and capital movements, international fragmentation of production, economic well-being and the income distribution and to identify and critically examine policy implications of these linkages. Besides that, the course provides students both classical and modern theories of international trade in goods and services, as well as empirical research on trade . A substantial fraction of the course is dedicated to examination of efficient trade policies. This course also covers the balance of payments, exchange rates and open-economy macroeconomics.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'EDT202c', N'Emerging Digital Technologies', N'<p>This course is intended for researchers and business experts seeking state-of-the-art knowledge in advanced science and technology. The course covers details on Big Data (Hadoop, Spark, Storm), Smartphones, Smart Watches, Android, iOS, CPU/GPU/SoC, Mobile Communications (1G to 5G), Sensors, IoT, Wi-Fi, Bluetooth, LP-WAN, Cloud Computing, AR (Augmented Reality), Skype, YouTube, H.264/MPEG-4 AVC, MPEG-DASH, CDN, and Video Streaming Services. The Specialization includes projects on Big Data using IBM SPSS Statistics, AR applications, Cloud Computing using AWS (Amazon Web Service) EC2 (Elastic Compute Cloud), and Smartphone applications to analyze mobile communication, Wi-Fi, and Bluetooth networks.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ENM301', N'	BUSINESS ENGLISH - Level: Intermediate', N'	"<p>This course is designed to help students further improve their ability to communicate in English in a wide range of business and business-related situations. It also helps students develop necessary knowledge and skills to succeed in business. In addition to the business-focused contents, the course is enhanced with supplementary activities corresponding to the Common European Framework of Reference for Languages. In particular the course will help students:<br />
* Communicate effectively in discussions, meetings, negotiations, socialization events<br />
* acquire and effectively use professional skills including telephoning, presentations, correspondence exchange, decision making, and problem solving.<br />
* enrich knowledge of business trends in the fast-changing world<br />
<br />
Teaching methodology:<br />
This course applies instructional, communicative and interactive methods which<br />
*provides inducive environment for communication between teacher and students as well as between students themselves<br />
*develops confidence and fluency through participation in case studies as simulations of business scenarios;<br />
*enhances skills and knowledge application through individual and group works and self-study<br />
The course applies an on-going assessment scheme with progress tests, mid-term test and final examination structured as follows</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'ENM401', N'	BUSINESS ENGLISH - Level: Upper- Intermediate', N'	"<p>This course is designed to help students further enhance their ability to communicate in English in an almost real business and business-related situations. It covers not only general business administration area but also deals with more complex issues such as management style and crisis management. It also helps students develop necessary knowledge and skills to excell in their future career. In addition to the business-focused contents, the course is enhanced with supplementary activities corresponding to the Common European Framework of Reference for Languages, with a focus on developing students&#39; own style in communication as a plus in their professional communication strategy. In particular the course will help students:<br />
* Enhance confidence, accuracy and fluency to communicate professionally and effectively in business-like contexts e.g. discussions, meetings, negotiations for the best business results;<br />
* acquire and practice professional communication skills at a higher level of complexity, including dealing with complaints, persuading for loan, negotiating for the best terms in M&amp;A , information-based decision making and problem solving.<br />
* expand knowledge of business concepts and business trends in the fast-changing world<br />
<br />
Teaching and Learning Methodology<br />
This course applies instructional, communicative and interactive methods which<br />
*provides inducive environment for communication between teacher and students as well as between students themselves<br />
*develops confidence and fluency through participation in case studies as simulations of business scenarios;<br />
*enhances skills and knowledge application through individual and group works and self-study</p>
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'EVN201', N'	Event Planning', N'	Overview of the event industry including conventions, expositions, and major national and international events and their operational requirements.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'FBM201', N'	Food and Beverage Operations Management', N'	"<p>Main objectives: This course has been designed to achieve the following objectives:<br />
To study the skills and science of food and beverage management. The systems approach to food and beverage (F&amp;B) management is presented and includes<br />
planning and control of F&amp;B operations. Management operation systems are also<br />
presented and integrated with F&amp;B delivery systems for a complete F&amp;B overview.<br />
Description: Managing food and beverage is essential for hospitality industry. This course addresses<br />
the key concepts of food and beverage industry and the management aspects of the trade</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'FIN201', N'	Monetary Economics and Global Economy', N'	The course is an intermediate-level course in macroeconomics, including topics in international, monetary, and financial economics. The goal of the course is to provide a coherent framework for analyzing macroeconomic events, such as business cycles (recessions and booms) and long-run growth, their impact on financial markets, and to discuss macroeconomic policy. In all parts of the course, theories will be applied to current economic events. Particular emphasis will be placed on the relation between macroeconomic events and financial markets.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'FIN202', N'	Principles of Corporate Finance', N'	"<p>The course describes the corporation and its operating environment, the manner in which corporate boards and management evaluate investment opportunities and arrangements for financing such investments.<br />
It also brings discussion in wide range context under varying conditions of aggregate demand, inflation, tax rates, interest rates, and exchange rates, among other variables as well as the tools for valuing the short-term movements in equity valuations in the various stock markets are even more complexly determined.<br />
Topics include: Analyzing Financial Statements, The Time Value of Money, Cash Flows and Capital Budgeting, Risk and Return, Stock Valuation, The Cost of Capital, working capital management</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'FIN301', N'	Financial Markets and Institutions', N'	"<p>The course provides students with information and knowledge about various financial markets and institutions including general purposes of these markets and institutions, and operations, products, and services that may involve.<br />
Topics include: Debt, equity, derivative markets, commercial bank, non-bank operation.</p>')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'FIN303', N'	Advanced Corporate Finance', N'	"<p>The course provides students with continuous information and knowledge about firm&#39;s financial decision, how to manage its financial performance more effectively in order to survive competition and takeover in practical environment.<br />
Topics include: Capital Budgeting, Capital Rationing and The Cost of Capital, Working Capital Management, Capital Raising for a Firm, Financial Planning and Forecasting, Capital Structure and Dividend Policy, Corporate Risk Management</p>')
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'GEM201', N'	Managing Guest Experience', N'	"<p>In order to remain competitive, hospitality organizations of today, in particularly highend hotels are very much focused on the &ldquo;guest experience&rdquo;. They are under high<br />
pressure to deliver high service standards as today&rsquo;s consumers are looking for more<br />
value for their money. This course covers the topic of managing hospitality organizations by using academic studies and real life experiences from companies and is written in three sections: Strategy, Staffing and Systems. Each chapter includes at suggested hospitality activities for students, in which students are encourages to visit local organizations to talk with guests, employees and managers to obtain a variety of perspectives on the guest experience.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'GRM491', N'	Graduation Thesis - Marketing', N'	"<p>The Graduation Thesis is an integrative experience that brings together various components of the undergraduate marketing studies in a more applied setting and under a new perspective. It enables students to further their knowledge and skills in marketing and related topics which they have found to be especially interesting or beneficial to them.<br />
<br />
As part of the course, students will learn about all aspects of the process of developing and carrying out the graduation thesis and gain an understanding of standards and expectations needed to successfully complete their dissertation. This thesis project will be completed by a group of 4-6 students, however each student will defend the thesis individually in front of a thesis committee. Each group of students will be supported by a supervisor, who will provide them with essential guidance in conducting a research, writing a thesis in a formal format and defending their arguments in front of the examination board.<br />
<br />
The thesis&#39; topic is concerned with such areas as (1) marketing mix analysis and solutions, (2) marketing channels, conflicts and distribution, (3) integrated marketing communications - analysis of campaigns or activities, (4) branding strategy, (5) new product development and innovation marketing, (6) ethics in marketing, (7) marketing in the services context and (8) contemporary issues in marketing in Vietnam.</p>')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HCM201', N'Ho Chi Minh Ideology', N'<p>Cung cấp cho sinh vi&ecirc;n những kiến thức cơ bản của Tư tưởng Hồ Ch&iacute; Minh về những vấn đề cơ bản của c&aacute;ch mạng Việt Nam. Nội dung gồm 8 chương: Chương mở đầu (nhập m&ocirc;n), chương 1:Cơ sở, qu&aacute; tr&igrave;nh h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển tư tưởng Hồ Ch&iacute; Minh. chương 2: Tư tưởng Hồ Ch&iacute; Minh về vấn đề d&acirc;n tộc v&agrave; c&aacute;ch mạng giải ph&oacute;ng d&acirc;n tộc, chương 3:Tưởng Hồ Ch&iacute; Minh về chủ nghĩa x&atilde; hội v&agrave; con đường qu&aacute; độ l&ecirc;n chủ nghĩa x&atilde; hội ở Việt nam, chương 4:Tưởng Hồ Ch&iacute; Minh về Đảng cộng sản Việt Nam, chương 5:Tưởng Hồ Ch&iacute; Minh về đại đo&agrave;n kết d&acirc;n tộc v&agrave; đo&agrave;n kết quốc tế, chương 6:Tưởng Hồ Ch&iacute; Minh về vấn đề d&acirc;n chủ v&agrave; x&acirc;y dựng nh&agrave; nước của d&acirc;n, do d&acirc;n v&agrave; v&igrave; d&acirc;n, chương 7:Tưởng Hồ Ch&iacute; Minh về văn h&oacute;a, đạo đức v&agrave; x&acirc;y dựng con người mới.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HCM202', N'HCM Ideology', N'Giới thiệu môn học: Tư tưởng Hồ Chí Minh là kết tinh của truyền thống hàng nghìn năm dựng nước và giữ nước của dân tộc Việt Nam. Trên nền tảng đó, tư tưởng Hồ Chí Minh đã gạn lọc các hạt giống trí tuệ của phương Đông, phương Tây, vận dụng sáng tạo và phát triển chủ nghĩa Mác - Lênin vào điều kiện cụ thể của nước ta. Dưới góc độ triết học, tư tưởng Hồ Chí Minh là hệ thống các quan điểm toàn diện, sâu sắc về những vấn đề cơ bản của cách mạng Việt Nam. Mục tiêu của tư tưởng Hồ Chí Minh là hướng tới giải phóng giai cấp, giải phóng dân tộc và giải phóng con người. Do đó, tư tưởng Hồ Chí Minh đã trở thành tài sản tinh thần vô giác và là ngọn cờ dẫn dắt cách mạng Việt Nam đi từ thắng lợi này đến thắng lợi khác.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HMO102', N'	Introduction to Tourism & Hospitality industry', N'	"<p>-Objective: To provide a basic understanding of the hospitality and tourism industry by traching the industry&#39;s growth, development, issues facing and future trends<br />
-Description: The course address to the structure, scope and measurement of tourism and hospitality industry. The students will be exposed to the roles of industry business players and governments. This course addresses the knowledge and skill needed for students to understand the development of the hospitality and tourism industry as well as its challenges.<br />
-Teaching method: lecturing<br />
-Assessment scheme<br />
1) On-going assessment:<br />
-Class participation/preparation: 10%<br />
-Quizzes (3): 15%<br />
-Individual assignment (01): 15%<br />
-Group assignment: (01): 30%<br />
2)Final exam: 30% (closed-book)<br />
Total 100%<br />
3) Completion Criteria:<br />
Every on-going assessment component &gt; 0; Final Result &gt;=5 &amp; Final Exam Score &gt;= 4</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HOD401', N'Ethical Hacking and Offensive Security', N'<p>This course is an introduction to the fundamentals of ethical hacking.<br />
Students will learn how hackers attack computers and networks, and how to protect Windows and Linux systems.<br />
Legal restrictions and ethical guidelines will be taught and enforced.<br />
Students will perform many hands-on labs, both attacking and defending, using port scans, footprinting, buffer overflow exploits, SQL injection, privilege escalation, Trojans, and backdoors.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HOM202', N'	Hotel Operations Management', N'	"<p>- Main objective: This course provides an overview of the operations of a mid-size full-service hotel, from lodging to food and beverage, marketing and sales, human resources,... The focus of this course will be on explaining the functions of each department in a hotel, the inter-relationships among them, and management skills development. This course offers up-to-date information of multiple aspects in hotel operations, and essential insights for future hotel managers.<br />
-Description: Hotel operational management introduces an overview of thel operation and organization of a midsize hotel. The course focuses on the front office, housekeeping, F&amp;B and how they relate to each other in order to provide excellent service to customers. Other departments are also explained to provide a full understanding of the organization of a hotel. Students are to practice their analyzing and problem solving skills with up-to-date real life example and current trends.<br />
-Teaching method: lecture, discussion, demonstration, roleplay, project based learning, group work<br />
-Assessment scheme<br />
1) On-going assessment:<br />
-Class participation/preparation: 10%<br />
-Quizzes (3): 15%<br />
-Individual assignment (01): 15%<br />
-Group assignment: (01): 30%<br />
2)Final exam: 30% (closed-book)<br />
Total 100%<br />
<br />
3) Completion Criteria:<br />
Every on-going assessment component &gt; 0; Final Result &gt;=5 &amp; Final Exam Score &gt;= 4</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HOM301c', N'	Hotel Revenue Management', N'	"<p>This Specialization covers the basics of hotel demand management, distribution, and revenue management. You&rsquo;ll learn how e-commerce intermediaries such as online travel agencies are impacting the already-complex hospitality sector, and you&rsquo;ll explore tools and techniques that will help you effectively market hospitality services and maximize business revenue in this new global industry landscape. In the final Capstone Project, you&rsquo;ll evaluate the importance of hotel branding in business success through a hands-on, real-world case study. During the sessions, you will hear from senior hotel industry executives commenting on distribution, revenue and demand management issues. We will also interview two leading Online Travel Agents on how to maximise online business for your property, and have partnered with Duetto and SnapShot, two leading hospitality industry companies, to gain access to cutting edge knowledge, thus insuring that the competencies that you gain will make you operational immediately as well as bang up to date on industry trends.<br />
Note: Student gets 0.25 bonus points for each course completed on time.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'HRM201c', N'	Human Resource Management', N'	"<p>This specialization provides a robust introduction to the key principles, policies, and practices of human resource management. The specialization begins with a foundational course that considers alternative approaches to managing human resources, provides a background to the U.S. legal context in which employees are hired, fired, rewarded, and managed, and outlines the different reasons that people are motivated to work. The remaining three courses tackle three core areas that all managers should understand: hiring employees, evaluating their performance, and rewarding them. Throughout the courses, an accessible, scientific approach is embraced such that best practices and practical tips are informed by research, but presented in accessible, applied ways.<br />
Upon completing the specialization, learners will have a deeper understanding of what works in the workplace, including a toolkit of best practices for hiring, managing, and rewarding employees.</p>
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IBC201', N'	Cross Cultural Management and Negotiation', N'	<p>This course explores the effect of cultural differences on organisational behaviour and negotiation in the global context. It exposes students to issues and problems that inevitably arise in international business when managers have to deal with culturally determined differences in values, attitudes and behaviours. The course assists students in developing cross-cultural communication competence and management and negotiation skills to successfully solve problems and capitalise on opportunities in a multicultural environment.</p>')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'IBI101', N'	Introduction to International Business', N'	<p>This course is designed to provide students with a deep understanding of international business including the techniques and strategies for entering and doing business in the international marketplace, the impact and dynamics of socio-cultural, demographic, economic, and political-legal factors in the foreign trade environment. Topics mainly include: (1) Explain how and why the world&#39;s countries differ in terms of the economics and politics, culture of international trade and investment. (2) Explain the implications of regional economic integration. (3) Identify the key factors impact future exchange rate movements and manage currency risks (4) Examine the strategies and structures of international businesses (5) Assess the special roles of an international business&#39;s various functions including global production, outsourcing, and logistics, marketing, R&amp;D, and HR.</p>')
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'LAW102', N'	Business Law and Ethics Fundamentals', N'	This course addresses the basic concept of the Legal Environment of Business studies. The course highlights the legal and regulatory environment in which people and companies conduct business activities. It appreciates the complexities, ambiguities and many areas of the law in undertaking business. Furthermore, it will focus on business ethics emphasizing how we should treat each other and our organizations in global and local contexts')
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MAS202', N'	Applied Statistics for Business', N'	"<p>The course focuses on data summaries and descriptive statistics; introduction to a statistical computer package; probability: distributions, expectation, variance, covariance, portfolios, central limit theorem; statistical inference of univariance data; Statistical inference for bivariate data: inference for intrinsically linear simple regression models. This course will have a business focus. Teaching method is flexible. Lecturers and tutors can mix between traditional teaching method with project-based learning, problem-based learning and flipped classroom.</p>
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MGT103', N'	Introduction to Management', N'	The course explores and focuses around the managerial functions of management, including planning, organizing, leading and controlling. The course is designed to provide basic knowledge and skills required in management and give students a comprehensive insight into human relations componnents that characterise any managerial roles, regardless of industry or functions. Various aspects of management theories will be examined and linked to current management practice in the world and Vietnam. Learning in the class will be facilitated through the use of interactive tools such as group exercise, case study discussion, role-play/activities, and projects.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MKT101', N'	Marketing Principles', N'	"<p>The course is designed to provide students with a strong foundation in marketing based on five key activities: (1) identifying customer needs, (2) providing customers with the right products or service to meet their needs, (3) assuring availability to customers through the right distribution channels, (4) using promotional activities in ways that motivate purchase as effectively as possible, (5) setting an appropriate price that maximizes firm profitability while maintaining customer satisfaction.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MKT201', N'	Consumer Behavior', N'	"Main objectives:
This course is designed to provide students with essential and working knowledge of the terminology and concepts in the field of consumer behavior and a better understanding of how consumers make choices and how their choices ultimately affect their well-being. After taking this class, the students should all be able to:
(1) Understand basic concepts and major research that has relevance to consumer behaviour
(2) Integrate these concepts into a framework that can be applied to the analysis of the individual consumer and the market
(3) Analyse and understand consumer''s decision making process
(4) Apply consumer behaviour in the development and implementation of marketing tactics and strategies.

Description:
This course will review concepts, issues, and methods applicable to the study of consumer behavior. It is divided into 4 main parts: (1) Psychological characteristics of consumers; (2) Social and external factors influencing consumer behavior; (3) The role of sub-culture and culture; and (4) Consumer decision-making process.
Class discussions, case study analysis , practical activities, along with group projects and quizzes will provide the basis for the learning environment in the classroom.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MKT202', N'	Services Marketing Management', N'	The course is to provide students with knowledge of the service sector which now accounts for the majority of world trade. Understanding services marketing becomes a great need to bridge the gap between customersΓÇÖ expectations and experiences. And this course is a study of the techniques and skills required for providing customer service excellence in order to keep customer service satisfaction at the highest levels possible and maintain repeat sales.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MKT205c', N'	International Marketing', N'	"<p>This Specialization covers marketing concepts but, more importantly, emphasizes the need by companies and individuals to think openly across international markets and industries for new ideas or expansion. This is summarized as &quot;Cross Country &amp; Cross Industry&quot; Innovation, or CCCI in short. The first two courses will establish the core foundations and then the last three courses will elaborate on major global industry clusters: course 3 on B2B, course 4 on Healthcare and Hospitality, and course 5 on Sports and Entertainment. The capstone will require learners to develop a new product using knowledge learned from at least 2 industries.<br />
Note: Student gets 1/6 bonus points for each course completed on time.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MKT208c', N'	Social Media Marketing', N'	"<p>The Social Media Marketing Specialization is designed to achieve two objectives. It gives students the social analytics tools, and training to help them become an influencer on social media. The course also gives the knowledge and resources to build a complete social media marketing strategy &ndash; from consumer insights to final justification metrics.<br />
Note: Student gets 0.165 bonus points for each course completed on time.</p>')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MKT301', N'	Marketing Research', N'	The course is to introduce the student to the field of marketing research which serves a central basis for marketing decision making. This course covers the basic concepts in measurement, research design, data collection, data analysis and presentation of findings.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MKT304', N'	Intergrated Marketing Communications', N'	 The course aims to provide students a solid foundation on different aspects of advertising and other major integrated marketing communications tools, and the role of these tools in the marketing process. In particular, attention will be given to discussions on (1) understanding the communication processes of consumers and marketers, (2) conducting situation analyses of business and social environments, (3) devising effective creative strategies for achieving marketing objectives, and (4) implementing and evaluating the creative strategy.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MKT318m', N'	Digital Marketing 1', N'	"<p>This Course is based on the Coursera Specialization &quot;Digital Marketing&quot;, which covers both the dynamics and the global aspects of digital marketing. You&#39;ll learn about the introduction of digital world, basics of Digital Analytics and Marketing Analytics Process. At the end of the course, you&#39;ll be able to use digital tools to promote your product, as well as apply data analytics to real-world challenges, and demystifying the use of date in marketing &amp; realize the power of visualizing data.<br />
*Teaching method: This is a blended-learning course, in which students will take a look at the videos &amp; slides and reading on Coursera first at home, then rewatch &amp; discuss key questions with classmates and teachers at classes.<br />
Completion Criteria:<br />
Every on-going assessment component &gt; 0 &amp; Final Result &gt;=5</p>')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'MKT328m', N'	Digital Marketing 2', N'	"<p>This Course is based on the Coursera Specialization &quot;Digital Marketing&quot;, which covers both the dynamics and the global aspects of digital marketing. You&#39;ll learn about the impacts of digital technologies on marketing communication strategies, as well as the core processes of planning a digital marketing campaign and how Digital Revolution impacted Marketing in an Analog World. At the end of the course, you&#39;ll be able to select the right marketing channels for the product and know how to plan a digital campaign , as well as apply critical thinking skills for successful marketing of Analog products and services in a Digital age.<br />
*Teaching method: This is a blended-learning course, in which students will take a look at the videos &amp; slides and reading on Coursera first at home, then rewatch &amp; discuss key questions with classmates and teachers at classes.<br />
Completion Criteria:<br />
Every on-going assessment component &gt; 0 &amp; Final Result &gt;=5 &amp; Final project score (both group assignment and group presentation) &gt;=4</p>')
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'OBE102c', N'	Organizational Behavior', N'	"<p>This specialization is designed to help students become an adaptable leader, ready to face the challenges of the disrupted workplace. This specialization will equip students with the skills to lead and navigate the ever-changing global environment we now work in. Through four themed courses students will: learn how to motivate staff with meaningful work (Become a Meaning Maker); better enable your organization to deliver on its strategic objectives (Know Your Organisation); harness your team&rsquo;s diversity and use teamwork to innovate and increase your organization&rsquo;s output (Know Your People), and strengthen your personal leadership skills (Adapt Your Leadership Style).</p>
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'PMG201c', N'	Project management', N'	This intensive and hands-on series of courses gives you the skills to ensure your projects are completed on time and on budget while giving the user the product they expect. You will gain a strong working knowledge of the basics of project management and be able to immediately use that knowledge to effectively manage work projects. At the end of the series you will be able to identify and manage the product scope, build a work breakdown structure, create a project plan, create the project budget, define and allocate resources and identify and manage risks, and then you will be able to manage the project development.')
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
GO
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'RMB302', N'	Research Methods & Quantitative Analysis', N'	This module provides students with an understanding of the quantitative methods for finance and investment and assists their thesis writing. This includes the ability to formulate problems into quantitative models, to aid the successful resolution of the problem. Students will learn how to apply statistical methods to analyze past data and make forecast on future trends. Using output from mathematical and statistical models, students will learn to analyze, interpret and derive potential outcomes from financial information. Topics covered include financial data collection, probability, sampling, panel regression, time series analyses, and decision tree. Teaching method is flexible. Lecturers and tutors can mix between traditional teaching method with project-based learning, problem-based learning and flipped classroom.')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SAL301', N'	Professional Selling and Management', N'	"<p>Learners will get accustomed to different valuable sales techniques, which guide them to prepare for sales activities, create better relationship with customers, utilize IT in sales management and deal with key accounts of their business.<br />
As for sales perspectives, the course brings about the important roles of sales in company&#39;s marketing strategy, and helps learners shape their own sales strategy for any kind of given products.<br />
Besides, four chapters in sales environment will also help learners consider various significant issues inside and outside their daily tasks such as, sales setting, customer behaviours, legal aspects and selling internationally.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SCM201', N'	Supply Chain Management', N'	"<p>A supply chain is comprised of all the parties involved in fulfilling a customer request. The integrated management of this network is a critical determinant of success in today&rsquo;s competitive environment.<br />
Supply chain management is the systemic, strategic coordination of the traditional business functions within a particular company and across businesses within a supply chain, for the purpose of improving the long-term performance of the individual companies and the supply chain as a whole. The major supply chain processes include planning, sourcing, making or converting, fulfillment, and relationships management. The major dimensions for evaluating the performance of supply chain processes and activities are time, cost, quality and compliance. This course covers the major activities of companies involved in profitably coordinating supply and demand in the marketplace to deliver consumer value.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SEP490', N'SE Capstone Project', N'n/a')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'SSB201', N'	Advanced Business Communication', N'	"<p>This course addresses the fundamental elements of communication in business environment to equip learners with essential communication tools to ensure success for both individuals and organization.<br />
Upon the completion of this course, the learners will be able to:<br />
(1) communicate effectively in writing the basic and practical business correspondence including emails and letters to internal and external customers (peers, subordinates, superiors, customers, partners, suppliers, and other stakeholders.<br />
(2) communicate effectively in speaking in different business contexts including socialization, staff meetings, meetings with customers and partners where the learners may play the role of participants or presenters. (3) successfully present their ideas of major research/problem solving in form of business report and presentation.<br />
(4) personalize their communication style to enhance communicative effects and leave good impresson on readers/audience<br />
(5) communicate effectively in job preparation</p>
')
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
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'TTM201', N'	Tourism and Travel Management', N'	"<p>The general objective of the course is to elucidate the intricate relationships existing between travel, transport and tourism and their functioning.<br />
<br />
The course focuses on introduction of tourism in general; its links with travel, air transport; airline operation and management; airport functioning; the role played by land and water transportation in tourism; the way the travel industry products are distributed; the value being added during the process of tour operation; functioning and management of tour operation businesses; and the nuances of tour guide. The course also deals with the demand and supply factors, influencing factors, impacts of information technology in travel intermediation and impacts of mass travel and tourism.<br />
<br />
Lecturing is the main teaching method in the theory part. However, the lecturer is required to provide relevant practical and hands-on experiences by using case studies or sharing personal experiences. The learners are encouraged to actively participate in lectures by active and student-centered teaching methods such as reciprocal questioning, games, rotating chair group discussions, rountable meeting or by self-learning and preparations before the lecture, Practical training sessions are organized to allow the learners to develop their initial skills and behaviors on the tourism and travel occupational/ opereational standards. Furthermore the group assignment project will strengthen leaners&#39; technical and soft skills such as research, team work, leadership, problem solving, work planning and scheduling, presentation and so on.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'TTM202', N'	Destination Management and Marketing', N'	"<p>-Course objectives: The subject is aimed at providing a vital and comprehensive understanding of destination marketing and management<br />
-Description: Managing destinations is an area of growing importance as tourism regions compete to provide unique experiences and exceptional value to visitors. Principles and concepts of building strong destinations are explored to assist future tourism professionals in establishing stronger regional &amp; international tourism organizations while responding to the needs and wants of community residents.<br />
-Teaching method: Basic input will be given by the lecturer in order to initiate discussions on the relevant topics. Therefore, students are required to prepare the reading material in advance. In class, short group works will take place. This should further stimulate discussion between students and allow them to immediately apply theoretical knowledge to mini-case studies. Additionally, discussion should allow students to reflect on observations of tourist destinations and identify linkages with management and marketing activities.</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'TTM203', N'	Consumer behavior in Tourism', N'	"<p>-Objective: The subject is aimed at providing a vital understanding of contemporary tourist behaviour and its application in a variety of sectors of tourism.<br />
-Description: Students will acquire broad knowledge of consumer behavior in tourism and hospitality industry. They will be able to describe and explain tourist behaviors through the perspectives of human psychology.They can also determine the role of tourist behaviors in the process of tourism product development, quality management and other marketing decisions.<br />
-Teaching Method:<br />
Basic input will be given by the lecturer in order to initiate discussions on the relevant topics. Therefore, students are required to prepare the reading material in advance. In class, short group works will take place. This should further stimulate discussion between students and allow them to immediately apply theoretical knowledge to mini-case studies. Additionally, discussion should allow students to reflect on observations of own or (other) tourists&rsquo; behaviour and identify linkages with management and marketing of tourism (products).</p>
')
INSERT [dbo].[Subject] ([SubCode], [SubName], [SubDesc]) VALUES (N'VNC103', N'	C╞í sß╗ƒ V─ân ho├í Viß╗çt Nam', N'	"<p>C╞í sß╗ƒ V─ân ho&aacute; Viß╗çt Nam l&agrave; m&ocirc;n hß╗ìc vß╗ü ─æß║╖c tr╞░ng v─ân ho&aacute; cß╗ºa d&acirc;n tß╗Öc Viß╗çt Nam.<br />
Phß║ºn ─æß║ºu ti&ecirc;n cß╗ºa m&ocirc;n hß╗ìc, giß╗¢i thiß╗çu vß╗ü l&yacute; luß║¡n v&agrave; c&aacute;ch nh&igrave;n nhß║¡n chung cß╗ºa v─ân ho&aacute; hß╗ìc. Tr&ecirc;n c╞í sß╗ƒ ─æ&oacute; gi&uacute;p ng╞░ß╗¥i hß╗ìc tiß║┐p cß║¡n v─ân ho&aacute; Viß╗çt Nam.<br />
- Tß╗½ viß╗çc x&aacute;c ─æß╗ïnh toß║í ─æß╗Ö cß╗ºa v─ân ho&aacute; viß╗çt nam vß╗ü kh&ocirc;ng gian, thß╗¥i gian v&agrave; chß╗º thß╗â cß╗ºa v─ân ho&aacute; viß╗çt nam cho ─æß║┐n diß╗àn tr&igrave;nh v─ân ho&aacute; Viß╗çt Nam.<br />
- M&ocirc;n hß╗ìc giß╗¢i thiß╗çu tß║¡p trung vß╗ü nhß╗»ng vß║Ñn ─æß╗ü ─æß║╖c tr╞░ng cß╗ºa v─ân ho&aacute; truyß╗ün thß╗æng, ─æß║╖c tr╞░ng c&aacute;c v&ugrave;ng v─ân ho&aacute; ß╗ƒ Viß╗çt Nam.<br />
<br />
─É&aacute;nh gi&aacute; qu&aacute; tr&igrave;nh:<br />
- Tham gia hoß║ít ─æß╗Öng tr&ecirc;n lß╗¢p : 10%<br />
- 2 B&agrave;i kiß╗âm tra trß║»c nghiß╗çm : 2x10% = 20%<br />
- 2 B&agrave;i thu hoß║ích Viß║┐t luß║¡n : 2x10% = 20%<br />
Thi cuß╗æi kß╗│ : 50%<br />
<br />
─Éiß╗üu kiß╗çn ho&agrave;n th&agrave;nh hß╗ìc phß║ºn:<br />
- C&aacute;c th&agrave;nh phß║ºn ─æiß╗âm ─æ&aacute;nh gi&aacute; qu&aacute; tr&igrave;nh &gt; 0<br />
- Thi cuß╗æi kß╗│ &gt;=4/10<br />
- ─Éiß╗âm tß╗òng kß║┐t cuß╗æi kß╗│ &gt;= 5/10<br />
- Tham dß╗▒ tß╗½ 80% giß╗¥ hß╗ìc</p>
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
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'MGT101 or MGT103', N'IBC201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101 or IBI101', N'MKT205c')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
ECO121', N'ECO201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
HMO101 or HMO102', N'HOM202')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MGT101 or MGT103', N'FBM201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MGT101 or MGT103', N'GEM201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
HMO101 or HMO102', N'HOM301c')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
TPG20x and DTG102', N'ADI201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
HMO102', N'TTM201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
TTM201, TTG201', N'TTM202')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
TTM201', N'TTM203')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
SSG103/SSG104', N'SSB201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MGT101 or MGT103', N'HRM201c')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
ENM301', N'ENM401')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
ECO121', N'FIN201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
FIN202', N'FIN303')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
ACC101', N'ACC305')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MAS202', N'RMB302')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT202')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT304')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT318m')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT318m', N'MKT328m')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT208c')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'SAL301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101 or CCO201', N'BRA301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
CCO201 or MTK304', N'CCM201')
GO
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
TTM201', N'TTM203')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
SSG103/SSG104', N'SSB201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MGT101 or MGT103', N'HRM201c')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
ENM301', N'ENM401')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
ECO121', N'FIN201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
FIN202', N'FIN303')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
ACC101', N'ACC305')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MAS202', N'RMB302')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT202')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT304')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT318m')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT318m', N'MKT328m')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT201')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'MKT208c')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101', N'SAL301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
Passed 80% of the program&#39;s total credits', N'GRM491')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
MKT101 or CCO201', N'BRA301')
INSERT [dbo].[SubNeedToLearn] ([PreRequitesite], [SubCode]) VALUES (N'
CCO201 or MTK304', N'CCM201')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (1, N'admin', N'admin', 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (2, N'teacher', N'teacher', 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (3, N'user', N'user', 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (4, N'staff.IT', N'staff', 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (6, N'staff.EN', N'staff', 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Status]) VALUES (7, N'staff.BA', N'staff', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Curr_Sub]  WITH NOCHECK ADD  CONSTRAINT [FK_Curr_Sub_Curriculum] FOREIGN KEY([CurrID])
REFERENCES [dbo].[Curriculum] ([CurrID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Curr_Sub] CHECK CONSTRAINT [FK_Curr_Sub_Curriculum]
GO
ALTER TABLE [dbo].[Curr_Sub]  WITH NOCHECK ADD  CONSTRAINT [FK_Curr_Sub_Subject] FOREIGN KEY([SubCode])
REFERENCES [dbo].[Subject] ([SubCode])
GO
ALTER TABLE [dbo].[Curr_Sub] CHECK CONSTRAINT [FK_Curr_Sub_Subject]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Subject] FOREIGN KEY([SubCode])
REFERENCES [dbo].[Subject] ([SubCode])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Subject]
GO
ALTER TABLE [dbo].[Role_User]  WITH CHECK ADD  CONSTRAINT [FK_Role_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Role_User] CHECK CONSTRAINT [FK_Role_User_Role]
GO
ALTER TABLE [dbo].[Role_User]  WITH CHECK ADD  CONSTRAINT [FK_Role_User_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Role_User] CHECK CONSTRAINT [FK_Role_User_User]
GO
USE [master]
GO
ALTER DATABASE [SES2] SET  READ_WRITE 
GO
