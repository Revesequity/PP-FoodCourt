USE [master]
GO

ALTER DATABASE [udb_Urusov] SET SINGLE_USER WITH ROLLBACK IMMEDIATE

/****** Object:  Database [Food-cort database]    Script Date: 24.11.2022 0:51:14 ******/
DROP DATABASE [Food-cort database]
GO

/****** Object:  Database [Food-cort database]    Script Date: 24.11.2022 0:51:14 ******/
CREATE DATABASE [Food-cort database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Food-cort database', FILENAME = N'D:\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Food-cort database.mdf' , SIZE = 11264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Food-cort database_log', FILENAME = N'D:\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Food-cort database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Food-cort database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Food-cort database] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Food-cort database] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Food-cort database] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Food-cort database] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Food-cort database] SET ARITHABORT OFF 
GO

ALTER DATABASE [Food-cort database] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Food-cort database] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Food-cort database] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Food-cort database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Food-cort database] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Food-cort database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Food-cort database] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Food-cort database] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Food-cort database] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Food-cort database] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Food-cort database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Food-cort database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Food-cort database] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Food-cort database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Food-cort database] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Food-cort database] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Food-cort database] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Food-cort database] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Food-cort database] SET  MULTI_USER 
GO

ALTER DATABASE [Food-cort database] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Food-cort database] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Food-cort database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Food-cort database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Food-cort database] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Food-cort database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Food-cort database] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Food-cort database] SET  READ_WRITE 
GO

USE [Food-cort database]
GO

