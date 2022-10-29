USE [master]
GO
/****** Object:  Database [POKEMON_DB]    Script Date: 29/10/2022 18:31:12 ******/
CREATE DATABASE [POKEMON_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POKEMON_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\POKEMON_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'POKEMON_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\POKEMON_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [POKEMON_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POKEMON_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POKEMON_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POKEMON_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POKEMON_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POKEMON_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POKEMON_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [POKEMON_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [POKEMON_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POKEMON_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POKEMON_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POKEMON_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POKEMON_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POKEMON_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POKEMON_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POKEMON_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POKEMON_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [POKEMON_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POKEMON_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POKEMON_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POKEMON_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POKEMON_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POKEMON_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POKEMON_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POKEMON_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [POKEMON_DB] SET  MULTI_USER 
GO
ALTER DATABASE [POKEMON_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POKEMON_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POKEMON_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POKEMON_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [POKEMON_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [POKEMON_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [POKEMON_DB] SET QUERY_STORE = OFF
GO
USE [POKEMON_DB]
GO
/****** Object:  Table [dbo].[Evolutions]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evolutions](
	[PokemonID] [int] NOT NULL,
	[EvolutionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PokemonID] ASC,
	[EvolutionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GymLeaders]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GymLeaders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LeaderName] [nvarchar](40) NOT NULL,
	[ImageURL] [varchar](5000) NOT NULL,
	[GymID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images_Pokemon]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images_Pokemon](
	[PokemonID] [int] NOT NULL,
	[ImageURL] [varchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Places]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlaceName] [nvarchar](40) NOT NULL,
	[RegionID] [int] NOT NULL,
	[ZoneID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PokemonGyms]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PokemonGyms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlaceID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[BadgeName] [nvarchar](40) NOT NULL,
	[BadgeURL] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pokemons]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pokemons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PokemonName] [varchar](50) NOT NULL,
	[HP] [int] NOT NULL,
	[Attack] [int] NOT NULL,
	[Defense] [int] NOT NULL,
	[SpecialAttack] [int] NOT NULL,
	[SpecialDefense] [int] NOT NULL,
	[Speed] [int] NOT NULL,
	[Legendary] [bit] NOT NULL,
	[RegionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](40) NOT NULL,
	[ReleaceDate] [date] NOT NULL,
	[ImageURL] [varchar](5000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types_Pokemon]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types_Pokemon](
	[PokemonID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PokemonID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zones]    Script Date: 29/10/2022 18:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZoneName] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (1, 2)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (2, 3)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (4, 5)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (5, 6)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (7, 8)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (8, 9)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (10, 11)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (11, 12)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (13, 14)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (14, 15)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (16, 17)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (17, 18)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (19, 20)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (21, 22)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (23, 24)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (25, 26)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (27, 28)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (29, 30)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (30, 31)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (32, 33)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (33, 34)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (35, 36)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (37, 38)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (39, 40)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (41, 42)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (42, 169)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (43, 44)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (44, 45)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (46, 47)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (48, 49)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (50, 51)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (52, 53)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (54, 55)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (56, 57)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (58, 59)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (60, 61)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (61, 62)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (63, 64)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (64, 65)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (66, 67)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (67, 68)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (69, 70)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (70, 71)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (72, 73)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (74, 75)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (75, 76)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (77, 78)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (79, 80)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (81, 82)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (82, 462)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (84, 85)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (86, 87)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (88, 89)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (90, 91)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (92, 93)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (93, 94)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (95, 208)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (96, 97)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (98, 99)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (100, 101)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (102, 103)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (104, 105)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (108, 463)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (109, 110)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (111, 112)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (112, 464)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (113, 242)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (114, 465)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (116, 117)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (117, 230)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (118, 119)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (120, 121)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (123, 212)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (125, 466)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (126, 467)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (129, 130)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (133, 134)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (137, 233)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (138, 139)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (140, 141)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (147, 148)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (148, 149)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (152, 153)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (153, 154)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (155, 156)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (156, 157)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (158, 159)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (159, 160)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (161, 162)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (163, 164)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (165, 166)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (167, 168)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (170, 171)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (172, 25)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (173, 35)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (174, 39)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (175, 176)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (176, 468)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (177, 178)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (179, 180)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (180, 181)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (183, 184)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (187, 188)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (188, 189)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (190, 424)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (191, 192)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (193, 469)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (194, 195)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (198, 430)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (200, 429)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (204, 205)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (207, 472)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (209, 210)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (215, 461)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (216, 217)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (218, 219)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (220, 221)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (221, 473)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (223, 224)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (228, 229)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (231, 232)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (233, 474)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (236, 106)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (238, 124)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (239, 125)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (240, 126)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (246, 247)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (247, 248)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (252, 253)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (253, 254)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (255, 256)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (256, 257)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (258, 259)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (259, 260)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (261, 262)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (263, 264)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (265, 266)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (266, 267)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (268, 269)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (270, 271)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (271, 272)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (273, 274)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (274, 275)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (276, 277)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (278, 279)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (280, 281)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (281, 282)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (283, 284)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (285, 286)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (287, 288)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (288, 289)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (290, 291)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (293, 294)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (294, 295)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (296, 297)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (298, 183)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (299, 476)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (300, 301)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (304, 305)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (305, 306)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (307, 308)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (309, 310)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (315, 407)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (316, 317)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (318, 319)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (320, 321)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (322, 323)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (325, 326)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (328, 329)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (329, 330)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (331, 332)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (333, 334)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (339, 340)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (341, 342)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (343, 344)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (345, 346)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (347, 348)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (349, 350)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (353, 354)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (355, 356)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (356, 477)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (360, 202)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (361, 362)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (363, 364)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (364, 365)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (366, 367)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (371, 372)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (372, 373)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (374, 375)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (375, 376)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (387, 388)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (388, 389)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (390, 391)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (391, 392)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (393, 394)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (394, 395)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (396, 397)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (397, 398)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (399, 400)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (401, 402)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (403, 404)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (404, 405)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (406, 315)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (408, 409)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (410, 411)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (412, 414)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (415, 416)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (418, 419)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (420, 421)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (422, 423)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (425, 426)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (427, 428)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (431, 432)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (433, 358)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (434, 435)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (436, 437)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (438, 185)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (439, 122)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (440, 113)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (443, 444)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (444, 445)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (446, 143)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (447, 448)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (449, 450)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (451, 452)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (453, 454)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (456, 457)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (458, 226)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (459, 460)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (495, 496)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (496, 497)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (498, 499)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (499, 500)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (501, 502)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (502, 503)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (504, 505)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (506, 507)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (507, 508)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (509, 510)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (511, 512)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (513, 514)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (515, 516)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (517, 518)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (519, 520)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (520, 521)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (522, 523)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (524, 525)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (525, 526)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (527, 528)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (529, 530)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (532, 533)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (533, 534)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (535, 536)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (536, 537)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (540, 541)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (541, 542)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (543, 544)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (544, 545)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (546, 547)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (548, 549)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (551, 552)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (552, 553)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (554, 555)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (557, 558)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (559, 560)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (562, 563)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (564, 565)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (566, 567)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (568, 569)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (570, 571)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (572, 573)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (574, 575)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (575, 576)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (577, 578)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (578, 579)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (580, 581)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (582, 583)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (583, 584)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (585, 586)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (588, 589)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (590, 591)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (592, 593)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (595, 596)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (597, 598)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (599, 600)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (600, 601)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (602, 603)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (603, 604)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (605, 606)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (607, 608)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (608, 609)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (610, 611)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (611, 612)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (613, 614)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (616, 617)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (619, 620)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (622, 623)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (624, 625)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (627, 628)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (629, 630)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (633, 634)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (634, 635)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (636, 637)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (650, 651)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (651, 652)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (653, 654)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (654, 655)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (656, 657)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (657, 658)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (659, 660)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (661, 662)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (662, 663)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (664, 665)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (665, 666)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (667, 668)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (669, 670)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (670, 671)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (672, 673)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (674, 675)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (677, 678)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (679, 680)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (680, 681)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (682, 683)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (684, 685)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (686, 687)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (688, 689)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (690, 691)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (692, 693)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (694, 695)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (696, 697)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (698, 699)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (704, 705)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (705, 706)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (708, 709)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (712, 713)
GO
INSERT [dbo].[Evolutions] ([PokemonID], [EvolutionID]) VALUES (714, 715)
GO
SET IDENTITY_INSERT [dbo].[GymLeaders] ON 
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (1, N'Brock', N'https://static.wikia.nocookie.net/espokemon/images/c/ca/VS_Brock.png/revision/latest?cb=20090915020350', 1)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (2, N'Misty', N'https://static.wikia.nocookie.net/espokemon/images/2/27/VS_Misty.png/revision/latest?cb=20090915172054', 2)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (3, N'Lt. Surge', N'https://static.wikia.nocookie.net/espokemon/images/3/3b/VS_Lt._Surge.png/revision/latest?cb=20090915172339', 3)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (4, N'Erika', N'https://static.wikia.nocookie.net/espokemon/images/1/14/VS_Erika.png/revision/latest?cb=20090915172755', 4)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (5, N'Koga', N'https://static.wikia.nocookie.net/espokemon/images/b/b9/VS_Koga.png/revision/latest?cb=20090915173007', 5)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (6, N'Sabrina', N'https://static.wikia.nocookie.net/espokemon/images/7/7a/VS_Sabrina.png/revision/latest?cb=20090915173118', 6)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (7, N'Blaine', N'https://static.wikia.nocookie.net/espokemon/images/7/70/VS_Blaine.png/revision/latest?cb=20090915173325', 7)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (8, N'Giovanni', N'https://static.wikia.nocookie.net/espokemon/images/a/a9/VS_Giovanni.png/revision/latest?cb=20090915173510', 8)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (9, N'Blue', N'https://static.wikia.nocookie.net/espokemon/images/3/34/VS_Azul.png/revision/latest?cb=20090915173842', 8)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (10, N'Falkner', N'https://static.wikia.nocookie.net/espokemon/images/2/23/VS_Pegaso.png/revision/latest?cb=20090915174300', 9)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (11, N'Bugsy', N'https://static.wikia.nocookie.net/espokemon/images/0/01/VS_Ant%C3%B3n.png/revision/latest?cb=20090915174449', 10)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (12, N'Whitney', N'https://static.wikia.nocookie.net/espokemon/images/8/8b/VS_Blanca.png/revision/latest?cb=20090915174552', 11)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (13, N'Morty', N'https://static.wikia.nocookie.net/espokemon/images/1/18/VS_Morti.png/revision/latest?cb=20090915174927', 12)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (14, N'Chuck', N'https://static.wikia.nocookie.net/espokemon/images/0/0a/VS_An%C3%ADbal.png/revision/latest?cb=20090915180431', 13)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (15, N'Jasmine', N'https://static.wikia.nocookie.net/espokemon/images/5/5f/VS_Yasmina.png/revision/latest?cb=20090915180643', 14)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (16, N'Pryce', N'https://static.wikia.nocookie.net/espokemon/images/0/09/VS_Fredo.png/revision/latest?cb=20090915180545', 15)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (17, N'Clair', N'https://static.wikia.nocookie.net/espokemon/images/9/98/VS_D%C3%A9bora.png/revision/latest?cb=20090915180745', 16)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (18, N'Roxanne', N'https://static.wikia.nocookie.net/espokemon/images/d/dd/VS_Petra_ROZA.png/revision/latest?cb=20140716144336', 17)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (19, N'Brawly', N'https://static.wikia.nocookie.net/espokemon/images/5/52/VS_Marcial_ROZA.png/revision/latest?cb=20140716144846', 18)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (20, N'Wattson', N'https://static.wikia.nocookie.net/espokemon/images/a/af/VS_Erico_ROZA.png/revision/latest?cb=20140716144846', 19)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (21, N'Flannery', N'https://static.wikia.nocookie.net/espokemon/images/b/b3/VS_Candela_ROZA.png/revision/latest?cb=20140716144845', 20)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (22, N'Norman', N'https://static.wikia.nocookie.net/espokemon/images/0/04/VS_Norman_ROZA.png/revision/latest?cb=20140716144847', 21)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (23, N'Winona', N'https://static.wikia.nocookie.net/espokemon/images/7/7b/VS_Alana_ROZA.png/revision/latest?cb=20141205020819', 22)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (24, N'Tate and Liza', N'https://static.wikia.nocookie.net/espokemon/images/b/b4/VS_Vito_y_Leti_ROZA.png/revision/latest?cb=20141016121913', 23)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (25, N'Wallace', N'https://static.wikia.nocookie.net/espokemon/images/b/b0/VS_Plubio_ROZA.png/revision/latest?cb=20141016121607', 24)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (26, N'Juan', N'https://static.wikia.nocookie.net/espokemon/images/a/a7/VS_Galano_E.png/revision/latest/scale-to-width-down/160?cb=20160623215728', 24)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (27, N'Roark', N'https://static.wikia.nocookie.net/espokemon/images/6/63/VS_Roco.png/revision/latest?cb=20090412162333', 25)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (28, N'Gardenia', N'https://static.wikia.nocookie.net/espokemon/images/b/b2/VS_Gardenia.png/revision/latest?cb=20090412162352', 26)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (29, N'Fantina', N'https://static.wikia.nocookie.net/espokemon/images/5/5f/VS_Fantina.png/revision/latest?cb=20090412162550', 27)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (30, N'Maylene', N'https://static.wikia.nocookie.net/espokemon/images/1/1b/VS_Brega.png/revision/latest?cb=20090412162502', 28)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (31, N'Crasher Wake', N'https://static.wikia.nocookie.net/espokemon/images/4/4f/VS_Mananti.png/revision/latest?cb=20090412162528', 29)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (32, N'Byron', N'https://static.wikia.nocookie.net/espokemon/images/1/11/VS_Acer%C3%B3n.png/revision/latest?cb=20090412162653', 30)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (33, N'Candice', N'https://static.wikia.nocookie.net/espokemon/images/b/b1/VS_Inverna.png/revision/latest?cb=20090412162722', 31)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (34, N'Volkner', N'https://static.wikia.nocookie.net/espokemon/images/4/43/VS_Lectro.png/revision/latest?cb=20090412162745', 32)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (35, N'Cilan', N'https://static.wikia.nocookie.net/espokemon/images/4/4d/VS_Millo.png/revision/latest?cb=20100918033810', 33)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (36, N'Cress', N'https://static.wikia.nocookie.net/espokemon/images/6/69/VS_Ma%C3%ADz.png/revision/latest?cb=20100918033711', 33)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (37, N'Chili', N'https://static.wikia.nocookie.net/espokemon/images/7/72/VS_Zeo.png/revision/latest?cb=20100918033718', 33)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (38, N'Lenora', N'https://static.wikia.nocookie.net/espokemon/images/e/ed/VS_Aloe.png/revision/latest?cb=20100918033720', 34)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (39, N'Burgh', N'https://static.wikia.nocookie.net/espokemon/images/6/68/VS_Camus.png/revision/latest?cb=20100918033723', 35)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (40, N'Elesa', N'https://static.wikia.nocookie.net/espokemon/images/3/35/VS_Camila.png/revision/latest?cb=20100918033727', 36)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (41, N'Clay', N'https://static.wikia.nocookie.net/espokemon/images/f/f0/VS_Yak%C3%B3n.png/revision/latest?cb=20100918033733', 37)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (42, N'Skyla', N'https://static.wikia.nocookie.net/espokemon/images/f/fa/VS_Gerania.png/revision/latest?cb=20100918033735', 38)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (43, N'Brycen', N'https://static.wikia.nocookie.net/espokemon/images/7/70/VS_Junco.png/revision/latest?cb=20100918033738', 39)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (44, N'Drayden', N'https://static.wikia.nocookie.net/espokemon/images/b/b0/VS_Lirio.png/revision/latest?cb=20100918033743', 40)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (45, N'Iris', N'https://static.wikia.nocookie.net/espokemon/images/2/2d/VS_Iris.png/revision/latest?cb=20100918033741', 40)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (46, N'Marlon', N'https://static.wikia.nocookie.net/espokemon/images/6/62/VS_Cipri%C3%A1n.png/revision/latest?cb=20120622173412', 41)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (47, N'Hiedra', N'https://static.wikia.nocookie.net/espokemon/images/e/e6/VS_Hiedra.png/revision/latest?cb=20120622173234', 42)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (48, N'Cheren', N'https://static.wikia.nocookie.net/espokemon/images/8/89/Vs_Cheren_N2B2.png/revision/latest?cb=20120622183353', 34)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (49, N'Viola', N'https://static.wikia.nocookie.net/espokemon/images/1/13/VS_Violeta.png/revision/latest/scale-to-width-down/150?cb=20140318224649', 43)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (50, N'Grant', N'https://static.wikia.nocookie.net/espokemon/images/6/6b/VS_Lino.png/revision/latest/scale-to-width-down/150?cb=20140318225216', 44)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (51, N'Korrina', N'https://static.wikia.nocookie.net/espokemon/images/2/20/VS_Corelia.png/revision/latest/scale-to-width-down/150?cb=20140318225329', 45)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (52, N'Ramos', N'https://static.wikia.nocookie.net/espokemon/images/6/6f/VS_Amaro.png/revision/latest/scale-to-width-down/150?cb=20140318224516', 46)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (53, N'Clemont', N'https://static.wikia.nocookie.net/espokemon/images/c/c9/VS_Lem.png/revision/latest/scale-to-width-down/150?cb=20131110130442', 47)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (54, N'Valerie', N'https://static.wikia.nocookie.net/espokemon/images/a/ae/VS_Valeria.png/revision/latest/scale-to-width-down/150?cb=20131110132845', 48)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (55, N'Olympia', N'https://static.wikia.nocookie.net/espokemon/images/5/51/VS_%C3%81strid.png/revision/latest/scale-to-width-down/150?cb=20140318224448', 49)
GO
INSERT [dbo].[GymLeaders] ([ID], [LeaderName], [ImageURL], [GymID]) VALUES (56, N'Wulfric', N'https://static.wikia.nocookie.net/espokemon/images/f/f0/VS_%C3%89del.png/revision/latest/scale-to-width-down/150?cb=20140318225231', 50)
GO
SET IDENTITY_INSERT [dbo].[GymLeaders] OFF
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (100, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/100.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (100, N'https://img.pokemondb.net/sprites/home/normal/voltorb.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (100, N'https://img.pokemondb.net/sprites/x-y/normal/voltorb.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (101, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/101.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (101, N'https://img.pokemondb.net/sprites/home/normal/electrode.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (101, N'https://img.pokemondb.net/sprites/x-y/normal/electrode.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (102, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/102.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (102, N'https://img.pokemondb.net/sprites/home/normal/exeggcute.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (102, N'https://img.pokemondb.net/sprites/x-y/normal/exeggcute.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (103, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/103.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (103, N'https://img.pokemondb.net/sprites/home/normal/exeggutor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (103, N'https://img.pokemondb.net/sprites/x-y/normal/exeggutor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (104, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/104.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (104, N'https://img.pokemondb.net/sprites/home/normal/cubone.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (104, N'https://img.pokemondb.net/sprites/x-y/normal/cubone.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (105, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/105.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (105, N'https://img.pokemondb.net/sprites/home/normal/marowak.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (105, N'https://img.pokemondb.net/sprites/x-y/normal/marowak.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (106, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/106.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (106, N'https://img.pokemondb.net/sprites/home/normal/hitmonlee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (106, N'https://img.pokemondb.net/sprites/x-y/normal/hitmonlee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (107, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/107.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (107, N'https://img.pokemondb.net/sprites/home/normal/hitmonchan.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (107, N'https://img.pokemondb.net/sprites/x-y/normal/hitmonchan.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (108, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/108.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (108, N'https://img.pokemondb.net/sprites/home/normal/lickitung.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (108, N'https://img.pokemondb.net/sprites/x-y/normal/lickitung.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (109, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/109.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (109, N'https://img.pokemondb.net/sprites/home/normal/koffing.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (109, N'https://img.pokemondb.net/sprites/x-y/normal/koffing.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (110, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/110.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (110, N'https://img.pokemondb.net/sprites/home/normal/weezing.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (110, N'https://img.pokemondb.net/sprites/x-y/normal/weezing.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (111, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/111.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (111, N'https://img.pokemondb.net/sprites/home/normal/rhyhorn.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (111, N'https://img.pokemondb.net/sprites/x-y/normal/rhyhorn.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (112, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/112.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (112, N'https://img.pokemondb.net/sprites/home/normal/rhydon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (112, N'https://img.pokemondb.net/sprites/x-y/normal/rhydon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (113, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/113.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (113, N'https://img.pokemondb.net/sprites/home/normal/chansey.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (113, N'https://img.pokemondb.net/sprites/x-y/normal/chansey.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (114, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/114.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (114, N'https://img.pokemondb.net/sprites/home/normal/tangela.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (114, N'https://img.pokemondb.net/sprites/x-y/normal/tangela.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (115, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/115.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (115, N'https://img.pokemondb.net/sprites/home/normal/kangaskhan.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (115, N'https://img.pokemondb.net/sprites/x-y/normal/kangaskhan.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (116, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/116.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (116, N'https://img.pokemondb.net/sprites/home/normal/horsea.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (116, N'https://img.pokemondb.net/sprites/x-y/normal/horsea.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (117, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/117.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (117, N'https://img.pokemondb.net/sprites/home/normal/seadra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (117, N'https://img.pokemondb.net/sprites/x-y/normal/seadra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (118, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/118.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (118, N'https://img.pokemondb.net/sprites/home/normal/goldeen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (118, N'https://img.pokemondb.net/sprites/x-y/normal/goldeen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (119, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/119.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (119, N'https://img.pokemondb.net/sprites/home/normal/seaking.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (119, N'https://img.pokemondb.net/sprites/x-y/normal/seaking.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (120, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/120.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (120, N'https://img.pokemondb.net/sprites/home/normal/staryu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (120, N'https://img.pokemondb.net/sprites/x-y/normal/staryu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (121, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/121.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (121, N'https://img.pokemondb.net/sprites/home/normal/starmie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (121, N'https://img.pokemondb.net/sprites/x-y/normal/starmie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (122, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/122.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (122, N'https://img.pokemondb.net/sprites/home/normal/mr-mime.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (122, N'https://img.pokemondb.net/sprites/x-y/normal/mr-mime.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (123, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/123.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (123, N'https://img.pokemondb.net/sprites/home/normal/scyther.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (123, N'https://img.pokemondb.net/sprites/x-y/normal/scyther.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (124, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/124.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (124, N'https://img.pokemondb.net/sprites/home/normal/jynx.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (124, N'https://img.pokemondb.net/sprites/x-y/normal/jynx.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (125, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/125.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (125, N'https://img.pokemondb.net/sprites/home/normal/electabuzz.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (125, N'https://img.pokemondb.net/sprites/x-y/normal/electabuzz.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (126, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/126.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (126, N'https://img.pokemondb.net/sprites/home/normal/magmar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (126, N'https://img.pokemondb.net/sprites/x-y/normal/magmar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (127, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/127.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (127, N'https://img.pokemondb.net/sprites/home/normal/pinsir.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (127, N'https://img.pokemondb.net/sprites/x-y/normal/pinsir.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (128, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/128.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (128, N'https://img.pokemondb.net/sprites/home/normal/tauros.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (128, N'https://img.pokemondb.net/sprites/x-y/normal/tauros.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (129, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/129.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (129, N'https://img.pokemondb.net/sprites/home/normal/magikarp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (129, N'https://img.pokemondb.net/sprites/x-y/normal/magikarp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (130, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/130.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (130, N'https://img.pokemondb.net/sprites/home/normal/gyarados.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (130, N'https://img.pokemondb.net/sprites/x-y/normal/gyarados.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (131, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/131.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (131, N'https://img.pokemondb.net/sprites/home/normal/lapras.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (131, N'https://img.pokemondb.net/sprites/x-y/normal/lapras.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (132, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/132.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (132, N'https://img.pokemondb.net/sprites/home/normal/ditto.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (132, N'https://img.pokemondb.net/sprites/x-y/normal/ditto.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (133, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/133.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (133, N'https://img.pokemondb.net/sprites/home/normal/eevee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (133, N'https://img.pokemondb.net/sprites/x-y/normal/eevee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (134, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/134.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (134, N'https://img.pokemondb.net/sprites/home/normal/vaporeon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (134, N'https://img.pokemondb.net/sprites/x-y/normal/vaporeon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (135, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/135.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (135, N'https://img.pokemondb.net/sprites/home/normal/jolteon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (135, N'https://img.pokemondb.net/sprites/x-y/normal/jolteon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (136, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/136.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (136, N'https://img.pokemondb.net/sprites/home/normal/flareon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (136, N'https://img.pokemondb.net/sprites/x-y/normal/flareon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (137, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/137.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (137, N'https://img.pokemondb.net/sprites/home/normal/porygon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (137, N'https://img.pokemondb.net/sprites/x-y/normal/porygon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (138, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/138.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (138, N'https://img.pokemondb.net/sprites/home/normal/omanyte.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (138, N'https://img.pokemondb.net/sprites/x-y/normal/omanyte.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (139, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/139.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (139, N'https://img.pokemondb.net/sprites/home/normal/omastar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (139, N'https://img.pokemondb.net/sprites/x-y/normal/omastar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (140, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/140.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (140, N'https://img.pokemondb.net/sprites/home/normal/kabuto.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (140, N'https://img.pokemondb.net/sprites/x-y/normal/kabuto.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (141, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/141.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (141, N'https://img.pokemondb.net/sprites/home/normal/kabutops.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (141, N'https://img.pokemondb.net/sprites/x-y/normal/kabutops.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (142, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/142.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (142, N'https://img.pokemondb.net/sprites/home/normal/aerodactyl.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (142, N'https://img.pokemondb.net/sprites/x-y/normal/aerodactyl.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (143, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/143.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (143, N'https://img.pokemondb.net/sprites/home/normal/snorlax.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (143, N'https://img.pokemondb.net/sprites/x-y/normal/snorlax.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (144, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/144.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (144, N'https://img.pokemondb.net/sprites/home/normal/articuno.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (144, N'https://img.pokemondb.net/sprites/x-y/normal/articuno.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (145, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/145.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (145, N'https://img.pokemondb.net/sprites/home/normal/zapdos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (145, N'https://img.pokemondb.net/sprites/x-y/normal/zapdos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (146, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/146.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (146, N'https://img.pokemondb.net/sprites/home/normal/moltres.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (146, N'https://img.pokemondb.net/sprites/x-y/normal/moltres.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (147, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/147.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (147, N'https://img.pokemondb.net/sprites/home/normal/dratini.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (147, N'https://img.pokemondb.net/sprites/x-y/normal/dratini.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (148, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/148.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (148, N'https://img.pokemondb.net/sprites/home/normal/dragonair.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (148, N'https://img.pokemondb.net/sprites/x-y/normal/dragonair.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (149, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/149.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (149, N'https://img.pokemondb.net/sprites/home/normal/dragonite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (149, N'https://img.pokemondb.net/sprites/x-y/normal/dragonite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (150, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/150.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (150, N'https://img.pokemondb.net/sprites/home/normal/mewtwo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (150, N'https://img.pokemondb.net/sprites/x-y/normal/mewtwo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (151, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/151.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (151, N'https://img.pokemondb.net/sprites/home/normal/mew.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (151, N'https://img.pokemondb.net/sprites/x-y/normal/mew.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (152, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/152.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (152, N'https://img.pokemondb.net/sprites/home/normal/chikorita.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (152, N'https://img.pokemondb.net/sprites/x-y/normal/chikorita.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (153, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/153.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (153, N'https://img.pokemondb.net/sprites/home/normal/bayleef.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (153, N'https://img.pokemondb.net/sprites/x-y/normal/bayleef.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (154, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/154.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (154, N'https://img.pokemondb.net/sprites/home/normal/meganium.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (154, N'https://img.pokemondb.net/sprites/x-y/normal/meganium.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (155, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/155.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (155, N'https://img.pokemondb.net/sprites/home/normal/cyndaquil.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (155, N'https://img.pokemondb.net/sprites/x-y/normal/cyndaquil.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (156, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/156.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (156, N'https://img.pokemondb.net/sprites/home/normal/quilava.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (156, N'https://img.pokemondb.net/sprites/x-y/normal/quilava.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (157, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/157.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (157, N'https://img.pokemondb.net/sprites/home/normal/typhlosion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (157, N'https://img.pokemondb.net/sprites/x-y/normal/typhlosion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (158, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/158.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (158, N'https://img.pokemondb.net/sprites/home/normal/totodile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (158, N'https://img.pokemondb.net/sprites/x-y/normal/totodile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (159, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/159.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (159, N'https://img.pokemondb.net/sprites/home/normal/croconaw.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (159, N'https://img.pokemondb.net/sprites/x-y/normal/croconaw.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (160, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/160.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (160, N'https://img.pokemondb.net/sprites/home/normal/feraligatr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (160, N'https://img.pokemondb.net/sprites/x-y/normal/feraligatr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (161, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/161.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (161, N'https://img.pokemondb.net/sprites/home/normal/sentret.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (161, N'https://img.pokemondb.net/sprites/x-y/normal/sentret.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (162, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/162.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (162, N'https://img.pokemondb.net/sprites/home/normal/furret.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (162, N'https://img.pokemondb.net/sprites/x-y/normal/furret.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (163, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/163.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (163, N'https://img.pokemondb.net/sprites/home/normal/hoothoot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (163, N'https://img.pokemondb.net/sprites/x-y/normal/hoothoot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (164, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/164.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (164, N'https://img.pokemondb.net/sprites/home/normal/noctowl.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (164, N'https://img.pokemondb.net/sprites/x-y/normal/noctowl.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (165, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/165.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (165, N'https://img.pokemondb.net/sprites/home/normal/ledyba.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (165, N'https://img.pokemondb.net/sprites/x-y/normal/ledyba.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (166, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/166.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (166, N'https://img.pokemondb.net/sprites/home/normal/ledian.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (166, N'https://img.pokemondb.net/sprites/x-y/normal/ledian.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (167, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/167.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (167, N'https://img.pokemondb.net/sprites/home/normal/spinarak.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (167, N'https://img.pokemondb.net/sprites/x-y/normal/spinarak.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (168, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/168.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (168, N'https://img.pokemondb.net/sprites/home/normal/ariados.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (168, N'https://img.pokemondb.net/sprites/x-y/normal/ariados.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (169, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/169.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (169, N'https://img.pokemondb.net/sprites/home/normal/crobat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (169, N'https://img.pokemondb.net/sprites/x-y/normal/crobat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (170, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/170.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (170, N'https://img.pokemondb.net/sprites/home/normal/chinchou.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (170, N'https://img.pokemondb.net/sprites/x-y/normal/chinchou.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (171, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/171.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (171, N'https://img.pokemondb.net/sprites/home/normal/lanturn.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (171, N'https://img.pokemondb.net/sprites/x-y/normal/lanturn.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (172, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/172.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (172, N'https://img.pokemondb.net/sprites/home/normal/pichu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (172, N'https://img.pokemondb.net/sprites/x-y/normal/pichu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (173, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/173.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (173, N'https://img.pokemondb.net/sprites/home/normal/cleffa.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (173, N'https://img.pokemondb.net/sprites/x-y/normal/cleffa.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (174, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/174.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (174, N'https://img.pokemondb.net/sprites/home/normal/igglybuff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (174, N'https://img.pokemondb.net/sprites/x-y/normal/igglybuff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (175, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/175.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (175, N'https://img.pokemondb.net/sprites/home/normal/togepi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (175, N'https://img.pokemondb.net/sprites/x-y/normal/togepi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (176, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/176.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (176, N'https://img.pokemondb.net/sprites/home/normal/togetic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (176, N'https://img.pokemondb.net/sprites/x-y/normal/togetic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (177, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/177.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (177, N'https://img.pokemondb.net/sprites/home/normal/natu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (177, N'https://img.pokemondb.net/sprites/x-y/normal/natu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (178, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/178.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (178, N'https://img.pokemondb.net/sprites/home/normal/xatu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (178, N'https://img.pokemondb.net/sprites/x-y/normal/xatu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (179, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/179.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (179, N'https://img.pokemondb.net/sprites/home/normal/mareep.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (179, N'https://img.pokemondb.net/sprites/x-y/normal/mareep.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (180, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/180.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (180, N'https://img.pokemondb.net/sprites/home/normal/flaaffy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (180, N'https://img.pokemondb.net/sprites/x-y/normal/flaaffy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (181, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/181.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (181, N'https://img.pokemondb.net/sprites/home/normal/ampharos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (181, N'https://img.pokemondb.net/sprites/x-y/normal/ampharos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (182, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/182.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (182, N'https://img.pokemondb.net/sprites/home/normal/bellossom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (182, N'https://img.pokemondb.net/sprites/x-y/normal/bellossom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (183, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/183.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (183, N'https://img.pokemondb.net/sprites/home/normal/marill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (183, N'https://img.pokemondb.net/sprites/x-y/normal/marill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (184, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/184.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (184, N'https://img.pokemondb.net/sprites/home/normal/azumarill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (184, N'https://img.pokemondb.net/sprites/x-y/normal/azumarill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (185, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/185.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (185, N'https://img.pokemondb.net/sprites/home/normal/sudowoodo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (185, N'https://img.pokemondb.net/sprites/x-y/normal/sudowoodo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (186, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/186.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (186, N'https://img.pokemondb.net/sprites/home/normal/politoed.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (186, N'https://img.pokemondb.net/sprites/x-y/normal/politoed.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (187, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/187.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (187, N'https://img.pokemondb.net/sprites/home/normal/hoppip.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (187, N'https://img.pokemondb.net/sprites/x-y/normal/hoppip.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (188, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/188.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (188, N'https://img.pokemondb.net/sprites/home/normal/skiploom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (188, N'https://img.pokemondb.net/sprites/x-y/normal/skiploom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (189, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/189.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (189, N'https://img.pokemondb.net/sprites/home/normal/jumpluff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (189, N'https://img.pokemondb.net/sprites/x-y/normal/jumpluff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (190, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/190.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (190, N'https://img.pokemondb.net/sprites/home/normal/aipom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (190, N'https://img.pokemondb.net/sprites/x-y/normal/aipom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (191, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/191.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (191, N'https://img.pokemondb.net/sprites/home/normal/sunkern.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (191, N'https://img.pokemondb.net/sprites/x-y/normal/sunkern.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (192, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/192.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (192, N'https://img.pokemondb.net/sprites/home/normal/sunflora.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (192, N'https://img.pokemondb.net/sprites/x-y/normal/sunflora.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (193, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/193.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (193, N'https://img.pokemondb.net/sprites/home/normal/yanma.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (193, N'https://img.pokemondb.net/sprites/x-y/normal/yanma.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (194, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/194.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (194, N'https://img.pokemondb.net/sprites/home/normal/wooper.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (194, N'https://img.pokemondb.net/sprites/x-y/normal/wooper.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (195, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/195.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (195, N'https://img.pokemondb.net/sprites/home/normal/quagsire.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (195, N'https://img.pokemondb.net/sprites/x-y/normal/quagsire.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (196, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/196.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (196, N'https://img.pokemondb.net/sprites/home/normal/espeon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (196, N'https://img.pokemondb.net/sprites/x-y/normal/espeon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (197, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/197.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (197, N'https://img.pokemondb.net/sprites/home/normal/umbreon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (197, N'https://img.pokemondb.net/sprites/x-y/normal/umbreon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (198, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/198.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (198, N'https://img.pokemondb.net/sprites/home/normal/murkrow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (198, N'https://img.pokemondb.net/sprites/x-y/normal/murkrow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (199, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/199.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (199, N'https://img.pokemondb.net/sprites/home/normal/slowking.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (199, N'https://img.pokemondb.net/sprites/x-y/normal/slowking.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (200, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/200.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (200, N'https://img.pokemondb.net/sprites/home/normal/misdreavus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (200, N'https://img.pokemondb.net/sprites/x-y/normal/misdreavus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (201, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/201.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (201, N'https://img.pokemondb.net/sprites/home/normal/unown.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (201, N'https://img.pokemondb.net/sprites/x-y/normal/unown.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (202, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/202.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (202, N'https://img.pokemondb.net/sprites/home/normal/wobbuffet.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (202, N'https://img.pokemondb.net/sprites/x-y/normal/wobbuffet.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (203, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/203.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (203, N'https://img.pokemondb.net/sprites/home/normal/girafarig.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (203, N'https://img.pokemondb.net/sprites/x-y/normal/girafarig.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (204, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/204.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (204, N'https://img.pokemondb.net/sprites/home/normal/pineco.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (204, N'https://img.pokemondb.net/sprites/x-y/normal/pineco.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (205, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/205.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (205, N'https://img.pokemondb.net/sprites/home/normal/forretress.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (205, N'https://img.pokemondb.net/sprites/x-y/normal/forretress.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (206, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/206.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (206, N'https://img.pokemondb.net/sprites/home/normal/dunsparce.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (206, N'https://img.pokemondb.net/sprites/x-y/normal/dunsparce.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (207, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/207.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (207, N'https://img.pokemondb.net/sprites/home/normal/gligar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (207, N'https://img.pokemondb.net/sprites/x-y/normal/gligar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (208, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/208.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (208, N'https://img.pokemondb.net/sprites/home/normal/steelix.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (208, N'https://img.pokemondb.net/sprites/x-y/normal/steelix.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (209, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/209.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (209, N'https://img.pokemondb.net/sprites/home/normal/snubbull.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (209, N'https://img.pokemondb.net/sprites/x-y/normal/snubbull.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (210, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/210.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (210, N'https://img.pokemondb.net/sprites/home/normal/granbull.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (210, N'https://img.pokemondb.net/sprites/x-y/normal/granbull.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (211, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/211.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (211, N'https://img.pokemondb.net/sprites/home/normal/qwilfish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (211, N'https://img.pokemondb.net/sprites/x-y/normal/qwilfish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (212, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/212.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (212, N'https://img.pokemondb.net/sprites/home/normal/scizor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (212, N'https://img.pokemondb.net/sprites/x-y/normal/scizor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (213, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/213.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (213, N'https://img.pokemondb.net/sprites/home/normal/shuckle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (213, N'https://img.pokemondb.net/sprites/x-y/normal/shuckle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (214, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/214.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (214, N'https://img.pokemondb.net/sprites/home/normal/heracross.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (214, N'https://img.pokemondb.net/sprites/x-y/normal/heracross.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (215, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/215.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (215, N'https://img.pokemondb.net/sprites/home/normal/sneasel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (215, N'https://img.pokemondb.net/sprites/x-y/normal/sneasel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (216, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/216.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (216, N'https://img.pokemondb.net/sprites/home/normal/teddiursa.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (216, N'https://img.pokemondb.net/sprites/x-y/normal/teddiursa.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (217, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/217.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (217, N'https://img.pokemondb.net/sprites/home/normal/ursaring.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (217, N'https://img.pokemondb.net/sprites/x-y/normal/ursaring.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (218, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/218.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (218, N'https://img.pokemondb.net/sprites/home/normal/slugma.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (218, N'https://img.pokemondb.net/sprites/x-y/normal/slugma.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (219, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/219.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (219, N'https://img.pokemondb.net/sprites/home/normal/magcargo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (219, N'https://img.pokemondb.net/sprites/x-y/normal/magcargo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (220, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/220.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (220, N'https://img.pokemondb.net/sprites/home/normal/swinub.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (220, N'https://img.pokemondb.net/sprites/x-y/normal/swinub.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (221, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/221.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (221, N'https://img.pokemondb.net/sprites/home/normal/piloswine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (221, N'https://img.pokemondb.net/sprites/x-y/normal/piloswine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (222, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/222.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (222, N'https://img.pokemondb.net/sprites/home/normal/corsola.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (222, N'https://img.pokemondb.net/sprites/x-y/normal/corsola.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (223, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/223.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (223, N'https://img.pokemondb.net/sprites/home/normal/remoraid.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (223, N'https://img.pokemondb.net/sprites/x-y/normal/remoraid.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (224, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/224.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (224, N'https://img.pokemondb.net/sprites/home/normal/octillery.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (224, N'https://img.pokemondb.net/sprites/x-y/normal/octillery.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (225, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/225.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (225, N'https://img.pokemondb.net/sprites/home/normal/delibird.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (225, N'https://img.pokemondb.net/sprites/x-y/normal/delibird.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (226, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/226.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (226, N'https://img.pokemondb.net/sprites/home/normal/mantine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (226, N'https://img.pokemondb.net/sprites/x-y/normal/mantine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (227, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/227.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (227, N'https://img.pokemondb.net/sprites/home/normal/skarmory.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (227, N'https://img.pokemondb.net/sprites/x-y/normal/skarmory.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (228, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/228.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (228, N'https://img.pokemondb.net/sprites/home/normal/houndour.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (228, N'https://img.pokemondb.net/sprites/x-y/normal/houndour.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (229, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/229.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (229, N'https://img.pokemondb.net/sprites/home/normal/houndoom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (229, N'https://img.pokemondb.net/sprites/x-y/normal/houndoom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (230, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/230.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (230, N'https://img.pokemondb.net/sprites/home/normal/kingdra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (230, N'https://img.pokemondb.net/sprites/x-y/normal/kingdra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (231, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/231.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (231, N'https://img.pokemondb.net/sprites/home/normal/phanpy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (231, N'https://img.pokemondb.net/sprites/x-y/normal/phanpy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (232, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/232.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (232, N'https://img.pokemondb.net/sprites/home/normal/donphan.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (232, N'https://img.pokemondb.net/sprites/x-y/normal/donphan.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (233, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/233.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (233, N'https://img.pokemondb.net/sprites/home/normal/porygon2.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (233, N'https://img.pokemondb.net/sprites/x-y/normal/porygon2.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (234, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/234.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (234, N'https://img.pokemondb.net/sprites/home/normal/stantler.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (234, N'https://img.pokemondb.net/sprites/x-y/normal/stantler.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (235, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/235.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (235, N'https://img.pokemondb.net/sprites/home/normal/smeargle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (235, N'https://img.pokemondb.net/sprites/x-y/normal/smeargle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (236, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/236.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (236, N'https://img.pokemondb.net/sprites/home/normal/tyrogue.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (236, N'https://img.pokemondb.net/sprites/x-y/normal/tyrogue.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (237, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/237.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (237, N'https://img.pokemondb.net/sprites/home/normal/hitmontop.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (237, N'https://img.pokemondb.net/sprites/x-y/normal/hitmontop.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (238, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/238.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (238, N'https://img.pokemondb.net/sprites/home/normal/smoochum.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (238, N'https://img.pokemondb.net/sprites/x-y/normal/smoochum.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (239, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/239.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (239, N'https://img.pokemondb.net/sprites/home/normal/elekid.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (239, N'https://img.pokemondb.net/sprites/x-y/normal/elekid.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (240, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/240.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (240, N'https://img.pokemondb.net/sprites/home/normal/magby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (240, N'https://img.pokemondb.net/sprites/x-y/normal/magby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (241, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/241.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (241, N'https://img.pokemondb.net/sprites/home/normal/miltank.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (241, N'https://img.pokemondb.net/sprites/x-y/normal/miltank.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (242, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/242.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (242, N'https://img.pokemondb.net/sprites/home/normal/blissey.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (242, N'https://img.pokemondb.net/sprites/x-y/normal/blissey.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (243, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/243.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (243, N'https://img.pokemondb.net/sprites/home/normal/raikou.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (243, N'https://img.pokemondb.net/sprites/x-y/normal/raikou.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (244, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/244.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (244, N'https://img.pokemondb.net/sprites/home/normal/entei.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (244, N'https://img.pokemondb.net/sprites/x-y/normal/entei.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (245, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/245.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (245, N'https://img.pokemondb.net/sprites/home/normal/suicune.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (245, N'https://img.pokemondb.net/sprites/x-y/normal/suicune.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (246, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/246.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (246, N'https://img.pokemondb.net/sprites/home/normal/larvitar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (246, N'https://img.pokemondb.net/sprites/x-y/normal/larvitar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (247, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/247.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (247, N'https://img.pokemondb.net/sprites/home/normal/pupitar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (247, N'https://img.pokemondb.net/sprites/x-y/normal/pupitar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (248, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/248.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (248, N'https://img.pokemondb.net/sprites/home/normal/tyranitar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (248, N'https://img.pokemondb.net/sprites/x-y/normal/tyranitar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (249, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/249.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (249, N'https://img.pokemondb.net/sprites/home/normal/lugia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (249, N'https://img.pokemondb.net/sprites/x-y/normal/lugia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (250, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/250.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (250, N'https://img.pokemondb.net/sprites/home/normal/ho-oh.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (250, N'https://img.pokemondb.net/sprites/x-y/normal/ho-oh.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (251, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/251.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (251, N'https://img.pokemondb.net/sprites/home/normal/celebi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (251, N'https://img.pokemondb.net/sprites/x-y/normal/celebi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (252, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/252.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (252, N'https://img.pokemondb.net/sprites/home/normal/treecko.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (252, N'https://img.pokemondb.net/sprites/x-y/normal/treecko.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (253, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/253.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (253, N'https://img.pokemondb.net/sprites/home/normal/grovyle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (253, N'https://img.pokemondb.net/sprites/x-y/normal/grovyle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (254, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/254.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (254, N'https://img.pokemondb.net/sprites/home/normal/sceptile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (254, N'https://img.pokemondb.net/sprites/x-y/normal/sceptile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (255, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/255.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (255, N'https://img.pokemondb.net/sprites/home/normal/torchic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (255, N'https://img.pokemondb.net/sprites/x-y/normal/torchic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (256, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/256.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (256, N'https://img.pokemondb.net/sprites/home/normal/combusken.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (256, N'https://img.pokemondb.net/sprites/x-y/normal/combusken.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (257, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/257.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (257, N'https://img.pokemondb.net/sprites/home/normal/blaziken.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (257, N'https://img.pokemondb.net/sprites/x-y/normal/blaziken.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (258, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/258.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (258, N'https://img.pokemondb.net/sprites/home/normal/mudkip.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (258, N'https://img.pokemondb.net/sprites/x-y/normal/mudkip.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (259, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/259.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (259, N'https://img.pokemondb.net/sprites/home/normal/marshtomp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (259, N'https://img.pokemondb.net/sprites/x-y/normal/marshtomp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (260, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/260.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (260, N'https://img.pokemondb.net/sprites/home/normal/swampert.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (260, N'https://img.pokemondb.net/sprites/x-y/normal/swampert.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (261, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/261.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (261, N'https://img.pokemondb.net/sprites/home/normal/poochyena.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (261, N'https://img.pokemondb.net/sprites/x-y/normal/poochyena.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (262, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/262.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (262, N'https://img.pokemondb.net/sprites/home/normal/mightyena.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (262, N'https://img.pokemondb.net/sprites/x-y/normal/mightyena.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (263, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/263.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (263, N'https://img.pokemondb.net/sprites/home/normal/zigzagoon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (263, N'https://img.pokemondb.net/sprites/x-y/normal/zigzagoon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (264, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/264.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (264, N'https://img.pokemondb.net/sprites/home/normal/linoone.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (264, N'https://img.pokemondb.net/sprites/x-y/normal/linoone.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (265, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/265.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (265, N'https://img.pokemondb.net/sprites/home/normal/wurmple.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (265, N'https://img.pokemondb.net/sprites/x-y/normal/wurmple.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (266, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/266.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (266, N'https://img.pokemondb.net/sprites/home/normal/silcoon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (266, N'https://img.pokemondb.net/sprites/x-y/normal/silcoon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (267, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/267.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (267, N'https://img.pokemondb.net/sprites/home/normal/beautifly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (267, N'https://img.pokemondb.net/sprites/x-y/normal/beautifly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (268, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/268.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (268, N'https://img.pokemondb.net/sprites/home/normal/cascoon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (268, N'https://img.pokemondb.net/sprites/x-y/normal/cascoon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (269, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/269.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (269, N'https://img.pokemondb.net/sprites/home/normal/dustox.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (269, N'https://img.pokemondb.net/sprites/x-y/normal/dustox.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (270, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/270.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (270, N'https://img.pokemondb.net/sprites/home/normal/lotad.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (270, N'https://img.pokemondb.net/sprites/x-y/normal/lotad.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (271, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/271.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (271, N'https://img.pokemondb.net/sprites/home/normal/lombre.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (271, N'https://img.pokemondb.net/sprites/x-y/normal/lombre.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (272, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/272.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (272, N'https://img.pokemondb.net/sprites/home/normal/ludicolo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (272, N'https://img.pokemondb.net/sprites/x-y/normal/ludicolo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (273, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/273.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (273, N'https://img.pokemondb.net/sprites/home/normal/seedot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (273, N'https://img.pokemondb.net/sprites/x-y/normal/seedot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (274, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/274.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (274, N'https://img.pokemondb.net/sprites/home/normal/nuzleaf.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (274, N'https://img.pokemondb.net/sprites/x-y/normal/nuzleaf.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (275, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/275.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (275, N'https://img.pokemondb.net/sprites/home/normal/shiftry.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (275, N'https://img.pokemondb.net/sprites/x-y/normal/shiftry.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (276, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/276.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (276, N'https://img.pokemondb.net/sprites/home/normal/taillow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (276, N'https://img.pokemondb.net/sprites/x-y/normal/taillow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (277, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/277.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (277, N'https://img.pokemondb.net/sprites/home/normal/swellow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (277, N'https://img.pokemondb.net/sprites/x-y/normal/swellow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (278, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/278.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (278, N'https://img.pokemondb.net/sprites/home/normal/wingull.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (278, N'https://img.pokemondb.net/sprites/x-y/normal/wingull.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (279, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/279.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (279, N'https://img.pokemondb.net/sprites/home/normal/pelipper.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (279, N'https://img.pokemondb.net/sprites/x-y/normal/pelipper.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (280, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/280.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (280, N'https://img.pokemondb.net/sprites/home/normal/ralts.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (280, N'https://img.pokemondb.net/sprites/x-y/normal/ralts.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (281, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/281.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (281, N'https://img.pokemondb.net/sprites/home/normal/kirlia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (281, N'https://img.pokemondb.net/sprites/x-y/normal/kirlia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (282, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/282.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (282, N'https://img.pokemondb.net/sprites/home/normal/gardevoir.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (282, N'https://img.pokemondb.net/sprites/x-y/normal/gardevoir.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (283, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/283.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (283, N'https://img.pokemondb.net/sprites/home/normal/surskit.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (283, N'https://img.pokemondb.net/sprites/x-y/normal/surskit.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (284, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/284.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (284, N'https://img.pokemondb.net/sprites/home/normal/masquerain.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (284, N'https://img.pokemondb.net/sprites/x-y/normal/masquerain.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (285, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/285.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (285, N'https://img.pokemondb.net/sprites/home/normal/shroomish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (285, N'https://img.pokemondb.net/sprites/x-y/normal/shroomish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (286, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/286.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (286, N'https://img.pokemondb.net/sprites/home/normal/breloom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (286, N'https://img.pokemondb.net/sprites/x-y/normal/breloom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (287, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/287.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (287, N'https://img.pokemondb.net/sprites/home/normal/slakoth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (287, N'https://img.pokemondb.net/sprites/x-y/normal/slakoth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (288, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/288.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (288, N'https://img.pokemondb.net/sprites/home/normal/vigoroth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (288, N'https://img.pokemondb.net/sprites/x-y/normal/vigoroth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (289, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/289.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (289, N'https://img.pokemondb.net/sprites/home/normal/slaking.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (289, N'https://img.pokemondb.net/sprites/x-y/normal/slaking.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (290, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/290.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (290, N'https://img.pokemondb.net/sprites/home/normal/nincada.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (290, N'https://img.pokemondb.net/sprites/x-y/normal/nincada.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (291, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/291.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (291, N'https://img.pokemondb.net/sprites/home/normal/ninjask.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (291, N'https://img.pokemondb.net/sprites/x-y/normal/ninjask.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (292, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/292.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (292, N'https://img.pokemondb.net/sprites/home/normal/shedinja.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (292, N'https://img.pokemondb.net/sprites/x-y/normal/shedinja.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (293, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/293.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (293, N'https://img.pokemondb.net/sprites/home/normal/whismur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (293, N'https://img.pokemondb.net/sprites/x-y/normal/whismur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (294, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/294.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (294, N'https://img.pokemondb.net/sprites/home/normal/loudred.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (294, N'https://img.pokemondb.net/sprites/x-y/normal/loudred.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (295, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/295.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (295, N'https://img.pokemondb.net/sprites/home/normal/exploud.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (295, N'https://img.pokemondb.net/sprites/x-y/normal/exploud.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (296, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/296.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (296, N'https://img.pokemondb.net/sprites/home/normal/makuhita.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (296, N'https://img.pokemondb.net/sprites/x-y/normal/makuhita.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (297, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/297.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (297, N'https://img.pokemondb.net/sprites/home/normal/hariyama.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (297, N'https://img.pokemondb.net/sprites/x-y/normal/hariyama.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (298, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/298.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (298, N'https://img.pokemondb.net/sprites/home/normal/azurill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (298, N'https://img.pokemondb.net/sprites/x-y/normal/azurill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (299, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/299.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (299, N'https://img.pokemondb.net/sprites/home/normal/nosepass.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (299, N'https://img.pokemondb.net/sprites/x-y/normal/nosepass.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (300, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/300.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (300, N'https://img.pokemondb.net/sprites/home/normal/skitty.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (300, N'https://img.pokemondb.net/sprites/x-y/normal/skitty.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (301, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/301.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (301, N'https://img.pokemondb.net/sprites/home/normal/delcatty.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (301, N'https://img.pokemondb.net/sprites/x-y/normal/delcatty.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (302, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/302.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (302, N'https://img.pokemondb.net/sprites/home/normal/sableye.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (302, N'https://img.pokemondb.net/sprites/x-y/normal/sableye.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (303, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/303.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (303, N'https://img.pokemondb.net/sprites/home/normal/mawile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (303, N'https://img.pokemondb.net/sprites/x-y/normal/mawile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (304, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/304.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (304, N'https://img.pokemondb.net/sprites/home/normal/aron.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (304, N'https://img.pokemondb.net/sprites/x-y/normal/aron.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (305, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/305.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (305, N'https://img.pokemondb.net/sprites/home/normal/lairon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (305, N'https://img.pokemondb.net/sprites/x-y/normal/lairon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (306, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/306.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (306, N'https://img.pokemondb.net/sprites/home/normal/aggron.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (306, N'https://img.pokemondb.net/sprites/x-y/normal/aggron.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (307, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/307.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (307, N'https://img.pokemondb.net/sprites/home/normal/meditite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (307, N'https://img.pokemondb.net/sprites/x-y/normal/meditite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (308, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/308.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (308, N'https://img.pokemondb.net/sprites/home/normal/medicham.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (308, N'https://img.pokemondb.net/sprites/x-y/normal/medicham.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (309, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/309.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (309, N'https://img.pokemondb.net/sprites/home/normal/electrike.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (309, N'https://img.pokemondb.net/sprites/x-y/normal/electrike.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (310, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/310.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (310, N'https://img.pokemondb.net/sprites/home/normal/manectric.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (310, N'https://img.pokemondb.net/sprites/x-y/normal/manectric.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (311, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/311.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (311, N'https://img.pokemondb.net/sprites/home/normal/plusle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (311, N'https://img.pokemondb.net/sprites/x-y/normal/plusle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (312, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/312.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (312, N'https://img.pokemondb.net/sprites/home/normal/minun.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (312, N'https://img.pokemondb.net/sprites/x-y/normal/minun.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (313, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/313.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (313, N'https://img.pokemondb.net/sprites/home/normal/volbeat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (313, N'https://img.pokemondb.net/sprites/x-y/normal/volbeat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (314, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/314.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (314, N'https://img.pokemondb.net/sprites/home/normal/illumise.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (314, N'https://img.pokemondb.net/sprites/x-y/normal/illumise.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (315, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/315.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (315, N'https://img.pokemondb.net/sprites/home/normal/roselia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (315, N'https://img.pokemondb.net/sprites/x-y/normal/roselia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (316, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/316.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (316, N'https://img.pokemondb.net/sprites/home/normal/gulpin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (316, N'https://img.pokemondb.net/sprites/x-y/normal/gulpin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (317, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/317.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (317, N'https://img.pokemondb.net/sprites/home/normal/swalot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (317, N'https://img.pokemondb.net/sprites/x-y/normal/swalot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (318, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/318.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (318, N'https://img.pokemondb.net/sprites/home/normal/carvanha.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (318, N'https://img.pokemondb.net/sprites/x-y/normal/carvanha.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (319, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/319.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (319, N'https://img.pokemondb.net/sprites/home/normal/sharpedo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (319, N'https://img.pokemondb.net/sprites/x-y/normal/sharpedo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (320, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/320.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (320, N'https://img.pokemondb.net/sprites/home/normal/wailmer.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (320, N'https://img.pokemondb.net/sprites/x-y/normal/wailmer.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (321, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/321.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (321, N'https://img.pokemondb.net/sprites/home/normal/wailord.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (321, N'https://img.pokemondb.net/sprites/x-y/normal/wailord.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (322, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/322.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (322, N'https://img.pokemondb.net/sprites/home/normal/numel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (322, N'https://img.pokemondb.net/sprites/x-y/normal/numel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (323, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/323.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (323, N'https://img.pokemondb.net/sprites/home/normal/camerupt.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (323, N'https://img.pokemondb.net/sprites/x-y/normal/camerupt.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (324, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/324.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (324, N'https://img.pokemondb.net/sprites/home/normal/torkoal.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (324, N'https://img.pokemondb.net/sprites/x-y/normal/torkoal.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (325, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/325.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (325, N'https://img.pokemondb.net/sprites/home/normal/spoink.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (325, N'https://img.pokemondb.net/sprites/x-y/normal/spoink.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (326, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/326.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (326, N'https://img.pokemondb.net/sprites/home/normal/grumpig.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (326, N'https://img.pokemondb.net/sprites/x-y/normal/grumpig.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (327, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/327.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (327, N'https://img.pokemondb.net/sprites/home/normal/spinda.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (327, N'https://img.pokemondb.net/sprites/x-y/normal/spinda.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (328, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/328.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (328, N'https://img.pokemondb.net/sprites/home/normal/trapinch.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (328, N'https://img.pokemondb.net/sprites/x-y/normal/trapinch.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (329, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/329.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (329, N'https://img.pokemondb.net/sprites/home/normal/vibrava.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (329, N'https://img.pokemondb.net/sprites/x-y/normal/vibrava.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (330, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/330.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (330, N'https://img.pokemondb.net/sprites/home/normal/flygon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (330, N'https://img.pokemondb.net/sprites/x-y/normal/flygon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (331, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/331.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (331, N'https://img.pokemondb.net/sprites/home/normal/cacnea.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (331, N'https://img.pokemondb.net/sprites/x-y/normal/cacnea.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (332, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/332.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (332, N'https://img.pokemondb.net/sprites/home/normal/cacturne.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (332, N'https://img.pokemondb.net/sprites/x-y/normal/cacturne.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (333, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/333.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (333, N'https://img.pokemondb.net/sprites/home/normal/swablu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (333, N'https://img.pokemondb.net/sprites/x-y/normal/swablu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (334, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/334.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (334, N'https://img.pokemondb.net/sprites/home/normal/altaria.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (334, N'https://img.pokemondb.net/sprites/x-y/normal/altaria.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (335, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/335.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (335, N'https://img.pokemondb.net/sprites/home/normal/zangoose.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (335, N'https://img.pokemondb.net/sprites/x-y/normal/zangoose.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (336, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/336.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (336, N'https://img.pokemondb.net/sprites/home/normal/seviper.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (336, N'https://img.pokemondb.net/sprites/x-y/normal/seviper.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (337, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/337.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (337, N'https://img.pokemondb.net/sprites/home/normal/lunatone.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (337, N'https://img.pokemondb.net/sprites/x-y/normal/lunatone.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (338, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/338.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (338, N'https://img.pokemondb.net/sprites/home/normal/solrock.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (338, N'https://img.pokemondb.net/sprites/x-y/normal/solrock.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (339, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/339.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (339, N'https://img.pokemondb.net/sprites/home/normal/barboach.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (339, N'https://img.pokemondb.net/sprites/x-y/normal/barboach.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (340, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/340.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (340, N'https://img.pokemondb.net/sprites/home/normal/whiscash.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (340, N'https://img.pokemondb.net/sprites/x-y/normal/whiscash.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (341, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/341.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (341, N'https://img.pokemondb.net/sprites/home/normal/corphish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (341, N'https://img.pokemondb.net/sprites/x-y/normal/corphish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (342, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/342.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (342, N'https://img.pokemondb.net/sprites/home/normal/crawdaunt.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (342, N'https://img.pokemondb.net/sprites/x-y/normal/crawdaunt.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (343, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/343.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (343, N'https://img.pokemondb.net/sprites/home/normal/baltoy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (343, N'https://img.pokemondb.net/sprites/x-y/normal/baltoy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (344, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/344.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (344, N'https://img.pokemondb.net/sprites/home/normal/claydol.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (344, N'https://img.pokemondb.net/sprites/x-y/normal/claydol.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (345, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/345.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (345, N'https://img.pokemondb.net/sprites/home/normal/lileep.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (345, N'https://img.pokemondb.net/sprites/x-y/normal/lileep.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (346, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/346.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (346, N'https://img.pokemondb.net/sprites/home/normal/cradily.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (346, N'https://img.pokemondb.net/sprites/x-y/normal/cradily.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (347, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/347.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (347, N'https://img.pokemondb.net/sprites/home/normal/anorith.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (347, N'https://img.pokemondb.net/sprites/x-y/normal/anorith.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (348, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/348.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (348, N'https://img.pokemondb.net/sprites/home/normal/armaldo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (348, N'https://img.pokemondb.net/sprites/x-y/normal/armaldo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (349, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/349.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (349, N'https://img.pokemondb.net/sprites/home/normal/feebas.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (349, N'https://img.pokemondb.net/sprites/x-y/normal/feebas.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (350, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/350.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (350, N'https://img.pokemondb.net/sprites/home/normal/milotic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (350, N'https://img.pokemondb.net/sprites/x-y/normal/milotic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (351, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/351.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (351, N'https://img.pokemondb.net/sprites/home/normal/castform.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (351, N'https://img.pokemondb.net/sprites/x-y/normal/castform.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (352, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/352.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (352, N'https://img.pokemondb.net/sprites/home/normal/kecleon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (352, N'https://img.pokemondb.net/sprites/x-y/normal/kecleon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (353, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/353.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (353, N'https://img.pokemondb.net/sprites/home/normal/shuppet.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (353, N'https://img.pokemondb.net/sprites/x-y/normal/shuppet.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (354, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/354.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (354, N'https://img.pokemondb.net/sprites/home/normal/banette.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (354, N'https://img.pokemondb.net/sprites/x-y/normal/banette.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (355, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/355.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (355, N'https://img.pokemondb.net/sprites/home/normal/duskull.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (355, N'https://img.pokemondb.net/sprites/x-y/normal/duskull.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (356, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/356.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (356, N'https://img.pokemondb.net/sprites/home/normal/dusclops.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (356, N'https://img.pokemondb.net/sprites/x-y/normal/dusclops.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (357, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/357.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (357, N'https://img.pokemondb.net/sprites/home/normal/tropius.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (357, N'https://img.pokemondb.net/sprites/x-y/normal/tropius.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (358, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/358.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (358, N'https://img.pokemondb.net/sprites/home/normal/chimecho.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (358, N'https://img.pokemondb.net/sprites/x-y/normal/chimecho.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (359, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/359.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (359, N'https://img.pokemondb.net/sprites/home/normal/absol.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (359, N'https://img.pokemondb.net/sprites/x-y/normal/absol.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (360, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/360.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (360, N'https://img.pokemondb.net/sprites/home/normal/wynaut.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (360, N'https://img.pokemondb.net/sprites/x-y/normal/wynaut.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (361, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/361.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (361, N'https://img.pokemondb.net/sprites/home/normal/snorunt.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (361, N'https://img.pokemondb.net/sprites/x-y/normal/snorunt.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (362, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/362.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (362, N'https://img.pokemondb.net/sprites/home/normal/glalie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (362, N'https://img.pokemondb.net/sprites/x-y/normal/glalie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (363, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/363.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (363, N'https://img.pokemondb.net/sprites/home/normal/spheal.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (363, N'https://img.pokemondb.net/sprites/x-y/normal/spheal.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (364, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/364.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (364, N'https://img.pokemondb.net/sprites/home/normal/sealeo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (364, N'https://img.pokemondb.net/sprites/x-y/normal/sealeo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (365, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/365.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (365, N'https://img.pokemondb.net/sprites/home/normal/walrein.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (365, N'https://img.pokemondb.net/sprites/x-y/normal/walrein.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (366, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/366.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (366, N'https://img.pokemondb.net/sprites/home/normal/clamperl.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (366, N'https://img.pokemondb.net/sprites/x-y/normal/clamperl.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (367, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/367.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (367, N'https://img.pokemondb.net/sprites/home/normal/huntail.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (367, N'https://img.pokemondb.net/sprites/x-y/normal/huntail.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (368, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/368.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (368, N'https://img.pokemondb.net/sprites/home/normal/gorebyss.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (368, N'https://img.pokemondb.net/sprites/x-y/normal/gorebyss.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (369, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/369.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (369, N'https://img.pokemondb.net/sprites/home/normal/relicanth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (369, N'https://img.pokemondb.net/sprites/x-y/normal/relicanth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (370, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/370.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (370, N'https://img.pokemondb.net/sprites/home/normal/luvdisc.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (370, N'https://img.pokemondb.net/sprites/x-y/normal/luvdisc.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (371, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/371.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (371, N'https://img.pokemondb.net/sprites/home/normal/bagon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (371, N'https://img.pokemondb.net/sprites/x-y/normal/bagon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (372, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/372.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (372, N'https://img.pokemondb.net/sprites/home/normal/shelgon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (372, N'https://img.pokemondb.net/sprites/x-y/normal/shelgon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (373, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/373.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (373, N'https://img.pokemondb.net/sprites/home/normal/salamence.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (373, N'https://img.pokemondb.net/sprites/x-y/normal/salamence.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (374, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/374.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (374, N'https://img.pokemondb.net/sprites/home/normal/beldum.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (374, N'https://img.pokemondb.net/sprites/x-y/normal/beldum.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (375, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/375.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (375, N'https://img.pokemondb.net/sprites/home/normal/metang.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (375, N'https://img.pokemondb.net/sprites/x-y/normal/metang.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (376, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/376.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (376, N'https://img.pokemondb.net/sprites/home/normal/metagross.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (376, N'https://img.pokemondb.net/sprites/x-y/normal/metagross.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (377, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/377.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (377, N'https://img.pokemondb.net/sprites/home/normal/regirock.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (377, N'https://img.pokemondb.net/sprites/x-y/normal/regirock.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (378, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/378.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (378, N'https://img.pokemondb.net/sprites/home/normal/regice.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (378, N'https://img.pokemondb.net/sprites/x-y/normal/regice.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (379, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/379.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (379, N'https://img.pokemondb.net/sprites/home/normal/registeel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (379, N'https://img.pokemondb.net/sprites/x-y/normal/registeel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (380, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/380.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (380, N'https://img.pokemondb.net/sprites/home/normal/latias.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (380, N'https://img.pokemondb.net/sprites/x-y/normal/latias.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (381, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/381.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (381, N'https://img.pokemondb.net/sprites/home/normal/latios.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (381, N'https://img.pokemondb.net/sprites/x-y/normal/latios.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (382, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/382.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (382, N'https://img.pokemondb.net/sprites/home/normal/kyogre.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (382, N'https://img.pokemondb.net/sprites/x-y/normal/kyogre.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (383, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/383.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (383, N'https://img.pokemondb.net/sprites/home/normal/groudon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (383, N'https://img.pokemondb.net/sprites/x-y/normal/groudon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (384, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/384.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (384, N'https://img.pokemondb.net/sprites/home/normal/rayquaza.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (384, N'https://img.pokemondb.net/sprites/x-y/normal/rayquaza.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (385, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/385.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (385, N'https://img.pokemondb.net/sprites/home/normal/jirachi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (385, N'https://img.pokemondb.net/sprites/x-y/normal/jirachi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (386, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/386.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (386, N'https://img.pokemondb.net/sprites/home/normal/deoxys.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (386, N'https://img.pokemondb.net/sprites/x-y/normal/deoxys.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (387, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/387.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (387, N'https://img.pokemondb.net/sprites/home/normal/turtwig.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (387, N'https://img.pokemondb.net/sprites/x-y/normal/turtwig.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (388, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/388.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (388, N'https://img.pokemondb.net/sprites/home/normal/grotle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (388, N'https://img.pokemondb.net/sprites/x-y/normal/grotle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (389, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/389.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (389, N'https://img.pokemondb.net/sprites/home/normal/torterra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (389, N'https://img.pokemondb.net/sprites/x-y/normal/torterra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (390, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/390.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (390, N'https://img.pokemondb.net/sprites/home/normal/chimchar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (390, N'https://img.pokemondb.net/sprites/x-y/normal/chimchar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (391, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/391.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (391, N'https://img.pokemondb.net/sprites/home/normal/monferno.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (391, N'https://img.pokemondb.net/sprites/x-y/normal/monferno.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (392, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/392.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (392, N'https://img.pokemondb.net/sprites/home/normal/infernape.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (392, N'https://img.pokemondb.net/sprites/x-y/normal/infernape.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (393, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/393.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (393, N'https://img.pokemondb.net/sprites/home/normal/piplup.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (393, N'https://img.pokemondb.net/sprites/x-y/normal/piplup.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (394, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/394.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (394, N'https://img.pokemondb.net/sprites/home/normal/prinplup.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (394, N'https://img.pokemondb.net/sprites/x-y/normal/prinplup.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (395, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/395.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (395, N'https://img.pokemondb.net/sprites/home/normal/empoleon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (395, N'https://img.pokemondb.net/sprites/x-y/normal/empoleon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (396, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/396.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (396, N'https://img.pokemondb.net/sprites/home/normal/starly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (396, N'https://img.pokemondb.net/sprites/x-y/normal/starly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (397, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/397.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (397, N'https://img.pokemondb.net/sprites/home/normal/staravia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (397, N'https://img.pokemondb.net/sprites/x-y/normal/staravia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (398, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/398.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (398, N'https://img.pokemondb.net/sprites/home/normal/staraptor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (398, N'https://img.pokemondb.net/sprites/x-y/normal/staraptor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (399, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/399.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (399, N'https://img.pokemondb.net/sprites/home/normal/bidoof.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (399, N'https://img.pokemondb.net/sprites/x-y/normal/bidoof.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (400, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/400.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (400, N'https://img.pokemondb.net/sprites/home/normal/bibarel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (400, N'https://img.pokemondb.net/sprites/x-y/normal/bibarel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (401, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/401.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (401, N'https://img.pokemondb.net/sprites/home/normal/kricketot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (401, N'https://img.pokemondb.net/sprites/x-y/normal/kricketot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (402, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/402.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (402, N'https://img.pokemondb.net/sprites/home/normal/kricketune.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (402, N'https://img.pokemondb.net/sprites/x-y/normal/kricketune.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (403, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/403.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (403, N'https://img.pokemondb.net/sprites/home/normal/shinx.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (403, N'https://img.pokemondb.net/sprites/x-y/normal/shinx.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (404, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/404.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (404, N'https://img.pokemondb.net/sprites/home/normal/luxio.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (404, N'https://img.pokemondb.net/sprites/x-y/normal/luxio.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (405, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/405.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (405, N'https://img.pokemondb.net/sprites/home/normal/luxray.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (405, N'https://img.pokemondb.net/sprites/x-y/normal/luxray.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (406, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/406.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (406, N'https://img.pokemondb.net/sprites/home/normal/budew.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (406, N'https://img.pokemondb.net/sprites/x-y/normal/budew.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (407, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/407.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (407, N'https://img.pokemondb.net/sprites/home/normal/roserade.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (407, N'https://img.pokemondb.net/sprites/x-y/normal/roserade.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (408, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/408.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (408, N'https://img.pokemondb.net/sprites/home/normal/cranidos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (408, N'https://img.pokemondb.net/sprites/x-y/normal/cranidos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (409, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/409.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (409, N'https://img.pokemondb.net/sprites/home/normal/rampardos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (409, N'https://img.pokemondb.net/sprites/x-y/normal/rampardos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (410, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/410.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (410, N'https://img.pokemondb.net/sprites/home/normal/shieldon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (410, N'https://img.pokemondb.net/sprites/x-y/normal/shieldon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (411, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/411.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (411, N'https://img.pokemondb.net/sprites/home/normal/bastiodon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (411, N'https://img.pokemondb.net/sprites/x-y/normal/bastiodon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (412, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/412.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (412, N'https://img.pokemondb.net/sprites/home/normal/burmy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (412, N'https://img.pokemondb.net/sprites/x-y/normal/burmy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (413, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/413.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (413, N'https://img.pokemondb.net/sprites/home/normal/wormadam.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (413, N'https://img.pokemondb.net/sprites/x-y/normal/wormadam.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (414, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/414.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (414, N'https://img.pokemondb.net/sprites/home/normal/mothim.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (414, N'https://img.pokemondb.net/sprites/x-y/normal/mothim.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (415, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/415.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (415, N'https://img.pokemondb.net/sprites/home/normal/combee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (415, N'https://img.pokemondb.net/sprites/x-y/normal/combee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (416, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/416.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (416, N'https://img.pokemondb.net/sprites/home/normal/vespiquen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (416, N'https://img.pokemondb.net/sprites/x-y/normal/vespiquen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (417, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/417.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (417, N'https://img.pokemondb.net/sprites/home/normal/pachirisu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (417, N'https://img.pokemondb.net/sprites/x-y/normal/pachirisu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (418, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/418.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (418, N'https://img.pokemondb.net/sprites/home/normal/buizel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (418, N'https://img.pokemondb.net/sprites/x-y/normal/buizel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (419, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/419.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (419, N'https://img.pokemondb.net/sprites/home/normal/floatzel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (419, N'https://img.pokemondb.net/sprites/x-y/normal/floatzel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (420, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/420.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (420, N'https://img.pokemondb.net/sprites/home/normal/cherubi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (420, N'https://img.pokemondb.net/sprites/x-y/normal/cherubi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (421, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/421.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (421, N'https://img.pokemondb.net/sprites/home/normal/cherrim.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (421, N'https://img.pokemondb.net/sprites/x-y/normal/cherrim.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (422, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/422.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (422, N'https://img.pokemondb.net/sprites/home/normal/shellos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (422, N'https://img.pokemondb.net/sprites/x-y/normal/shellos.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (423, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/423.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (423, N'https://img.pokemondb.net/sprites/home/normal/gastrodon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (423, N'https://img.pokemondb.net/sprites/x-y/normal/gastrodon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (424, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/424.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (424, N'https://img.pokemondb.net/sprites/home/normal/ambipom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (424, N'https://img.pokemondb.net/sprites/x-y/normal/ambipom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (425, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/425.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (425, N'https://img.pokemondb.net/sprites/home/normal/drifloon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (425, N'https://img.pokemondb.net/sprites/x-y/normal/drifloon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (426, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/426.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (426, N'https://img.pokemondb.net/sprites/home/normal/drifblim.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (426, N'https://img.pokemondb.net/sprites/x-y/normal/drifblim.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (427, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/427.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (427, N'https://img.pokemondb.net/sprites/home/normal/buneary.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (427, N'https://img.pokemondb.net/sprites/x-y/normal/buneary.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (428, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/428.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (428, N'https://img.pokemondb.net/sprites/home/normal/lopunny.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (428, N'https://img.pokemondb.net/sprites/x-y/normal/lopunny.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (429, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/429.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (429, N'https://img.pokemondb.net/sprites/home/normal/mismagius.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (429, N'https://img.pokemondb.net/sprites/x-y/normal/mismagius.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (430, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/430.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (430, N'https://img.pokemondb.net/sprites/home/normal/honchkrow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (430, N'https://img.pokemondb.net/sprites/x-y/normal/honchkrow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (431, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/431.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (431, N'https://img.pokemondb.net/sprites/home/normal/glameow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (431, N'https://img.pokemondb.net/sprites/x-y/normal/glameow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (432, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/432.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (432, N'https://img.pokemondb.net/sprites/home/normal/purugly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (432, N'https://img.pokemondb.net/sprites/x-y/normal/purugly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (433, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/433.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (433, N'https://img.pokemondb.net/sprites/home/normal/chingling.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (433, N'https://img.pokemondb.net/sprites/x-y/normal/chingling.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (434, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/434.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (434, N'https://img.pokemondb.net/sprites/home/normal/stunky.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (434, N'https://img.pokemondb.net/sprites/x-y/normal/stunky.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (435, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/435.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (435, N'https://img.pokemondb.net/sprites/home/normal/skuntank.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (435, N'https://img.pokemondb.net/sprites/x-y/normal/skuntank.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (436, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/436.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (436, N'https://img.pokemondb.net/sprites/home/normal/bronzor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (436, N'https://img.pokemondb.net/sprites/x-y/normal/bronzor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (437, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/437.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (437, N'https://img.pokemondb.net/sprites/home/normal/bronzong.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (437, N'https://img.pokemondb.net/sprites/x-y/normal/bronzong.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (438, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/438.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (438, N'https://img.pokemondb.net/sprites/home/normal/bonsly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (438, N'https://img.pokemondb.net/sprites/x-y/normal/bonsly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (439, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/439.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (439, N'https://img.pokemondb.net/sprites/home/normal/mime-jr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (439, N'https://img.pokemondb.net/sprites/x-y/normal/mime-jr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (440, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/440.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (440, N'https://img.pokemondb.net/sprites/home/normal/happiny.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (440, N'https://img.pokemondb.net/sprites/x-y/normal/happiny.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (441, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/441.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (441, N'https://img.pokemondb.net/sprites/home/normal/chatot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (441, N'https://img.pokemondb.net/sprites/x-y/normal/chatot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (442, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/442.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (442, N'https://img.pokemondb.net/sprites/home/normal/spiritomb.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (442, N'https://img.pokemondb.net/sprites/x-y/normal/spiritomb.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (443, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/443.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (443, N'https://img.pokemondb.net/sprites/home/normal/gible.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (443, N'https://img.pokemondb.net/sprites/x-y/normal/gible.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (444, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/444.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (444, N'https://img.pokemondb.net/sprites/home/normal/gabite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (444, N'https://img.pokemondb.net/sprites/x-y/normal/gabite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (445, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/445.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (445, N'https://img.pokemondb.net/sprites/home/normal/garchomp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (445, N'https://img.pokemondb.net/sprites/x-y/normal/garchomp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (446, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/446.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (446, N'https://img.pokemondb.net/sprites/home/normal/munchlax.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (446, N'https://img.pokemondb.net/sprites/x-y/normal/munchlax.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (447, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/447.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (447, N'https://img.pokemondb.net/sprites/home/normal/riolu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (447, N'https://img.pokemondb.net/sprites/x-y/normal/riolu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (448, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/448.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (448, N'https://img.pokemondb.net/sprites/home/normal/lucario.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (448, N'https://img.pokemondb.net/sprites/x-y/normal/lucario.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (449, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/449.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (449, N'https://img.pokemondb.net/sprites/home/normal/hippopotas.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (449, N'https://img.pokemondb.net/sprites/x-y/normal/hippopotas.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (450, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/450.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (450, N'https://img.pokemondb.net/sprites/home/normal/hippowdon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (450, N'https://img.pokemondb.net/sprites/x-y/normal/hippowdon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (451, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/451.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (451, N'https://img.pokemondb.net/sprites/home/normal/skorupi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (451, N'https://img.pokemondb.net/sprites/x-y/normal/skorupi.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (452, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/452.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (452, N'https://img.pokemondb.net/sprites/home/normal/drapion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (452, N'https://img.pokemondb.net/sprites/x-y/normal/drapion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (453, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/453.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (453, N'https://img.pokemondb.net/sprites/home/normal/croagunk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (453, N'https://img.pokemondb.net/sprites/x-y/normal/croagunk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (454, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/454.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (454, N'https://img.pokemondb.net/sprites/home/normal/toxicroak.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (454, N'https://img.pokemondb.net/sprites/x-y/normal/toxicroak.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (455, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/455.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (455, N'https://img.pokemondb.net/sprites/home/normal/carnivine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (455, N'https://img.pokemondb.net/sprites/x-y/normal/carnivine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (456, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/456.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (456, N'https://img.pokemondb.net/sprites/home/normal/finneon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (456, N'https://img.pokemondb.net/sprites/x-y/normal/finneon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (457, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/457.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (457, N'https://img.pokemondb.net/sprites/home/normal/lumineon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (457, N'https://img.pokemondb.net/sprites/x-y/normal/lumineon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (458, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/458.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (458, N'https://img.pokemondb.net/sprites/home/normal/mantyke.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (458, N'https://img.pokemondb.net/sprites/x-y/normal/mantyke.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (459, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/459.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (459, N'https://img.pokemondb.net/sprites/home/normal/snover.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (459, N'https://img.pokemondb.net/sprites/x-y/normal/snover.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (460, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/460.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (460, N'https://img.pokemondb.net/sprites/home/normal/abomasnow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (460, N'https://img.pokemondb.net/sprites/x-y/normal/abomasnow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (461, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/461.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (461, N'https://img.pokemondb.net/sprites/home/normal/weavile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (461, N'https://img.pokemondb.net/sprites/x-y/normal/weavile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (462, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/462.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (462, N'https://img.pokemondb.net/sprites/home/normal/magnezone.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (462, N'https://img.pokemondb.net/sprites/x-y/normal/magnezone.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (463, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/463.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (463, N'https://img.pokemondb.net/sprites/home/normal/lickilicky.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (463, N'https://img.pokemondb.net/sprites/x-y/normal/lickilicky.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (464, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/464.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (464, N'https://img.pokemondb.net/sprites/home/normal/rhyperior.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (464, N'https://img.pokemondb.net/sprites/x-y/normal/rhyperior.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (465, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/465.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (465, N'https://img.pokemondb.net/sprites/home/normal/tangrowth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (465, N'https://img.pokemondb.net/sprites/x-y/normal/tangrowth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (466, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/466.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (466, N'https://img.pokemondb.net/sprites/home/normal/electivire.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (466, N'https://img.pokemondb.net/sprites/x-y/normal/electivire.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (467, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/467.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (467, N'https://img.pokemondb.net/sprites/home/normal/magmortar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (467, N'https://img.pokemondb.net/sprites/x-y/normal/magmortar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (468, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/468.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (468, N'https://img.pokemondb.net/sprites/home/normal/togekiss.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (468, N'https://img.pokemondb.net/sprites/x-y/normal/togekiss.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (469, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/469.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (469, N'https://img.pokemondb.net/sprites/home/normal/yanmega.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (469, N'https://img.pokemondb.net/sprites/x-y/normal/yanmega.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (470, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/470.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (470, N'https://img.pokemondb.net/sprites/home/normal/leafeon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (470, N'https://img.pokemondb.net/sprites/x-y/normal/leafeon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (471, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/471.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (471, N'https://img.pokemondb.net/sprites/home/normal/glaceon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (471, N'https://img.pokemondb.net/sprites/x-y/normal/glaceon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (472, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/472.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (472, N'https://img.pokemondb.net/sprites/home/normal/gliscor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (472, N'https://img.pokemondb.net/sprites/x-y/normal/gliscor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (473, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/473.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (473, N'https://img.pokemondb.net/sprites/home/normal/mamoswine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (473, N'https://img.pokemondb.net/sprites/x-y/normal/mamoswine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (474, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/474.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (474, N'https://img.pokemondb.net/sprites/home/normal/porygon-z.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (474, N'https://img.pokemondb.net/sprites/x-y/normal/porygon-z.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (475, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/475.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (475, N'https://img.pokemondb.net/sprites/home/normal/gallade.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (475, N'https://img.pokemondb.net/sprites/x-y/normal/gallade.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (476, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/476.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (476, N'https://img.pokemondb.net/sprites/home/normal/probopass.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (476, N'https://img.pokemondb.net/sprites/x-y/normal/probopass.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (477, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/477.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (477, N'https://img.pokemondb.net/sprites/home/normal/dusknoir.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (477, N'https://img.pokemondb.net/sprites/x-y/normal/dusknoir.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (478, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/478.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (478, N'https://img.pokemondb.net/sprites/home/normal/froslass.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (478, N'https://img.pokemondb.net/sprites/x-y/normal/froslass.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (479, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/479.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (479, N'https://img.pokemondb.net/sprites/home/normal/rotom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (479, N'https://img.pokemondb.net/sprites/x-y/normal/rotom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (480, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/480.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (480, N'https://img.pokemondb.net/sprites/home/normal/uxie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (480, N'https://img.pokemondb.net/sprites/x-y/normal/uxie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (481, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/481.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (481, N'https://img.pokemondb.net/sprites/home/normal/mesprit.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (481, N'https://img.pokemondb.net/sprites/x-y/normal/mesprit.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (482, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/482.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (482, N'https://img.pokemondb.net/sprites/home/normal/azelf.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (482, N'https://img.pokemondb.net/sprites/x-y/normal/azelf.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (483, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/483.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (483, N'https://img.pokemondb.net/sprites/home/normal/dialga.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (483, N'https://img.pokemondb.net/sprites/x-y/normal/dialga.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (484, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/484.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (484, N'https://img.pokemondb.net/sprites/home/normal/palkia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (484, N'https://img.pokemondb.net/sprites/x-y/normal/palkia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (485, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/485.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (485, N'https://img.pokemondb.net/sprites/home/normal/heatran.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (485, N'https://img.pokemondb.net/sprites/x-y/normal/heatran.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (486, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/486.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (486, N'https://img.pokemondb.net/sprites/home/normal/regigigas.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (486, N'https://img.pokemondb.net/sprites/x-y/normal/regigigas.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (487, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/487.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (487, N'https://img.pokemondb.net/sprites/home/normal/giratina.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (487, N'https://img.pokemondb.net/sprites/x-y/normal/giratina.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (488, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/488.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (488, N'https://img.pokemondb.net/sprites/home/normal/cresselia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (488, N'https://img.pokemondb.net/sprites/x-y/normal/cresselia.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (489, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/489.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (489, N'https://img.pokemondb.net/sprites/home/normal/phione.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (489, N'https://img.pokemondb.net/sprites/x-y/normal/phione.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (490, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/490.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (490, N'https://img.pokemondb.net/sprites/home/normal/manaphy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (490, N'https://img.pokemondb.net/sprites/x-y/normal/manaphy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (491, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/491.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (491, N'https://img.pokemondb.net/sprites/home/normal/darkrai.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (491, N'https://img.pokemondb.net/sprites/x-y/normal/darkrai.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (492, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/492.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (492, N'https://img.pokemondb.net/sprites/home/normal/shaymin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (492, N'https://img.pokemondb.net/sprites/x-y/normal/shaymin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (493, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/493.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (493, N'https://img.pokemondb.net/sprites/home/normal/arceus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (493, N'https://img.pokemondb.net/sprites/x-y/normal/arceus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (494, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/494.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (494, N'https://img.pokemondb.net/sprites/home/normal/victini.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (494, N'https://img.pokemondb.net/sprites/x-y/normal/victini.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (495, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/495.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (495, N'https://img.pokemondb.net/sprites/home/normal/snivy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (495, N'https://img.pokemondb.net/sprites/x-y/normal/snivy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (496, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/496.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (496, N'https://img.pokemondb.net/sprites/home/normal/servine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (496, N'https://img.pokemondb.net/sprites/x-y/normal/servine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (497, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/497.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (497, N'https://img.pokemondb.net/sprites/home/normal/serperior.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (497, N'https://img.pokemondb.net/sprites/x-y/normal/serperior.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (498, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/498.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (498, N'https://img.pokemondb.net/sprites/home/normal/tepig.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (498, N'https://img.pokemondb.net/sprites/x-y/normal/tepig.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (499, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/499.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (499, N'https://img.pokemondb.net/sprites/home/normal/pignite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (499, N'https://img.pokemondb.net/sprites/x-y/normal/pignite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (500, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/500.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (500, N'https://img.pokemondb.net/sprites/home/normal/emboar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (500, N'https://img.pokemondb.net/sprites/x-y/normal/emboar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (501, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/501.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (501, N'https://img.pokemondb.net/sprites/home/normal/oshawott.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (501, N'https://img.pokemondb.net/sprites/x-y/normal/oshawott.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (502, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/502.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (502, N'https://img.pokemondb.net/sprites/home/normal/dewott.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (502, N'https://img.pokemondb.net/sprites/x-y/normal/dewott.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (503, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/503.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (503, N'https://img.pokemondb.net/sprites/home/normal/samurott.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (503, N'https://img.pokemondb.net/sprites/x-y/normal/samurott.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (504, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/504.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (504, N'https://img.pokemondb.net/sprites/home/normal/patrat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (504, N'https://img.pokemondb.net/sprites/x-y/normal/patrat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (505, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/505.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (505, N'https://img.pokemondb.net/sprites/home/normal/watchog.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (505, N'https://img.pokemondb.net/sprites/x-y/normal/watchog.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (506, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/506.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (506, N'https://img.pokemondb.net/sprites/home/normal/lillipup.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (506, N'https://img.pokemondb.net/sprites/x-y/normal/lillipup.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (507, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/507.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (507, N'https://img.pokemondb.net/sprites/home/normal/herdier.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (507, N'https://img.pokemondb.net/sprites/x-y/normal/herdier.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (508, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/508.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (508, N'https://img.pokemondb.net/sprites/home/normal/stoutland.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (508, N'https://img.pokemondb.net/sprites/x-y/normal/stoutland.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (509, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/509.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (509, N'https://img.pokemondb.net/sprites/home/normal/purrloin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (509, N'https://img.pokemondb.net/sprites/x-y/normal/purrloin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (510, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/510.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (510, N'https://img.pokemondb.net/sprites/home/normal/liepard.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (510, N'https://img.pokemondb.net/sprites/x-y/normal/liepard.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (511, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/511.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (511, N'https://img.pokemondb.net/sprites/home/normal/pansage.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (511, N'https://img.pokemondb.net/sprites/x-y/normal/pansage.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (512, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/512.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (512, N'https://img.pokemondb.net/sprites/home/normal/simisage.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (512, N'https://img.pokemondb.net/sprites/x-y/normal/simisage.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (513, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/513.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (513, N'https://img.pokemondb.net/sprites/home/normal/pansear.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (513, N'https://img.pokemondb.net/sprites/x-y/normal/pansear.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (514, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/514.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (514, N'https://img.pokemondb.net/sprites/home/normal/simisear.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (514, N'https://img.pokemondb.net/sprites/x-y/normal/simisear.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (515, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/515.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (515, N'https://img.pokemondb.net/sprites/home/normal/panpour.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (515, N'https://img.pokemondb.net/sprites/x-y/normal/panpour.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (516, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/516.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (516, N'https://img.pokemondb.net/sprites/home/normal/simipour.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (516, N'https://img.pokemondb.net/sprites/x-y/normal/simipour.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (517, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/517.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (517, N'https://img.pokemondb.net/sprites/home/normal/munna.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (517, N'https://img.pokemondb.net/sprites/x-y/normal/munna.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (518, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/518.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (518, N'https://img.pokemondb.net/sprites/home/normal/musharna.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (518, N'https://img.pokemondb.net/sprites/x-y/normal/musharna.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (519, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/519.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (519, N'https://img.pokemondb.net/sprites/home/normal/pidove.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (519, N'https://img.pokemondb.net/sprites/x-y/normal/pidove.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (520, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/520.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (520, N'https://img.pokemondb.net/sprites/home/normal/tranquill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (520, N'https://img.pokemondb.net/sprites/x-y/normal/tranquill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (521, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/521.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (521, N'https://img.pokemondb.net/sprites/home/normal/unfezant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (521, N'https://img.pokemondb.net/sprites/x-y/normal/unfezant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (522, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/522.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (522, N'https://img.pokemondb.net/sprites/home/normal/blitzle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (522, N'https://img.pokemondb.net/sprites/x-y/normal/blitzle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (523, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/523.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (523, N'https://img.pokemondb.net/sprites/home/normal/zebstrika.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (523, N'https://img.pokemondb.net/sprites/x-y/normal/zebstrika.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (524, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/524.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (524, N'https://img.pokemondb.net/sprites/home/normal/roggenrola.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (524, N'https://img.pokemondb.net/sprites/x-y/normal/roggenrola.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (525, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/525.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (525, N'https://img.pokemondb.net/sprites/home/normal/boldore.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (525, N'https://img.pokemondb.net/sprites/x-y/normal/boldore.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (526, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/526.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (526, N'https://img.pokemondb.net/sprites/home/normal/gigalith.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (526, N'https://img.pokemondb.net/sprites/x-y/normal/gigalith.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (527, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/527.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (527, N'https://img.pokemondb.net/sprites/home/normal/woobat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (527, N'https://img.pokemondb.net/sprites/x-y/normal/woobat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (528, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/528.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (528, N'https://img.pokemondb.net/sprites/home/normal/swoobat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (528, N'https://img.pokemondb.net/sprites/x-y/normal/swoobat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (529, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/529.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (529, N'https://img.pokemondb.net/sprites/home/normal/drilbur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (529, N'https://img.pokemondb.net/sprites/x-y/normal/drilbur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (530, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/530.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (530, N'https://img.pokemondb.net/sprites/home/normal/excadrill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (530, N'https://img.pokemondb.net/sprites/x-y/normal/excadrill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (531, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/531.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (531, N'https://img.pokemondb.net/sprites/home/normal/audino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (531, N'https://img.pokemondb.net/sprites/x-y/normal/audino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (532, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/532.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (532, N'https://img.pokemondb.net/sprites/home/normal/timburr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (532, N'https://img.pokemondb.net/sprites/x-y/normal/timburr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (533, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/533.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (533, N'https://img.pokemondb.net/sprites/home/normal/gurdurr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (533, N'https://img.pokemondb.net/sprites/x-y/normal/gurdurr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (534, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/534.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (534, N'https://img.pokemondb.net/sprites/home/normal/conkeldurr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (534, N'https://img.pokemondb.net/sprites/x-y/normal/conkeldurr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (535, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/535.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (535, N'https://img.pokemondb.net/sprites/home/normal/tympole.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (535, N'https://img.pokemondb.net/sprites/x-y/normal/tympole.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (536, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/536.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (536, N'https://img.pokemondb.net/sprites/home/normal/palpitoad.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (536, N'https://img.pokemondb.net/sprites/x-y/normal/palpitoad.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (537, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/537.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (537, N'https://img.pokemondb.net/sprites/home/normal/seismitoad.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (537, N'https://img.pokemondb.net/sprites/x-y/normal/seismitoad.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (538, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/538.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (538, N'https://img.pokemondb.net/sprites/home/normal/throh.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (538, N'https://img.pokemondb.net/sprites/x-y/normal/throh.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (539, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/539.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (539, N'https://img.pokemondb.net/sprites/home/normal/sawk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (539, N'https://img.pokemondb.net/sprites/x-y/normal/sawk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (540, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/540.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (540, N'https://img.pokemondb.net/sprites/home/normal/sewaddle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (540, N'https://img.pokemondb.net/sprites/x-y/normal/sewaddle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (541, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/541.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (541, N'https://img.pokemondb.net/sprites/home/normal/swadloon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (541, N'https://img.pokemondb.net/sprites/x-y/normal/swadloon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (542, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/542.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (542, N'https://img.pokemondb.net/sprites/home/normal/leavanny.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (542, N'https://img.pokemondb.net/sprites/x-y/normal/leavanny.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (543, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/543.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (543, N'https://img.pokemondb.net/sprites/home/normal/venipede.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (543, N'https://img.pokemondb.net/sprites/x-y/normal/venipede.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (544, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/544.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (544, N'https://img.pokemondb.net/sprites/home/normal/whirlipede.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (544, N'https://img.pokemondb.net/sprites/x-y/normal/whirlipede.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (545, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/545.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (545, N'https://img.pokemondb.net/sprites/home/normal/scolipede.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (545, N'https://img.pokemondb.net/sprites/x-y/normal/scolipede.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (546, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/546.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (546, N'https://img.pokemondb.net/sprites/home/normal/cottonee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (546, N'https://img.pokemondb.net/sprites/x-y/normal/cottonee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (547, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/547.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (547, N'https://img.pokemondb.net/sprites/home/normal/whimsicott.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (547, N'https://img.pokemondb.net/sprites/x-y/normal/whimsicott.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (548, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/548.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (548, N'https://img.pokemondb.net/sprites/home/normal/petilil.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (548, N'https://img.pokemondb.net/sprites/x-y/normal/petilil.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (549, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/549.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (549, N'https://img.pokemondb.net/sprites/home/normal/lilligant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (549, N'https://img.pokemondb.net/sprites/x-y/normal/lilligant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (550, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/550.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (550, N'https://img.pokemondb.net/sprites/home/normal/basculin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (550, N'https://img.pokemondb.net/sprites/x-y/normal/basculin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (551, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/551.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (551, N'https://img.pokemondb.net/sprites/home/normal/sandile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (551, N'https://img.pokemondb.net/sprites/x-y/normal/sandile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (552, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/552.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (552, N'https://img.pokemondb.net/sprites/home/normal/krokorok.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (552, N'https://img.pokemondb.net/sprites/x-y/normal/krokorok.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (553, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/553.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (553, N'https://img.pokemondb.net/sprites/home/normal/krookodile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (553, N'https://img.pokemondb.net/sprites/x-y/normal/krookodile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (554, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/554.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (554, N'https://img.pokemondb.net/sprites/home/normal/darumaka.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (554, N'https://img.pokemondb.net/sprites/x-y/normal/darumaka.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (555, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/555.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (555, N'https://img.pokemondb.net/sprites/home/normal/darmanitan.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (555, N'https://img.pokemondb.net/sprites/x-y/normal/darmanitan.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (556, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/556.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (556, N'https://img.pokemondb.net/sprites/home/normal/maractus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (556, N'https://img.pokemondb.net/sprites/x-y/normal/maractus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (557, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/557.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (557, N'https://img.pokemondb.net/sprites/home/normal/dwebble.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (557, N'https://img.pokemondb.net/sprites/x-y/normal/dwebble.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (558, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/558.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (558, N'https://img.pokemondb.net/sprites/home/normal/crustle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (558, N'https://img.pokemondb.net/sprites/x-y/normal/crustle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (559, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/559.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (559, N'https://img.pokemondb.net/sprites/home/normal/scraggy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (559, N'https://img.pokemondb.net/sprites/x-y/normal/scraggy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (560, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/560.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (560, N'https://img.pokemondb.net/sprites/home/normal/scrafty.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (560, N'https://img.pokemondb.net/sprites/x-y/normal/scrafty.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (561, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/561.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (561, N'https://img.pokemondb.net/sprites/home/normal/sigilyph.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (561, N'https://img.pokemondb.net/sprites/x-y/normal/sigilyph.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (562, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/562.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (562, N'https://img.pokemondb.net/sprites/home/normal/yamask.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (562, N'https://img.pokemondb.net/sprites/x-y/normal/yamask.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (563, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/563.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (563, N'https://img.pokemondb.net/sprites/home/normal/cofagrigus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (563, N'https://img.pokemondb.net/sprites/x-y/normal/cofagrigus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (564, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/564.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (564, N'https://img.pokemondb.net/sprites/home/normal/tirtouga.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (564, N'https://img.pokemondb.net/sprites/x-y/normal/tirtouga.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (565, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/565.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (565, N'https://img.pokemondb.net/sprites/home/normal/carracosta.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (565, N'https://img.pokemondb.net/sprites/x-y/normal/carracosta.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (566, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/566.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (566, N'https://img.pokemondb.net/sprites/home/normal/archen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (566, N'https://img.pokemondb.net/sprites/x-y/normal/archen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (567, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/567.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (567, N'https://img.pokemondb.net/sprites/home/normal/archeops.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (567, N'https://img.pokemondb.net/sprites/x-y/normal/archeops.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (568, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/568.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (568, N'https://img.pokemondb.net/sprites/home/normal/trubbish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (568, N'https://img.pokemondb.net/sprites/x-y/normal/trubbish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (569, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/569.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (569, N'https://img.pokemondb.net/sprites/home/normal/garbodor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (569, N'https://img.pokemondb.net/sprites/x-y/normal/garbodor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (570, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/570.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (570, N'https://img.pokemondb.net/sprites/home/normal/zorua.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (570, N'https://img.pokemondb.net/sprites/x-y/normal/zorua.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (571, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/571.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (571, N'https://img.pokemondb.net/sprites/home/normal/zoroark.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (571, N'https://img.pokemondb.net/sprites/x-y/normal/zoroark.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (572, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/572.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (572, N'https://img.pokemondb.net/sprites/home/normal/minccino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (572, N'https://img.pokemondb.net/sprites/x-y/normal/minccino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (573, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/573.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (573, N'https://img.pokemondb.net/sprites/home/normal/cinccino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (573, N'https://img.pokemondb.net/sprites/x-y/normal/cinccino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (574, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/574.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (574, N'https://img.pokemondb.net/sprites/home/normal/gothita.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (574, N'https://img.pokemondb.net/sprites/x-y/normal/gothita.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (575, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/575.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (575, N'https://img.pokemondb.net/sprites/home/normal/gothorita.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (575, N'https://img.pokemondb.net/sprites/x-y/normal/gothorita.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (576, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/576.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (576, N'https://img.pokemondb.net/sprites/home/normal/gothitelle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (576, N'https://img.pokemondb.net/sprites/x-y/normal/gothitelle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (577, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/577.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (577, N'https://img.pokemondb.net/sprites/home/normal/solosis.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (577, N'https://img.pokemondb.net/sprites/x-y/normal/solosis.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (578, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/578.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (578, N'https://img.pokemondb.net/sprites/home/normal/duosion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (578, N'https://img.pokemondb.net/sprites/x-y/normal/duosion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (579, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/579.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (579, N'https://img.pokemondb.net/sprites/home/normal/reuniclus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (579, N'https://img.pokemondb.net/sprites/x-y/normal/reuniclus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (580, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/580.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (580, N'https://img.pokemondb.net/sprites/home/normal/ducklett.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (580, N'https://img.pokemondb.net/sprites/x-y/normal/ducklett.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (581, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/581.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (581, N'https://img.pokemondb.net/sprites/home/normal/swanna.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (581, N'https://img.pokemondb.net/sprites/x-y/normal/swanna.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (582, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/582.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (582, N'https://img.pokemondb.net/sprites/home/normal/vanillite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (582, N'https://img.pokemondb.net/sprites/x-y/normal/vanillite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (583, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/583.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (583, N'https://img.pokemondb.net/sprites/home/normal/vanillish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (583, N'https://img.pokemondb.net/sprites/x-y/normal/vanillish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (584, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/584.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (584, N'https://img.pokemondb.net/sprites/home/normal/vanilluxe.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (584, N'https://img.pokemondb.net/sprites/x-y/normal/vanilluxe.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (585, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/585.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (585, N'https://img.pokemondb.net/sprites/home/normal/deerling.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (585, N'https://img.pokemondb.net/sprites/x-y/normal/deerling.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (586, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/586.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (586, N'https://img.pokemondb.net/sprites/home/normal/sawsbuck.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (586, N'https://img.pokemondb.net/sprites/x-y/normal/sawsbuck.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (587, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/587.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (587, N'https://img.pokemondb.net/sprites/home/normal/emolga.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (587, N'https://img.pokemondb.net/sprites/x-y/normal/emolga.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (588, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/588.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (588, N'https://img.pokemondb.net/sprites/home/normal/karrablast.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (588, N'https://img.pokemondb.net/sprites/x-y/normal/karrablast.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (589, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/589.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (589, N'https://img.pokemondb.net/sprites/home/normal/escavalier.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (589, N'https://img.pokemondb.net/sprites/x-y/normal/escavalier.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (590, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/590.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (590, N'https://img.pokemondb.net/sprites/home/normal/foongus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (590, N'https://img.pokemondb.net/sprites/x-y/normal/foongus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (591, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/591.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (591, N'https://img.pokemondb.net/sprites/home/normal/amoonguss.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (591, N'https://img.pokemondb.net/sprites/x-y/normal/amoonguss.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (592, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/592.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (592, N'https://img.pokemondb.net/sprites/home/normal/frillish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (592, N'https://img.pokemondb.net/sprites/x-y/normal/frillish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (593, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/593.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (593, N'https://img.pokemondb.net/sprites/home/normal/jellicent.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (593, N'https://img.pokemondb.net/sprites/x-y/normal/jellicent.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (594, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/594.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (594, N'https://img.pokemondb.net/sprites/home/normal/alomomola.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (594, N'https://img.pokemondb.net/sprites/x-y/normal/alomomola.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (595, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/595.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (595, N'https://img.pokemondb.net/sprites/home/normal/joltik.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (595, N'https://img.pokemondb.net/sprites/x-y/normal/joltik.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (596, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/596.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (596, N'https://img.pokemondb.net/sprites/home/normal/galvantula.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (596, N'https://img.pokemondb.net/sprites/x-y/normal/galvantula.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (597, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/597.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (597, N'https://img.pokemondb.net/sprites/home/normal/ferroseed.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (597, N'https://img.pokemondb.net/sprites/x-y/normal/ferroseed.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (598, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/598.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (598, N'https://img.pokemondb.net/sprites/home/normal/ferrothorn.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (598, N'https://img.pokemondb.net/sprites/x-y/normal/ferrothorn.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (599, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/599.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (599, N'https://img.pokemondb.net/sprites/home/normal/klink.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (599, N'https://img.pokemondb.net/sprites/x-y/normal/klink.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (600, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/600.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (600, N'https://img.pokemondb.net/sprites/home/normal/klang.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (600, N'https://img.pokemondb.net/sprites/x-y/normal/klang.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (601, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/601.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (601, N'https://img.pokemondb.net/sprites/home/normal/klinklang.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (601, N'https://img.pokemondb.net/sprites/x-y/normal/klinklang.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (602, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/602.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (602, N'https://img.pokemondb.net/sprites/home/normal/tynamo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (602, N'https://img.pokemondb.net/sprites/x-y/normal/tynamo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (603, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/603.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (603, N'https://img.pokemondb.net/sprites/home/normal/eelektrik.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (603, N'https://img.pokemondb.net/sprites/x-y/normal/eelektrik.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (604, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/604.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (604, N'https://img.pokemondb.net/sprites/home/normal/eelektross.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (604, N'https://img.pokemondb.net/sprites/x-y/normal/eelektross.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (605, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/605.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (605, N'https://img.pokemondb.net/sprites/home/normal/elgyem.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (605, N'https://img.pokemondb.net/sprites/x-y/normal/elgyem.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (606, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/606.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (606, N'https://img.pokemondb.net/sprites/home/normal/beheeyem.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (606, N'https://img.pokemondb.net/sprites/x-y/normal/beheeyem.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (607, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/607.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (607, N'https://img.pokemondb.net/sprites/home/normal/litwick.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (607, N'https://img.pokemondb.net/sprites/x-y/normal/litwick.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (608, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/608.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (608, N'https://img.pokemondb.net/sprites/home/normal/lampent.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (608, N'https://img.pokemondb.net/sprites/x-y/normal/lampent.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (609, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/609.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (609, N'https://img.pokemondb.net/sprites/home/normal/chandelure.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (609, N'https://img.pokemondb.net/sprites/x-y/normal/chandelure.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (610, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/610.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (610, N'https://img.pokemondb.net/sprites/home/normal/axew.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (610, N'https://img.pokemondb.net/sprites/x-y/normal/axew.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (611, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/611.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (611, N'https://img.pokemondb.net/sprites/home/normal/fraxure.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (611, N'https://img.pokemondb.net/sprites/x-y/normal/fraxure.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (612, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/612.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (612, N'https://img.pokemondb.net/sprites/home/normal/haxorus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (612, N'https://img.pokemondb.net/sprites/x-y/normal/haxorus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (613, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/613.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (613, N'https://img.pokemondb.net/sprites/home/normal/cubchoo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (613, N'https://img.pokemondb.net/sprites/x-y/normal/cubchoo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (614, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/614.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (614, N'https://img.pokemondb.net/sprites/home/normal/beartic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (614, N'https://img.pokemondb.net/sprites/x-y/normal/beartic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (615, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/615.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (615, N'https://img.pokemondb.net/sprites/home/normal/cryogonal.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (615, N'https://img.pokemondb.net/sprites/x-y/normal/cryogonal.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (616, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/616.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (616, N'https://img.pokemondb.net/sprites/home/normal/shelmet.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (616, N'https://img.pokemondb.net/sprites/x-y/normal/shelmet.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (617, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/617.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (617, N'https://img.pokemondb.net/sprites/home/normal/accelgor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (617, N'https://img.pokemondb.net/sprites/x-y/normal/accelgor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (618, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/618.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (618, N'https://img.pokemondb.net/sprites/home/normal/stunfisk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (618, N'https://img.pokemondb.net/sprites/x-y/normal/stunfisk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (619, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/619.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (619, N'https://img.pokemondb.net/sprites/home/normal/mienfoo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (619, N'https://img.pokemondb.net/sprites/x-y/normal/mienfoo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (620, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/620.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (620, N'https://img.pokemondb.net/sprites/home/normal/mienshao.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (620, N'https://img.pokemondb.net/sprites/x-y/normal/mienshao.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (621, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/621.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (621, N'https://img.pokemondb.net/sprites/home/normal/druddigon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (621, N'https://img.pokemondb.net/sprites/x-y/normal/druddigon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (622, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/622.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (622, N'https://img.pokemondb.net/sprites/home/normal/golett.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (622, N'https://img.pokemondb.net/sprites/x-y/normal/golett.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (623, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/623.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (623, N'https://img.pokemondb.net/sprites/home/normal/golurk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (623, N'https://img.pokemondb.net/sprites/x-y/normal/golurk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (624, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/624.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (624, N'https://img.pokemondb.net/sprites/home/normal/pawniard.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (624, N'https://img.pokemondb.net/sprites/x-y/normal/pawniard.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (625, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/625.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (625, N'https://img.pokemondb.net/sprites/home/normal/bisharp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (625, N'https://img.pokemondb.net/sprites/x-y/normal/bisharp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (626, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/626.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (626, N'https://img.pokemondb.net/sprites/home/normal/bouffalant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (626, N'https://img.pokemondb.net/sprites/x-y/normal/bouffalant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (627, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/627.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (627, N'https://img.pokemondb.net/sprites/home/normal/rufflet.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (627, N'https://img.pokemondb.net/sprites/x-y/normal/rufflet.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (628, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/628.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (628, N'https://img.pokemondb.net/sprites/home/normal/braviary.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (628, N'https://img.pokemondb.net/sprites/x-y/normal/braviary.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (629, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/629.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (629, N'https://img.pokemondb.net/sprites/home/normal/vullaby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (629, N'https://img.pokemondb.net/sprites/x-y/normal/vullaby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (630, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/630.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (630, N'https://img.pokemondb.net/sprites/home/normal/mandibuzz.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (630, N'https://img.pokemondb.net/sprites/x-y/normal/mandibuzz.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (631, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/631.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (631, N'https://img.pokemondb.net/sprites/home/normal/heatmor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (631, N'https://img.pokemondb.net/sprites/x-y/normal/heatmor.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (632, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/632.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (632, N'https://img.pokemondb.net/sprites/home/normal/durant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (632, N'https://img.pokemondb.net/sprites/x-y/normal/durant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (633, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/633.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (633, N'https://img.pokemondb.net/sprites/home/normal/deino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (633, N'https://img.pokemondb.net/sprites/x-y/normal/deino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (634, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/634.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (634, N'https://img.pokemondb.net/sprites/home/normal/zweilous.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (634, N'https://img.pokemondb.net/sprites/x-y/normal/zweilous.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (635, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/635.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (635, N'https://img.pokemondb.net/sprites/home/normal/hydreigon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (635, N'https://img.pokemondb.net/sprites/x-y/normal/hydreigon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (636, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/636.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (636, N'https://img.pokemondb.net/sprites/home/normal/larvesta.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (636, N'https://img.pokemondb.net/sprites/x-y/normal/larvesta.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (637, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/637.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (637, N'https://img.pokemondb.net/sprites/home/normal/volcarona.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (637, N'https://img.pokemondb.net/sprites/x-y/normal/volcarona.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (638, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/638.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (638, N'https://img.pokemondb.net/sprites/home/normal/cobalion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (638, N'https://img.pokemondb.net/sprites/x-y/normal/cobalion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (639, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/639.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (639, N'https://img.pokemondb.net/sprites/home/normal/terrakion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (639, N'https://img.pokemondb.net/sprites/x-y/normal/terrakion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (640, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/640.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (640, N'https://img.pokemondb.net/sprites/home/normal/virizion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (640, N'https://img.pokemondb.net/sprites/x-y/normal/virizion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (641, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/641.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (641, N'https://img.pokemondb.net/sprites/home/normal/tornadus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (641, N'https://img.pokemondb.net/sprites/x-y/normal/tornadus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (642, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/642.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (642, N'https://img.pokemondb.net/sprites/home/normal/thundurus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (642, N'https://img.pokemondb.net/sprites/x-y/normal/thundurus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (643, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/643.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (643, N'https://img.pokemondb.net/sprites/home/normal/reshiram.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (643, N'https://img.pokemondb.net/sprites/x-y/normal/reshiram.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (644, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/644.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (644, N'https://img.pokemondb.net/sprites/home/normal/zekrom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (644, N'https://img.pokemondb.net/sprites/x-y/normal/zekrom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (645, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/645.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (645, N'https://img.pokemondb.net/sprites/home/normal/landorus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (645, N'https://img.pokemondb.net/sprites/x-y/normal/landorus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (646, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/646.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (646, N'https://img.pokemondb.net/sprites/home/normal/kyurem.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (646, N'https://img.pokemondb.net/sprites/x-y/normal/kyurem.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (647, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/647.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (647, N'https://img.pokemondb.net/sprites/home/normal/keldeo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (647, N'https://img.pokemondb.net/sprites/x-y/normal/keldeo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (648, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/648.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (648, N'https://img.pokemondb.net/sprites/home/normal/meloetta.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (648, N'https://img.pokemondb.net/sprites/x-y/normal/meloetta.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (649, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/649.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (649, N'https://img.pokemondb.net/sprites/home/normal/genesect.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (649, N'https://img.pokemondb.net/sprites/x-y/normal/genesect.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (650, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/650.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (650, N'https://img.pokemondb.net/sprites/home/normal/chespin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (650, N'https://img.pokemondb.net/sprites/x-y/normal/chespin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (651, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/651.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (651, N'https://img.pokemondb.net/sprites/home/normal/quilladin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (651, N'https://img.pokemondb.net/sprites/x-y/normal/quilladin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (652, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/652.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (652, N'https://img.pokemondb.net/sprites/home/normal/chesnaught.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (652, N'https://img.pokemondb.net/sprites/x-y/normal/chesnaught.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (653, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/653.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (653, N'https://img.pokemondb.net/sprites/home/normal/fennekin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (653, N'https://img.pokemondb.net/sprites/x-y/normal/fennekin.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (654, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/654.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (654, N'https://img.pokemondb.net/sprites/home/normal/braixen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (654, N'https://img.pokemondb.net/sprites/x-y/normal/braixen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (655, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/655.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (655, N'https://img.pokemondb.net/sprites/home/normal/delphox.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (655, N'https://img.pokemondb.net/sprites/x-y/normal/delphox.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (656, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/656.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (656, N'https://img.pokemondb.net/sprites/home/normal/froakie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (656, N'https://img.pokemondb.net/sprites/x-y/normal/froakie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (657, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/657.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (657, N'https://img.pokemondb.net/sprites/home/normal/frogadier.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (657, N'https://img.pokemondb.net/sprites/x-y/normal/frogadier.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (658, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/658.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (658, N'https://img.pokemondb.net/sprites/home/normal/greninja.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (658, N'https://img.pokemondb.net/sprites/x-y/normal/greninja.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (659, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/659.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (659, N'https://img.pokemondb.net/sprites/home/normal/bunnelby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (659, N'https://img.pokemondb.net/sprites/x-y/normal/bunnelby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (660, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/660.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (660, N'https://img.pokemondb.net/sprites/home/normal/diggersby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (660, N'https://img.pokemondb.net/sprites/x-y/normal/diggersby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (661, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/661.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (661, N'https://img.pokemondb.net/sprites/home/normal/fletchling.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (661, N'https://img.pokemondb.net/sprites/x-y/normal/fletchling.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (662, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/662.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (662, N'https://img.pokemondb.net/sprites/home/normal/fletchinder.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (662, N'https://img.pokemondb.net/sprites/x-y/normal/fletchinder.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (663, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/663.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (663, N'https://img.pokemondb.net/sprites/home/normal/talonflame.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (663, N'https://img.pokemondb.net/sprites/x-y/normal/talonflame.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (664, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/664.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (664, N'https://img.pokemondb.net/sprites/home/normal/scatterbug.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (664, N'https://img.pokemondb.net/sprites/x-y/normal/scatterbug.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (665, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/665.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (665, N'https://img.pokemondb.net/sprites/home/normal/spewpa.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (665, N'https://img.pokemondb.net/sprites/x-y/normal/spewpa.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (666, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/666.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (666, N'https://img.pokemondb.net/sprites/home/normal/vivillon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (666, N'https://img.pokemondb.net/sprites/x-y/normal/vivillon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (667, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/667.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (667, N'https://img.pokemondb.net/sprites/home/normal/litleo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (667, N'https://img.pokemondb.net/sprites/x-y/normal/litleo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (668, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/668.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (668, N'https://img.pokemondb.net/sprites/home/normal/pyroar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (668, N'https://img.pokemondb.net/sprites/x-y/normal/pyroar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (669, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/669.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (669, N'https://img.pokemondb.net/sprites/home/normal/flabébé.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (669, N'https://img.pokemondb.net/sprites/x-y/normal/flabébé.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (670, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/670.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (670, N'https://img.pokemondb.net/sprites/home/normal/floette.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (670, N'https://img.pokemondb.net/sprites/x-y/normal/floette.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (671, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/671.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (671, N'https://img.pokemondb.net/sprites/home/normal/florges.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (671, N'https://img.pokemondb.net/sprites/x-y/normal/florges.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (672, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/672.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (672, N'https://img.pokemondb.net/sprites/home/normal/skiddo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (672, N'https://img.pokemondb.net/sprites/x-y/normal/skiddo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (673, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/673.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (673, N'https://img.pokemondb.net/sprites/home/normal/gogoat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (673, N'https://img.pokemondb.net/sprites/x-y/normal/gogoat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (674, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/674.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (674, N'https://img.pokemondb.net/sprites/home/normal/pancham.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (674, N'https://img.pokemondb.net/sprites/x-y/normal/pancham.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (675, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/675.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (675, N'https://img.pokemondb.net/sprites/home/normal/pangoro.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (675, N'https://img.pokemondb.net/sprites/x-y/normal/pangoro.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (676, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/676.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (676, N'https://img.pokemondb.net/sprites/home/normal/furfrou.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (676, N'https://img.pokemondb.net/sprites/x-y/normal/furfrou.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (677, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/677.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (677, N'https://img.pokemondb.net/sprites/home/normal/espurr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (677, N'https://img.pokemondb.net/sprites/x-y/normal/espurr.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (678, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/678.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (678, N'https://img.pokemondb.net/sprites/home/normal/meowstic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (678, N'https://img.pokemondb.net/sprites/x-y/normal/meowstic.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (679, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/679.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (679, N'https://img.pokemondb.net/sprites/home/normal/honedge.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (679, N'https://img.pokemondb.net/sprites/x-y/normal/honedge.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (680, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/680.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (680, N'https://img.pokemondb.net/sprites/home/normal/doublade.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (680, N'https://img.pokemondb.net/sprites/x-y/normal/doublade.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (681, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/681.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (681, N'https://img.pokemondb.net/sprites/home/normal/aegislash.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (681, N'https://img.pokemondb.net/sprites/x-y/normal/aegislash.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (682, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/682.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (682, N'https://img.pokemondb.net/sprites/home/normal/spritzee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (682, N'https://img.pokemondb.net/sprites/x-y/normal/spritzee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (683, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/683.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (683, N'https://img.pokemondb.net/sprites/home/normal/aromatisse.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (683, N'https://img.pokemondb.net/sprites/x-y/normal/aromatisse.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (684, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/684.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (684, N'https://img.pokemondb.net/sprites/home/normal/swirlix.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (684, N'https://img.pokemondb.net/sprites/x-y/normal/swirlix.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (685, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/685.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (685, N'https://img.pokemondb.net/sprites/home/normal/slurpuff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (685, N'https://img.pokemondb.net/sprites/x-y/normal/slurpuff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (686, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/686.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (686, N'https://img.pokemondb.net/sprites/home/normal/inkay.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (686, N'https://img.pokemondb.net/sprites/x-y/normal/inkay.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (687, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/687.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (687, N'https://img.pokemondb.net/sprites/home/normal/malamar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (687, N'https://img.pokemondb.net/sprites/x-y/normal/malamar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (688, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/688.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (688, N'https://img.pokemondb.net/sprites/home/normal/binacle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (688, N'https://img.pokemondb.net/sprites/x-y/normal/binacle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (689, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/689.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (689, N'https://img.pokemondb.net/sprites/home/normal/barbaracle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (689, N'https://img.pokemondb.net/sprites/x-y/normal/barbaracle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (690, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/690.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (690, N'https://img.pokemondb.net/sprites/home/normal/skrelp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (690, N'https://img.pokemondb.net/sprites/x-y/normal/skrelp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (691, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/691.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (691, N'https://img.pokemondb.net/sprites/home/normal/dragalge.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (691, N'https://img.pokemondb.net/sprites/x-y/normal/dragalge.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (692, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/692.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (692, N'https://img.pokemondb.net/sprites/home/normal/clauncher.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (692, N'https://img.pokemondb.net/sprites/x-y/normal/clauncher.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (693, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/693.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (693, N'https://img.pokemondb.net/sprites/home/normal/clawitzer.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (693, N'https://img.pokemondb.net/sprites/x-y/normal/clawitzer.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (694, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/694.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (694, N'https://img.pokemondb.net/sprites/home/normal/helioptile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (694, N'https://img.pokemondb.net/sprites/x-y/normal/helioptile.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (695, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/695.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (695, N'https://img.pokemondb.net/sprites/home/normal/heliolisk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (695, N'https://img.pokemondb.net/sprites/x-y/normal/heliolisk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (696, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/696.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (696, N'https://img.pokemondb.net/sprites/home/normal/tyrunt.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (696, N'https://img.pokemondb.net/sprites/x-y/normal/tyrunt.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (697, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/697.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (697, N'https://img.pokemondb.net/sprites/home/normal/tyrantrum.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (697, N'https://img.pokemondb.net/sprites/x-y/normal/tyrantrum.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (698, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/698.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (698, N'https://img.pokemondb.net/sprites/home/normal/amaura.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (698, N'https://img.pokemondb.net/sprites/x-y/normal/amaura.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (699, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/699.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (699, N'https://img.pokemondb.net/sprites/home/normal/aurorus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (699, N'https://img.pokemondb.net/sprites/x-y/normal/aurorus.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (700, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/700.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (700, N'https://img.pokemondb.net/sprites/home/normal/sylveon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (700, N'https://img.pokemondb.net/sprites/x-y/normal/sylveon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (701, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/701.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (701, N'https://img.pokemondb.net/sprites/home/normal/hawlucha.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (701, N'https://img.pokemondb.net/sprites/x-y/normal/hawlucha.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (702, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/702.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (702, N'https://img.pokemondb.net/sprites/home/normal/dedenne.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (702, N'https://img.pokemondb.net/sprites/x-y/normal/dedenne.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (703, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/703.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (703, N'https://img.pokemondb.net/sprites/home/normal/carbink.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (703, N'https://img.pokemondb.net/sprites/x-y/normal/carbink.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (704, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/704.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (704, N'https://img.pokemondb.net/sprites/home/normal/goomy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (704, N'https://img.pokemondb.net/sprites/x-y/normal/goomy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (705, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/705.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (705, N'https://img.pokemondb.net/sprites/home/normal/sliggoo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (705, N'https://img.pokemondb.net/sprites/x-y/normal/sliggoo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (706, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/706.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (706, N'https://img.pokemondb.net/sprites/home/normal/goodra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (706, N'https://img.pokemondb.net/sprites/x-y/normal/goodra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (707, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/707.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (707, N'https://img.pokemondb.net/sprites/home/normal/klefki.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (707, N'https://img.pokemondb.net/sprites/x-y/normal/klefki.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (708, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/708.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (708, N'https://img.pokemondb.net/sprites/home/normal/phantump.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (708, N'https://img.pokemondb.net/sprites/x-y/normal/phantump.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (709, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/709.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (709, N'https://img.pokemondb.net/sprites/home/normal/trevenant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (709, N'https://img.pokemondb.net/sprites/x-y/normal/trevenant.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (710, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/710.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (710, N'https://img.pokemondb.net/sprites/home/normal/pumpkaboo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (710, N'https://img.pokemondb.net/sprites/x-y/normal/pumpkaboo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (711, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/711.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (711, N'https://img.pokemondb.net/sprites/home/normal/gourgeist.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (711, N'https://img.pokemondb.net/sprites/x-y/normal/gourgeist.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (712, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/712.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (712, N'https://img.pokemondb.net/sprites/home/normal/bergmite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (712, N'https://img.pokemondb.net/sprites/x-y/normal/bergmite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (713, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/713.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (713, N'https://img.pokemondb.net/sprites/home/normal/avalugg.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (713, N'https://img.pokemondb.net/sprites/x-y/normal/avalugg.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (714, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/714.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (714, N'https://img.pokemondb.net/sprites/home/normal/noibat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (714, N'https://img.pokemondb.net/sprites/x-y/normal/noibat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (715, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/715.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (715, N'https://img.pokemondb.net/sprites/home/normal/noivern.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (715, N'https://img.pokemondb.net/sprites/x-y/normal/noivern.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (716, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/716.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (716, N'https://img.pokemondb.net/sprites/home/normal/xerneas.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (716, N'https://img.pokemondb.net/sprites/x-y/normal/xerneas.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (717, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/717.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (717, N'https://img.pokemondb.net/sprites/home/normal/yveltal.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (717, N'https://img.pokemondb.net/sprites/x-y/normal/yveltal.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (718, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/718.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (718, N'https://img.pokemondb.net/sprites/home/normal/zygarde.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (718, N'https://img.pokemondb.net/sprites/x-y/normal/zygarde.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (719, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/719.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (719, N'https://img.pokemondb.net/sprites/home/normal/diancie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (719, N'https://img.pokemondb.net/sprites/x-y/normal/diancie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (720, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/720.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (720, N'https://img.pokemondb.net/sprites/home/normal/hoopahoopa-confined.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (720, N'https://img.pokemondb.net/sprites/x-y/normal/hoopa-confined.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (721, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/721.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (721, N'https://img.pokemondb.net/sprites/home/normal/volcanion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (721, N'https://img.pokemondb.net/sprites/x-y/normal/volcanion.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (1, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (1, N'https://img.pokemondb.net/sprites/home/normal/bulbasaur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (1, N'https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (2, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (2, N'https://img.pokemondb.net/sprites/home/normal/ivysaur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (2, N'https://img.pokemondb.net/sprites/x-y/normal/ivysaur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (3, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/003.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (3, N'https://img.pokemondb.net/sprites/home/normal/venusaur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (3, N'https://img.pokemondb.net/sprites/x-y/normal/venusaur.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (4, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (4, N'https://img.pokemondb.net/sprites/home/normal/charmander.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (4, N'https://img.pokemondb.net/sprites/x-y/normal/charmander.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (5, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/005.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (5, N'https://img.pokemondb.net/sprites/home/normal/charmeleon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (5, N'https://img.pokemondb.net/sprites/x-y/normal/charmeleon.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (6, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (6, N'https://img.pokemondb.net/sprites/home/normal/charizard.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (6, N'https://img.pokemondb.net/sprites/x-y/normal/charizard.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (7, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (7, N'https://img.pokemondb.net/sprites/home/normal/squirtle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (7, N'https://img.pokemondb.net/sprites/x-y/normal/squirtle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (8, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/008.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (8, N'https://img.pokemondb.net/sprites/home/normal/wartortle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (8, N'https://img.pokemondb.net/sprites/x-y/normal/wartortle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (9, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/009.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (9, N'https://img.pokemondb.net/sprites/home/normal/blastoise.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (9, N'https://img.pokemondb.net/sprites/x-y/normal/blastoise.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (10, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/010.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (10, N'https://img.pokemondb.net/sprites/home/normal/caterpie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (10, N'https://img.pokemondb.net/sprites/x-y/normal/caterpie.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (11, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/011.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (11, N'https://img.pokemondb.net/sprites/home/normal/metapod.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (11, N'https://img.pokemondb.net/sprites/x-y/normal/metapod.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (12, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/012.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (12, N'https://img.pokemondb.net/sprites/home/normal/butterfree.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (12, N'https://img.pokemondb.net/sprites/x-y/normal/butterfree.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (13, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/013.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (13, N'https://img.pokemondb.net/sprites/home/normal/weedle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (13, N'https://img.pokemondb.net/sprites/x-y/normal/weedle.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (14, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/014.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (14, N'https://img.pokemondb.net/sprites/home/normal/kakuna.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (14, N'https://img.pokemondb.net/sprites/x-y/normal/kakuna.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (15, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/015.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (15, N'https://img.pokemondb.net/sprites/home/normal/beedrill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (15, N'https://img.pokemondb.net/sprites/x-y/normal/beedrill.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (16, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/016.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (16, N'https://img.pokemondb.net/sprites/home/normal/pidgey.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (16, N'https://img.pokemondb.net/sprites/x-y/normal/pidgey.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (17, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/017.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (17, N'https://img.pokemondb.net/sprites/home/normal/pidgeotto.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (17, N'https://img.pokemondb.net/sprites/x-y/normal/pidgeotto.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (18, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/018.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (18, N'https://img.pokemondb.net/sprites/home/normal/pidgeot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (18, N'https://img.pokemondb.net/sprites/x-y/normal/pidgeot.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (19, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/019.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (19, N'https://img.pokemondb.net/sprites/home/normal/rattata.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (19, N'https://img.pokemondb.net/sprites/x-y/normal/rattata.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (20, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/020.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (20, N'https://img.pokemondb.net/sprites/home/normal/raticate.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (20, N'https://img.pokemondb.net/sprites/x-y/normal/raticate.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (21, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/021.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (21, N'https://img.pokemondb.net/sprites/home/normal/spearow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (21, N'https://img.pokemondb.net/sprites/x-y/normal/spearow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (22, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/022.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (22, N'https://img.pokemondb.net/sprites/home/normal/fearow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (22, N'https://img.pokemondb.net/sprites/x-y/normal/fearow.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (23, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/023.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (23, N'https://img.pokemondb.net/sprites/home/normal/ekans.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (23, N'https://img.pokemondb.net/sprites/x-y/normal/ekans.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (24, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/024.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (24, N'https://img.pokemondb.net/sprites/home/normal/arbok.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (24, N'https://img.pokemondb.net/sprites/x-y/normal/arbok.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (25, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (25, N'https://img.pokemondb.net/sprites/home/normal/pikachu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (25, N'https://img.pokemondb.net/sprites/x-y/normal/pikachu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (26, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/026.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (26, N'https://img.pokemondb.net/sprites/home/normal/raichu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (26, N'https://img.pokemondb.net/sprites/x-y/normal/raichu.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (27, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/027.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (27, N'https://img.pokemondb.net/sprites/home/normal/sandshrew.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (27, N'https://img.pokemondb.net/sprites/x-y/normal/sandshrew.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (28, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/028.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (28, N'https://img.pokemondb.net/sprites/home/normal/sandslash.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (28, N'https://img.pokemondb.net/sprites/x-y/normal/sandslash.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (29, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/029.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (29, N'https://img.pokemondb.net/sprites/home/normal/nidoran-f.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (29, N'https://img.pokemondb.net/sprites/x-y/normal/nidoran-f.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (30, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/030.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (30, N'https://img.pokemondb.net/sprites/home/normal/nidorina.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (30, N'https://img.pokemondb.net/sprites/x-y/normal/nidorina.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (31, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/031.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (31, N'https://img.pokemondb.net/sprites/home/normal/nidoqueen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (31, N'https://img.pokemondb.net/sprites/x-y/normal/nidoqueen.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (32, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/032.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (32, N'https://img.pokemondb.net/sprites/home/normal/nidoran-m.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (32, N'https://img.pokemondb.net/sprites/x-y/normal/nidoran-m.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (33, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/033.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (33, N'https://img.pokemondb.net/sprites/home/normal/nidorino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (33, N'https://img.pokemondb.net/sprites/x-y/normal/nidorino.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (34, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/034.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (34, N'https://img.pokemondb.net/sprites/home/normal/nidoking.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (34, N'https://img.pokemondb.net/sprites/x-y/normal/nidoking.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (35, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/035.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (35, N'https://img.pokemondb.net/sprites/home/normal/clefairy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (35, N'https://img.pokemondb.net/sprites/x-y/normal/clefairy.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (36, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/036.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (36, N'https://img.pokemondb.net/sprites/home/normal/clefable.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (36, N'https://img.pokemondb.net/sprites/x-y/normal/clefable.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (37, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/037.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (37, N'https://img.pokemondb.net/sprites/home/normal/vulpix.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (37, N'https://img.pokemondb.net/sprites/x-y/normal/vulpix.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (38, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/038.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (38, N'https://img.pokemondb.net/sprites/home/normal/ninetales.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (38, N'https://img.pokemondb.net/sprites/x-y/normal/ninetales.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (39, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/039.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (39, N'https://img.pokemondb.net/sprites/home/normal/jigglypuff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (39, N'https://img.pokemondb.net/sprites/x-y/normal/jigglypuff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (40, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/040.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (40, N'https://img.pokemondb.net/sprites/home/normal/wigglytuff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (40, N'https://img.pokemondb.net/sprites/x-y/normal/wigglytuff.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (41, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/041.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (41, N'https://img.pokemondb.net/sprites/home/normal/zubat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (41, N'https://img.pokemondb.net/sprites/x-y/normal/zubat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (42, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/042.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (42, N'https://img.pokemondb.net/sprites/home/normal/golbat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (42, N'https://img.pokemondb.net/sprites/x-y/normal/golbat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (43, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/043.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (43, N'https://img.pokemondb.net/sprites/home/normal/oddish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (43, N'https://img.pokemondb.net/sprites/x-y/normal/oddish.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (44, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/044.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (44, N'https://img.pokemondb.net/sprites/home/normal/gloom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (44, N'https://img.pokemondb.net/sprites/x-y/normal/gloom.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (45, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/045.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (45, N'https://img.pokemondb.net/sprites/home/normal/vileplume.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (45, N'https://img.pokemondb.net/sprites/x-y/normal/vileplume.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (46, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/046.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (46, N'https://img.pokemondb.net/sprites/home/normal/paras.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (46, N'https://img.pokemondb.net/sprites/x-y/normal/paras.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (47, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/047.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (47, N'https://img.pokemondb.net/sprites/home/normal/parasect.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (47, N'https://img.pokemondb.net/sprites/x-y/normal/parasect.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (48, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/048.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (48, N'https://img.pokemondb.net/sprites/home/normal/venonat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (48, N'https://img.pokemondb.net/sprites/x-y/normal/venonat.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (49, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/049.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (49, N'https://img.pokemondb.net/sprites/home/normal/venomoth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (49, N'https://img.pokemondb.net/sprites/x-y/normal/venomoth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (50, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/050.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (50, N'https://img.pokemondb.net/sprites/home/normal/diglett.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (50, N'https://img.pokemondb.net/sprites/x-y/normal/diglett.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (51, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/051.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (51, N'https://img.pokemondb.net/sprites/home/normal/dugtrio.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (51, N'https://img.pokemondb.net/sprites/x-y/normal/dugtrio.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (52, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/052.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (52, N'https://img.pokemondb.net/sprites/home/normal/meowth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (52, N'https://img.pokemondb.net/sprites/x-y/normal/meowth.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (53, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/053.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (53, N'https://img.pokemondb.net/sprites/home/normal/persian.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (53, N'https://img.pokemondb.net/sprites/x-y/normal/persian.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (54, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/054.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (54, N'https://img.pokemondb.net/sprites/home/normal/psyduck.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (54, N'https://img.pokemondb.net/sprites/x-y/normal/psyduck.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (55, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/055.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (55, N'https://img.pokemondb.net/sprites/home/normal/golduck.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (55, N'https://img.pokemondb.net/sprites/x-y/normal/golduck.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (56, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/056.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (56, N'https://img.pokemondb.net/sprites/home/normal/mankey.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (56, N'https://img.pokemondb.net/sprites/x-y/normal/mankey.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (57, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/057.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (57, N'https://img.pokemondb.net/sprites/home/normal/primeape.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (57, N'https://img.pokemondb.net/sprites/x-y/normal/primeape.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (58, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/058.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (58, N'https://img.pokemondb.net/sprites/home/normal/growlithe.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (58, N'https://img.pokemondb.net/sprites/x-y/normal/growlithe.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (59, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/059.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (59, N'https://img.pokemondb.net/sprites/home/normal/arcanine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (59, N'https://img.pokemondb.net/sprites/x-y/normal/arcanine.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (60, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/060.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (60, N'https://img.pokemondb.net/sprites/home/normal/poliwag.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (60, N'https://img.pokemondb.net/sprites/x-y/normal/poliwag.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (61, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/061.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (61, N'https://img.pokemondb.net/sprites/home/normal/poliwhirl.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (61, N'https://img.pokemondb.net/sprites/x-y/normal/poliwhirl.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (62, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/062.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (62, N'https://img.pokemondb.net/sprites/home/normal/poliwrath.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (62, N'https://img.pokemondb.net/sprites/x-y/normal/poliwrath.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (63, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/063.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (63, N'https://img.pokemondb.net/sprites/home/normal/abra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (63, N'https://img.pokemondb.net/sprites/x-y/normal/abra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (64, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/064.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (64, N'https://img.pokemondb.net/sprites/home/normal/kadabra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (64, N'https://img.pokemondb.net/sprites/x-y/normal/kadabra.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (65, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/065.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (65, N'https://img.pokemondb.net/sprites/home/normal/alakazam.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (65, N'https://img.pokemondb.net/sprites/x-y/normal/alakazam.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (66, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/066.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (66, N'https://img.pokemondb.net/sprites/home/normal/machop.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (66, N'https://img.pokemondb.net/sprites/x-y/normal/machop.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (67, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/067.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (67, N'https://img.pokemondb.net/sprites/home/normal/machoke.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (67, N'https://img.pokemondb.net/sprites/x-y/normal/machoke.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (68, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/068.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (68, N'https://img.pokemondb.net/sprites/home/normal/machamp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (68, N'https://img.pokemondb.net/sprites/x-y/normal/machamp.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (69, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/069.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (69, N'https://img.pokemondb.net/sprites/home/normal/bellsprout.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (69, N'https://img.pokemondb.net/sprites/x-y/normal/bellsprout.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (70, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/070.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (70, N'https://img.pokemondb.net/sprites/home/normal/weepinbell.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (70, N'https://img.pokemondb.net/sprites/x-y/normal/weepinbell.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (71, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/071.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (71, N'https://img.pokemondb.net/sprites/home/normal/victreebel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (71, N'https://img.pokemondb.net/sprites/x-y/normal/victreebel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (72, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/072.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (72, N'https://img.pokemondb.net/sprites/home/normal/tentacool.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (72, N'https://img.pokemondb.net/sprites/x-y/normal/tentacool.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (73, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/073.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (73, N'https://img.pokemondb.net/sprites/home/normal/tentacruel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (73, N'https://img.pokemondb.net/sprites/x-y/normal/tentacruel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (74, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/074.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (74, N'https://img.pokemondb.net/sprites/home/normal/geodude.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (74, N'https://img.pokemondb.net/sprites/x-y/normal/geodude.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (75, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/075.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (75, N'https://img.pokemondb.net/sprites/home/normal/graveler.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (75, N'https://img.pokemondb.net/sprites/x-y/normal/graveler.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (76, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/076.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (76, N'https://img.pokemondb.net/sprites/home/normal/golem.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (76, N'https://img.pokemondb.net/sprites/x-y/normal/golem.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (77, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/077.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (77, N'https://img.pokemondb.net/sprites/home/normal/ponyta.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (77, N'https://img.pokemondb.net/sprites/x-y/normal/ponyta.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (78, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/078.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (78, N'https://img.pokemondb.net/sprites/home/normal/rapidash.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (78, N'https://img.pokemondb.net/sprites/x-y/normal/rapidash.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (79, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/079.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (79, N'https://img.pokemondb.net/sprites/home/normal/slowpoke.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (79, N'https://img.pokemondb.net/sprites/x-y/normal/slowpoke.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (80, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/080.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (80, N'https://img.pokemondb.net/sprites/home/normal/slowbro.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (80, N'https://img.pokemondb.net/sprites/x-y/normal/slowbro.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (81, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/081.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (81, N'https://img.pokemondb.net/sprites/home/normal/magnemite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (81, N'https://img.pokemondb.net/sprites/x-y/normal/magnemite.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (82, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/082.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (82, N'https://img.pokemondb.net/sprites/home/normal/magneton.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (82, N'https://img.pokemondb.net/sprites/x-y/normal/magneton.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (83, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/083.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (83, N'https://img.pokemondb.net/sprites/home/normal/farfetchd.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (83, N'https://img.pokemondb.net/sprites/x-y/normal/farfetchd.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (84, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/084.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (84, N'https://img.pokemondb.net/sprites/home/normal/doduo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (84, N'https://img.pokemondb.net/sprites/x-y/normal/doduo.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (85, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/085.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (85, N'https://img.pokemondb.net/sprites/home/normal/dodrio.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (85, N'https://img.pokemondb.net/sprites/x-y/normal/dodrio.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (86, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/086.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (86, N'https://img.pokemondb.net/sprites/home/normal/seel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (86, N'https://img.pokemondb.net/sprites/x-y/normal/seel.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (87, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/087.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (87, N'https://img.pokemondb.net/sprites/home/normal/dewgong.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (87, N'https://img.pokemondb.net/sprites/x-y/normal/dewgong.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (88, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/088.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (88, N'https://img.pokemondb.net/sprites/home/normal/grimer.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (88, N'https://img.pokemondb.net/sprites/x-y/normal/grimer.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (89, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/089.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (89, N'https://img.pokemondb.net/sprites/home/normal/muk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (89, N'https://img.pokemondb.net/sprites/x-y/normal/muk.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (90, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/090.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (90, N'https://img.pokemondb.net/sprites/home/normal/shellder.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (90, N'https://img.pokemondb.net/sprites/x-y/normal/shellder.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (91, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/091.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (91, N'https://img.pokemondb.net/sprites/home/normal/cloyster.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (91, N'https://img.pokemondb.net/sprites/x-y/normal/cloyster.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (92, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/092.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (92, N'https://img.pokemondb.net/sprites/home/normal/gastly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (92, N'https://img.pokemondb.net/sprites/x-y/normal/gastly.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (93, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/093.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (93, N'https://img.pokemondb.net/sprites/home/normal/haunter.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (93, N'https://img.pokemondb.net/sprites/x-y/normal/haunter.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (94, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/094.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (94, N'https://img.pokemondb.net/sprites/home/normal/gengar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (94, N'https://img.pokemondb.net/sprites/x-y/normal/gengar.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (95, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/095.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (95, N'https://img.pokemondb.net/sprites/home/normal/onix.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (95, N'https://img.pokemondb.net/sprites/x-y/normal/onix.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (96, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/096.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (96, N'https://img.pokemondb.net/sprites/home/normal/drowzee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (96, N'https://img.pokemondb.net/sprites/x-y/normal/drowzee.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (97, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/097.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (97, N'https://img.pokemondb.net/sprites/home/normal/hypno.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (97, N'https://img.pokemondb.net/sprites/x-y/normal/hypno.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (98, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/098.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (98, N'https://img.pokemondb.net/sprites/home/normal/krabby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (98, N'https://img.pokemondb.net/sprites/x-y/normal/krabby.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (99, N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/099.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (99, N'https://img.pokemondb.net/sprites/home/normal/kingler.png')
GO
INSERT [dbo].[Images_Pokemon] ([PokemonID], [ImageURL]) VALUES (99, N'https://img.pokemondb.net/sprites/x-y/normal/kingler.png')
GO
SET IDENTITY_INSERT [dbo].[Places] ON 
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (1, N'Pallet', 1, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (2, N'Viridian', 1, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (3, N'Pewter', 1, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (4, N'Cerulean', 1, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (5, N'Saffron', 1, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (6, N'Vermilion', 1, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (7, N'Celadon', 1, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (8, N'Fucshia', 1, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (9, N'Lavender', 1, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (10, N'Cinnabar', 1, 3)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (11, N'New Bark', 2, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (12, N'Cherrygrove', 2, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (13, N'Violet', 2, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (14, N'Azalea', 2, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (15, N'Goldenrod', 2, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (16, N'Ecruteak', 2, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (17, N'Olivine', 2, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (18, N'Cianwood', 2, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (19, N'Mahogany', 2, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (20, N'Blackthorn', 2, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (21, N'Littleroot', 3, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (22, N'Oldale', 3, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (23, N'Petalburg', 3, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (24, N'Rustboro', 3, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (25, N'Dewford', 3, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (26, N'Slateport', 3, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (27, N'Mauville', 3, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (28, N'Verdanturf', 3, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (29, N'Lavaridge', 3, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (30, N'Fallarbor', 3, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (31, N'Fortree', 3, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (32, N'Lilycove', 3, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (33, N'Mossdeep', 3, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (34, N'Sootopolis', 3, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (35, N'Pacifidlog', 3, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (36, N'Ever Grande', 3, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (37, N'Twinleaf', 4, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (38, N'Sandgem', 4, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (39, N'Jubilife', 4, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (40, N'Oreburgh', 4, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (41, N'Floaroma', 4, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (42, N'Eterna', 4, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (43, N'Hearthome', 4, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (44, N'Solaceon', 4, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (45, N'Veilstone', 4, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (46, N'Pastoria', 4, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (47, N'Celestic', 4, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (48, N'Canalave', 4, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (49, N'Snowpoint', 4, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (50, N'Sunyshore', 4, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (51, N'Nuvema', 5, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (52, N'Aspertia', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (53, N'Floccesy', 5, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (54, N'Virbank', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (55, N'Accumula', 5, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (56, N'Striaton', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (57, N'Nacrene', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (58, N'Castelia', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (59, N'Nimbasa', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (60, N'Anville', 5, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (61, N'Driftveil', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (62, N'Mistralton', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (63, N'Lentimas', 5, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (64, N'Icirrus', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (65, N'Opelucid', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (66, N'Humilau', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (67, N'Lacunosa', 5, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (68, N'Undella', 5, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (69, N'Black', 5, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (70, N'Vaniville', 6, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (71, N'Aquacorde', 6, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (72, N'Santalune', 6, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (73, N'Lumiose', 6, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (74, N'Camphrier', 6, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (75, N'Ambrette', 6, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (76, N'Cyllage', 6, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (77, N'Geosenge', 6, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (78, N'Shalour', 6, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (79, N'Coumarine', 6, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (80, N'Laverre', 6, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (81, N'Dendemille', 6, 1)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (82, N'Anistar', 6, 2)
GO
INSERT [dbo].[Places] ([ID], [PlaceName], [RegionID], [ZoneID]) VALUES (83, N'Snowbelle', 6, 2)
GO
SET IDENTITY_INSERT [dbo].[Places] OFF
GO
SET IDENTITY_INSERT [dbo].[PokemonGyms] ON 
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (1, 3, 12, N'Boulder Badge', N'https://static.wikia.nocookie.net/espokemon/images/3/39/Medalla_Roca.png/revision/latest/scale-to-width-down/30?cb=20130327173400')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (2, 4, 3, N'Cascade Badge', N'https://static.wikia.nocookie.net/espokemon/images/6/60/Medalla_Cascada.png/revision/latest/scale-to-width-down/30?cb=20130327173411')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (3, 6, 7, N'Thunder Badge', N'https://static.wikia.nocookie.net/espokemon/images/6/60/Medalla_Cascada.png/revision/latest/scale-to-width-down/30?cb=20130327173411')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (4, 7, 7, N'Rainbow Badge', N'https://static.wikia.nocookie.net/espokemon/images/0/09/Medalla_Arco%C3%ADris.png/revision/latest/scale-to-width-down/30?cb=20130327173435')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (5, 8, 6, N'Soul Badge', N'https://static.wikia.nocookie.net/espokemon/images/c/c5/Medalla_Alma.png/revision/latest/scale-to-width-down/30?cb=20130327173447')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (6, 5, 11, N'Marsh Badge', N'https://static.wikia.nocookie.net/espokemon/images/9/93/Medalla_Volc%C3%A1n.png/revision/latest/scale-to-width-down/30?cb=20130915183208')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (7, 10, 2, N'Volcano Badge', N'https://static.wikia.nocookie.net/espokemon/images/9/93/Medalla_Volc%C3%A1n.png/revision/latest/scale-to-width-down/30?cb=20130915183208')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (8, 2, 8, N'Earth Badge', N'https://static.wikia.nocookie.net/espokemon/images/1/16/Medalla_Tierra.png/revision/latest/scale-to-width-down/30?cb=20130327173516')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (9, 13, 18, N'Zephyr Badge', N'https://static.wikia.nocookie.net/espokemon/images/e/ee/Medalla_C%C3%A9firo.png/revision/latest?cb=20070909112251')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (10, 14, 4, N'Hive Badge', N'https://static.wikia.nocookie.net/espokemon/images/e/ee/Medalla_Colmena.png/revision/latest?cb=20070909112556')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (11, 15, 5, N'Plain Badge', N'https://static.wikia.nocookie.net/espokemon/images/8/8d/Medalla_Planicie.png/revision/latest?cb=20090124182916')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (12, 16, 6, N'Fog Badge', N'https://static.wikia.nocookie.net/espokemon/images/c/c2/Medalla_Niebla.png/revision/latest?cb=20070909112820')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (13, 18, 10, N'Storm Badge', N'https://static.wikia.nocookie.net/espokemon/images/2/2d/Medalla_Tormenta.png/revision/latest?cb=20070909112900')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (14, 17, 17, N'Mineral Badge', N'https://static.wikia.nocookie.net/espokemon/images/6/6a/Medalla_Mineral.png/revision/latest?cb=20070909112954')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (15, 19, 14, N'Glacier Badge', N'https://static.wikia.nocookie.net/espokemon/images/f/f8/Medalla_Glaciar.png/revision/latest?cb=20070909113044')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (16, 20, 15, N'Rising Badge', N'https://static.wikia.nocookie.net/espokemon/images/4/4d/Medalla_Drag%C3%B3n.png/revision/latest?cb=20070909113209')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (17, 24, 12, N'Stone Badge', N'https://static.wikia.nocookie.net/espokemon/images/f/ff/Medalla_Piedra.png/revision/latest?cb=20140714195114')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (18, 25, 10, N'Knuckle Badge', N'https://static.wikia.nocookie.net/espokemon/images/8/85/Medalla_Pu%C3%B1o.png/revision/latest?cb=20140714200249')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (19, 27, 7, N'Dynamo Badge', N'https://static.wikia.nocookie.net/espokemon/images/1/18/Medalla_Dinamo.png/revision/latest?cb=20140714195609')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (20, 29, 2, N'Heat Badge', N'https://static.wikia.nocookie.net/espokemon/images/5/5c/Medalla_Calor.png/revision/latest?cb=20140714194523')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (21, 23, 5, N'Balance Badge', N'https://static.wikia.nocookie.net/espokemon/images/e/e7/Medalla_Equilibrio.png/revision/latest?cb=20140714195342')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (22, 31, 18, N'Feather Badge', N'https://static.wikia.nocookie.net/espokemon/images/b/b3/Medalla_Pluma.png/revision/latest?cb=20141123204133')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (23, 33, 11, N'Mind Badge', N'https://static.wikia.nocookie.net/espokemon/images/a/a0/Medalla_Mente.png/revision/latest?cb=20141123204057')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (24, 34, 3, N'Rain Badge', N'https://static.wikia.nocookie.net/espokemon/images/4/47/Medalla_Lluvia.png/revision/latest?cb=20141123203757')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (25, 40, 12, N'Coal Badge', N'https://static.wikia.nocookie.net/espokemon/images/0/0b/Medalla_Lignito.png/revision/latest/scale-to-width-down/55?cb=20140218004352')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (26, 42, 1, N'Forest Badge', N'https://static.wikia.nocookie.net/espokemon/images/7/75/Medalla_Bosque.png/revision/latest/scale-to-width-down/55?cb=20090913184353')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (27, 43, 13, N'Relic Badge', N'https://static.wikia.nocookie.net/espokemon/images/e/e2/Medalla_Reliquia.png/revision/latest/scale-to-width-down/55?cb=20090913184435')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (28, 45, 10, N'Cobble Badge', N'https://static.wikia.nocookie.net/espokemon/images/a/a5/Medalla_Adoqu%C3%ADn.png/revision/latest/scale-to-width-down/55?cb=20090913184422')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (29, 41, 3, N'Fen Badge', N'https://static.wikia.nocookie.net/espokemon/images/7/73/Medalla_Ci%C3%A9naga.png/revision/latest/scale-to-width-down/55?cb=20090913184439')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (30, 48, 17, N'Mine Badge', N'https://static.wikia.nocookie.net/espokemon/images/7/7c/Medalla_Mina.png/revision/latest/scale-to-width-down/55?cb=20090913184450')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (31, 49, 14, N'Icicle Badge', N'https://static.wikia.nocookie.net/espokemon/images/0/06/Medalla_Car%C3%A1mbano.png/revision/latest/scale-to-width-down/55?cb=20090913184349')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (32, 50, 7, N'Beacon Badge', N'https://static.wikia.nocookie.net/espokemon/images/7/7b/Medalla_Faro.png/revision/latest/scale-to-width-down/55?cb=20140225235114')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (33, 56, 2, N'Trio Badge', N'https://static.wikia.nocookie.net/espokemon/images/3/31/Medalla_Tr%C3%ADo.png/revision/latest/scale-to-width-down/80?cb=20120628043243')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (34, 57, 5, N'Basic Badge', N'https://static.wikia.nocookie.net/espokemon/images/e/e8/Medalla_Base.png/revision/latest/scale-to-width-down/80?cb=20120628043241')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (35, 58, 4, N'Isect Badge', N'https://static.wikia.nocookie.net/pokemon/images/9/9e/Insectbadge.png/revision/latest?cb=20101019231914')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (36, 59, 7, N'Bolt Badge', N'https://static.wikia.nocookie.net/espokemon/images/9/93/Medalla_Voltio.png/revision/latest/scale-to-width-down/85?cb=20130915183232')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (37, 61, 8, N'Quake Badge', N'https://static.wikia.nocookie.net/espokemon/images/c/c3/Medalla_Temblor.png/revision/latest/scale-to-width-down/80?cb=20120628043242')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (38, 62, 10, N'Jet Badge', N'https://static.wikia.nocookie.net/espokemon/images/8/80/Medalla_Jet.png/revision/latest/scale-to-width-down/85?cb=20120628043242')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (39, 64, 14, N'Freeze Badge', N'https://static.wikia.nocookie.net/pokemon/images/d/d3/Freezebadge.png/revision/latest?cb=20110211044859')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (40, 65, 15, N'Legend Badge', N'https://static.wikia.nocookie.net/pokemon/images/b/b0/Legendbadge.png/revision/latest?cb=20110211044929')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (41, 66, 3, N'Wave Badge', N'https://static.wikia.nocookie.net/espokemon/images/f/f2/Medalla_Ola.png/revision/latest/scale-to-width-down/85?cb=20120628043240')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (42, 54, 6, N'Poison Badge', N'https://static.wikia.nocookie.net/espokemon/images/6/61/Medalla_Ponzo%C3%B1a.png/revision/latest/scale-to-width-down/80?cb=20120628043239')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (43, 72, 4, N'Bug Badge', N'https://static.wikia.nocookie.net/pokemon/images/a/a5/Bug_Badge.png/revision/latest/scale-to-width-down/50?cb=20131025141332')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (44, 76, 12, N'Cliff Badge', N'https://static.wikia.nocookie.net/pokemon/images/3/35/Cliffbadge.png/revision/latest/scale-to-width-down/50?cb=20131029164123')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (45, 78, 10, N'Rumble Badge', N'https://static.wikia.nocookie.net/pokemon/images/d/d4/Rumble_Badge.png/revision/latest?cb=20171006161933')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (46, 79, 1, N'Plant Badge', N'https://static.wikia.nocookie.net/pokemon/images/e/ee/Plantbadge.png/revision/latest/scale-to-width-down/50?cb=20131030125043')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (47, 73, 7, N'Voltage Badge', N'https://static.wikia.nocookie.net/pokemon/images/5/5f/Voltagebadge.png/revision/latest/scale-to-width-down/50?cb=20131105033256')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (48, 80, 9, N'Fairy Badge', N'https://static.wikia.nocookie.net/pokemon/images/2/2a/Fairybadge.png/revision/latest/scale-to-width-down/50?cb=20131105033335')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (49, 82, 11, N'Psychic Badge', N'https://static.wikia.nocookie.net/pokemon/images/c/c7/Psychicbadge.png/revision/latest/scale-to-width-down/50?cb=20131105130017')
GO
INSERT [dbo].[PokemonGyms] ([ID], [PlaceID], [TypeID], [BadgeName], [BadgeURL]) VALUES (50, 83, 14, N'Iceberg Badge', N'https://static.wikia.nocookie.net/pokemon/images/8/84/Iceberg_Badge.png/revision/latest/scale-to-width-down/50?cb=20131105162357')
GO
SET IDENTITY_INSERT [dbo].[PokemonGyms] OFF
GO
SET IDENTITY_INSERT [dbo].[Pokemons] ON 
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (1, N'Bulbasaur', 45, 49, 49, 65, 65, 45, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (2, N'Ivysaur', 60, 62, 63, 80, 80, 60, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (3, N'Venusaur', 80, 82, 83, 100, 100, 80, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (4, N'Charmander', 39, 52, 43, 60, 50, 65, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (5, N'Charmeleon', 58, 64, 58, 80, 65, 80, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (6, N'Charizard', 78, 84, 78, 109, 85, 100, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (7, N'Squirtle', 44, 48, 65, 50, 64, 43, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (8, N'Wartortle', 59, 63, 80, 65, 80, 58, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (9, N'Blastoise', 79, 83, 100, 85, 105, 78, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (10, N'Caterpie', 45, 30, 35, 20, 20, 45, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (11, N'Metapod', 50, 20, 55, 25, 25, 30, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (12, N'Butterfree', 60, 45, 50, 90, 80, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (13, N'Weedle', 40, 35, 30, 20, 20, 50, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (14, N'Kakuna', 45, 25, 50, 25, 25, 35, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (15, N'Beedrill', 65, 90, 40, 45, 80, 75, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (16, N'Pidgey', 40, 45, 40, 35, 35, 56, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (17, N'Pidgeotto', 63, 60, 55, 50, 50, 71, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (18, N'Pidgeot', 83, 80, 75, 70, 70, 101, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (19, N'Rattata', 30, 56, 35, 25, 35, 72, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (20, N'Raticate', 55, 81, 60, 50, 70, 97, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (21, N'Spearow', 40, 60, 30, 31, 31, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (22, N'Fearow', 65, 90, 65, 61, 61, 100, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (23, N'Ekans', 35, 60, 44, 40, 54, 55, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (24, N'Arbok', 60, 85, 69, 65, 79, 80, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (25, N'Pikachu', 35, 55, 40, 50, 50, 90, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (26, N'Raichu', 60, 90, 55, 90, 80, 110, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (27, N'Sandshrew', 50, 75, 85, 20, 30, 40, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (28, N'Sandslash', 75, 100, 110, 45, 55, 65, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (29, N'Nidoran f', 55, 47, 52, 40, 40, 41, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (30, N'Nidorina', 70, 62, 67, 55, 55, 56, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (31, N'Nidoqueen', 90, 92, 87, 75, 85, 76, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (32, N'Nidoran m', 46, 57, 40, 40, 40, 50, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (33, N'Nidorino', 61, 72, 57, 55, 55, 65, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (34, N'Nidoking', 81, 102, 77, 85, 75, 85, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (35, N'Clefairy', 70, 45, 48, 60, 65, 35, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (36, N'Clefable', 95, 70, 73, 95, 90, 60, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (37, N'Vulpix', 38, 41, 40, 50, 65, 65, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (38, N'Ninetales', 73, 76, 75, 81, 100, 100, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (39, N'Jigglypuff', 115, 45, 20, 45, 25, 20, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (40, N'Wigglytuff', 140, 70, 45, 85, 50, 45, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (41, N'Zubat', 40, 45, 35, 30, 40, 55, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (42, N'Golbat', 75, 80, 70, 65, 75, 90, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (43, N'Oddish', 45, 50, 55, 75, 65, 30, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (44, N'Gloom', 60, 65, 70, 85, 75, 40, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (45, N'Vileplume', 75, 80, 85, 110, 90, 50, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (46, N'Paras', 35, 70, 55, 45, 55, 25, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (47, N'Parasect', 60, 95, 80, 60, 80, 30, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (48, N'Venonat', 60, 55, 50, 40, 55, 45, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (49, N'Venomoth', 70, 65, 60, 90, 75, 90, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (50, N'Diglett', 10, 55, 25, 35, 45, 95, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (51, N'Dugtrio', 35, 80, 50, 50, 70, 120, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (52, N'Meowth', 40, 45, 35, 40, 40, 90, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (53, N'Persian', 65, 70, 60, 65, 65, 115, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (54, N'Psyduck', 50, 52, 48, 65, 50, 55, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (55, N'Golduck', 80, 82, 78, 95, 80, 85, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (56, N'Mankey', 40, 80, 35, 35, 45, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (57, N'Primeape', 65, 105, 60, 60, 70, 95, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (58, N'Growlithe', 55, 70, 45, 70, 50, 60, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (59, N'Arcanine', 90, 110, 80, 100, 80, 95, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (60, N'Poliwag', 40, 50, 40, 40, 40, 90, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (61, N'Poliwhirl', 65, 65, 65, 50, 50, 90, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (62, N'Poliwrath', 90, 95, 95, 70, 90, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (63, N'Abra', 25, 20, 15, 105, 55, 90, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (64, N'Kadabra', 40, 35, 30, 120, 70, 105, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (65, N'Alakazam', 55, 50, 45, 135, 95, 120, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (66, N'Machop', 70, 80, 50, 35, 35, 35, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (67, N'Machoke', 80, 100, 70, 50, 60, 45, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (68, N'Machamp', 90, 130, 80, 65, 85, 55, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (69, N'Bellsprout', 50, 75, 35, 70, 30, 40, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (70, N'Weepinbell', 65, 90, 50, 85, 45, 55, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (71, N'Victreebel', 80, 105, 65, 100, 70, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (72, N'Tentacool', 40, 40, 35, 50, 100, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (73, N'Tentacruel', 80, 70, 65, 80, 120, 100, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (74, N'Geodude', 40, 80, 100, 30, 30, 20, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (75, N'Graveler', 55, 95, 115, 45, 45, 35, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (76, N'Golem', 80, 120, 130, 55, 65, 45, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (77, N'Ponyta', 50, 85, 55, 65, 65, 90, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (78, N'Rapidash', 65, 100, 70, 80, 80, 105, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (79, N'Slowpoke', 90, 65, 65, 40, 40, 15, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (80, N'Slowbro', 95, 75, 110, 100, 80, 30, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (81, N'Magnemite', 25, 35, 70, 95, 55, 45, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (82, N'Magneton', 50, 60, 95, 120, 70, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (83, N'Farfetch D', 52, 65, 55, 58, 62, 60, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (84, N'Doduo', 35, 85, 45, 35, 35, 75, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (85, N'Dodrio', 60, 110, 70, 60, 60, 100, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (86, N'Seel', 65, 45, 55, 45, 70, 45, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (87, N'Dewgong', 90, 70, 80, 70, 95, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (88, N'Grimer', 80, 80, 50, 40, 50, 25, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (89, N'Muk', 105, 105, 75, 65, 100, 50, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (90, N'Shellder', 30, 65, 100, 45, 25, 40, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (91, N'Cloyster', 50, 95, 180, 85, 45, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (92, N'Gastly', 30, 35, 30, 100, 35, 80, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (93, N'Haunter', 45, 50, 45, 115, 55, 95, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (94, N'Gengar', 60, 65, 60, 130, 75, 110, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (95, N'Onix', 35, 45, 160, 30, 45, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (96, N'Drowzee', 60, 48, 45, 43, 90, 42, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (97, N'Hypno', 85, 73, 70, 73, 115, 67, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (98, N'Krabby', 30, 105, 90, 25, 25, 50, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (99, N'Kingler', 55, 130, 115, 50, 50, 75, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (100, N'Voltorb', 40, 30, 50, 55, 55, 100, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (101, N'Electrode', 60, 50, 70, 80, 80, 140, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (102, N'Exeggcute', 60, 40, 80, 60, 45, 40, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (103, N'Exeggutor', 95, 95, 85, 125, 65, 55, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (104, N'Cubone', 50, 50, 95, 40, 50, 35, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (105, N'Marowak', 60, 80, 110, 50, 80, 45, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (106, N'Hitmonlee', 50, 120, 53, 35, 110, 87, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (107, N'Hitmonchan', 50, 105, 79, 35, 110, 76, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (108, N'Lickitung', 90, 55, 75, 60, 75, 30, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (109, N'Koffing', 40, 65, 95, 60, 45, 35, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (110, N'Weezing', 65, 90, 120, 85, 70, 60, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (111, N'Rhyhorn', 80, 85, 95, 30, 30, 25, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (112, N'Rhydon', 105, 130, 120, 45, 45, 40, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (113, N'Chansey', 250, 5, 5, 35, 105, 50, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (114, N'Tangela', 65, 55, 115, 100, 40, 60, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (115, N'Kangaskhan', 105, 125, 100, 60, 100, 100, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (116, N'Horsea', 30, 40, 70, 70, 25, 60, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (117, N'Seadra', 55, 65, 95, 95, 45, 85, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (118, N'Goldeen', 45, 67, 60, 35, 50, 63, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (119, N'Seaking', 80, 92, 65, 65, 80, 68, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (120, N'Staryu', 30, 45, 55, 70, 55, 85, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (121, N'Starmie', 60, 75, 85, 100, 85, 115, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (122, N'Mr. Mime', 40, 45, 65, 100, 120, 90, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (123, N'Scyther', 70, 110, 80, 55, 80, 105, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (124, N'Jynx', 65, 50, 35, 115, 95, 95, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (125, N'Electabuzz', 65, 83, 57, 95, 85, 105, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (126, N'Magmar', 65, 95, 57, 100, 85, 93, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (127, N'Pinsir', 65, 125, 100, 55, 70, 85, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (128, N'Tauros', 75, 100, 95, 40, 70, 110, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (129, N'Magikarp', 20, 10, 55, 15, 20, 80, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (130, N'Gyarados', 95, 125, 79, 60, 100, 81, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (131, N'Lapras', 130, 85, 80, 85, 95, 60, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (132, N'Ditto', 48, 48, 48, 48, 48, 48, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (133, N'Eevee', 55, 55, 50, 45, 65, 55, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (134, N'Vaporeon', 130, 65, 60, 110, 95, 65, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (135, N'Jolteon', 65, 65, 60, 110, 95, 130, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (136, N'Flareon', 65, 130, 60, 95, 110, 65, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (137, N'Porygon', 65, 60, 70, 85, 75, 40, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (138, N'Omanyte', 35, 40, 100, 90, 55, 35, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (139, N'Omastar', 70, 60, 125, 115, 70, 55, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (140, N'Kabuto', 30, 80, 90, 55, 45, 55, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (141, N'Kabutops', 60, 115, 105, 65, 70, 80, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (142, N'Aerodactyl', 80, 105, 65, 60, 75, 130, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (143, N'Snorlax', 160, 110, 65, 65, 110, 30, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (144, N'Articuno', 90, 85, 100, 95, 125, 85, 1, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (145, N'Zapdos', 90, 90, 85, 125, 90, 100, 1, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (146, N'Moltres', 90, 100, 90, 125, 85, 90, 1, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (147, N'Dratini', 41, 64, 45, 50, 50, 50, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (148, N'Dragonair', 61, 84, 65, 70, 70, 70, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (149, N'Dragonite', 91, 134, 95, 100, 100, 80, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (150, N'Mewtwo', 106, 110, 90, 154, 90, 130, 1, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (151, N'Mew', 100, 100, 100, 100, 100, 100, 0, 1)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (152, N'Chikorita', 45, 49, 65, 49, 65, 45, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (153, N'Bayleef', 60, 62, 80, 63, 80, 60, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (154, N'Meganium', 80, 82, 100, 83, 100, 80, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (155, N'Cyndaquil', 39, 52, 43, 60, 50, 65, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (156, N'Quilava', 58, 64, 58, 80, 65, 80, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (157, N'Typhlosion', 78, 84, 78, 109, 85, 100, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (158, N'Totodile', 50, 65, 64, 44, 48, 43, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (159, N'Croconaw', 65, 80, 80, 59, 63, 58, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (160, N'Feraligatr', 85, 105, 100, 79, 83, 78, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (161, N'Sentret', 35, 46, 34, 35, 45, 20, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (162, N'Furret', 85, 76, 64, 45, 55, 90, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (163, N'Hoothoot', 60, 30, 30, 36, 56, 50, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (164, N'Noctowl', 100, 50, 50, 76, 96, 70, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (165, N'Ledyba', 40, 20, 30, 40, 80, 55, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (166, N'Ledian', 55, 35, 50, 55, 110, 85, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (167, N'Spinarak', 40, 60, 40, 40, 40, 30, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (168, N'Ariados', 70, 90, 70, 60, 60, 40, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (169, N'Crobat', 85, 90, 80, 70, 80, 130, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (170, N'Chinchou', 75, 38, 38, 56, 56, 67, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (171, N'Lanturn', 125, 58, 58, 76, 76, 67, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (172, N'Pichu', 20, 40, 15, 35, 35, 60, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (173, N'Cleffa', 50, 25, 28, 45, 55, 15, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (174, N'Igglybuff', 90, 30, 15, 40, 20, 15, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (175, N'Togepi', 35, 20, 65, 40, 65, 20, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (176, N'Togetic', 55, 40, 85, 80, 105, 40, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (177, N'Natu', 40, 50, 45, 70, 45, 70, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (178, N'Xatu', 65, 75, 70, 95, 70, 95, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (179, N'Mareep', 55, 40, 40, 65, 45, 35, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (180, N'Flaaffy', 70, 55, 55, 80, 60, 45, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (181, N'Ampharos', 90, 75, 85, 115, 90, 55, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (182, N'Bellossom', 75, 80, 95, 90, 100, 50, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (183, N'Marill', 70, 20, 50, 20, 50, 40, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (184, N'Azumarill', 100, 50, 80, 60, 80, 50, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (185, N'Sudowoodo', 70, 100, 115, 30, 65, 30, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (186, N'Politoed', 90, 75, 75, 90, 100, 70, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (187, N'Hoppip', 35, 35, 40, 35, 55, 50, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (188, N'Skiploom', 55, 45, 50, 45, 65, 80, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (189, N'Jumpluff', 75, 55, 70, 55, 95, 110, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (190, N'Aipom', 55, 70, 55, 40, 55, 85, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (191, N'Sunkern', 30, 30, 30, 30, 30, 30, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (192, N'Sunflora', 75, 75, 55, 105, 85, 30, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (193, N'Yanma', 65, 65, 45, 75, 45, 95, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (194, N'Wooper', 55, 45, 45, 25, 25, 15, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (195, N'Quagsire', 95, 85, 85, 65, 65, 35, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (196, N'Espeon', 65, 65, 60, 130, 95, 110, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (197, N'Umbreon', 95, 65, 110, 60, 130, 65, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (198, N'Murkrow', 60, 85, 42, 85, 42, 91, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (199, N'Slowking', 95, 75, 80, 100, 110, 30, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (200, N'Misdreavus', 60, 60, 60, 85, 85, 85, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (201, N'Unown', 48, 72, 48, 72, 48, 48, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (202, N'Wobbuffet', 190, 33, 58, 33, 58, 33, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (203, N'Girafarig', 70, 80, 65, 90, 65, 85, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (204, N'Pineco', 50, 65, 90, 35, 35, 15, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (205, N'Forretress', 75, 90, 140, 60, 60, 40, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (206, N'Dunsparce', 100, 70, 70, 65, 65, 45, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (207, N'Gligar', 65, 75, 105, 35, 65, 85, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (208, N'Steelix', 75, 85, 200, 55, 65, 30, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (209, N'Snubbull', 60, 80, 50, 40, 40, 30, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (210, N'Granbull', 90, 120, 75, 60, 60, 45, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (211, N'Qwilfish', 65, 95, 75, 55, 55, 85, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (212, N'Scizor', 70, 130, 100, 55, 80, 65, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (213, N'Shuckle', 20, 10, 230, 10, 230, 5, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (214, N'Heracross', 80, 125, 75, 40, 95, 85, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (215, N'Sneasel', 55, 95, 55, 35, 75, 115, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (216, N'Teddiursa', 60, 80, 50, 50, 50, 40, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (217, N'Ursaring', 90, 130, 75, 75, 75, 55, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (218, N'Slugma', 40, 40, 40, 70, 40, 20, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (219, N'Magcargo', 50, 50, 120, 80, 80, 30, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (220, N'Swinub', 50, 50, 40, 30, 30, 50, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (221, N'Piloswine', 100, 100, 80, 60, 60, 50, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (222, N'Corsola', 55, 55, 85, 65, 85, 35, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (223, N'Remoraid', 35, 65, 35, 65, 35, 65, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (224, N'Octillery', 75, 105, 75, 105, 75, 45, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (225, N'Delibird', 45, 55, 45, 65, 45, 75, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (226, N'Mantine', 65, 40, 70, 80, 140, 70, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (227, N'Skarmory', 65, 80, 140, 40, 70, 70, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (228, N'Houndour', 45, 60, 30, 80, 50, 65, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (229, N'Houndoom', 75, 90, 50, 110, 80, 95, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (230, N'Kingdra', 75, 95, 95, 95, 95, 85, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (231, N'Phanpy', 90, 60, 60, 40, 40, 40, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (232, N'Donphan', 90, 120, 120, 60, 60, 50, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (233, N'Porygon2', 85, 80, 90, 105, 95, 60, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (234, N'Stantler', 73, 95, 62, 85, 65, 85, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (235, N'Smeargle', 55, 20, 35, 20, 45, 75, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (236, N'Tyrogue', 35, 35, 35, 35, 35, 35, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (237, N'Hitmontop', 50, 95, 95, 35, 110, 70, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (238, N'Smoochum', 45, 30, 15, 85, 65, 65, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (239, N'Elekid', 45, 63, 37, 65, 55, 95, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (240, N'Magby', 45, 75, 37, 70, 55, 83, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (241, N'Miltank', 95, 80, 105, 40, 70, 100, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (242, N'Blissey', 255, 10, 10, 75, 135, 55, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (243, N'Raikou', 90, 85, 75, 115, 100, 115, 1, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (244, N'Entei', 115, 115, 85, 90, 75, 100, 1, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (245, N'Suicune', 100, 75, 115, 90, 115, 85, 1, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (246, N'Larvitar', 50, 64, 50, 45, 50, 41, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (247, N'Pupitar', 70, 84, 70, 65, 70, 51, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (248, N'Tyranitar', 100, 134, 110, 95, 100, 61, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (249, N'Lugia', 106, 90, 130, 90, 154, 110, 1, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (250, N'Ho-Oh', 106, 130, 90, 110, 154, 90, 1, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (251, N'Celebi', 100, 100, 100, 100, 100, 100, 0, 2)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (252, N'Treecko', 40, 45, 35, 65, 55, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (253, N'Grovyle', 50, 65, 45, 85, 65, 95, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (254, N'Sceptile', 70, 85, 65, 105, 85, 120, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (255, N'Torchic', 45, 60, 40, 70, 50, 45, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (256, N'Combusken', 60, 85, 60, 85, 60, 55, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (257, N'Blaziken', 80, 120, 70, 110, 70, 80, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (258, N'Mudkip', 50, 70, 50, 50, 50, 40, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (259, N'Marshtomp', 70, 85, 70, 60, 70, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (260, N'Swampert', 100, 110, 90, 85, 90, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (261, N'Poochyena', 35, 55, 35, 30, 30, 35, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (262, N'Mightyena', 70, 90, 70, 60, 60, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (263, N'Zigzagoon', 38, 30, 41, 30, 41, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (264, N'Linoone', 78, 70, 61, 50, 61, 100, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (265, N'Wurmple', 45, 45, 35, 20, 30, 20, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (266, N'Silcoon', 50, 35, 55, 25, 25, 15, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (267, N'Beautifly', 60, 70, 50, 100, 50, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (268, N'Cascoon', 50, 35, 55, 25, 25, 15, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (269, N'Dustox', 60, 50, 70, 50, 90, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (270, N'Lotad', 40, 30, 30, 40, 50, 30, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (271, N'Lombre', 60, 50, 50, 60, 70, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (272, N'Ludicolo', 80, 70, 70, 90, 100, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (273, N'Seedot', 40, 40, 50, 30, 30, 30, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (274, N'Nuzleaf', 70, 70, 40, 60, 40, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (275, N'Shiftry', 90, 100, 60, 90, 60, 80, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (276, N'Taillow', 40, 55, 30, 30, 30, 85, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (277, N'Swellow', 60, 85, 60, 50, 50, 125, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (278, N'Wingull', 40, 30, 30, 55, 30, 85, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (279, N'Pelipper', 60, 50, 100, 85, 70, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (280, N'Ralts', 28, 25, 25, 45, 35, 40, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (281, N'Kirlia', 38, 35, 35, 65, 55, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (282, N'Gardevoir', 68, 65, 65, 125, 115, 80, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (283, N'Surskit', 40, 30, 32, 50, 52, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (284, N'Masquerain', 70, 60, 62, 80, 82, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (285, N'Shroomish', 60, 40, 60, 40, 60, 35, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (286, N'Breloom', 60, 130, 80, 60, 60, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (287, N'Slakoth', 60, 60, 60, 35, 35, 30, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (288, N'Vigoroth', 80, 80, 80, 55, 55, 90, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (289, N'Slaking', 150, 160, 100, 95, 65, 100, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (290, N'Nincada', 31, 45, 90, 30, 30, 40, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (291, N'Ninjask', 61, 90, 45, 50, 50, 160, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (292, N'Shedinja', 1, 90, 45, 30, 30, 40, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (293, N'Whismur', 64, 51, 23, 51, 23, 28, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (294, N'Loudred', 84, 71, 43, 71, 43, 48, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (295, N'Exploud', 104, 91, 63, 91, 73, 68, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (296, N'Makuhita', 72, 60, 30, 20, 30, 25, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (297, N'Hariyama', 144, 120, 60, 40, 60, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (298, N'Azurill', 50, 20, 40, 20, 40, 20, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (299, N'Nosepass', 30, 45, 135, 45, 90, 30, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (300, N'Skitty', 50, 45, 45, 35, 35, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (301, N'Delcatty', 70, 65, 65, 55, 55, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (302, N'Sableye', 50, 75, 75, 65, 65, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (303, N'Mawile', 50, 85, 85, 55, 55, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (304, N'Aron', 50, 70, 100, 40, 40, 30, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (305, N'Lairon', 60, 90, 140, 50, 50, 40, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (306, N'Aggron', 70, 110, 180, 60, 60, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (307, N'Meditite', 30, 40, 55, 40, 55, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (308, N'Medicham', 60, 60, 75, 60, 75, 80, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (309, N'Electrike', 40, 45, 40, 65, 40, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (310, N'Manectric', 70, 75, 60, 105, 60, 105, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (311, N'Plusle', 60, 50, 40, 85, 75, 95, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (312, N'Minun', 60, 40, 50, 75, 85, 95, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (313, N'Volbeat', 65, 73, 55, 47, 75, 85, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (314, N'Illumise', 65, 47, 55, 73, 75, 85, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (315, N'Roselia', 50, 60, 45, 100, 80, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (316, N'Gulpin', 70, 43, 53, 43, 53, 40, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (317, N'Swalot', 100, 73, 83, 73, 83, 55, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (318, N'Carvanha', 45, 90, 20, 65, 20, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (319, N'Sharpedo', 70, 120, 40, 95, 40, 95, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (320, N'Wailmer', 130, 70, 35, 70, 35, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (321, N'Wailord', 170, 90, 45, 90, 45, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (322, N'Numel', 60, 60, 40, 65, 45, 35, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (323, N'Camerupt', 70, 100, 70, 105, 75, 40, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (324, N'Torkoal', 70, 85, 140, 85, 70, 20, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (325, N'Spoink', 60, 25, 35, 70, 80, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (326, N'Grumpig', 80, 45, 65, 90, 110, 80, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (327, N'Spinda', 60, 60, 60, 60, 60, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (328, N'Trapinch', 45, 100, 45, 45, 45, 10, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (329, N'Vibrava', 50, 70, 50, 50, 50, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (330, N'Flygon', 80, 100, 80, 80, 80, 100, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (331, N'Cacnea', 50, 85, 40, 85, 40, 35, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (332, N'Cacturne', 70, 115, 60, 115, 60, 55, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (333, N'Swablu', 45, 40, 60, 40, 75, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (334, N'Altaria', 75, 70, 90, 70, 105, 80, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (335, N'Zangoose', 73, 115, 60, 60, 60, 90, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (336, N'Seviper', 73, 100, 60, 100, 60, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (337, N'Lunatone', 70, 55, 65, 95, 85, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (338, N'Solrock', 70, 95, 85, 55, 65, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (339, N'Barboach', 50, 48, 43, 46, 41, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (340, N'Whiscash', 110, 78, 73, 76, 71, 60, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (341, N'Corphish', 43, 80, 65, 50, 35, 35, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (342, N'Crawdaunt', 63, 120, 85, 90, 55, 55, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (343, N'Baltoy', 40, 40, 55, 40, 70, 55, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (344, N'Claydol', 60, 70, 105, 70, 120, 75, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (345, N'Lileep', 66, 41, 77, 61, 87, 23, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (346, N'Cradily', 86, 81, 97, 81, 107, 43, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (347, N'Anorith', 45, 95, 50, 40, 50, 75, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (348, N'Armaldo', 75, 125, 100, 70, 80, 45, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (349, N'Feebas', 20, 15, 20, 10, 55, 80, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (350, N'Milotic', 95, 60, 79, 100, 125, 81, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (351, N'Castform', 70, 70, 70, 70, 70, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (352, N'Kecleon', 60, 90, 70, 60, 120, 40, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (353, N'Shuppet', 44, 75, 35, 63, 33, 45, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (354, N'Banette', 64, 115, 65, 83, 63, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (355, N'Duskull', 20, 40, 90, 30, 90, 25, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (356, N'Dusclops', 40, 70, 130, 60, 130, 25, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (357, N'Tropius', 99, 68, 83, 72, 87, 51, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (358, N'Chimecho', 65, 50, 70, 95, 80, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (359, N'Absol', 65, 130, 60, 75, 60, 75, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (360, N'Wynaut', 95, 23, 48, 23, 48, 23, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (361, N'Snorunt', 50, 50, 50, 50, 50, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (362, N'Glalie', 80, 80, 80, 80, 80, 80, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (363, N'Spheal', 70, 40, 50, 55, 50, 25, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (364, N'Sealeo', 90, 60, 70, 75, 70, 45, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (365, N'Walrein', 110, 80, 90, 95, 90, 65, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (366, N'Clamperl', 35, 64, 85, 74, 55, 32, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (367, N'Huntail', 55, 104, 105, 94, 75, 52, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (368, N'Gorebyss', 55, 84, 105, 114, 75, 52, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (369, N'Relicanth', 100, 90, 130, 45, 65, 55, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (370, N'Luvdisc', 43, 30, 55, 40, 65, 97, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (371, N'Bagon', 45, 75, 60, 40, 30, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (372, N'Shelgon', 65, 95, 100, 60, 50, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (373, N'Salamence', 95, 135, 80, 110, 80, 100, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (374, N'Beldum', 40, 55, 80, 35, 60, 30, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (375, N'Metang', 60, 75, 100, 55, 80, 50, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (376, N'Metagross', 80, 135, 130, 95, 90, 70, 0, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (377, N'Regirock', 80, 100, 200, 50, 100, 50, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (378, N'Regice', 80, 50, 100, 100, 200, 50, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (379, N'Registeel', 80, 75, 150, 75, 150, 50, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (380, N'Latias', 80, 80, 90, 110, 130, 110, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (381, N'Latios', 80, 90, 80, 130, 110, 110, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (382, N'Kyogre', 100, 100, 90, 150, 140, 90, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (383, N'Groudon', 100, 150, 140, 100, 90, 90, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (384, N'Rayquaza', 105, 150, 90, 150, 90, 95, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (385, N'Jirachi', 100, 100, 100, 100, 100, 100, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (386, N'Deoxys', 50, 150, 50, 150, 50, 150, 1, 3)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (387, N'Turtwig', 55, 68, 64, 45, 55, 31, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (388, N'Grotle', 75, 89, 85, 55, 65, 36, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (389, N'Torterra', 95, 109, 105, 75, 85, 56, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (390, N'Chimchar', 44, 58, 44, 58, 44, 61, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (391, N'Monferno', 64, 78, 52, 78, 52, 81, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (392, N'Infernape', 76, 104, 71, 104, 71, 108, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (393, N'Piplup', 53, 51, 53, 61, 56, 40, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (394, N'Prinplup', 64, 66, 68, 81, 76, 50, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (395, N'Empoleon', 84, 86, 88, 111, 101, 60, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (396, N'Starly', 40, 55, 30, 30, 30, 60, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (397, N'Staravia', 55, 75, 50, 40, 40, 80, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (398, N'Staraptor', 85, 120, 70, 50, 60, 100, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (399, N'Bidoof', 59, 45, 40, 35, 40, 31, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (400, N'Bibarel', 79, 85, 60, 55, 60, 71, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (401, N'Kricketot', 37, 25, 41, 25, 41, 25, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (402, N'Kricketune', 77, 85, 51, 55, 51, 65, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (403, N'Shinx', 45, 65, 34, 40, 34, 45, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (404, N'Luxio', 60, 85, 49, 60, 49, 60, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (405, N'Luxray', 80, 120, 79, 95, 79, 70, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (406, N'Budew', 40, 30, 35, 50, 70, 55, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (407, N'Roserade', 60, 70, 65, 125, 105, 90, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (408, N'Cranidos', 67, 125, 40, 30, 30, 58, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (409, N'Rampardos', 97, 165, 60, 65, 50, 58, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (410, N'Shieldon', 30, 42, 118, 42, 88, 30, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (411, N'Bastiodon', 60, 52, 168, 47, 138, 30, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (412, N'Burmy', 40, 29, 45, 29, 45, 36, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (413, N'Wormadam', 60, 59, 85, 79, 105, 36, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (414, N'Mothim', 70, 94, 50, 94, 50, 66, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (415, N'Combee', 30, 30, 42, 30, 42, 70, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (416, N'Vespiquen', 70, 80, 102, 80, 102, 40, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (417, N'Pachirisu', 60, 45, 70, 45, 90, 95, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (418, N'Buizel', 55, 65, 35, 60, 30, 85, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (419, N'Floatzel', 85, 105, 55, 85, 50, 115, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (420, N'Cherubi', 45, 35, 45, 62, 53, 35, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (421, N'Cherrim', 70, 60, 70, 87, 78, 85, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (422, N'Shellos', 76, 48, 48, 57, 62, 34, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (423, N'Gastrodon', 111, 83, 68, 92, 82, 39, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (424, N'Ambipom', 75, 100, 66, 60, 66, 115, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (425, N'Drifloon', 90, 50, 34, 60, 44, 70, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (426, N'Drifblim', 150, 80, 44, 90, 54, 80, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (427, N'Buneary', 55, 66, 44, 44, 56, 85, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (428, N'Lopunny', 65, 76, 84, 54, 96, 105, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (429, N'Mismagius', 60, 60, 60, 105, 105, 105, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (430, N'Honchkrow', 100, 125, 52, 105, 52, 71, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (431, N'Glameow', 49, 55, 42, 42, 37, 85, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (432, N'Purugly', 71, 82, 64, 64, 59, 112, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (433, N'Chingling', 45, 30, 50, 65, 50, 45, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (434, N'Stunky', 63, 63, 47, 41, 41, 74, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (435, N'Skuntank', 103, 93, 67, 71, 61, 84, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (436, N'Bronzor', 57, 24, 86, 24, 86, 23, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (437, N'Bronzong', 67, 89, 116, 79, 116, 33, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (438, N'Bonsly', 50, 80, 95, 10, 45, 10, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (439, N'Mime Jr.', 20, 25, 45, 70, 90, 60, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (440, N'Happiny', 100, 5, 5, 15, 65, 30, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (441, N'Chatot', 76, 65, 45, 92, 42, 91, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (442, N'Spiritomb', 50, 92, 108, 92, 108, 35, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (443, N'Gible', 58, 70, 45, 40, 45, 42, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (444, N'Gabite', 68, 90, 65, 50, 55, 82, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (445, N'Garchomp', 108, 130, 95, 80, 85, 102, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (446, N'Munchlax', 135, 85, 40, 40, 85, 5, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (447, N'Riolu', 40, 70, 40, 35, 40, 60, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (448, N'Lucario', 70, 110, 70, 115, 70, 90, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (449, N'Hippopotas', 68, 72, 78, 38, 42, 32, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (450, N'Hippowdon', 108, 112, 118, 68, 72, 47, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (451, N'Skorupi', 40, 50, 90, 30, 55, 65, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (452, N'Drapion', 70, 90, 110, 60, 75, 95, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (453, N'Croagunk', 48, 61, 40, 61, 40, 50, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (454, N'Toxicroak', 83, 106, 65, 86, 65, 85, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (455, N'Carnivine', 74, 100, 72, 90, 72, 46, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (456, N'Finneon', 49, 49, 56, 49, 61, 66, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (457, N'Lumineon', 69, 69, 76, 69, 86, 91, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (458, N'Mantyke', 45, 20, 50, 60, 120, 50, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (459, N'Snover', 60, 62, 50, 62, 60, 40, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (460, N'Abomasnow', 90, 92, 75, 92, 85, 60, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (461, N'Weavile', 70, 120, 65, 45, 85, 125, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (462, N'Magnezone', 70, 70, 115, 130, 90, 60, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (463, N'Lickilicky', 110, 85, 95, 80, 95, 50, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (464, N'Rhyperior', 115, 140, 130, 55, 55, 40, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (465, N'Tangrowth', 100, 100, 125, 110, 50, 50, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (466, N'Electivire', 75, 123, 67, 95, 85, 95, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (467, N'Magmortar', 75, 95, 67, 125, 95, 83, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (468, N'Togekiss', 85, 50, 95, 120, 115, 80, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (469, N'Yanmega', 86, 76, 86, 116, 56, 95, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (470, N'Leafeon', 65, 110, 130, 60, 65, 95, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (471, N'Glaceon', 65, 60, 110, 130, 95, 65, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (472, N'Gliscor', 75, 95, 125, 45, 75, 95, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (473, N'Mamoswine', 110, 130, 80, 70, 60, 80, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (474, N'Porygon-Z', 85, 80, 70, 135, 75, 90, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (475, N'Gallade', 68, 125, 65, 65, 115, 80, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (476, N'Probopass', 60, 55, 145, 75, 150, 40, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (477, N'Dusknoir', 45, 100, 135, 65, 135, 45, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (478, N'Froslass', 70, 80, 70, 80, 70, 110, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (479, N'Rotom', 50, 50, 77, 95, 77, 91, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (480, N'Uxie', 75, 75, 130, 75, 130, 95, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (481, N'Mesprit', 80, 105, 105, 105, 105, 80, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (482, N'Azelf', 75, 125, 70, 125, 70, 115, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (483, N'Dialga', 100, 120, 120, 150, 100, 90, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (484, N'Palkia', 90, 120, 100, 150, 120, 100, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (485, N'Heatran', 91, 90, 106, 130, 106, 77, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (486, N'Regigigas', 110, 160, 110, 80, 110, 100, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (487, N'Giratina', 150, 100, 120, 100, 120, 90, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (488, N'Cresselia', 120, 70, 120, 75, 130, 85, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (489, N'Phione', 80, 80, 80, 80, 80, 80, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (490, N'Manaphy', 100, 100, 100, 100, 100, 100, 0, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (491, N'Darkrai', 70, 90, 90, 135, 90, 125, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (492, N'Shaymin', 100, 100, 100, 100, 100, 100, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (493, N'Arceus', 120, 120, 120, 120, 120, 120, 1, 4)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (494, N'Victini', 100, 100, 100, 100, 100, 100, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (495, N'Snivy', 45, 45, 55, 45, 55, 63, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (496, N'Servine', 60, 60, 75, 60, 75, 83, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (497, N'Serperior', 75, 75, 95, 75, 95, 113, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (498, N'Tepig', 65, 63, 45, 45, 45, 45, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (499, N'Pignite', 90, 93, 55, 70, 55, 55, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (500, N'Emboar', 110, 123, 65, 100, 65, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (501, N'Oshawott', 55, 55, 45, 63, 45, 45, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (502, N'Dewott', 75, 75, 60, 83, 60, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (503, N'Samurott', 95, 100, 85, 108, 70, 70, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (504, N'Patrat', 45, 55, 39, 35, 39, 42, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (505, N'Watchog', 60, 85, 69, 60, 69, 77, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (506, N'Lillipup', 45, 60, 45, 25, 45, 55, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (507, N'Herdier', 65, 80, 65, 35, 65, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (508, N'Stoutland', 85, 110, 90, 45, 90, 80, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (509, N'Purrloin', 41, 50, 37, 50, 37, 66, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (510, N'Liepard', 64, 88, 50, 88, 50, 106, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (511, N'Pansage', 50, 53, 48, 53, 48, 64, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (512, N'Simisage', 75, 98, 63, 98, 63, 101, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (513, N'Pansear', 50, 53, 48, 53, 48, 64, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (514, N'Simisear', 75, 98, 63, 98, 63, 101, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (515, N'Panpour', 50, 53, 48, 53, 48, 64, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (516, N'Simipour', 75, 98, 63, 98, 63, 101, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (517, N'Munna', 76, 25, 45, 67, 55, 24, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (518, N'Musharna', 116, 55, 85, 107, 95, 29, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (519, N'Pidove', 50, 55, 50, 36, 30, 43, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (520, N'Tranquill', 62, 77, 62, 50, 42, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (521, N'Unfezant', 80, 115, 80, 65, 55, 93, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (522, N'Blitzle', 45, 60, 32, 50, 32, 76, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (523, N'Zebstrika', 75, 100, 63, 80, 63, 116, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (524, N'Roggenrola', 55, 75, 85, 25, 25, 15, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (525, N'Boldore', 70, 105, 105, 50, 40, 20, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (526, N'Gigalith', 85, 135, 130, 60, 80, 25, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (527, N'Woobat', 55, 45, 43, 55, 43, 72, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (528, N'Swoobat', 67, 57, 55, 77, 55, 114, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (529, N'Drilbur', 60, 85, 40, 30, 45, 68, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (530, N'Excadrill', 110, 135, 60, 50, 65, 88, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (531, N'Audino', 103, 60, 86, 60, 86, 50, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (532, N'Timburr', 75, 80, 55, 25, 35, 35, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (533, N'Gurdurr', 85, 105, 85, 40, 50, 40, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (534, N'Conkeldurr', 105, 140, 95, 55, 65, 45, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (535, N'Tympole', 50, 50, 40, 50, 40, 64, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (536, N'Palpitoad', 75, 65, 55, 65, 55, 69, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (537, N'Seismitoad', 105, 95, 75, 85, 75, 74, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (538, N'Throh', 120, 100, 85, 30, 85, 45, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (539, N'Sawk', 75, 125, 75, 30, 75, 85, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (540, N'Sewaddle', 45, 53, 70, 40, 60, 42, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (541, N'Swadloon', 55, 63, 90, 50, 80, 42, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (542, N'Leavanny', 75, 103, 80, 70, 80, 92, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (543, N'Venipede', 30, 45, 59, 30, 39, 57, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (544, N'Whirlipede', 40, 55, 99, 40, 79, 47, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (545, N'Scolipede', 60, 100, 89, 55, 69, 112, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (546, N'Cottonee', 40, 27, 60, 37, 50, 66, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (547, N'Whimsicott', 60, 67, 85, 77, 75, 116, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (548, N'Petilil', 45, 35, 50, 70, 50, 30, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (549, N'Lilligant', 70, 60, 75, 110, 75, 90, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (550, N'Basculin', 70, 92, 65, 80, 55, 98, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (551, N'Sandile', 50, 72, 35, 35, 35, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (552, N'Krokorok', 60, 82, 45, 45, 45, 74, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (553, N'Krookodile', 95, 117, 80, 65, 70, 92, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (554, N'Darumaka', 70, 90, 45, 15, 45, 50, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (555, N'Darmanitan', 105, 140, 55, 30, 55, 95, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (556, N'Maractus', 75, 86, 67, 106, 67, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (557, N'Dwebble', 50, 65, 85, 35, 35, 55, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (558, N'Crustle', 70, 95, 125, 65, 75, 45, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (559, N'Scraggy', 50, 75, 70, 35, 70, 48, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (560, N'Scrafty', 65, 90, 115, 45, 115, 58, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (561, N'Sigilyph', 72, 58, 80, 103, 80, 97, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (562, N'Yamask', 38, 30, 85, 55, 65, 30, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (563, N'Cofagrigus', 58, 50, 145, 95, 105, 30, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (564, N'Tirtouga', 54, 78, 103, 53, 45, 22, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (565, N'Carracosta', 74, 108, 133, 83, 65, 32, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (566, N'Archen', 55, 112, 45, 74, 45, 70, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (567, N'Archeops', 75, 140, 65, 112, 65, 110, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (568, N'Trubbish', 50, 50, 62, 40, 62, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (569, N'Garbodor', 80, 95, 82, 60, 82, 75, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (570, N'Zorua', 40, 65, 40, 80, 40, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (571, N'Zoroark', 60, 105, 60, 120, 60, 105, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (572, N'Minccino', 55, 50, 40, 40, 40, 75, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (573, N'Cinccino', 75, 95, 60, 65, 60, 115, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (574, N'Gothita', 45, 30, 50, 55, 65, 45, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (575, N'Gothorita', 60, 45, 70, 75, 85, 55, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (576, N'Gothitelle', 70, 55, 95, 95, 110, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (577, N'Solosis', 45, 30, 40, 105, 50, 20, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (578, N'Duosion', 65, 40, 50, 125, 60, 30, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (579, N'Reuniclus', 110, 65, 75, 125, 85, 30, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (580, N'Ducklett', 62, 44, 50, 44, 50, 55, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (581, N'Swanna', 75, 87, 63, 87, 63, 98, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (582, N'Vanillite', 36, 50, 50, 65, 60, 44, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (583, N'Vanillish', 51, 65, 65, 80, 75, 59, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (584, N'Vanilluxe', 71, 95, 85, 110, 95, 79, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (585, N'Deerling', 60, 60, 50, 40, 50, 75, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (586, N'Sawsbuck', 80, 100, 70, 60, 70, 95, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (587, N'Emolga', 55, 75, 60, 75, 60, 103, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (588, N'Karrablast', 50, 75, 45, 40, 45, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (589, N'Escavalier', 70, 135, 105, 60, 105, 20, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (590, N'Foongus', 69, 55, 45, 55, 55, 15, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (591, N'Amoonguss', 114, 85, 70, 85, 80, 30, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (592, N'Frillish', 55, 40, 50, 65, 85, 40, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (593, N'Jellicent', 100, 60, 70, 85, 105, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (594, N'Alomomola', 165, 75, 80, 40, 45, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (595, N'Joltik', 50, 47, 50, 57, 50, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (596, N'Galvantula', 70, 77, 60, 97, 60, 108, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (597, N'Ferroseed', 44, 50, 91, 24, 86, 10, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (598, N'Ferrothorn', 74, 94, 131, 54, 116, 20, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (599, N'Klink', 40, 55, 70, 45, 60, 30, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (600, N'Klang', 60, 80, 95, 70, 85, 50, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (601, N'Klinklang', 60, 100, 115, 70, 85, 90, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (602, N'Tynamo', 35, 55, 40, 45, 40, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (603, N'Eelektrik', 65, 85, 70, 75, 70, 40, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (604, N'Eelektross', 85, 115, 80, 105, 80, 50, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (605, N'Elgyem', 55, 55, 55, 85, 55, 30, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (606, N'Beheeyem', 75, 75, 75, 125, 95, 40, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (607, N'Litwick', 50, 30, 55, 65, 55, 20, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (608, N'Lampent', 60, 40, 60, 95, 60, 55, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (609, N'Chandelure', 60, 55, 90, 145, 90, 80, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (610, N'Axew', 46, 87, 60, 30, 40, 57, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (611, N'Fraxure', 66, 117, 70, 40, 50, 67, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (612, N'Haxorus', 76, 147, 90, 60, 70, 97, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (613, N'Cubchoo', 55, 70, 40, 60, 40, 40, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (614, N'Beartic', 95, 110, 80, 70, 80, 50, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (615, N'Cryogonal', 70, 50, 30, 95, 135, 105, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (616, N'Shelmet', 50, 40, 85, 40, 65, 25, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (617, N'Accelgor', 80, 70, 40, 100, 60, 145, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (618, N'Stunfisk', 109, 66, 84, 81, 99, 32, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (619, N'Mienfoo', 45, 85, 50, 55, 50, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (620, N'Mienshao', 65, 125, 60, 95, 60, 105, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (621, N'Druddigon', 77, 120, 90, 60, 90, 48, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (622, N'Golett', 59, 74, 50, 35, 50, 35, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (623, N'Golurk', 89, 124, 80, 55, 80, 55, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (624, N'Pawniard', 45, 85, 70, 40, 40, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (625, N'Bisharp', 65, 125, 100, 60, 70, 70, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (626, N'Bouffalant', 95, 110, 95, 40, 95, 55, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (627, N'Rufflet', 70, 83, 50, 37, 50, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (628, N'Braviary', 100, 123, 75, 57, 75, 80, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (629, N'Vullaby', 70, 55, 75, 45, 65, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (630, N'Mandibuzz', 110, 65, 105, 55, 95, 80, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (631, N'Heatmor', 85, 97, 66, 105, 66, 65, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (632, N'Durant', 58, 109, 112, 48, 48, 109, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (633, N'Deino', 52, 65, 50, 45, 50, 38, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (634, N'Zweilous', 72, 85, 70, 65, 70, 58, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (635, N'Hydreigon', 92, 105, 90, 125, 90, 98, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (636, N'Larvesta', 55, 85, 55, 50, 55, 60, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (637, N'Volcarona', 85, 60, 65, 135, 105, 100, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (638, N'Cobalion', 91, 90, 129, 90, 72, 108, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (639, N'Terrakion', 91, 129, 90, 72, 90, 108, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (640, N'Virizion', 91, 90, 72, 90, 129, 108, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (641, N'Tornadus', 79, 115, 70, 125, 80, 111, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (642, N'Thundurus', 79, 115, 70, 125, 80, 111, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (643, N'Reshiram', 100, 120, 100, 150, 120, 90, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (644, N'Zekrom', 100, 150, 120, 120, 100, 90, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (645, N'Landorus', 89, 125, 90, 115, 80, 101, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (646, N'Kyurem', 125, 130, 90, 130, 90, 95, 1, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (647, N'Keldeo', 91, 72, 90, 129, 90, 108, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (648, N'Meloetta', 100, 77, 77, 128, 128, 90, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (649, N'Genesect', 71, 120, 95, 120, 95, 99, 0, 5)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (650, N'Chespin', 56, 61, 65, 48, 45, 38, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (651, N'Quilladin', 61, 78, 95, 56, 58, 57, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (652, N'Chesnaught', 88, 107, 122, 74, 75, 64, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (653, N'Fennekin', 40, 45, 40, 62, 60, 60, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (654, N'Braixen', 59, 59, 58, 90, 70, 73, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (655, N'Delphox', 75, 69, 72, 114, 100, 104, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (656, N'Froakie', 41, 56, 40, 62, 44, 71, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (657, N'Frogadier', 54, 63, 52, 83, 56, 97, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (658, N'Greninja', 72, 95, 67, 103, 71, 122, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (659, N'Bunnelby', 38, 36, 38, 32, 36, 57, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (660, N'Diggersby', 85, 56, 77, 50, 77, 78, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (661, N'Fletchling', 45, 50, 43, 40, 38, 62, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (662, N'Fletchinder', 62, 73, 55, 56, 52, 84, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (663, N'Talonflame', 78, 81, 71, 74, 69, 126, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (664, N'Scatterbug', 38, 35, 40, 27, 25, 35, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (665, N'Spewpa', 45, 22, 60, 27, 30, 29, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (666, N'Vivillon', 80, 52, 50, 90, 50, 89, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (667, N'Litleo', 62, 50, 58, 73, 54, 72, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (668, N'Pyroar', 86, 68, 72, 109, 66, 106, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (669, N'Flabébé', 44, 38, 39, 61, 79, 42, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (670, N'Floette', 54, 45, 47, 75, 98, 52, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (671, N'Florges', 78, 65, 68, 112, 154, 75, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (672, N'Skiddo', 66, 65, 48, 62, 57, 52, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (673, N'Gogoat', 123, 100, 62, 97, 81, 68, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (674, N'Pancham', 67, 82, 62, 46, 48, 43, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (675, N'Pangoro', 95, 124, 78, 69, 71, 58, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (676, N'Furfrou', 75, 80, 60, 65, 90, 102, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (677, N'Espurr', 62, 48, 54, 63, 60, 68, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (678, N'Meowstic', 74, 48, 76, 83, 81, 104, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (679, N'Honedge', 45, 80, 100, 35, 37, 28, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (680, N'Doublade', 59, 110, 150, 45, 49, 35, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (681, N'Aegislash', 60, 50, 150, 50, 150, 60, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (682, N'Spritzee', 78, 52, 60, 63, 65, 23, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (683, N'Aromatisse', 101, 72, 72, 99, 89, 29, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (684, N'Swirlix', 62, 48, 66, 59, 57, 49, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (685, N'Slurpuff', 82, 80, 86, 85, 75, 72, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (686, N'Inkay', 53, 54, 53, 37, 46, 45, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (687, N'Malamar', 86, 92, 88, 68, 75, 73, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (688, N'Binacle', 42, 52, 67, 39, 56, 50, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (689, N'Barbaracle', 72, 105, 115, 54, 86, 68, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (690, N'Skrelp', 50, 60, 60, 60, 60, 30, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (691, N'Dragalge', 65, 75, 90, 97, 123, 44, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (692, N'Clauncher', 50, 53, 62, 58, 63, 44, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (693, N'Clawitzer', 71, 73, 88, 120, 89, 59, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (694, N'Helioptile', 44, 38, 33, 61, 43, 70, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (695, N'Heliolisk', 62, 55, 52, 109, 94, 109, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (696, N'Tyrunt', 58, 89, 77, 45, 45, 48, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (697, N'Tyrantrum', 82, 121, 119, 69, 59, 71, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (698, N'Amaura', 77, 59, 50, 67, 63, 46, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (699, N'Aurorus', 123, 77, 72, 99, 92, 58, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (700, N'Sylveon', 95, 65, 65, 110, 130, 60, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (701, N'Hawlucha', 78, 92, 75, 74, 63, 118, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (702, N'Dedenne', 67, 58, 57, 81, 67, 101, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (703, N'Carbink', 50, 50, 150, 50, 150, 50, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (704, N'Goomy', 45, 50, 35, 55, 75, 40, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (705, N'Sliggoo', 68, 75, 53, 83, 113, 60, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (706, N'Goodra', 90, 100, 70, 110, 150, 80, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (707, N'Klefki', 57, 80, 91, 80, 87, 75, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (708, N'Phantump', 43, 70, 48, 50, 60, 38, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (709, N'Trevenant', 85, 110, 76, 65, 82, 56, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (710, N'Pumpkaboo', 49, 66, 70, 44, 55, 51, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (711, N'Gourgeist', 65, 90, 122, 58, 75, 84, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (712, N'Bergmite', 55, 69, 85, 32, 35, 28, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (713, N'Avalugg', 95, 117, 184, 44, 46, 28, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (714, N'Noibat', 40, 30, 35, 45, 40, 55, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (715, N'Noivern', 85, 70, 80, 97, 80, 123, 0, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (716, N'Xerneas', 126, 131, 95, 131, 98, 99, 1, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (717, N'Yveltal', 126, 131, 95, 131, 98, 99, 1, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (718, N'Zygarde', 108, 100, 121, 81, 95, 95, 1, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (719, N'Diancie', 50, 100, 150, 100, 150, 50, 1, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (720, N'Hoopahoopa', 80, 110, 60, 150, 130, 70, 1, 6)
GO
INSERT [dbo].[Pokemons] ([ID], [PokemonName], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Legendary], [RegionID]) VALUES (721, N'Volcanion', 80, 110, 120, 130, 90, 70, 1, 6)
GO
SET IDENTITY_INSERT [dbo].[Pokemons] OFF
GO
SET IDENTITY_INSERT [dbo].[Regions] ON 
GO
INSERT [dbo].[Regions] ([ID], [RegionName], [ReleaceDate], [ImageURL]) VALUES (1, N'Kanto', CAST(N'1996-02-27' AS Date), N'https://static.wikia.nocookie.net/espokemon/images/c/c6/Kanto_mapa_juegos.png')
GO
INSERT [dbo].[Regions] ([ID], [RegionName], [ReleaceDate], [ImageURL]) VALUES (2, N'Johto', CAST(N'1999-11-21' AS Date), N'https://static.wikia.nocookie.net/espokemon/images/4/43/Johto_mapa_juegos.png')
GO
INSERT [dbo].[Regions] ([ID], [RegionName], [ReleaceDate], [ImageURL]) VALUES (3, N'Hoenn', CAST(N'2002-11-21' AS Date), N'https://static.wikia.nocookie.net/espokemon/images/1/1c/Mapa_Hoenn_juegos.png')
GO
INSERT [dbo].[Regions] ([ID], [RegionName], [ReleaceDate], [ImageURL]) VALUES (4, N'Sinnoh', CAST(N'2006-09-28' AS Date), N'https://static.wikia.nocookie.net/espokemon/images/0/03/Sinnoh_mapa_juegos.png')
GO
INSERT [dbo].[Regions] ([ID], [RegionName], [ReleaceDate], [ImageURL]) VALUES (5, N'Teselia', CAST(N'2010-09-18' AS Date), N'https://static.wikia.nocookie.net/espokemon/images/d/dd/Teselia2_mapa_juegos.png')
GO
INSERT [dbo].[Regions] ([ID], [RegionName], [ReleaceDate], [ImageURL]) VALUES (6, N'Kalos', CAST(N'2013-10-12' AS Date), N'https://static.wikia.nocookie.net/espokemon/images/6/65/Mapa_Alola_SL.png')
GO
SET IDENTITY_INSERT [dbo].[Regions] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (4, N'Bug')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (16, N'Dark')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (15, N'Dragon')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (7, N'Electric')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (9, N'Fairy')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (10, N'Fighting')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (2, N'Fire')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (18, N'Flying')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (13, N'Ghost')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (1, N'Grass')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (8, N'Ground')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (14, N'Ice')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (5, N'Normal')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (6, N'Poison')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (11, N'Psychic')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (12, N'Rock')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (17, N'Steel')
GO
INSERT [dbo].[Types] ([ID], [TypeName]) VALUES (3, N'Water')
GO
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (1, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (1, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (2, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (2, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (3, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (3, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (4, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (5, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (6, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (6, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (7, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (8, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (9, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (10, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (11, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (12, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (12, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (13, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (13, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (14, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (14, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (15, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (15, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (16, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (16, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (17, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (17, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (18, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (18, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (19, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (20, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (21, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (21, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (22, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (22, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (23, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (24, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (25, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (26, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (27, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (28, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (29, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (30, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (31, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (31, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (32, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (33, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (34, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (34, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (35, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (36, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (37, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (38, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (39, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (39, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (40, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (40, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (41, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (41, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (42, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (42, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (43, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (43, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (44, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (44, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (45, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (45, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (46, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (46, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (47, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (47, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (48, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (48, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (49, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (49, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (50, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (51, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (52, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (53, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (54, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (55, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (56, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (57, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (58, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (59, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (60, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (61, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (62, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (62, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (63, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (64, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (65, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (66, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (67, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (68, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (69, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (69, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (70, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (70, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (71, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (71, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (72, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (72, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (73, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (73, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (74, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (74, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (75, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (75, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (76, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (76, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (77, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (78, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (79, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (79, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (80, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (80, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (81, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (81, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (82, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (82, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (83, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (83, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (84, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (84, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (85, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (85, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (86, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (87, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (87, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (88, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (89, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (90, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (91, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (91, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (92, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (92, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (93, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (93, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (94, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (94, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (95, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (95, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (96, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (97, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (98, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (99, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (100, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (101, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (102, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (102, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (103, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (103, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (104, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (105, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (106, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (107, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (108, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (109, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (110, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (111, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (111, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (112, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (112, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (113, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (114, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (115, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (116, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (117, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (118, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (119, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (120, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (121, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (121, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (122, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (122, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (123, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (123, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (124, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (124, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (125, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (126, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (127, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (128, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (129, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (130, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (130, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (131, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (131, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (132, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (133, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (134, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (135, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (136, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (137, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (138, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (138, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (139, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (139, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (140, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (140, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (141, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (141, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (142, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (142, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (143, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (144, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (144, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (145, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (145, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (146, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (146, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (147, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (148, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (149, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (149, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (150, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (151, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (152, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (153, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (154, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (155, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (156, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (157, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (158, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (159, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (160, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (161, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (162, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (163, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (163, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (164, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (164, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (165, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (165, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (166, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (166, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (167, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (167, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (168, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (168, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (169, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (169, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (170, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (170, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (171, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (171, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (172, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (173, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (174, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (174, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (175, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (176, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (176, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (177, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (177, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (178, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (178, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (179, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (180, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (181, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (182, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (183, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (183, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (184, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (184, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (185, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (186, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (187, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (187, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (188, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (188, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (189, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (189, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (190, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (191, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (192, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (193, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (193, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (194, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (194, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (195, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (195, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (196, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (197, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (198, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (198, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (199, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (199, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (200, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (201, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (202, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (203, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (203, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (204, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (205, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (205, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (206, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (207, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (207, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (208, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (208, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (209, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (210, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (211, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (211, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (212, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (212, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (213, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (213, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (214, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (214, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (215, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (215, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (216, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (217, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (218, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (219, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (219, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (220, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (220, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (221, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (221, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (222, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (222, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (223, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (224, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (225, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (225, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (226, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (226, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (227, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (227, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (228, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (228, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (229, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (229, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (230, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (230, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (231, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (232, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (233, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (234, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (235, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (236, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (237, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (238, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (238, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (239, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (240, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (241, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (242, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (243, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (244, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (245, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (246, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (246, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (247, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (247, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (248, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (248, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (249, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (249, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (250, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (250, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (251, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (251, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (252, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (253, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (254, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (255, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (256, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (256, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (257, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (257, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (258, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (259, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (259, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (260, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (260, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (261, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (262, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (263, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (264, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (265, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (266, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (267, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (267, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (268, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (269, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (269, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (270, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (270, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (271, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (271, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (272, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (272, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (273, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (274, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (274, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (275, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (275, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (276, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (276, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (277, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (277, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (278, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (278, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (279, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (279, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (280, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (280, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (281, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (281, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (282, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (282, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (283, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (283, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (284, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (284, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (285, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (286, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (286, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (287, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (288, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (289, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (290, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (290, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (291, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (291, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (292, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (292, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (293, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (294, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (295, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (296, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (297, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (298, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (298, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (299, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (300, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (301, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (302, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (302, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (303, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (303, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (304, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (304, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (305, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (305, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (306, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (306, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (307, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (307, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (308, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (308, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (309, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (310, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (311, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (312, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (313, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (314, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (315, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (315, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (316, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (317, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (318, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (318, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (319, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (319, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (320, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (321, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (322, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (322, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (323, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (323, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (324, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (325, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (326, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (327, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (328, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (329, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (329, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (330, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (330, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (331, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (332, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (332, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (333, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (333, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (334, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (334, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (335, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (336, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (337, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (337, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (338, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (338, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (339, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (339, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (340, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (340, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (341, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (342, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (342, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (343, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (343, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (344, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (344, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (345, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (345, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (346, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (346, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (347, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (347, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (348, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (348, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (349, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (350, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (351, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (352, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (353, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (354, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (355, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (356, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (357, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (357, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (358, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (359, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (360, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (361, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (362, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (363, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (363, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (364, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (364, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (365, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (365, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (366, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (367, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (368, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (369, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (369, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (370, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (371, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (372, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (373, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (373, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (374, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (374, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (375, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (375, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (376, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (376, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (377, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (378, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (379, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (380, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (380, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (381, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (381, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (382, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (383, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (384, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (384, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (385, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (385, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (386, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (387, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (388, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (389, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (389, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (390, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (391, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (391, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (392, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (392, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (393, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (394, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (395, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (395, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (396, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (396, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (397, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (397, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (398, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (398, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (399, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (400, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (400, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (401, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (402, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (403, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (404, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (405, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (406, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (406, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (407, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (407, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (408, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (409, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (410, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (410, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (411, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (411, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (412, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (413, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (413, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (414, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (414, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (415, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (415, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (416, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (416, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (417, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (418, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (419, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (420, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (421, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (422, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (423, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (423, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (424, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (425, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (425, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (426, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (426, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (427, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (428, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (429, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (430, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (430, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (431, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (432, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (433, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (434, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (434, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (435, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (435, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (436, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (436, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (437, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (437, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (438, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (439, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (439, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (440, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (441, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (441, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (442, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (442, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (443, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (443, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (444, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (444, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (445, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (445, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (446, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (447, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (448, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (448, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (449, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (450, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (451, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (451, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (452, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (452, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (453, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (453, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (454, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (454, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (455, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (456, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (457, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (458, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (458, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (459, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (459, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (460, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (460, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (461, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (461, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (462, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (462, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (463, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (464, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (464, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (465, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (466, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (467, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (468, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (468, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (469, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (469, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (470, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (471, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (472, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (472, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (473, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (473, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (474, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (475, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (475, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (476, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (476, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (477, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (478, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (478, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (479, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (479, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (480, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (481, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (482, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (483, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (483, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (484, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (484, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (485, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (485, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (486, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (487, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (487, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (488, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (489, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (490, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (491, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (492, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (493, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (494, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (494, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (495, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (496, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (497, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (498, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (499, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (499, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (500, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (500, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (501, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (502, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (503, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (504, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (505, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (506, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (507, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (508, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (509, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (510, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (511, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (512, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (513, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (514, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (515, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (516, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (517, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (518, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (519, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (519, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (520, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (520, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (521, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (521, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (522, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (523, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (524, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (525, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (526, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (527, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (527, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (528, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (528, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (529, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (530, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (530, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (531, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (532, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (533, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (534, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (535, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (536, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (536, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (537, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (537, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (538, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (539, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (540, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (540, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (541, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (541, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (542, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (542, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (543, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (543, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (544, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (544, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (545, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (545, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (546, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (546, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (547, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (547, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (548, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (549, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (550, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (551, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (551, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (552, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (552, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (553, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (553, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (554, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (555, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (556, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (557, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (557, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (558, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (558, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (559, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (559, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (560, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (560, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (561, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (561, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (562, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (563, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (564, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (564, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (565, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (565, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (566, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (566, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (567, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (567, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (568, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (569, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (570, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (571, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (572, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (573, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (574, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (575, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (576, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (577, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (578, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (579, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (580, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (580, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (581, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (581, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (582, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (583, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (584, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (585, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (585, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (586, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (586, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (587, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (587, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (588, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (589, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (589, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (590, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (590, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (591, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (591, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (592, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (592, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (593, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (593, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (594, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (595, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (595, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (596, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (596, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (597, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (597, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (598, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (598, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (599, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (600, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (601, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (602, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (603, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (604, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (605, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (606, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (607, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (607, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (608, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (608, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (609, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (609, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (610, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (611, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (612, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (613, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (614, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (615, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (616, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (617, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (618, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (618, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (619, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (620, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (621, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (622, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (622, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (623, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (623, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (624, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (624, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (625, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (625, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (626, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (627, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (627, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (628, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (628, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (629, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (629, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (630, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (630, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (631, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (632, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (632, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (633, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (633, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (634, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (634, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (635, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (635, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (636, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (636, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (637, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (637, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (638, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (638, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (639, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (639, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (640, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (640, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (641, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (642, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (642, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (643, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (643, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (644, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (644, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (645, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (645, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (646, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (646, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (647, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (647, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (648, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (648, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (649, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (649, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (650, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (651, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (652, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (652, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (653, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (654, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (655, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (655, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (656, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (657, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (658, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (658, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (659, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (660, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (660, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (661, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (661, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (662, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (662, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (663, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (663, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (664, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (665, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (666, 4)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (666, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (667, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (667, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (668, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (668, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (669, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (670, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (671, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (672, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (673, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (674, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (675, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (675, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (676, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (677, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (678, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (679, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (679, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (680, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (680, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (681, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (681, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (682, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (683, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (684, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (685, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (686, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (686, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (687, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (687, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (688, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (688, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (689, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (689, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (690, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (690, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (691, 6)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (691, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (692, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (693, 3)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (694, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (694, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (695, 5)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (695, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (696, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (696, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (697, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (697, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (698, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (698, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (699, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (699, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (700, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (701, 10)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (701, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (702, 7)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (702, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (703, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (703, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (704, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (705, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (706, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (707, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (707, 17)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (708, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (708, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (709, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (709, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (710, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (710, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (711, 1)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (711, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (712, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (713, 14)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (714, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (714, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (715, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (715, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (716, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (717, 16)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (717, 18)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (718, 8)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (718, 15)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (719, 9)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (719, 12)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (720, 11)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (720, 13)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (721, 2)
GO
INSERT [dbo].[Types_Pokemon] ([PokemonID], [TypeID]) VALUES (721, 3)
GO
SET IDENTITY_INSERT [dbo].[Zones] ON 
GO
INSERT [dbo].[Zones] ([ID], [ZoneName]) VALUES (2, N'City')
GO
INSERT [dbo].[Zones] ([ID], [ZoneName]) VALUES (3, N'Island')
GO
INSERT [dbo].[Zones] ([ID], [ZoneName]) VALUES (1, N'Town')
GO
SET IDENTITY_INSERT [dbo].[Zones] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ImagesBy__372DE2C580948CC4]    Script Date: 29/10/2022 18:31:13 ******/
ALTER TABLE [dbo].[Images_Pokemon] ADD UNIQUE NONCLUSTERED 
(
	[ImageURL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Places__540ADD39C3EC1558]    Script Date: 29/10/2022 18:31:13 ******/
ALTER TABLE [dbo].[Places] ADD UNIQUE NONCLUSTERED 
(
	[PlaceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__PokemonG__D5222B4FE4636E92]    Script Date: 29/10/2022 18:31:13 ******/
ALTER TABLE [dbo].[PokemonGyms] ADD UNIQUE NONCLUSTERED 
(
	[PlaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Pokemons__8461352A14EEBA59]    Script Date: 29/10/2022 18:31:13 ******/
ALTER TABLE [dbo].[Pokemons] ADD UNIQUE NONCLUSTERED 
(
	[PokemonName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Regions__A6A5AD7A02947758]    Script Date: 29/10/2022 18:31:13 ******/
ALTER TABLE [dbo].[Regions] ADD UNIQUE NONCLUSTERED 
(
	[RegionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Types__D4E7DFA84909A8ED]    Script Date: 29/10/2022 18:31:13 ******/
ALTER TABLE [dbo].[Types] ADD UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Zones__EE0DD16877877E53]    Script Date: 29/10/2022 18:31:13 ******/
ALTER TABLE [dbo].[Zones] ADD UNIQUE NONCLUSTERED 
(
	[ZoneName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Evolutions]  WITH CHECK ADD FOREIGN KEY([EvolutionID])
REFERENCES [dbo].[Pokemons] ([ID])
GO
ALTER TABLE [dbo].[Evolutions]  WITH CHECK ADD FOREIGN KEY([PokemonID])
REFERENCES [dbo].[Pokemons] ([ID])
GO
ALTER TABLE [dbo].[GymLeaders]  WITH CHECK ADD FOREIGN KEY([GymID])
REFERENCES [dbo].[PokemonGyms] ([ID])
GO
ALTER TABLE [dbo].[Images_Pokemon]  WITH CHECK ADD FOREIGN KEY([PokemonID])
REFERENCES [dbo].[Pokemons] ([ID])
GO
ALTER TABLE [dbo].[Places]  WITH CHECK ADD FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([ID])
GO
ALTER TABLE [dbo].[Places]  WITH CHECK ADD FOREIGN KEY([ZoneID])
REFERENCES [dbo].[Zones] ([ID])
GO
ALTER TABLE [dbo].[PokemonGyms]  WITH CHECK ADD FOREIGN KEY([PlaceID])
REFERENCES [dbo].[Places] ([ID])
GO
ALTER TABLE [dbo].[PokemonGyms]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([ID])
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([ID])
GO
ALTER TABLE [dbo].[Types_Pokemon]  WITH CHECK ADD FOREIGN KEY([PokemonID])
REFERENCES [dbo].[Pokemons] ([ID])
GO
ALTER TABLE [dbo].[Types_Pokemon]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([ID])
GO
ALTER TABLE [dbo].[Evolutions]  WITH CHECK ADD CHECK  (([PokemonID]<>[EvolutionID]))
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD CHECK  (([Attack]>(0)))
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD CHECK  (([Defense]>(0)))
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD CHECK  (([HP]>(0)))
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD CHECK  (([SpecialAttack]>(0)))
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD CHECK  (([SpecialDefense]>(0)))
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD CHECK  (([Speed]>(0)))
GO
USE [master]
GO
ALTER DATABASE [POKEMON_DB] SET  READ_WRITE 
GO