/****** Object:  Table [dbo].[Cards]    Script Date: 28.12.2022 15:27:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cards](
	[User_ID] [char](11) NOT NULL,
	[Number] [char](16) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[CVV] [char](3) NOT NULL,
	[Valid_thru] [char](5) NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Users]
GO

ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [CK_Cards_Number] CHECK  (([Number] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [CK_Cards_Number]
GO

ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [CK_Cards_Valid_thru] CHECK  (([Valid_thru] like '[0-9][0-9]/[0-9][0-9]'))
GO

ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [CK_Cards_Valid_thru]
GO

ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [CK_Cards_ÑVV] CHECK  (([CVV] like '[0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [CK_Cards_ÑVV]
GO


USE [Food-cort database]
GO

/****** Object:  Table [dbo].[FoodCorts]    Script Date: 28.12.2022 15:27:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FoodCorts](
	[ID] [char](7) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Administrator_ID] [char](11) NOT NULL,
	[Verification_status] [bit] NULL,
	[Location] [geography] NOT NULL,
	[Contact_phone] [char](11) NULL,
	[Contact_email] [varchar](50) NULL,
 CONSTRAINT [PK_FoodCorts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[FoodCorts] ADD  CONSTRAINT [DF_FoodCorts_Verification_status]  DEFAULT ((0)) FOR [Verification_status]
GO

ALTER TABLE [dbo].[FoodCorts]  WITH CHECK ADD  CONSTRAINT [FK_FoodCorts_Users] FOREIGN KEY([Administrator_ID])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[FoodCorts] CHECK CONSTRAINT [FK_FoodCorts_Users]
GO

ALTER TABLE [dbo].[FoodCorts]  WITH CHECK ADD  CONSTRAINT [CK_FoodCorts_Contact_Phone] CHECK  (([Contact_phone] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[FoodCorts] CHECK CONSTRAINT [CK_FoodCorts_Contact_Phone]
GO

ALTER TABLE [dbo].[FoodCorts]  WITH CHECK ADD  CONSTRAINT [CK_FoodCorts_Email] CHECK  (([Contact_email] like '%@%.%'))
GO

ALTER TABLE [dbo].[FoodCorts] CHECK CONSTRAINT [CK_FoodCorts_Email]
GO

ALTER TABLE [dbo].[FoodCorts]  WITH CHECK ADD  CONSTRAINT [CK_FoodCorts_ID] CHECK  (([ID] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[FoodCorts] CHECK CONSTRAINT [CK_FoodCorts_ID]
GO


USE [Food-cort database]
GO

/****** Object:  Table [dbo].[FoodPoints]    Script Date: 28.12.2022 15:28:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FoodPoints](
	[ID] [char](8) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[administrator_ID] [char](11) NOT NULL,
	[FoodCort_ID] [char](7) NOT NULL,
	[Verification_status] [bit] NULL,
	[Opening_time] [time](7) NULL,
	[Closing_time] [time](7) NULL,
	[Contact_phone] [char](11) NULL,
	[Contact_Email] [varchar](100) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FoodPoints]  WITH CHECK ADD  CONSTRAINT [FK_FoodPoints_FoodCorts] FOREIGN KEY([FoodCort_ID])
REFERENCES [dbo].[FoodCorts] ([ID])
GO

ALTER TABLE [dbo].[FoodPoints] CHECK CONSTRAINT [FK_FoodPoints_FoodCorts]
GO

ALTER TABLE [dbo].[FoodPoints]  WITH CHECK ADD  CONSTRAINT [FK_FoodPoints_Users] FOREIGN KEY([administrator_ID])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[FoodPoints] CHECK CONSTRAINT [FK_FoodPoints_Users]
GO

ALTER TABLE [dbo].[FoodPoints]  WITH CHECK ADD  CONSTRAINT [CK_FoodPoints_Contact_Email] CHECK  (([Contact_email] like '%@%.%'))
GO

ALTER TABLE [dbo].[FoodPoints] CHECK CONSTRAINT [CK_FoodPoints_Contact_Email]
GO

ALTER TABLE [dbo].[FoodPoints]  WITH CHECK ADD  CONSTRAINT [CK_FoodPoints_Contact_phone] CHECK  (([Contact_phone] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[FoodPoints] CHECK CONSTRAINT [CK_FoodPoints_Contact_phone]
GO

ALTER TABLE [dbo].[FoodPoints]  WITH CHECK ADD  CONSTRAINT [CK_FoodPoints_ID] CHECK  (([ID] like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[FoodPoints] CHECK CONSTRAINT [CK_FoodPoints_ID]
GO


USE [Food-cort database]
GO

/****** Object:  Table [dbo].[Images_FoodCort]    Script Date: 28.12.2022 15:28:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Images_FoodCort](
	[FoodCort_ID] [char](7) NOT NULL,
	[Number] [tinyint] NOT NULL,
	[Image] [image] NOT NULL,
	[Is_main_image] [bit] NOT NULL,
 CONSTRAINT [PK_Images_FoodCort] PRIMARY KEY CLUSTERED 
(
	[FoodCort_ID] ASC,
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Images_FoodCort] ADD  CONSTRAINT [DF_Images_FoodCort_Is_main_image]  DEFAULT ((0)) FOR [Is_main_image]
GO

ALTER TABLE [dbo].[Images_FoodCort]  WITH CHECK ADD  CONSTRAINT [FK_Images_FoodCort_FoodCorts] FOREIGN KEY([FoodCort_ID])
REFERENCES [dbo].[FoodCorts] ([ID])
GO

ALTER TABLE [dbo].[Images_FoodCort] CHECK CONSTRAINT [FK_Images_FoodCort_FoodCorts]
GO

ALTER TABLE [dbo].[Images_FoodCort]  WITH CHECK ADD  CONSTRAINT [CK_Images_FoodCort] CHECK  (([Number]<(10)))
GO

ALTER TABLE [dbo].[Images_FoodCort] CHECK CONSTRAINT [CK_Images_FoodCort]
GO


USE [Food-cort database]
GO

/****** Object:  Table [dbo].[Images_FoodPoint]    Script Date: 28.12.2022 15:28:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Images_FoodPoint](
	[FoodPoint_ID] [char](8) NOT NULL,
	[Number] [tinyint] NOT NULL,
	[Image] [image] NOT NULL,
	[Is_main_image] [bit] NOT NULL,
 CONSTRAINT [PK_Images_FoodPoint] PRIMARY KEY CLUSTERED 
(
	[FoodPoint_ID] ASC,
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Images_FoodPoint] ADD  CONSTRAINT [DF_Images_FoodPoint_Is_main_image]  DEFAULT ((0)) FOR [Is_main_image]
GO

ALTER TABLE [dbo].[Images_FoodPoint]  WITH CHECK ADD  CONSTRAINT [FK_Images_FoodPoint_Images_FoodPoint] FOREIGN KEY([FoodPoint_ID])
REFERENCES [dbo].[FoodPoints] ([ID])
GO

ALTER TABLE [dbo].[Images_FoodPoint] CHECK CONSTRAINT [FK_Images_FoodPoint_Images_FoodPoint]
GO


USE [Food-cort database]
GO

/****** Object:  Table [dbo].[Images_Item]    Script Date: 28.12.2022 15:28:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Images_Item](
	[Item_ID] [char](13) NOT NULL,
	[Number] [tinyint] NOT NULL,
	[Image] [image] NOT NULL,
	[Is_main_image] [bit] NOT NULL,
 CONSTRAINT [PK_Items_images_1] PRIMARY KEY CLUSTERED 
(
	[Item_ID] ASC,
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Images_Item] ADD  CONSTRAINT [DF_Images_Item_Is_main_image]  DEFAULT ((0)) FOR [Is_main_image]
GO

ALTER TABLE [dbo].[Images_Item]  WITH CHECK ADD  CONSTRAINT [FK_Items_images_Items] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Items] ([ID])
GO

ALTER TABLE [dbo].[Images_Item] CHECK CONSTRAINT [FK_Items_images_Items]
GO

ALTER TABLE [dbo].[Images_Item]  WITH CHECK ADD  CONSTRAINT [CK_Items_Images_per_item_limit] CHECK  (([Number]<=(10)))
GO

ALTER TABLE [dbo].[Images_Item] CHECK CONSTRAINT [CK_Items_Images_per_item_limit]
GO


USE [Food-cort database]
GO

/****** Object:  Table [dbo].[Ingredients]    Script Date: 28.12.2022 15:29:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ingredients](
	[Name] [varchar](100) NOT NULL,
	[Item_ID] [char](13) NOT NULL,
	[Weigth] [smallint] NULL,
 CONSTRAINT [PK_Ingredients_1] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_Items] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Items] ([ID])
GO

ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_Items]
GO


USE [Food-cort database]
GO

/****** Object:  Table [dbo].[Items]    Script Date: 28.12.2022 15:29:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Items](
	[ID] [char](13) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[FoodPoint_ID] [char](8) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Time_to_cook] [timestamp] NOT NULL,
	[weight] [smallint] NULL,
	[Calories_per_100g] [smallint] NULL,
	[Proteins_per_100g] [smallint] NULL,
	[Ñarbohydrates_per_100g] [smallint] NULL,
	[Fats_per_100g] [smallint] NULL,
 CONSTRAINT [PK_Items_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_FoodPoints] FOREIGN KEY([FoodPoint_ID])
REFERENCES [dbo].[FoodPoints] ([ID])
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_FoodPoints]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [Item_ID_Format] CHECK  (([ID] like '[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [Item_ID_Format]
GO



USE [Food-cort database]
GO

/****** Object:  Table [dbo].[Order-Item]    Script Date: 28.12.2022 15:29:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order-Item](
	[Order_ID] [char](13) NOT NULL,
	[Item_ID] [char](13) NOT NULL,
	[amount] [tinyint] NOT NULL,
 CONSTRAINT [PK_Order-Item] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC,
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order-Item]  WITH CHECK ADD  CONSTRAINT [FK_Order-Item_Items] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Items] ([ID])
GO

ALTER TABLE [dbo].[Order-Item] CHECK CONSTRAINT [FK_Order-Item_Items]
GO

ALTER TABLE [dbo].[Order-Item]  WITH CHECK ADD  CONSTRAINT [FK_Order-Item_Orders] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO

ALTER TABLE [dbo].[Order-Item] CHECK CONSTRAINT [FK_Order-Item_Orders]
GO



USE [Food-cort database]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 28.12.2022 15:29:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Orders](
	[ID] [char](13) NOT NULL,
	[FoodPoint_ID] [char](8) NOT NULL,
	[Client_ID] [char](11) NOT NULL,
	[order_time] [datetime] NOT NULL,
	[Full_Price] [money] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_FoodPoints] FOREIGN KEY([FoodPoint_ID])
REFERENCES [dbo].[FoodPoints] ([ID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_FoodPoints]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Orders_ID] CHECK  (([ID] like '[0-9][0-9][0-9][A-Z][A-Z][A-Z][A-Z][A-Z][0-9][0-9][A-Z][A-Z][A-Z]'))
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Orders_ID]
GO



USE [Food-cort database]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 28.12.2022 15:29:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[ID] [char](11) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Surname] [varchar](100) NOT NULL,
	[Verification_status] [bit] NULL,
	[Online_status] [bit] NOT NULL,
	[Phone] [char](11) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Verification_status]  DEFAULT ((0)) FOR [Verification_status]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Online_status]  DEFAULT ((0)) FOR [Online_status]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_Email] CHECK  (([Email] like '%@%.%'))
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_Email]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_ID] CHECK  (([ID] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_ID]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_Phone] CHECK  (([Phone] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_Phone]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'CONSTRAINT',@level2name=N'CK_Users_ID'
GO

