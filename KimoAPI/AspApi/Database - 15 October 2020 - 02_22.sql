USE [master]
GO
/****** Object:  Database [KIMODB]    Script Date: 2020/10/15 00:21:31 ******/
CREATE DATABASE [KIMODB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KIMODB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KIMODB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KIMODB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KIMODB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KIMODB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KIMODB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KIMODB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KIMODB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KIMODB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KIMODB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KIMODB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KIMODB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KIMODB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KIMODB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KIMODB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KIMODB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KIMODB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KIMODB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KIMODB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KIMODB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KIMODB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KIMODB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KIMODB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KIMODB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KIMODB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KIMODB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KIMODB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KIMODB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KIMODB] SET RECOVERY FULL 
GO
ALTER DATABASE [KIMODB] SET  MULTI_USER 
GO
ALTER DATABASE [KIMODB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KIMODB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KIMODB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KIMODB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KIMODB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KIMODB', N'ON'
GO
ALTER DATABASE [KIMODB] SET QUERY_STORE = OFF
GO
USE [KIMODB]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Company_ID] [int] NOT NULL,
	[Name] [nchar](50) NULL,
	[Address] [nchar](50) NULL,
	[Contact_Number] [nchar](10) NULL,
	[Email_Address] [nchar](50) NULL,
	[Telephone_Number] [nchar](10) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NULL,
	[Last_Name] [varchar](50) NULL,
	[Contact_Number] [varchar](50) NULL,
	[Email_Address] [varchar](50) NULL,
	[UserID] [int] NULL,
	[Address_ID] [int] NULL,
	[OTP] [varchar](50) NULL,
	[verified] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Order]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Order](
	[Customer_Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[Order_Date] [datetime] NULL,
	[Order_Total] [decimal](18, 2) NULL,
	[OrderStatus_ID] [int] NULL,
 CONSTRAINT [PK_Customer_Order] PRIMARY KEY CLUSTERED 
(
	[Customer_Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Order_Line]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Order_Line](
	[Customer_Order_Line_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Order_ID] [int] NULL,
	[Quotation_Line_ID] [int] NULL,
	[Description] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](12, 2) NULL,
	[Total] [decimal](12, 2) NULL,
 CONSTRAINT [PK_Customer_Order_Line] PRIMARY KEY CLUSTERED 
(
	[Customer_Order_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[Delivery_ID] [int] IDENTITY(1,1) NOT NULL,
	[Address_ID] [int] NULL,
	[Customer_Order_ID] [int] NULL,
	[Date] [date] NULL,
	[OrderStatus_ID] [int] NULL,
 CONSTRAINT [PK_Delivery1] PRIMARY KEY CLUSTERED 
(
	[Delivery_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery_Address]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_Address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[StreetNumber] [int] NULL,
	[StreetName] [varchar](150) NULL,
	[Postal_Code] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
 CONSTRAINT [PK_Delivery_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Design]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Design](
	[Design_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Type_ID] [int] NULL,
	[Design_Name] [varchar](50) NULL,
	[Additional_Instructions] [varchar](max) NULL,
	[Customer_ID] [int] NULL,
	[Date_Created] [date] NULL,
 CONSTRAINT [PK_Design] PRIMARY KEY CLUSTERED 
(
	[Design_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Design_Line]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Design_Line](
	[Design_Line_ID] [int] IDENTITY(1,1) NOT NULL,
	[Design_ID] [int] NULL,
	[Template_Position_ID] [int] NULL,
	[Job_Type_ID] [int] NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Image] [varchar](max) NULL,
	[Text] [varchar](max) NULL,
 CONSTRAINT [PK_Design_Line] PRIMARY KEY CLUSTERED 
(
	[Design_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[Cell_Number] [nchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job_Type]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Type](
	[Job_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Job_Type] PRIMARY KEY CLUSTERED 
(
	[Job_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[OrderStatus_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Order_Status] PRIMARY KEY CLUSTERED 
(
	[OrderStatus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionDescription] [varchar](100) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission_Line]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission_Line](
	[PermissionLineID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionID] [int] NULL,
	[UserRoleID] [int] NULL,
 CONSTRAINT [PK_Permission_Line] PRIMARY KEY CLUSTERED 
(
	[PermissionLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Position_ID] [int] IDENTITY(1,1) NOT NULL,
	[Position_Number] [int] NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Position_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Category]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Category](
	[Product_Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Product_Category] PRIMARY KEY CLUSTERED 
(
	[Product_Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[Product_Size_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Product_Size] PRIMARY KEY CLUSTERED 
(
	[Product_Size_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[Product_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Category_ID] [int] NULL,
	[Template_ID] [int] NULL,
	[Name] [varchar](50) NULL,
	[ImageString] [varchar](max) NULL,
 CONSTRAINT [PK_Product_Type.] PRIMARY KEY CLUSTERED 
(
	[Product_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[Province_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[Province_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation](
	[Quotation_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[Date] [date] NULL,
	[Additional_Notes] [varchar](max) NULL,
	[Quotation_Status_ID] [int] NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Quotation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation_Line]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation_Line](
	[Quotation_Line_ID] [int] IDENTITY(1,1) NOT NULL,
	[Quotation_ID] [int] NULL,
	[Description] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Quotation_Line] PRIMARY KEY CLUSTERED 
(
	[Quotation_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation_Request]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation_Request](
	[Request_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Quotation_Request] PRIMARY KEY CLUSTERED 
(
	[Request_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation_Request_Line]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation_Request_Line](
	[Request_Line_ID] [int] IDENTITY(1,1) NOT NULL,
	[Request_ID] [int] NULL,
	[Design_ID] [int] NULL,
	[Product_Size_ID] [int] NULL,
	[Colour] [varchar](50) NULL,
	[Web_Link_ID] [int] NULL,
	[Product_Code] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Product_Type_ID] [int] NULL,
 CONSTRAINT [PK_Quotation_Request_Line] PRIMARY KEY CLUSTERED 
(
	[Request_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation-Status]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation-Status](
	[Quotation_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](20) NULL,
 CONSTRAINT [PK_Quotation-Status] PRIMARY KEY CLUSTERED 
(
	[Quotation_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Return_Customer_Order]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return_Customer_Order](
	[Return_Customer_Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](12, 2) NULL,
	[Date] [date] NULL,
	[Reason] [varchar](max) NULL,
	[Product] [varchar](50) NULL,
 CONSTRAINT [PK_Return_Customer_Order] PRIMARY KEY CLUSTERED 
(
	[Return_Customer_Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Return_Customer_Order_Line]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return_Customer_Order_Line](
	[Return_Line_ID] [int] IDENTITY(1,1) NOT NULL,
	[Return_Customer_Order_ID] [int] NULL,
	[Customer_Order_ID] [int] NULL,
 CONSTRAINT [PK_Return_Customer_Order_Line] PRIMARY KEY CLUSTERED 
(
	[Return_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Supplier_ID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Name] [varchar](50) NULL,
	[Contact_Number] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Web_Link_ID] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Order]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Order](
	[Supplier_Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_ID] [int] NULL,
	[Supplier_Order_Status_ID] [int] NULL,
	[Quotation_ID] [int] NULL,
	[Date] [date] NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Supplier_Order] PRIMARY KEY CLUSTERED 
(
	[Supplier_Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Order_Line]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Order_Line](
	[Supplier_Order_Line_ID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Order_ID] [int] NULL,
	[Product_Type_ID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Supplier_Order_Line] PRIMARY KEY CLUSTERED 
(
	[Supplier_Order_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Order_Status]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Order_Status](
	[Supplier_Order_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [char](50) NULL,
 CONSTRAINT [PK_Supplier_Order_Status] PRIMARY KEY CLUSTERED 
(
	[Supplier_Order_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template](
	[Template_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ImagePath] [varchar](max) NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[Template_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template_Position]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template_Position](
	[Template_Position_ID] [int] IDENTITY(1,1) NOT NULL,
	[Position_ID] [int] NULL,
	[Template_ID] [int] NULL,
 CONSTRAINT [PK_Template_Position] PRIMARY KEY CLUSTERED 
(
	[Template_Position_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserRoleID] [int] NULL,
	[UserPassword] [varchar](65) NULL,
	[UserName] [varchar](20) NULL,
	[UserPasswordChangeRequest] [bit] NULL,
	[ResetOTP] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserRoleDescription] [varchar](50) NULL,
	[UserRoleName] [varchar](50) NULL,
 CONSTRAINT [PK_User_Role] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web_Link]    Script Date: 2020/10/15 00:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web_Link](
	[Web_Link_ID] [int] IDENTITY(1,1) NOT NULL,
	[Web_Name] [varchar](50) NOT NULL,
	[Web_Address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Web_Link] PRIMARY KEY CLUSTERED 
(
	[Web_Link_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Company] ([Company_ID], [Name], [Address], [Contact_Number], [Email_Address], [Telephone_Number]) VALUES (1, N'KIMOsource                                        ', N'786 Jan Shoba, Brooklyn                           ', N'0824518711', N'info@kimo.co.za                                   ', N'0127516686')
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (0, N'cc  ', N'cc', N'cc ', N'cc', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (1, N'Portia', N'Biyela', N'0832614815', N'portiakarim100@gmail.com                          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (2, N'Nadia', N'Smith', N'0811011030', N'NADIA@up.ac.za                                    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (3, N'Nadia', N'Smith', N'0811011030', N'NADIA@up.ac.za                                    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (4, N'hh', N'hh', N'98        ', N'jj', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (5, N'Tshidiyyyy1', N'Shalangggg1', N'00975441  ', N'shalangt@gmail.com1                               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (6, N'Tshidi', N'Shalang', N'0000000000', N'shalangt@gmail.com                                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (7, N'Lebo', N'Nchabaleng', N'0129384951', N'u17345180@tuks.co.za                              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (9, N'Lebogang', N'Nchabeleng', N'0909890989', N'lebo@gmail.com', 4, 5, N'551805', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (10, N'testing', N'testing', N'0909090909', N'u17345180@tuks.co.za', 7, 8, N'169120', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (11, N'testingg', N'testingg', N'0989098909', N'shalangt@gmail.com', 8, 9, N'919340', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (12, N'Jenny', N'Storm', N'0987898229', N'shalangt@gmail.com', 9, 10, N'490089', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Contact_Number], [Email_Address], [UserID], [Address_ID], [OTP], [verified]) VALUES (13, N'Samsung', N'Samsung', N'0909890989', N'h@gmai.com', 10, 11, N'234512', 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_Order] ON 

INSERT [dbo].[Customer_Order] ([Customer_Order_ID], [Customer_ID], [Order_Date], [Order_Total], [OrderStatus_ID]) VALUES (1, 1, CAST(N'2020-10-12T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Customer_Order] ([Customer_Order_ID], [Customer_ID], [Order_Date], [Order_Total], [OrderStatus_ID]) VALUES (6, 5, CAST(N'2020-10-14T00:00:00.000' AS DateTime), CAST(21.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Customer_Order] ([Customer_Order_ID], [Customer_ID], [Order_Date], [Order_Total], [OrderStatus_ID]) VALUES (7, 5, CAST(N'2020-09-09T00:00:00.000' AS DateTime), CAST(20.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[Customer_Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_Order_Line] ON 

INSERT [dbo].[Customer_Order_Line] ([Customer_Order_Line_ID], [Customer_Order_ID], [Quotation_Line_ID], [Description], [Quantity], [Price], [Total]) VALUES (1, 1, 17, N'Tshirt', 5, CAST(100.00 AS Decimal(12, 2)), CAST(500.00 AS Decimal(12, 2)))
INSERT [dbo].[Customer_Order_Line] ([Customer_Order_Line_ID], [Customer_Order_ID], [Quotation_Line_ID], [Description], [Quantity], [Price], [Total]) VALUES (2, 6, 16, N'Hoodie', 10, CAST(200.00 AS Decimal(12, 2)), CAST(600.00 AS Decimal(12, 2)))
INSERT [dbo].[Customer_Order_Line] ([Customer_Order_Line_ID], [Customer_Order_ID], [Quotation_Line_ID], [Description], [Quantity], [Price], [Total]) VALUES (3, 7, 15, N'Scarf', 2, CAST(300.00 AS Decimal(12, 2)), CAST(700.00 AS Decimal(12, 2)))
INSERT [dbo].[Customer_Order_Line] ([Customer_Order_Line_ID], [Customer_Order_ID], [Quotation_Line_ID], [Description], [Quantity], [Price], [Total]) VALUES (4, NULL, 18, N'Banner', 3, CAST(400.00 AS Decimal(12, 2)), CAST(800.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[Customer_Order_Line] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery_Address] ON 

INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (1, NULL, NULL, N'0001      ', NULL)
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (2, 32, N'yellow wood drive', N'0002', N'Kwazulu Natal')
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (3, 1, N'Yoletha', N'0003', N'Kwazulu Natal')
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (4, 32, N'yellow wood drive', N'0009', N'Kwazulu Natal')
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (5, 32, N'yellow wood drive', N'0098', N'Kwazulu Natal')
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (6, 32, N'yellow wood drive', N'0989', N'Gauteng')
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (7, 20, N'prospect', N'0002', N'Kwazulu Natal')
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (8, 123, N'testing', N'0009', N'Kwazulu Natal')
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (9, 32, N'yellow', N'8888', N'Kwazulu Natal')
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (10, 21, N'jenny', N'0999', N'Gauteng')
INSERT [dbo].[Delivery_Address] ([Address_ID], [StreetNumber], [StreetName], [Postal_Code], [Province]) VALUES (11, 11, N'yy', N'777', N'Kwazulu Natal')
SET IDENTITY_INSERT [dbo].[Delivery_Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Design] ON 

INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (20, 1, N'sd', N'dss', 6, CAST(N'2020-10-03' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (24, 1, N'dss', N'Hi', 6, CAST(N'2020-10-03' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (27, 1, N'dsd', N'Print in white.', 6, CAST(N'2020-10-03' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (46, 1, N'Test', N'ds', 5, CAST(N'2020-10-03' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (56, 1, N'heyya', N'hey', 1, CAST(N'2020-10-05' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (57, 1, N'heyya', N'hey', 1, CAST(N'2020-10-05' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (61, 1, N'heyya', N'we are testiing', 1, CAST(N'2020-10-05' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (62, 1, N'heyya', N'hey', 1, CAST(N'2020-10-05' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (63, 1, N'heyya', N'hey', 1, CAST(N'2020-10-05' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (64, 1, N'New design', N'additionalk  ', 1, CAST(N'2020-10-05' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (71, 2, N'The 370 Backpack design', N'', 1, CAST(N'2020-10-06' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (72, 2, N'test', N'test', 13, CAST(N'2020-10-06' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (73, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (74, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (75, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (76, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (77, 2, N'aa', N'', 13, CAST(N'2020-10-12' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (78, 1, N'design', N'', 13, CAST(N'2020-10-12' AS Date))
INSERT [dbo].[Design] ([Design_ID], [Product_Type_ID], [Design_Name], [Additional_Instructions], [Customer_ID], [Date_Created]) VALUES (79, 22, N'des', N'', 13, CAST(N'2020-10-12' AS Date))
SET IDENTITY_INSERT [dbo].[Design] OFF
GO
SET IDENTITY_INSERT [dbo].[Design_Line] ON 

INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (22, 20, 2, 1, 2, 2, NULL, N'dfghg')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (98, 56, 2, 2, 2, 2, N'', N'hey')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (104, 61, 3, 3, 2, 2, N'', N'testing')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (105, 61, 8, 2, 2, 2, N'', N'testing2')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (106, 62, 2, 2, 2, 2, N'', N'hey')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (107, 62, 2, 2, 2, 2, N'', N'hey')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (108, 63, 2, 2, 2, 2, N'', N'gdfgfg')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (109, 64, 2, 2, 2, 2, N'data:image/jpeg;base64,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', N'testing')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (121, 71, 1, 2, 2, 2, N'', N'INF 370')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (122, 71, 2, 1, 10, 10, N'', N'Informatics@UP')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (123, 72, 2, 1, 3, 3, NULL, N'test')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (124, 77, 2, 2, 2, 2, N'', N'hey')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (125, 77, 2, 2, 2, 2, N'', N'hey')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (126, 78, 3, 2, 3, 3, N'', N'this is a design')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (127, 78, 3, 3, 4, 3, N'', N'Another one')
INSERT [dbo].[Design_Line] ([Design_Line_ID], [Design_ID], [Template_Position_ID], [Job_Type_ID], [Width], [Height], [Image], [Text]) VALUES (128, 79, 3, 1, 4, 3, N'', N'ttt')
SET IDENTITY_INSERT [dbo].[Design_Line] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_ID], [UserID], [Name], [Surname], [Cell_Number], [Email], [Address]) VALUES (1, NULL, N'Stephan                                           ', N'Schoombie                                         ', N'0824518711', N'Stephan@kimo.co.za                                ', N'6                                                 ')
INSERT [dbo].[Employee] ([Employee_ID], [UserID], [Name], [Surname], [Cell_Number], [Email], [Address]) VALUES (2, NULL, N'Thabo                                             ', N'Malake                                            ', N'0837376885', N'Thabo@kimo.co.za                                  ', N'7                                                 ')
INSERT [dbo].[Employee] ([Employee_ID], [UserID], [Name], [Surname], [Cell_Number], [Email], [Address]) VALUES (3, NULL, N'Emily                                             ', N'Galain                                            ', N'0794528052', N'Emily@kimo.co.za                                  ', N'8                                                 ')
INSERT [dbo].[Employee] ([Employee_ID], [UserID], [Name], [Surname], [Cell_Number], [Email], [Address]) VALUES (4, NULL, N'Tshidi ', N'ff', N'000       ', N'shalangt@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Job_Type] ON 

INSERT [dbo].[Job_Type] ([Job_Type_ID], [Description]) VALUES (1, N'Embroidery')
INSERT [dbo].[Job_Type] ([Job_Type_ID], [Description]) VALUES (2, N'Screen Print')
INSERT [dbo].[Job_Type] ([Job_Type_ID], [Description]) VALUES (3, N'Engraving')
SET IDENTITY_INSERT [dbo].[Job_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Status] ON 

INSERT [dbo].[Order_Status] ([OrderStatus_ID], [Description]) VALUES (1, N'Placed                                            ')
INSERT [dbo].[Order_Status] ([OrderStatus_ID], [Description]) VALUES (2, N'Collected                                         ')
INSERT [dbo].[Order_Status] ([OrderStatus_ID], [Description]) VALUES (3, N'Sent to Delivery                                  ')
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([Position_ID], [Position_Number]) VALUES (1, 1)
INSERT [dbo].[Position] ([Position_ID], [Position_Number]) VALUES (2, 2)
INSERT [dbo].[Position] ([Position_ID], [Position_Number]) VALUES (3, 3)
INSERT [dbo].[Position] ([Position_ID], [Position_Number]) VALUES (4, 4)
INSERT [dbo].[Position] ([Position_ID], [Position_Number]) VALUES (5, 5)
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Category] ON 

INSERT [dbo].[Product_Category] ([Product_Category_ID], [Description]) VALUES (1, N'Clothing                                          ')
INSERT [dbo].[Product_Category] ([Product_Category_ID], [Description]) VALUES (3, N'Bags                                              ')
INSERT [dbo].[Product_Category] ([Product_Category_ID], [Description]) VALUES (4, N'Headwear                                          ')
INSERT [dbo].[Product_Category] ([Product_Category_ID], [Description]) VALUES (5, N'Sports                                            ')
INSERT [dbo].[Product_Category] ([Product_Category_ID], [Description]) VALUES (6, N'Gifts                                             ')
INSERT [dbo].[Product_Category] ([Product_Category_ID], [Description]) VALUES (8, N'Kitchenware                                       ')
INSERT [dbo].[Product_Category] ([Product_Category_ID], [Description]) VALUES (11, N'ddggggggggggg')
INSERT [dbo].[Product_Category] ([Product_Category_ID], [Description]) VALUES (12, N'Doeks')
SET IDENTITY_INSERT [dbo].[Product_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Size] ON 

INSERT [dbo].[Product_Size] ([Product_Size_ID], [Description]) VALUES (1, N'Small')
INSERT [dbo].[Product_Size] ([Product_Size_ID], [Description]) VALUES (2, N'Medium')
INSERT [dbo].[Product_Size] ([Product_Size_ID], [Description]) VALUES (3, N'Large')
INSERT [dbo].[Product_Size] ([Product_Size_ID], [Description]) VALUES (4, N'Medium')
INSERT [dbo].[Product_Size] ([Product_Size_ID], [Description]) VALUES (5, N'X-Large')
SET IDENTITY_INSERT [dbo].[Product_Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Type] ON 

INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Category_ID], [Template_ID], [Name], [ImageString]) VALUES (1, 1, 1, N'Shirt     ', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAATsAAAC7CAYAAAAaGzmrAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAFEMSURBVHhe7V0JYExXFz4iiD3UkpSqaGtrteiG7kH/oihaWqqWKH8tbe1b1JZU/xJKqVK6aaKlqC1dkK6EakWppahoqxJrgiCyzX++895NRmSZJDOZSeZ+cb2ZN2+5y7nfPefcrYSFQRoaGhrFHB7mUUNDQ6NYQ5OdhoaGW0CTnYaGhltAk52GhoZbQJNdZmwPphIlSqSH4O3meQ0NhyGWwrpnyFyJEsEUaf5iE46HUfDyWPOLRnbQZJcFuobFEDqpESa2ME/mFyyIYZowNXJFEG0zZS4mbBfN0uRld2iyswGRy5mwplu1uFbaXzcllGhdu3fLdJ5b7BG9qFdLPtc9jL9paNiG5n4+coxdniFT6VYGy1q3a+RMwdAQtTWSNTTZZYHVPX1NAetGYcf5xJFeFN0Wre5Easl0Fzzbj2KkFY6hbmuGGNcwdlE38/w2ar4mgkXPh3qOCKKgSD63oid/09DIDoHUyiQw3yOj0i0Kn+dWibZn+SeUdm1CU4sGNJpGmVrgqucypCp2+VKi2XawRoopNNllgQwzdhX1rI0zQeSvBOh4NO1q4mcSlw/5dyGKNsmueRd/87wf+TWRDxoaNiLDjLW0jciwDJQv76ZetFqui+Y/li/5nIFd3ED7rvEjf5FXjaygyS6vqO1HzfdGmyZpLEWsYWrLRcB2RWsDViNvWH0kmmj7UlrVxWx4WbPrKr+A6EB416I5N9AxXVbREO3ryxaa7PKMljSRzQhfMTl8WRgXmNpfNmByJJjF2menkSMyzNgSLYm2TeL/WvhTc+VSGbHKvA6uEUq/1tpnB5N31BHfTH48DQU9N1ZDQ8MtoDU7DQ0Nt4AmOw0NDbdAkTdjVfThv7BOCr6npqZSSkoKXU1KopTkZIqNPUlnzpymZs2aUfny5cnDw0PuUffiaE9Yx80AetvMj4zUlFS6dPkS7T94kMqXK0c31a5NpUuXpjJlylDJkiXN+zIXT0YcHRFnjeyRU37jtzSWN8haEsva2bNn6NSpU9SwQUMqx2WLci2BsuN/hVFuLGlWkoJ3EiUmJlLsyZN0kkM9Pz+RMyVv1nXBuN74nJaWJr8VBxR5skNhIAkgNRQcvuMzCjaJBe/KlSu0+7e99Pa8eXTp0iWKiTlB48aNpaeffloID/fgflWgqnALKox4Jsg2sxApIH4XL1ykTVsiaFrQdPKuXImqenvTiBEjqGHDhlSpUiXy9PQkLy8veYZ1vPAZR/XMgsZVI3egDLMqR8iYalQvJlyk06dOU1BwkJDKLbfcQhUrVKAxo8eQN5etV+kyVKpMabkWZQs4ouwkrvyXlpomjebVq1fp8pXLFB19jIaPGE5N7ryTftsVRV26dKVOnTpSxYoVqSwTspfZyFrLv0oz0qjiXFRRpMkOUYfgoHBwREDBJiQk0Ndff02fffYZVa9enYYNG0a33nabFNqTHZ+k1wIn0VtvvUX/+9//6NZbb5WWrVSpUkIiKGygoEIoAmdmLZ4L4JmoHIhjdHQ0vTZlMnVo/ySt+nwVvffeYia2MrRz506aMGECNWjQgAYPHkx33HEHlS1bVuKHuFnHz17ErJE7VBmqhgaVH2V5+fJlOn78OC1atIh+27OHHnvsMXr22Wfplnr1pKHat28fN67j6JlnnqEOHTpQBSY/NLCq3HC0NyxpTHQWo9FP5nD+/Hkayw38TTfdRC8PHUbVqlWjs+fi6eeffxZZ8/X1oRd696aHH36IKleuLPUBxKZkTRFdUZezIkt2EDqEFC4ICNyFixdo/bp19NOPP1GNGjXI39+f1qxZQ5MnTyY/VtmRzAsXL9KLA1+k2bNC5N4FCxaIqQFt6uabb2ZSKccF7CGFXNCCVWSnKgkE5jJrmceP/0PzWMusVKkyDX7pJY5/Gr366qu04tNPyausl5gYIOFXXnmFfv/9d1rEJFiFtYLBQ4bQbbfeRpW4FU4nPVQWDprsHA+RNSYOlCO08jNnztCcOXPon3/+oXbt2tFDDz1EVW+4Qcr2CsvjqFGjRA5BErj+q6++og8/+pCe7vY0PfHEE+maO4I9CQ8yh3gmcoN69txZmj9/Ph05coTGjx1Hd911l8gKLJzVq7+g9evX09RpU5jsbqR9v++lZaGfUCLLaI8ez9J9991LlVlG0cgifioUZRQZslPRxFGIgwXqXFwca2+f0u/cekKDa80E17JFS6pSpYpoT++++660Zl1ZXYcDAybtli1bpGW7//77peDR8i5fvpz+/vtvatu2LT3++H/Y5Khs+FgyEUlupGKdlRLPtFS6mniVzpw9Q99//wN9880mqnNzHerevTs1YY2N23baFRVFa9euo4kTx8t9W7dtpe++/Y6FcJp8T+NWev/+fXL/Dz/8QHX5/i5duoipCzMcwpg5nhr2AcoQAUQHefv333/pU26U9u7dS3fffbdocc2bNxdNSF0P2fz6m2/oEyaOLp2fEpmCtgRcTbpKG9ZvoBUrVojGDlcK5BM+vcwNrC3laYhbpnrBMr5//wH64MMPmLgSqffzveiRRx4V/x3e/8uvv9JibkAfeuBBeuGFF8RqEPD78IwTJ/6liIhv6auvv6JqVW+grl27UqNGjdI1PhWvoihvLkV21lGx/oyMhTqecDFBCgPCdPDgH1ShYgV6oGVLJqjHRWDQ8qhCwP2HDx+mDz/+SFT18qy1ocWDyRH0ejAtXrRYtCJ17ZmzZ+lTNnt37PiZalSvRrex2duyRQuqXbu2CERp09RVRYx7rAsc35VZA1JFi7/zl1/oaPRR0QLuv+9+eo7NG/hu1H0gZGifjRs3Fj/KZW5x3//gA6rrV5c6PtmRC4dNJg/DlMDzU7nS/bzzZybNbyRtjRo2oif+8x8xxVWFUa0vrgfwLlRW9U4crePtjlB5o/IFQZWn+g1HlCMawU2bNrGJ+htVZG2sbZu2HNpk2chY3wtXyoJ33qE/j/5JzzCptbivhZiwECC8F89EuMTyUu+WevTow49QnTp1qGLFSuLOgMZnDeu4QQ4gu3iO+H4TLtIff/xBW7dupQMHDlDdunVFg7z99ttFHiBnUbt3U9jyMGnEB//3JarHZrZYB1kA70H4fd8B2rx5M/3KBInG9fG2rcUPqbTSzLDOC5W3rqQNuhzZqSCFxOQBoTn21zH67bffJNNL8vkHH3yQOnfqLNcg060z2RpQ46dMmcIm4avS+wRcuHCBWrdpTcNfHU6dOnWi8iyAuBvPgBYFQow/H0+bNm+iPb/toeP/HqeK5SuwCXmrCDsyC+ZmKc8yEs9kbi3R++bBDwGp/fXXX1JJatWuJcLWrn17uR8XlCxhkDFa4HPnztG3331PS5cuoWXLlgnBnj59hoKCgmjS5NeoerXqHC+YwBnCgnfjXgT0/P3400+0cUM4nec0PfjgA3TvvfeKOV6xQvn0PFFHxBUCiDxzJQF0BlReAMgLVTFxRNmdPn2aIiMjafv27UIUjzzyCHXq3NnQbPgeXJtZEwOU7EKG8DuOIEuYknh2+w7tWSO8h81DgyxS+Xc8P+Lbb+Vdx1h2atSoSQ3qN6AyXl5sgdxAVdlKqVSpopBUMssZ6sO5uHhxv1y6dJkOHfqDTsbGMnn50X+44WvBDbQiIly7Y8cO+vLLL8WH9+LAgdTgtvryO9KdOf6ZkZKSanZ0pLLFEclm71rRHFuwVdScNdubatUW4stJnlxJ1lyK7EA20I7gf4NmBLNhw4b1XMgp1LHjk9SWNThPFqJSpUoL6Unt5/JCElBwKinqM4Rj1erVQlivvvyKCCCe/zGTywrW4nx9falvv3501513sZqe0Vql8b0QzuSUZOOZ/C+NBfNodDQdZ80SWuCli5f4N5L7qjEx1fO7WZ6ntCvroIQq8WqiVCT44qDRHTvGwl2zBi19b4loCv8c/4dmvjlTfEGlWLj5rcyR17a+IDo8E/EyiC+NyTaJzfMI6egoz0TXifPqNhbqmjVrsjZR3rzTyBcV3B3IPxWgHZ0+c5oOHzosroJDhw/Rww89LB0N0JiFHDjPPLhsAUWOKAdr4LyCyI15hCZ28tRJCuaGDK4XuDGgld/I8lKBG0KPkh7psobyPHEihnbu/IW1tP0iL2hIAbwP7/CuUlWsgfvuvY9urOUrcYP84D2XmOBimfx2sya3bt06ce+gAQV5QjZL2+j2sI4/YNQHoxMwPHwjbdi4kWqw3Ldu3Vo6/6pXq2aY6/xckKN6R+Y8ciacTnZ4PVq3ixcv0omYWCa54/T55yulVRo48EU2/+6TVq2kJ5OcZyncwYG1I26phEhyiD3IANrdmLFj6c3//Y+q3VBNCussk1Xfvn3FZHz77Xm0f/8fNHjwS6yi16MbqlaVrnhFWiA+jqR8RmcIPhsxMKAKFZd5sFQiPbgWRwRUJGiT6HiAf+6LL9bQPffcS/3796fPVqyk9u2eEK3xyuUr/P0zNls9qB/HDW/B81hczDcZUMWFI9InGgJXEAvnh/T0ctiwYSN9vvJzuoWf261bV7q5zk1iPsMcR7oQeTzZXYG8gwaHcjlx4oR0Hvzw04/06KOPUv9+/ZngylKZ0sYwDOQxIA0hN8YCk30yEwauBSngWutyEnngP8h50tUkWrd+HX2+apUQEYgPHRmQOxAf7vXyKsvPhmaVgpcIeUi5WQHvguaVzA2doe3F0cE/Dor/uaRHSQpg+UKniRppABhyasQnc9wzQ8UfUOQu4GMSpwNxS2KC/vjjj2kzm+MPPfwwPcoasE9NH7rhhhvIs5SnxMOT62wuryo0FBrZ4TUIKsORWfHx8VJIR44cptCwMMmcAQEB1KBBQ6pSxVsKCQUDZBQOomt77sGHFsYCAG1xyODBrBl6isY3YeIEevjhR6gNt0wJCRcpKmo3E9/bbKpWpgEvBhj+kwoVuUUsQ15lvIRwoVWi5CQdHA1ECeYBIBoWEw2eDYJLuHRJ3v39D9+Lj60aC8CI4SOo1o03ypimQ0eO0OyQEJo3dy5VqliJTsTGUGDgRNHsIPiSSn5BbkKZGRBM5O1VrlQwldezZgxnM7TX559/XswOaKMyfs80q4G8vseVgTwAVJqUiINsMAwDAb4okBwGmPfifKnJGna5sqYWZ8qcI4C4gKig5Z+PPy8a2Epu3FFW1arXYBOxBd3LjWHpMqVFBmR0AKcDn9W9SNdff/9Fv/zyC23bto08ud7Ub9CA+vbpI0SDMkb5CkE7EMhnxAcNBxSI95YsoX3794l7CP5ubzbBK1esLGlB3UH8HZm3uaHQyE61DngdSOGvv/+Wwb3elb2pd+/e4muCGShanNmK2aMC4r0xrNaPHjOayWU21eDWFOeg8Q0cNIg+ZO0OwzlAVqrH7c/oo7Rl8xaKizvHLaMXNWnShG5nswGdFVxa5pMZnHMQQzwPPhQ4h/fv3y9d+xCC5vfczVrcPVSrVi3pAS7D5jfSdP7CeXpn4bv08IMPio8F5LT7t930846f6b///a+QvEp7XvMA+YuAOEGwkNcXueWH7yji2wjazaR++x2307M9enBe1BBtz5aWvihBibQ6ogFCZdzIphec+NCk0KONIUnQeCFzzqqEoiGxdgbZw0Dki+cvclzP0d///E3/HD9Ol65cZtP0opQTyKsqN4SYaeNX1098x2hE4d+FzKh0FFZaEHfUVSVvaPjh4vmTG3Jorhe4UenQoSOb2/eyFltN4ojrnSVrharZAah8aMWmBwXRkT+P0HuLF1PtWrXFrIKqb13J7ZEpKAS0onACwx8zdfIUyXTEZ/lnn9IJJrdhQ4cZmhsLkxQaB8RTkR96cKG6Q/uCJnqJW7Kkq8lsVntSBdbSfHxqcotalZ9RRkwTaIXwX6jCBVRaICAgnfDwL+mNGTPkvSDK8axpjhk1Wnq9AAgs4phXwcU9IFolhAr4jEqPzoy169bSYs73JYvfk15n+KWcJYCOgEq3ygvIGwaWw4c5fPhwOaqZKSqvnJV+yJp6d0a8cT5VfHCInzpfgjVxuDagJZXgIywh/Iag5AXPKqy04H2Iv4KKA/5groOsJwW+Jo3LuHFjROtEvjsLharZYdxZfFw8rV69Wgb41maNBzMFmjZrapAdMoqDquD2KDQ8Dy0OKvnUKVOozwt96M4775T3XUm8QuMmTGBTtg093raNEA/MBtwDwTKOHC8UKB9BVPDhpceTzyGu4lvjz7hHruffFIw08PVpEAGSHrfpQdPptUmvUV0mxSts8kbu2E5Ru6Jo6JAh6WO2jOflPf14N/JakZ11XABUnl+jdknv9pZNm2ns2LHSa+xMIbQ3DALB0SJEhw4fVDj4hceMGSPlrCqpyuf85LU9cE354GNW0ZBLzOs4nrgH8VVHI73GjYWZFmv5UvEB1BHx+u9/B8sMjRo1qlOPZ58VC0c6F50Ah71VZYQKABypv+76lQ4ePEiDXnxRhkrAWcs5BToQ4sisCdkD8E1hjuJQ1uBGjhwpQ0QQJwzKnchkh14rDLaEc9+oBJkEiuOFgEpShgPmEJZl8xbjoUrBEctx9uBWFlBplXvxx98RQLjoJXs9OJh69ewppkgqn49h0wWdJxiDB8LBfSrt6ll5Ae5VeQggT9XzAKTv2LFj9PDDD8tMDQyLwJg9aLIqrvl5r6sBSYC8oddQdQSIhm6mU8maalidBrNoVLlbB/MHCDAK0gjy0YizOqp0pN9TSMgcV3VUcYHfOOFSAgUMCKDTbN7+8OOPFMeWEWRQZAyyxn+FBYeVdHqCGNAm4MTEfNDQ0DCaMnWqOOkxTAKOYvzOWSbXAirT7AXEAyo/CAbd8K+z+YiBmHhvTW7xAwMn0MJ3F9KuXbukY0HFG0cVLxUjVbgwI3DW0Oauz0bRBs1yTEpKplOnT9PUaVPpySeflGENEFCYxCtXrqDx4yeIaQWkP98MBYH1/eozTNmoqCghbvgSQf6YNoehPqK5crwNwi+6QFIhb5j7+dNPP3FlGyCmOogO5zPnbUHzuSDgmGS8P1M0JJ44XhOMi9Q9mdNh/b0woN5pHRSSkq6KP7F8ufKyGMKXX30tfm0sgIG6gdENZlUrFDiM7BS7gzBSUlPEL7XwnYU0MXCiLGeEyo65qF5ly4rzWBGMvaGei7jAJ9e0aVMZ37Rq1SrpNcXvdW+uSyGzQuiN/71BkdsixcmKgcJistrY8qiCFoJEgXNIZpIDeWL8HCpct67dpKcKaYdJ9cMP34tPEPMQcc7RQLxAdgf2HxDtFD7F+vXrSy8ttLzTZ1nj5euUxlBUgcbl0KFDtHDhQvrfG29QBdbgUfboYALZaTgG1nUNAfXr9tsbifVTrqwXBXNjP//tt+lEzAm6cjXRuE7uKBw4VKqReFSuc2fP0Yw3ZlC3p7vRbbfcmj44E7Y7uv7/Pf6vwysYtBUQCkzFl19+WbrtP//8c+mEwFI46GT45JNP6M8//6T+/ftJ5wnMIPyONKiCzA7WmiwKGT2y5y9eoB++/55eHPAivctEj2ltIgRc0Bihv37tOno9KJjKepnzEx0ExEvFDdoN/JKY/oZ0gQTubt6cnnrqKRo7bhydPx8vrW5RBbT1U6dP0fgJE8RER0cR8hzpxJxpaBYajgHyWQHyBr8wrAdYEfgN1ktwcDC9/MorFBMTI2VVmHAow4AAoMGsWLGCHnn0UWrduo34zzgnRPMB+bRv114myudGJvmFKgB1BMFiXTE4rffs2UPvLHyHCe0SpSSnkHelyjRo0CCaM/stWbKnb98+YgZhXNbly1eMQaFMFpjRAZNPBZAGAn7HQFVosR8tW0a9+/Sls+fiaMP6jVTnpjrSSYFOkR9/+JFWsPkaEhIifkPAWlDsDfVs5HFcfJzke+lSpdN7pdEAPObvL0sQTQycJNqPo8rDkYC8wSc0YUIgvcEaHTolVLYiD3x8fGRokCPz2t2BvEU54IipamXLlzN83vwdAXNyUfewvBlcO7i2sOCw3lgLa0sYI4QEY+I+llqC+aqA14I4oNIuWbqUgqZNLxQhxHtBUKjwaFngr8L0rRkzZogWgPNQrmF6w6ENslu/YQNrniXJu2pVasZmcOOGDaV3CT2nIHPMjjh46A/x+V1ksruhWjXq8lQXNk/vk3mQKGz48C4z0WHEOSpcYGAg+dSoWWhpVscdP/8sRL5gwXwZLA1Aq8ZvIGz8hu+Y4aE6TPhHSYOrQlUYuAxmzppJd97RhDp37izaHOJv4SRAe9/5y05auXIlzXpzZpE31V0RkCHkN8oDM5x69eolS0thhZf0suBroBR8/c3XMqPolWEvy1hHQNUFdbQ3HEZ2qDgwFadOnUqhoaEyxsYaeC3ILi4+ngYOGkhfrF5TaAKIwkDA+0B8P23bSrNnz5YK3qZNG1khRREAAFJERcLSOejJTOF4o5cJ90JFx4DPsuXKUv3b6lODhg3MCeOm/46fg0GjsTGxrMnNkp7B4cNH8D1eMpujMIB4qLR8+dWXdPCPP2QtPWh3Kp1KSGGCo9PiyY4ds13dw9WAeAtRL14sboeXhw0TogYQb5U+NEowo6BZoPJp2BdKziBTmOvbvUcPWSH8Rt8b0+VHXYM6NfutOVS5YiXq06ePlJe612Gyxi+wO1j4LAcOHLD07dfPcuLECQuTgvlLBnANJ9hyLj7O8mTHJy1cycxfHA+81zpcTU6yxMTGWgInTbIMHjLEsnnzZkt8fLyFK1D6NficwkcmaPmcVbB+JtJ86dIlS3R0tGXuvLmWzk91tkRERMj9+C2rPHEUkNcqvzds2GBZv3GDJYnja30e8cFnHJnILe2f7GDZ+csvFm6F5XdXBvJ07dq1lpdfecUSf+G8xNc6berz+fPnLc8++6wlISHBvFPDnkAeq+Oly5csbf/zuOXkqZPp+W8dRM74msFDBltWrFghdUWVlaNgd1WKnykt6LJPllGP7t1Fk8mKp8HeCNBusMIHxqDhXkfD+h2qBUEcsGrD+HHjJHzFKjbW6kePLRza51n75IKQdEAjgKmrAloiMX35WbgGHRPoYf1p61aZK4hBrNDyQpd9IktTKXXeGUD84FPEQG6stJFVPJAedJhg2anJUyZT9F+sybIG66pAeWKcIPzCmH4IH6hKF9ILoMSl1Pl8CU43VvHVcCyuJiWLNSc+eiugvJjQpIzgRpkx4w2Zxoc5wrAqHImSU7DgWwEhwsQJgAMeznwsmImxNRjICTMIyFyxFOmgImHfBUyxwqqtjiYCPD+rgEqOuKKyYByc/2P+4lt7//33afWaL+jkqdOUkHBJ5vTGnjxFp0+fkjm3WDUDSz8dPvInHTj4B61csZI++ngZHeNz7do9QS+++KLMf0XvpyI69b7CBmufFP7l19Ti/vtkPjBgHR/1mf+TebxN7mhC8+a9Tfe3uF9MdfyGclNlJ9cWMlgvMOWNTSH+HBMbI8N6ZoaEyCILnIr0tKijAtKPubFYDQTDUTQcA5YQSrh0mY4ePSaL6yrZUSG9fDigzmFExptvvkl333OP1D/87gg5s4vPTkUMzIxFL7Go5LQpUzMc3IzMEVavRSsLDQqruHbu1MluCSsIEDe0PtAM4EwFIaMH9rff9siAXKzscObcGVxIpTmNWMCgwa0NZNJ/gwb1uQBZW2WyKM1HKVQuPMBZaVN5fTEhgSZNmkwTxo9NH8ScHZB2kAPm0WJFGOypgIUkkS9Kk3UGMF8U70bvOVar6RfQn2bOnEU331xHFkfNKm4ZspZI895+W2awYD62hv2h8hrblm7duo2eeOJxY4XmbKDqGhSeWbNDaNasWeRb00d84epZqv4UFHYjO5AWVtaYMGE8LV2yVBKISCIhismthVAlEpVq34H9Mgykd6/n7ZawggBxQ7xQcRTUOcQZ5GedFpU+aG7W8cc9OK+O1vcUJtT70Rk0bNgrNGe20VGSE5BOAGSPPQtALgNYg8Jaf85OC8oBK+YumD+fGjZqSO3bd5DJ8QDilVmGcA8CyBuLP2CxhRb33W/+qmEvII/V8duI70RWmtxp7I6XE3A9OisxnQzLbo0ZPVrGRKqhUfbiBLs8BUKEsWWYDjXj9RmynhaEDhUGR0Q4q8qhEoHJwYcPHZLPrgLr+Kr4I75ocTD1CAs8lkMvLAe1QCKus0ZWaXYWEDeQBKbwWJN4bsBaZNiY5ey5c6LVwieZOZ2FCbwbYxU3b9lM8RfO0xP/eUJW31XIKs9V+eGIBWD/OnbM/EXDnlB5jKmUe/bupTQuClvqAO5BvYJPG0u9YVMs+JZFizcukOsKinyRHSIHIsMR06qgMcybN5f6vtBHNn+BUwXEgEqljpmhMkEGHHL4+/hxeaZ6rjOBuFm3JuqztYkkMZTCNI64Rg1nwDXWhYzfrL87C1jxFmMdVTxzAsoA8UaoXNmb/jtoEC1avEjm82LHNFVOji4r9Q71PpiiWLJ83dq1NH7c+PRVYlRcs4KR9Zyekh4yJzv62F+FEnd3A/ITco5c3bv/d1lvz5bxmapuwO01YEAAfffdd/T7vt9lPTwpJ/4Nx4LKXL7ITgHmHBaiRG8KZghgazkA0VMVPrtKnhFpi8xouIDJwVaX5jdB9kLm+FunQ85LZI1gfDZw3XVW350FFQdMf4NGaotmp65B2uBIhl8ycNIk2eMWM16gJSKocnRUeVk/F6bO0aPR9CmboljQAZ0sKo+tQ2YYpyCTHmweVaXj/57I8jqNgkPKgIvsyOFDMpbUluWc0suOP2O1aMwsemfhQjp0+LDsvoYB4ZADXFMQOcsX2eGFYNnLVy7T/n376KetP8k0K9Wy2ipIeA66pmECpqWmSA+brfdq2A4lINg1DZ/yk8cgv1tvuZXJ7hVZ+BO97uo5kAVHQQk4iBXL+GPPEOwf4uvjK7/b9m7EkzU/flYV78p07sxp46yWNbtDyRp2TlOD8/MK+PsxywWriGM1HmjzeK4K+UW+NTv0vGI61cyZM+mtOW8ZswZM4bFViHAdMgMr/sp2gwwIrxZCxyCeCQobF+ULXCboBGjWtBl5sXa4YeOG9Dm0KMOCCGFOUAIOHw5GSWGJrLub3y0yokLuyLhGhtyYz9SwL1SewocPxaWs1WiMvAAcgN5ybNeAzb6xw1rmTsH8IF9khxdjWSZMBfvww4/SJ7MDeYkQrkXCUFng6EdlxDktiPaFEAYfMU6wQkVjrm5egWegZNHqDh0ylLZv3yHzhkWw+Tes1mwvSHzNgKeiUwQr0jzwwAP0+OP/YUvAGNJja8OI5wC4FvFX96p3aNgHqtFDD776bkv5ZIbhGyfZfAhLsmGpLizwAN4xnmlemEfYJPVIAIQDL0M4F3eOPvr4IwroHyBjr/gCSZRKnC0JhIWO56r7UB3h/9OwP4zysMjqLtj4BOZcXgHfC5bmQllBO5oyZapsRYlB1Ybvzj6mrCIgFbBs/b59+2RWCtYCRM+r2hXNusMoJ1hfAyc4CBpyrGFfYGIB8hpldjU5yTybP6BBhhXSo3sP8vO7hVau/FzGVbLeZ1yQD9hMduoIXw3WgfNkocMGubYIW3bAvQgg0jRWe2GqWJ/XsB/QuFy+dFm2aSxo3uL+6tVuoCmTJ9M4WQMPjVS+PSLXQZU/CGnv/n00edpUGjN2TLpWllco+cW96ImG5gGZA9RvGgWH7NvCR/jYsFAqFJiCAuX1/PM9KTY2hnbtiuIGG/4788c8wiYJVQKG3jAsOolWdvirrxoaGb8Zx7zD0OpUKF++XPoYLi2A9gXyE3mcwhoNtq7MX3ldCzzvlltuoeeee05WObbnvEbEF9oiVhvGajQfvP8+Va1qrJpTUNnA/SA7HBGUDGsUHCA3Fgu6wvl7I5OdPeQMwLhW7Ar37rvvyv41+dXKbY4NeleOHj0qm9MMHTqUGTdjIGe2iI+m8LeHUocmviap1aOQX8zfGBAy5XepUKGi4fC2+k3DPkD+qooNtwO+FxR4BHxnWH0Zo90/CQ0Tgio4jHLHYhIQ7tEjRlLN6jXERLIXUFmU3CkNT6PgMOSMZDsCH0xHtIOcAfxUkTGsPB0c/LostZafcsuS7BQJIeBzakoq/f3PPxT8ejANe/ll8vHxlR5UVB6ELCvPsdU04N56NPRHPxqyMkocjHFx2yjA2BZVRBrPlgziz9iM+srljP0B7JRPGlZAXqOVtA9QQCXEB4aNvbdt20r79u8XUhL5scGHZy1nGfKWJh1Vc+a+RY8++phsewlTBv65bGUtF1xnTnmUlEUEcNZ4XqbfNfIN5KYHl+uNNX1krrJdYD4HG4RPmTKZlixZIutKKvnB0RbkGBs8BFM2Tp4+Jc7ol/77EjVs0NCGRMRS2JhutLHLRtq1YiS1b+gjq5F6e/PRak5whuCWIGy+A8dx3kVZw1agPEF2WRLG9mA5n22YHmlemAH1G6YHTpoUSIOHDKaTp06JANoK3G8tsFeuXKUPP/yQ6tatS+3bt5MxmAUFvyID/AVLioHfcBrv17AfUI4IxpL49slbPA/PQqOHTd0feKAVhYWFyZAUJTe2IEfWQksaHx9HP+/8mSpUrCBLFRkjonN5we5QmrWyPQUNbE/GgsvXQ2WEiqwxtzQjYRr2A/IT+YrGxHo85DW4Z6SpfWcO22jWg0Tta/uYF2ZAlRW0LoyLemf+ApkfjVWdYQ3YCtwPwoN5+d0P31NsTAy98Hzv7OOaR5giJkCcEdRSUYAWN/tAyQPcGWp+vL0gZcYyApno0qWLyMxnn30ms4JsbVyzJDs8GMAS17ujdlPoJ6E0ZPAQISRM8rWSnSwRe3gXRbXtSv63mieygXoP8sQ6wjhv/pQHxFPkzG5Ujx8WvN085YqIP0Crpw+g1qYf07dJaxowM5Jj7zgoQUEnQrbzYj29TO372uB1MIJCj4ykkc/4mRdmAPFXZYiGEVq/j68vRURESGeW+i0nIF6oHLgfg9QXL14iPbwyIDWHpjhyeibNM1O4VgaMeCA+6nclxHi/LfEsdLCchI3pQI19jfj6NulAQ992rJwUFJKvDBAQ9nNBmV6HlFiKXB5MA1rWM8vClwasiTV/zBqqzPA8lBV4CNMWYcpirCfk2pYyzFKcQGcQggMHD9Lbb88XRzHMH0VIKlHZIfpgGNGtVSjxp5CMRN3WigZMD6fo9I6UawVPPTJfYndsNY3yb06BFxuRv3nKJZEQQaPu9acFcS1pounH3PZeT/Ja3YoajYkgx67TagCrS9iOeApfHEg0ohf5Z1qSTMkABBCf0dJ6enrQq6+8KvLyy6+7hPAgMzkRiqoQWKn6+d69aeab/5MhJhjaBEnMDi2HZ6WFcoicRS2pPflUMy+0gopzCZAePuAo57J/j3MQRSHtGtP8xF4UGmWkK2pZL6KwVtR+RlShyEl+oMoY5JOlZpcQScGPN6Ou78VRyzlbzDI7QLMey87+M4DnWMsZHlu6dCmaMAGb278r/QlQzPD+nEgvS7LDQpUYLPrWnDnGInpCQRZ5kc3YNIpGrfClIWt2SS9r3KYg8tsZQK1eDk9vnVRe4PkYDoAEYcBrbpG+FrG0elooVZm2i7ZM60DX6x8uhAr+NGtvNG2ZHUD+ph/Tr0UAzZo2kmJnrqYIBzXbSuiQp4aw2Fi5dy+lWR90pVHPNTNPXIvMz0nl519hoYOmtuCdBXT23FnZeAXIsjz5FExXzHkdMWKExO3cuXOUmmaYwNwUyjFLVLheC/X29qIDm0IpevRI6mVlVahByCJwcjAa2Yz45/AeZ+D4Adq2vSsNHdGTmvkYafNp2lPkJHJeOLnyzrfIU5Dd9VyRSJFzhlCgVyBFfDOLAlr4XVNueQNM5TQZqgYlbPTo0eK/y23403Vkh1YYvWGYotGjRw965ZWXRRAvXTKYU2l3ueK2iTR/nlFY6LHzrutPE2cHUeOFoRTBWitkHwOJAZAdRl3jOpzJEEJb4ENd319FEx/MuXVwGXAaM8OrYhX+P44Ly/hub1iXme2NSCJFhM2i6PFDqKsNi/riuehNnz59Oo0bO5b6vNBbVq+QVSv4/VmVKfxmENi5c+fS008/TR988IFBkmfPiX/RZllTOBNOS18jGtXTnzLnsqSbAwgUBIv42J4XhQwmcl+KpphMjV/MMaa5h/z4N9cGlJvryjs+gkJfi6GJowOoUQE3dkNjiDKcNm0aDRo4kEaOHCErHKOhxPnscB3ZoVVet269jGt54oknqGmzptSyZUtav36daF9IQm5C6FO3K9EdWRSKV1nyRiGeAaFlkBr+v8xCX6aMsXO4nMucWcUY0Qe2EbXz54bBPGFnWOcphMGmSn4klEJm+tGo7tcTR2bgeVjX8NvvvqeKlSrKIoyt/VvTjTfeSBs2bJCGLLPM4J6rfH7t2rXyvWPHjlTn5jrU8cknadGid4UE84qoZbNo6TOjqFdT80Qm4J0IyANlPruknHm3p5FhjWjWM90o5NtYbgTjKWr5UOr1pi+terMnN++uC5XHKn/TcSSKVlEv8m+ZVy3uWuDZ0Oo+CQ2lRo0aUatWLekhlrc772pKa75YJ0SbHa4jO5gUoWHLZeAwVNHy5cpS1y5dZc067OKUwmRoLSAqcdbwa+ZPLZeF07YE84TCmRimuubkx5qCusW4t4TMe8MyzuoHt+G6hAhaMGEXjRzey+EmOAQQfrTcwSbH8gUU3m8UBWRHHPgzyx7kgaV45rGGNm7ceHF9lOHQr19/6ayAIzkzcN+RI0dk/xHsb4F7sMtb506dRQS++/47MUvUO1TIFpyPoW9G08SXul5HBuo+JbelPK0WYc3pmU6E33OhFPWaF43y96WyZatQ8/e8KShyCXWta17ggkCeZpef6LSMbcppORZGozo1Jl++toRvY+oweClF5eK+UWWPAGUMPIR9brDfLMbngqewrwh2xDt06LB51/W4juzQi9Kyxf0ihKmphkqIeZAwT7C1HuZBqpdmq+HdEUAhg7dRr06BtPpgrBBo9PalNPSlUeT1egD5W1mcyCCIHaYyYRXdDCGUQ/FGQhSF9OxF2wavpqC2BWvxcgPyFW4Clb85wjQHcxo6pAAZwOrFkydPoY8+/pAqVjB6MlB+GGBctUpV0eCyqgTouYWgKplCzNBbjG0sw5Yvp39PnEif2qVkLTuZi14ZQiF1R1G3x7LKR6teY06/ECu/x6a8cAoS6cAHA6jVtESaFb6fjh7YSLOqhVHrlt1owW5X7Z4wSAl5mm0nWOwCCngtmtrP20bR8ONHhVIvz6XUvF0IRZmX5ASU/cWEBJa1yTRq5EixPoHUlDSK3L6D/Pz8ZApjtuAIXgMmMQvbvpYePXpYmEFlk2R+iWx6u2btF5Y5c+bIhrY4h8CtunlnZsRZdr0/xNL+Dh9ImcXnjvaWkWH7+WwG1DPwjoCAAAtrB+kbMuN83rHNEsTvCoo0v7oyLu63LOntY2k5bds1eeIIIE+Rn4sXL7bs3bs3PY+zw643m1mo3RLLUfN7VkhLMzbWvnjxouX999+3vDV3nmxWjffg+ZCXGW+8wefn8ufLltQsyhPlHhUVZWndurUlLi5O7se9uDZyx3ZLn359LSdiYtJlMFtZu8Ll3pQsAatzzkk8G/Ht1q1belzzJ2eOxZXIIEszn56W0GjzhImjH/e0+PgMsWx0tMDkE6rsv/76a8vRo0ctbFKav1gsMWFdLeQz0bIl45SBK1ssI8nHErTT/J4F1HOxeXvAiwMsG8PDRSYgDwh//PGH5T9PPGGJYVnJno+y2CQbpg66/qHJDR48OL1lxYa2Dz3woCyVvHnLFtHs1PX4/Xp4U7N+82nj3hj5PWYvt07PNbpGU8ACfwBHUJ6HnhkA17tuq2sHiEbXgcIarabwSS1z1Z4KCuQl8hRlleuYJGh1s2NoyEvdcjWrU1jz/3XXLtkzAI5iBRZO+vbb7+jChfNsyvaTTXuyAsZL3X777dKbds1iAhy/u5s1F78fTGOcxzNVOjIj/sulFEhBFNAu65zEPeo+DFGA5gGNUj0vx/xwAg58O5+iegdcZ7L69R5KAawdRR00T7gYkJ8IKFe1qIeCz02NiJr4kV9mxdurLFWhWIo5nb3Giuegw4obaqpcqTI9+MADoplDnsFPcLktfOcd4Y/re4EzcB3ZAZ4lPahevXoy5zFw0muUmGQsxlfFu4r0zK5Zs0YW7wSYdzmB8jFv4HyQAcqcEJAdMkeZWa4mfHYFxhp16kYRj62ijeMdT3QKyFc0KHFx8Tnmb/T6BbTAZxQFdMw+Zrgf5HPuXBy99dZbNHXaNPHRlfQwBC32ZCy9t+Q9FsJhshm1B5uR2YkIhPPRRx8VV8cvv/xCKUnGYqA43+Wpp8THyC13euN6PaJo6bSl1P7lnpST7xvpB7CMmHX61XlXgne1xkTHYq8fQHwmhmmhWVYd+i4FkI4s6mEtZ3e0oiF7V1PEEfO7gvjxm5Gfb86Jio6OpsmvTaZXh79K5c1VzUGAEyZOpJGjRsoeKWrzpWzBEboOSm3kVtASFBRk+SQ01JLIaqM6t3lLhOWllwZbEhIS5FxaWvaqY7Zg6yEtNc3CEbacOn3G0v7JjjmqoLbBxc3Yixy/x3ws7V/fZjnKZhtMt2vCRfM6O8MoozTLe0uWWj79bIWYcHkFnqGeg+PZc+cs4yaMt6xdu1bKDedRlmfOnbV0fbqbZffu3bmWJ+7BNQhwjcCc3bNnj5goeAfO//X335bHHnvMsn//fktyUrLIjDXi1g0xTLvT5okswK+R5yF+v/66y9Kz1/PmLy6Kf1ZZevpATjZa9seYshG9xRLU0cfi0zs0R/eCM4HyRICrZN26dcIP1jgaxmb4rQGW+ZFHJU0xBzaaaVpliTGvAZScKdmIi4+3vDhooGXHjh1ShqkpqSLDy5Yts0ycOFHeg+tzQ5aaHd8oLR7U/YCAAPrmm6/p+L/HpXXFuXvubi4733/88cdyzmLJZ+vIt2GhgZSU5HTHdrHG7xEU+G0shU9oRfWqVBEH6zVhzvWT7e0Bpb1gCtaZM2ekfPMKPAMB96LVxr6tMCXatm2bfh4tLcbWdX+mOzVo2CBHk0IB98IcgVaPmRdz5swRqwHPw3lfHx8ZQ/UOmylYIftaFTGaVi1cQL4jAqh9FjMm0sEaBt7D8k6n+dk31qpl/uCiqN2VQqNCyf9wCHVrZshGo47BFP1QKEW939NlB84jj9URS3SBG6yBHuZt8/woanhrSZNvxyAzTVn3oOM5kCn0smL1m8aNG8s5jM/EunabNm0SS9PmjjehvExgQUtvWZOSkywHD/1heeSxRy3//vuvcY5ZNTY21tK/f3/L77//bhOrZgXch1b877//sQwfPlLeqWF/IJ8R1q5dZ5kydTpr55m9xLlDyQTKngXN0qdPHwubq5aUVKP1TUxMtISHh1sGDx1idEjYUJbqmTjiGWi1w8LCLIGBgdJJJq04/w5rgknUsmjRIksCa4B5BbRBvCPxaqLl0xUrLPPfWWj+omFPII8R9h04YJk6fZrl/Pnz5i95g5ILyFpERITIVOzJkyIjKXz+woULlp49e0rnFvgD19uCbDU7Bfhhat1Yi4KmB9HS998X35qnZ0mqXLkSDRs2jMaOHUvnzeXU8wKLzJUwAAd0/fq3md80HIXK3pXpjCyLk3fNjmVFWmqMUkeZD3t5GLfOVWUqFuQFPhVoZdOmTsvdd2IF3ItnKzz11FNy/+bNm42R+PwHa6Jf//70886dtGvXrzn477KBKeV4TfLVJGrUwFxUUcOuULoVOqQwthL7veYXSjt8nzlnzOgx5M2yi3NXrybStOnT6elnnpFBxbAuVEdnbsiS7GB+wITAERtfYPwbVEj0ZH296RtKSkqm0qVKy+7/o8eMppmzZl4z6Zv1TPNJ2UO5rHH9vv37yMfXxzZVVCPPkDJhVKt6A1d4Y2Pr3IBrEBQZoWzQKH311Vf0/PPPG4LG8oGlnOLi4lgOxsg6dN5Y7YKvtaUscY3qVYOsIZT2KkNDhg2lL9atpROxMel7hmKEABaPnTN3Lh3/918WMY4bXCg2Crqkg8Opk6fo1pzGYmkUCCir8l5l6Rg3fpzj5tncoeRNAv9hmuHMkFnUvXt3qnbDDVTKsxQlp6TQ7/v2sdlaRjq11Hg+dHTagizJzhrqMZUrVaKXX36Zvvn6G1mRFsKGFviO2++gE8f/pd/2/GZeyRG34d1IFIBWeseOHeRdpbD6Jd0PIBNU9BtYaDB1yxbNSBEkCInNh/Su/9WrV5O/vz8LXFnxt2KjdLS+/QP6y4KNQJ41LxN4F0SnQvkKMu9xUuAkczMfY3czEF4Aa3jvvLPAOM/Xp5mLBuQIFjXkAdJx+M8/qUw5F+/OLKqQ8kiTyfnpw4hsAO6RsucAXsB0sBUrV4gy1apVK/HJQf5OnzolK50MHDhIfPy4Vt1jC3IlOwAPg7BgWeSRI0eKuQJhw4ukxQ0OFtXyr7//Tr/eFqgKdeTIYbqpdu0MZtWwM1iYuPw8S5eiixcTpIXMDUKQXI5KoLDJ0rx586SjALNsAMyMCP8yXEzbtq3bCMnhPnVvfgC6A7HdVKs2DQgIoOlBQaI5QlbKlvGiRx56WJzba5h0UQE4cuad2QPxB9BAn42PY43AdjNbw3agzKGdYw9olCQ6HtGZkBsUYSmZOcXmK6YZdu7cOV3WYFWOYesBm/LX5EZVXYujKt/cYBPZ4VEQZOzZWbtWLerZs6f0kIG9kTgIHxZcfH3G62x2GIOQbQEiCfMXlQ9Th5Rpq2FvQJjSxGQszYIIDccWKAG8ePGi9JRikDm0Q5BZEpfzocOH6Icff6SxXPbYKF38J6bw2SqA2QHPwqbYdzW9i1YxsUGDxDO9OP7Yr3jbtm30t9m45gaVDmi35ZjovPLgU9SwHarMjVXHjaldufntUC7p4PvRsMGCxEDzatWqyV7F4IhPP/2UnnzySbr1llvl+eAdde81z8gBNpEdIgHhAyDU9993H1Vndl25apUsDIABpU3uaEIN6zeg0LBQMW+UgOUEEChWy0hJSqGybBZpOAYoBggi/Kw331RbtCSUjdKssysnaINXWdDQWVC+XHlq3ry5uC4gfBdYs3973ts08MUX02e+KK2uoFBkCQ2hS+cu0imBbRWvJl0VfyBG0WOl2pGjRslyZNekJ4uk4DeYRidOxEjDXIYri4b9YS1H9Rs0pEsJl4ULcgSXp0Iyy9Wi996T7TmxB4kXN0yYM//rr7/S/v37qU2bNtJ/AChZg5zYKnO2aXZmhJQQQrV87rlnKXLHdmndkcZyLJh9+/al7779lvbs2SNEBhiClrVfBUSJ6R5N7rxT63QOhFF+6NUsxQ1SfVlOC9odzqN8VPlmBqaDHTr0B33xxRc0dOgQIR+UJXrkZ4WEULdu3ej2xrdL2SnZAKw/5xXqXgQIMbZ+nDJ5Ck2dOo01uX+E0DxLeVJ9TsfzvXrR/Plvp08nA7LqacazYE79vm8/1ahZw2aHtkbeoQjv0Uceo8QrXC7Z1H1r4A7II3z3f/11jB597DHx2+JZWMEa6xxi31i40azlSsmJrchXMwwhxNSxYWzWYApH/Pl4OYclmqZMmUpvvTVH1FFEFkKICKlMsAZ60o4c+ZMeeujhLH/XsA9U3qKMYIZu375dzuWU5/gt4WICzZ03TwStYqVKch6N0ybW9KreUFU6KpTG76jyAzFVr15d/MLvLnpXZA3vQlo6depEfxz8g3b+sjPdD5ldLNBrjIp0zz33OCyuGgYBIX+xA1gME1V2ik46zLI4feYMc8cU5pPXpDMU59GIwX0C3x2mg1mbrvlBvm0O2M1YUmX8uHE0fvx4MW0g+DjXgW1rRBzjpCCU2bFvEpsla9euo1q1bswTQ2vkD8hjNEhbt241nPsmMgsQvuN3zHvFZHxM1kfZ4hw2Sl+5YgUNGjhITFpc6+iyw7tvqVePbq5Thz7+eJnIGuQKPmR0mEyYMFHm4yr3SWYgflge/vjxf+nOO5toWXMwkL8YLvL9999JWeWGxMQr9Mb/3pAG7QbvqlK2UJLgq61Wo7osBoseWaU45Rf5JjtECCuhNGjQQOzrb9l8BdCT9hQzsV89P1q/fn2uXdC/7d5NN91Uu0CMrZEzICAIyOPatWvTqVOnhLhQhoqscLQOWIzzGGtCnZ/qnE5quA/O4zfffJMqm366ggifLYDfEO+GCd23bz+Ztoipaobge4j/DlvqYQFQ7GqVFXAt0hsXd046JxwdZ3cF8hV5DXiV9aK9pjsL5ZcVcB6/L//0UxkzJxuicwOGgero4d+wYT316N5DfMLq2oIgX2SHRCGgxYWmgNVRZs+ZK+OwgDKlS8lOUcuXLxcBtKRyi8uZgIxAQKTRMYHfklKuyvAVLYCOg8pbHCE4l68kyqBNaEI4hzKBSwECBd8JViDp07cPvfH6DBnugWvOXzhPk6dOobfmzqU6N98sfjqYFfhNBUcATwUpI1RiWcNo+g8//Eh8OfJKjvONPr50z9330Jov1qT77xCQFqQJQ04wVKqeX13RELKrfBoFA/JVyRM6LStUKC/znNHQqDJBwHVSLvz58JEjtHnTZpoUGCiE5+FZkhKuXJJlmyayxl4dPbJm+eP3gshavjU7BUQChPfuwgUyEBTjYUqUKEnVb6hGM2bMoF69etGpM6dF4AAkEPeksiBeunxJ7HFMP9MC6Dgo4YKQoLLfe+99dOVyovRspoM/4hr45DCDITgoWHxlAM6tXrNGemNvq3+baO+OIrecgHfCPHpt0iQZ74meWAuiwQFTF3/44QfasfNnaUgBkLHRsCbRDz/+QDV9aorsaTgOkCHkMcoK8vLXX38J2QE4p+o5jnBzjR0zRtxg5cqVN3ghOYWCgoJksy+4xJRP2B6wS8kjQj4+PtS/f38KZIZWdjqWSIZQYmFGtZifSjAyYOtPW2XsTJqNU340Cg6YpG3atBbfG8opXfg4YJjJd99/L2OZsMmSIobv+dy2rduod6/nqbQnxlAZ5OkMgMDgOunatSu98cYb6VoDzNNJEwPpow8/FHNVmU9IA4Y07N2zl+5jki+ok1sjZ1gT2rPPPit+0svm2nZpaRnjO6GBY4AwhpmgPNGAohzR2YRrH3n0ERnmhufZC3YhO8SnbNky9PDDxuj21Wu+kMGEECxUmhtr16KwsDDREOBnQV6goq1YsYJq1jRaW3smSuNaIG9V/iKv0YX/JgsaBmpif2AIHka7Y/I2etJHjR4lcxFxD0hx1ZrVsnK1uBv4D8LorPLCuxE37EZWkhvZ9Rs2GNYCy1WdOnVkgvismbNkILRUMA5X2GxHBwY0Beu80LAvVN6q/IVlsHb9evpp61Y6c/aMNEweHsZEgh9//ImtwCvUoX0HbkCNweiYCz12wngZvO5d2VtkFefthZJT0G1aYCBxxriou+66i+bOfYsa395YRkCj17ZB/frS64rWFueg2mKO5e7du+m/gwYJqzuzArkb0OisYQKDMK5avYp27Y6SzocPP/iAJrJm7uvjy+XmKX4umBQ9n+tJDbn1RVmijBGcCQxHQUPatGlT2Xzl/vvvlxVdcA7TDjGe7iSnB+4V7FIWGhpGtWvdRP7+j11XITXsC+v8xTjajRvDKe7cWdqwcSOdOX2GG52TskpSyOzZ9Orw4VS9RnWRJ8y8mjZ1qvjubq5zc4H9c1mhBJNMgakTj0DriojheODAATExMKUMAghnMrQGzK1E64rK9vjjj8sE8i1btsgzcB+u1XA84DTG3hDYCB2TtmFmfP3N1/T1V19J2bRu3UYaqMjISHFFwGREb6g9BS+/gKwpkYWmgJ3ge/fuLZYD0hIXH0979vxOU7kNr3dLPXrwwQeoSZM7pXe5J5tMJUsaVoQrpKW4A66rAS8OouDg6dIxBiUn/KsvZeFNjKurc1Mdur1RI6p/221yDqQHVxjMV0c0qHYjO3UEaaEXDENRZjN7q96ve++9V9Yqg2aHxCAjMOPim2++Sb/X2RqDuwC9rS+88AItWrSIavr4SN7DrwXzAiYtSARLOaGBwpxn+Pns6SguCKxlDXGFBoBB0tjXGPtLYF29Nm0ep+7dn5bfEPefftoqg5Gfe/ZZuRfQsuZ4oLNywIsDWenJmLwP6w5uBRyTk5PSe//RaDVr1ky0cUcpPXYhOwAVBBUCiUBkQWaYRQGyg8Ah4LwSMphNaJEV2QG6tS0cQLh693mB5s6dKwN14e+CGKj8Vw0WyhLl50qaEOKJ+EGO1BG9etAMoH3CNIdvEbKGgIHr69Zv4GMyPduju6QD92hZczzgkwsIGMAm6yxZXh9+fJmqh6y3Yh2UI+DosrFb8wZ/DgABQ2ShvWEAKzS5SpUqMdlhY2I1LksTmzMBOcPQH1mRQsZuZJQHjihDNE4wC43ycp2yQlxUg6kqBuIJrQALikLeQNAZ/sWSlMANLzozNMkVLpDVKZaUdF6TcuOTIlNMehL4M5Qk1Tg5EnbV5SURSKHVZ/Wdz0gwvlufN5D5u4bjgLyGABq9YxBA41xWZeCK5aLiah237OIJTfASaxjWDu/srtWwPwytzaQ7znZZxdr6zyyLzEdHwK5kp1E0AHHyYm1IBFG8GI4TMGcDqUtkM9fRWoNGFmCxwsypdNXOydBk54ZA64lJ9PDJWVxFEh0FJnMMa4ALRcFObmqNXADNzUP+dw1osnNTlFdr+LuMKDoGSCM27cFS7Pisaa7wgEZV3CQuAk12bgj4TTxKerIZW/yrPlKYmGQuM6T8QZrxCg2O9MHlFZrs3BTobZUls0UYi3HtZ20OA6UxIwRAal2pAroDXCW/Ndm5JUpQGTHr0kwjtnhXfmy36MmaLIhPoI4aDoU2YzWcD+Y2j5LGggxq6a3iCqQOQ2yQZiwEKrxevLndpWDdC+5sDU+TnRsCK89g0K1odsW94jOZpyYlCbkb3zloM7ZQYK3Z4bOze8E12bkljHnI7jIEA2O9SlmbsRqFBpCcszU6BU12bgiIHswLt1k0lZPpSr4jd4E10blCw6olwC1hzH8FCxT3cXYAUqiWoHcVLcNd4Er5rcnODSFz/7EJEje2qWmpbkB31zrKNQoPruQu0WSXHWIjKWz6AGrdxNdQx30bU4fBCyjyjPl7EQbSU9arLH9yD98d0qvJrvAh9cYMrgBNdlkhJYpCuvSiVeRPE1dGybp8cZFLqatnKLVqEkgROW+F6/pg2bMWQFcRRkcB6dM+O+cA+e4qhKclICt4NqORkUdp1aSe5N/QR5aU9q7bkgKmBdKQ2GCK3G1eV0Qhmhxkjw/u0iOrKp1G4QJ5rmTM2fmvyS4vSIinGGpGXl7m9yIKD/yZmo4II1ivmENVOnchd1cA8hwBS4m5Qt5rsrMRicciKHjwSIoZFkS9mponiypY5tJKYF6s+1R8pVWoo0bhAUv8u0Ijo8kuJ2wPTm+dyrYLobhnwil8XnvyMX8uqjDqu6HpFPeqL2nkBOsOCucAea+IztkNjSa7nHDPSKNzIi6G9n8QQL7ru1GVlqMoolj0yPJ/7qPYaZ+dE4D8Rr4rsnO2dqfJLid4ehmdE94+1KhFVxq5YgstqRJCo5ZFmRcUTUDmWF81Psv34s161pVOBY3CgTXZORua7PIEP2rckigqoYiPPfFg0y6Nix6aDv/DVorFCahcans+BWutTmt4hQdVFq5AeJrs8oQDtOtHomYVinh3rBvAmtBQ0TTBFT6Q5wiq4XF2GWiyywrHV1PwmKW0evsBio2Pl02lYw+G04L+ATQ0OoACn2lmXqjhilCVCiSngjrn7ArnjlBk52ztTpNdVqjWjJpVjKQFwzuQb5UqVIVDs2dCKMpvFO3fuYS61jav0ygSUGSnia7wgbyXXeycTHSAJrus4OVH7SctoS2RR6WQEGL2bqElk7pSI2/zmqIMljtLSQgfPsi/YglrcsNnVeFcoeK5E1R+O7ux0WTnloDQuY8fC5VNzRgBtIZXuHCVxkWTnVvCMC1AemoISnGFtVahSc450D47DeeBhS4tFQLIwucG9R+VDESHo6toGe4C5LfRsDofmuzcEmA4VP4MP1ZxgnWa1Gel1WntrvChx9lpOBXYYcwdq31xJHdXBvJba3YaTgUEsIRH8aY7RWw4ao3OeVDl4Owy0GTnpkhOSWYpNL8UQygfHaCOGoUP63JwNjTZuSEgfBLM78URqoK5yoBWdwXyXpWBUQ7OKwtNdu4IWBMsc67U6joCSJ9adQOfETQKFxbO8wyfnXNlTZOdO4JlLiU1hSu/QQjOFkJ7Q5GaOhZnQnd1lOTGJi1dq3NuY6PJzg0hBqzUfwgfh2LKBZrknI+SniXTy8Fse5wGTXZuCMyaAOF5SG8sC6KThdDeUGarhvNR0gNklyby5uy2R5OdGwKClwozFp9dwLxwBKy1OvVZk2DhA3t/pGC6mJOJDtBk564AAXDFL46VH2lSAQRnTXwahQsPJjs1N9bZ0GTnpkhj0yJDoSt+ZKAITmtyzkWpUp6UqjU7DaeBBU9MOv4I/12xg1bkXAalPEuRJU0ViHMLRpOdGwJEdzUxiT95sPhBAIsX4SFNSqPDZyONGs6AjHNMLwOjeXUWNNm5ISB4YloYX4o3kD7NdU6DkJ322Wk4CzL0hAXQA9pP8VLqNFwMHiU9MhpWJwubJjs3hNLs0p33urdSw0HA0JM0mRvLVOfkhlWTnTuCpQ6aXfoST86WQgdB9cjqoSfOg6enp5n/3MQ6uRw02bkpLGmpxdaCte5hRgWTYTYaTkHp0qVRCOA6p0OTnRsCWh0GeuoxaBqOBqaLpQ8qdrK8abJzQ4DkZKVilj1NeBqOBHpj4R9WpqwzocnODQGRS0kx1xhjISz2Pq1injxXBhpTWBLGODvnQpOdOyLNQknJSSyIGPBZPLU7awJ3hYrmrvDEdDFYEfzZ2bN1NNm5KZTPrjgbsaJVuIPm6sJAbyzaGhSBs0tBk50bApqO4bNTVFfcyCBTeopb8ooQ0EGRqnrDndzoaLJzU6Ri6EkxNF8VlFan4VxgpWKQnCoLZ5aIJjs3hIU5rkSaMVk+Tfiu+JEeKldxJvOiApixKckp6SLmzBLRZOeO4OY1NSVDAIsfSmiicxFg6ImCs8tEk50bAiKXmpLKhV9CQnGjBd0p4TqQDgoXgSY7N4Qig+Lq17LWICStuofCaQDZuYqWrcnOTQEBtDYxijO0kuc8YN9Y8Zu4ADTZuSFAdMWd7JRx7ipahbsCQ09cxVGiyc7NoclAw5HQZqyG06G0Ow0NR0J3UGi4BBTZ6Z5LDUcBKxVrzU7DaVA9sbIZiiY6DQfClfzCmuzcEMqEhSCqzxoajgA0O1eBJjs3hNLsELRmp+FIWJOds2VNk52GhobDoH12Gi6B4my+yrwJU5PQRrrzoHtjNZwOEJ07zKDQk8WcC5AdGh1XcJdosnNTFG+ys1reCXVM+yWdBtXj7wpWhCY7N0S6eccC6AotrqOhdTvnAT47pdk5m/A02bkhrMmueBIeVyrrJGmucxogX9gCwBVkrGiT3bEw6oYKOz3SPFHUEUth3Q0CujZ0o7Dj5iV2gHVLq4KGiyH+AIWN6UCNfVE+vtS40ygK+z3e/LHooFSpUhmbZDsZRZjsoijkufkU08L8WiwQQzGHiSaGx1FcnHVYSl1rm5fYARA+RXbFT6srBkiMouB2jWl+YldaGonyj6LQ54iWtm1PwdsTzYuKBkqXLp2u2Tlb1ooo2SVS5PQhtKp9CAW2N08VCyRS4m4fKlvdm7y9rw1e5hX2gtboXBfxm5ZSYOIsWjAvgFrWRfn7ULPnZtGqdxpT4LRQijavKwpQHRSAs+WtSJJd4vYQGhnegUKGt6Qq5rligcQrFEetyM/H/O4gWAuf1uxcDwd2LyBq24wamd8VvFu2p55fRlBUrHmiCEARnNbs8oMz4TSqy0bqtnAitaxgnisuOBNbKK22Ejyt3bkmfHz8iXZHU4z5PR3xMfDq0oFj5vciAMgXzFj12ZkoYmQXTWEjAijmzVAa2dQ8VZyQgv+iKKidr0lEvtTYfwCFfBnNBq79oHx2AN7j7BZX41r4tRtCPfcG0tAZERQdH0/xHKK3L6Whg4Nov3lNUYLujc0HopcHUiCF0KzefuaZYoa6PWlBVCit2nTA6JiIiaD5vb0pvH898p8TZV5UcCjNTsNFUbsrLf02hBpFDqVWVapQlUataOjHRAHzQqgV+RC5zgwsm5CCbTsZzpa5okN2R7hlG1GF5s/uScWU6gQ+TVtSIx+zY8KnEfn3g2M6gCLfDGedzz6wFjp81qas68GrYU+atW4/xaBhitlPG1kGmiVG0zbyp0Z27JkvDFhbEs5EkSG7yOUDKDx2AXWobviZVGj1Gv/4Wiv5HLzduLa4wduX6T02hmLsNMxKCZ7KQ42igahvV1FsO39q5uAOLHsD0obgbFkrMmTXcrj1uLOMsHE8/zh+o3weeY9xbXFD9N5tRE39yNfbPFFAgOxcoaXVyAOOhdGs2TE05KVuRc6ySU1LZbLTmp3tqJAx5sw6VCnLv5WtIp+9ipgvIzNi1wdT8HI2V48ZTun4Y1G0emY3aj0wjoIWDqFm5nUFhauYFRrZI/FMrCED8bF04MsQ6ta2F0U/s5RGdrRTi1eIEJ8dGljzu7NQpDooiju8b/KhmDUh1KtlFaoCx3TLXrTgQHOatTecJraw37Bia7LTpOeaOPBeM0MGqrSigA+iyX/eUQqf175I+quN3lj+4GRZcxrZoZLBhsexIJpGy0ncYkxqaX4r2vBqGkDzV2yh/TGGmQnH9Jb3J1LXO+zbmktOe5SQfAfUsfiAU2i6h9IsaVSC06rkS/I1n7JWmGg2PsaM61HatmI+DWnnR0VPpzOJLo3TIX/OhVM1O0V2akoJKp0Ojg8pKcmUluIaY58cA2Y6IQqWrRKGiCtZU2nOKl90sH/AEk+QN5SHKhNnwamaHWx5MH9SUhIlJyfLdx0KJ0Cz8yhpFH9xXMRTVSmD5EjkC3KGtGtZK7yAvFZmLMjPmSjBpFPoVItXxsbGUqdOnejxxx83z2oUFk6fOUMnYk5Q2CehVLFiRTnn7GEBdgXLlxLqs+fOUt++/aien5+kFbJXrNLq4rh06RKlcWmMGzeOfGrUlLx3Vv47jexiYmKoa9eutHjx4nQBdEJU3A7I55OnTtLb8xdQ6LJlVL58efFp4a/YgOUonezOnqU+ffvQpMBA8vLysqpsmvAKA0lJyfTe0iU0efJrVLNGDSrp4bx9ZJ1GdqdPn6ZevXrRl19+KecggMq/ouFYHDx0iCZNnkzvL3mPKpRjsmNztlhVfSXRnCiQ3cCBA2nRonepSpWqJtGhcdWyVhg4FxdPU6ZNpfHjxpJvTR8z/50Dp/rs4LxUAX4jZIMOjg/QfLCoooBPuINGDXJTvklNdIWHDItBHZ0Hp2l2J0+eou7de9CyTz5G3cNZp7K+OyH6aDQt+eADWrhgvmh2Fs52j+KU95k0u0GDBrFmt0gGnhfHzhhXxrm48zRt+jQaPXoU1fI1VvNxFpxGdvHx52n0mLGs1XmIXV+qlCelFH5U3A4QtdTkZHrgoYeod8/nqEyZMswNGUM0igVYjJAmVCzDZ9eP+rzQh8qXL5fesGYwooYjkZKSRuFfhYvPzteHzVgnanhOITsA3dKXL192ene0uwIkh1DcNR0MN/ntt9/o6tWr4i7RKFygfleqVInq168v8uZMOI3sNDQ0NAoT2oGhoaHhFtBkp6Gh4RbQZKehoeEW0GSnoaHhFtBkp6Gh4RbQZKehoeEGIPo/3MFZkwAeq3IAAAAASUVORK5CYII=')
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Category_ID], [Template_ID], [Name], [ImageString]) VALUES (2, 3, 2, N'BackPack  ', N'data:image/png;base64,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')
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Category_ID], [Template_ID], [Name], [ImageString]) VALUES (22, NULL, NULL, N'Banner', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAIAAADVSURYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAZcSURBVHhe7d2xSxt9HMfx3KMuGbqWTmIHu9h/oNBJRxvooGshoKvQUQMqWCgUBbtmcizpZNcLFCoBdXVuWkRcCt0SsEqeb72vkieP1Yte7nNe36/B3u+84w659+XuTGzQbrcLAHR+R9jpdHwEIF1BEPzjkwBEiBAQI0JAjAgBMSIExIgQECNCQIwIATEiBMSIEBAjQkCMCAExIgTEiBAQI0JAjAgBMSIExIgQECNCQIwIATEiBMSIEBAjQkCMCAExIgTEiBAQI0JAjAgBMSIExIgQECNCQIwIATEiBMSIEBAjQkCMCAExIgTEiBAQI0JAjAgBMSIExIgQECNCQIwIATEiBMSIEBAjQkCMCAExIgTEiBAQI0JAjAgBMSIExIgQECNCQIwIAZkgCOxrViKM9iamvhYGLvUcOTaM+Fjkiggl+zQ0NNTvds9/etSI34aHh+McDJ1O53Ixm7BhJM0DqXtbvvV2u23/+LzzJdbW1mymj1NhBe7u7o6Pjz948MBn3cRWOTo6+vnz58TExNnZmc/FX8kOhs+fPz9//tzH8Xz58qXfVe7u5OTk3bt3NvGf6HoilLDT2Pv376enp0dHR2PujJ0s9vf3m83m7OysfP+hZQfD6urq4uKiHUg+6yanp6crKyv2euPjFNne9hyxV98T2nJp8q1eXJTGYUv2uwryKjoYoivSmKKDxwfp+v9rxtUR2nJp8q0WCnZh6bNu4iuc81n4W/lxEPtI8KXP+awU+Ya78CsKQIwIATEiRD41Go3ihYWFBZ+bSUSIfPrw4UPrQr1ez3KHWY+wVCrVajUfALFtbm76VKGwvLxsHfoge7Ib4cbGhl1IhGHoYyCnMhqhvfpVKhW7kHj8+LHPAm5rZ2dncnLSB9mT0QhnZmasQB8Ad2CXVNVqtfvqNGt4MIM8W1hYiC6pfJxJRIjcmpiYsK/Zv6QiQuRTqVQql8tZvgq9RITIoWazGYbh69evfZxtRIgcOj4+tq/R22UuNRqN6LtZQ4TIoWfPntmtYA+b6d/OmOQjrNVqfuYpFjc2NnwugD9IPsLDw0M/87RalUrljm86Ozg4mJmZ8QGQR8lH2H03PDc3t7Oz4wMAVxn4PeHo6KhPAbjKACNsNBrVavW+PCYGVAYSYfRUZn5+3m4LfRaAPxhIhNFTmU+fPvGANB3dnyI3Gf8gOXoM8HJ0bGwsDMNKpeJjDMzR0dHU1FR07jP34r1auDTwBzNIweHhoZ3yfID7JuEIm81m97WQ3RZK/sgxcI8kHKGdj+v1ut+aFIvlcpmnoyn4/v17tVqNfubcEA5adAee4DtRk78cPTg48FuTVosC02E3gf4Tb7WsRjq8XqfTGRkZWVlZWVpaCvr//5js+s6nEsI9Yd6EYWgd+gBJq9Vqk5OTyf7pIyLMm0ePHvkUktZsNl+9epX4w2cizJvj42P+RN2AvHjxYmtrywfJIcI8KJVKPlUoTE1NlctlHyA5dqdtF6KD+EwPEeZE9GjU2Kma52GJs1vBer0+oHdBEGEebG9v+7PRVouPXw7C6urq169f/TxXLNq0XXEk9RSaCIGbdf/izdhddxiGSb0wEiEgRoSAGBECfbOr0wT/dhsRAmJECIgRISBGhIAYEQJiRIj8uMWHA83t1kpQ0G63O52Oj84NDw/7VFpGRkbW19enp6efPHny69cvn3stW2Vvb+/bt2+zs7MxV0Fe2cFQqVSWl5d9HM/p6amt9fbtWx+nxbbrUxd6I7Szwtra2tnZmY9TMTQ0FIbh06dPHz58GH/TP378aLVaY2NjKe8tssaOn48fP758+dLH8dhhs7293e9ad3RycvLmzZuel70rIuxZIh23265qb5E19/r46b0n7N4n20WfAvIig0f1dQ9m0jxJ3G5bWTiNIQviHwndS2bk+OHpKCBGhIAYEQJiRAiIESEgRoSAGBECYkQIiBEhIEaEgBgRAmJECIgRISBGhIAYEQJiRAiIESEgRoSAGBECYkQIiBEhIEaEgBgRAmJECIgRISBGhIAYEQJiRAiIESEgRoSAGBECYkQIiBEhIEaEgBgRAmJECIgRISBGhIAYEQJKQRAQISBGhIAYEQJiRAiIESEgRoSAGBECYkQIiBEhIEaEgBgRAmJECIgRISBGhIAYEQJiRAiIESEgFrTbbZ8EkL5C4V9w4TgEkFnR0QAAAABJRU5ErkJggg==')
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Category_ID], [Template_ID], [Name], [ImageString]) VALUES (23, NULL, NULL, N'Cap', N'data:image/jpeg;base64,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')
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Category_ID], [Template_ID], [Name], [ImageString]) VALUES (24, NULL, NULL, N'Hoodie', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAFoAf0DASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9U6KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoorL17xFpnhfSrjU9Xv7bTdPt13TXV3KscSfVjQBqUV5r/wtnUNcjZvC3grXtag42X10kemW7D+8PtDLIR7rGRT08beP4Wzc/DfzY/7un6/BLJ+UixD/AMeoA9HorhdF+LmiahqcGk6jFfeGdbnYrDp2uW5tnnb0hfmOY+0TvXcjmgBaKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK4/xN8UvDPhHUE02/1QSau43JpVjDJd3pHY+RCrybf9rbigDsKK83Hxink+aDwD4zng/wCe39mpF/45JKr/APjtWbP41+GJry3tNSnvPDN5McRweILKbT/Nb+6jyqEc+ysaAO/opFbdS0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSN0oAwvGHirT/AAX4dv8AWdTeQWtuo+SFN8srsQqRRr/E7uyoq92YCuT8K+Ar7XtWg8WeOoIbjW1PmafpPmeba6Iv8Kx9nnx9+frnITanWGCP/hZHxQluJMSeHfB83lQL1S51Vk+d/cQRuEX/AKaSy94hXTeO/GVt4I0dbp4Jb+/uZVtLDTbbHnXty+dkKZ47MxY8Iqs7YVTQBvX+oWumWct1eXEVrbwrvknncIiD1LHgVh6J8TPCPiW9NnpHinRdVvP+fax1GGaT/vlWzXhnjfVItN1yKLxHaWnxE+IRjW6XR5ZCuh+H43+4WBU88HDlHmk2sQI0+5l6p4y1fUrcR+MvCXhjxrog/wBZZ6Xpz217bD+/b+bK4kYdlDRv6HdgUagfTPiDw9pnirSrjTdWsLfUtPnGJLe5iDo34Hv79q4PT9Q1H4U69YaJqt5cap4S1OYWulareSF7ixuD9yzuHPLo/SKZvm3fI5LFC+H4U8cDwTZ6Vfx63J4p+GGsMqWGvXUjSXGkyO2xIbl25eEv8nmP+8jf5JM7tyep+KPDen+MvDuo6JqUPm2F7C0Mq5wcH+JT2cHkN1DAGgDborgfhX4kvtS0u90PXJvO8SeHrj+z7+XAX7T8oaG5C+k0TI/oH3r/AA131ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUh4pa4b4peKL7QdFttP0MoPE+uXC6dpnmDesUjKWe4de6Qxq8p9dgX+IUAZGva7q3xA8QXfhfwxeyaXp2nt5et+ILfBkil2qfsdtkEedtYM8nPlhlAy5+TrvCfgnRPA+ntZ6Fp0dhFI/mTOoLSzv3klkbLyOe7uSx9af4N8K2Pgfw1YaJpwk+zWiY8yY5klcnc8jt/E7uWdj3LGt+gBNo9BVTUNPtdUsZ7S8tYry0mUpJBPGHR19Cp4Iq5RQB5RfaFqXwdjbVPDKXOpeEY/nvfDK5lezj/imse+F6m2+6R/q9hGx/SNJ1az1/TbPULC5ivLG7iSeC4hbckiMNysp7girzdK8t8NIfhr8RJPCv+r8O+IDNqWjL/BbXS/Pd2q+itnz0H/XwOirQB6nRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVy/xI8WN4J8E6trMMH2q7gh22lv/wA97l2CQRf8DkdF/wCBV1FebeOk/wCEi+JHgfw7hXt7eWbxBdrnqtuFjhU/9trhHH/XGgDo/h74SHgfwbpeitObu4t4911dN965uHYvNMfd5Gd/+BV4z4j+IB23vxDSCLUbu7mfw/4HsJiRHJknzrxv9lzE7lv+eFuu3/WHd6b8ZNTurfweNH0yVrfVvEN1FolpNH96EzZ82VfeOFZpP+2deHeIbi11v4gXiWEYg0DwpF/wjekQR/cRkCfa3X/gQih/7d39TTApaLpP9k2ziS4kv725ma6vdQnH728nf78z+7bVUL0QKqDhRV+iitCCLw7rNt4D8QXSalDHc+B/Ez/Ytds5+YYZ5v3aXRB42PlY5v8AeR/4XJ9r+FuoXWiXWqeBdVuprq/0HY1ldXLbpLzTZM/Z5GP8TpseFz3aLefv14lfWNvqljcWd5ALizuY3hngb7ro64Zf+BK1bPhLxZdW/hvw54iv7p59b8D6l/wj2t3Eh+e60y58sJO/r8rWk5b1il96iRSPUfGSnwb8SvDfiiP5LLViPD2qdcZdmezlP+7Mzxf9vXtXpdcr8SfCreOPAet6LG4huru2YW8+f9TOvzwyf8AkVG/4DU3w78VDxx4F0LXgoibULOO4khH/ACzkK/On/AX3L+FSM6SiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigArzLwmp8Z/FTxD4ikw9hoIPh/TfTzPlkvZB/wPyYf+3d/Wus8deKI/BPg3W9flTzE02zmu/Lz98ohIT6k4H41U+Fvhebwb4B0TSrpvNv47cS3s2c+ZdSEyXD/APApXdv+BUAdZRRRQAUUUUAFcT8V/C934n8HznSsLr+mypqeku3a6hO9FP8AsvzG3+xK1dtSN0oAxPB3ia18Z+GNL16xz9k1G2juo1f7yK6g7W9GHQj1Brcrzb4XL/wjviLxn4SIZYLG/wD7UsV24AtbzdLgewuFu1+irXpNABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABXm/hhhqnxt8b3bqCdO0/TdMjb0z507/n5sX/fNekV5/wDD2Mf8J98Tpv8AqLWkX5abaN/7PQBz/wASvEkemfENdTuEMln4N8NX/iCRc8GaT91D/wCQ4rsf8Drxrwjps+k+GNLtrl2e9WBZbqRvvPcSfvZmb/eld2rr/jRNJc6T8bZmOFaDRtGB9EdlZh/5NtWVcf6+X/fP/oVXETGUUUVRIUvhOztrz4hXHh+7yul+NtDutGulX/ntCjSRN/veVLc/98D0pKpzXBsfFXga8T/Ww+JLJB/uzb7dv/HZmpPYaPof4Q+IrjxV8MfDuo3rFtRezSK83f8APzH+7m/8iI9ZfwXzZ2XivR9qiLS/Ed9DCF7JK4ulH4fadv8AwGj4Ls0OmeJ9P+UJY+JdUSNV7I9wZsf+RqsfDNceKPiWvp4jVvz02xrMo7+iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigDzj42f6bo/h/RdgePWPEGn20g9Y0m+0yL+KW7L/wKvRl6V5/8Sl87xh8MYv8AqYJHP4abe16AvSgBaKKKACiiigAooooA831zZpPxz8L3YyBrGkX2nzc/eeF4Z4fyU3H/AH1XpFecfEH5fih8L3/6fr9P/JCY/wDstej0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAI3SvPvhe3neI/iVIf4vEm0f8BsLNf6V6C3SvOPgmBd+H9a1dX3pq2v6ldxt/ejFy8MbfikKt9GoA85+KFjJfaB+0DZoP30dnZ6rHx18uzRlx/wK2Nc/5yXX7+M7kk/eo3+yfmWvX9Vs4oPjTNZXiodO8U+G2tnUn772szbl+rR3jfgh9K8E8Dx3Fn4ZtdMvDuv9Hd9Huv8ArpbO0LN/wJUV/o61cRM3KKKKokKrLbnUPGngKyQEtN4jtpcD+7DFNcN/6KqzV34dxxXvxg066uH8uw8M6TdavcSnpG837iLd/wAAS7P/AAGk9ho9a+DSvJD4xuSMLceKNSx77JBD/wC0jU3w3Ozxj8UEPX/hIIW/PTbKj4FWs9v8K9BuLsbLrUo5NWmRvvK91K9yVP087FQeEd2n/GD4g2MjhftkWm6rGo/iDwvbMfztR+lZlHpFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHnfj6bd8TPhlD/0/3s3/AHzYTL/7PXolec+IVj1D45eDrcHLafpOpXzj0LvbQp+e6X/vmvRqACiiigAooooAKKKKAPO/iFGP+Fj/AAvf/qKXifnp1z/8TXoleefFiY2OqfD7Uf8Alna+JYY5D6LPb3Fsv/j8yV6EvSgBaKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigArkfFfxQ8OeDLqKy1HUN2qTDMGl2cT3N5N/uW8YaRhx124964Gz8cXnxq8Zat4f0PWJ/DvhnT4UlOp2YAu9ZR3kjL2krZEcCvE6GUKXc8oUGx39I8I+AdA8D2s0OiaVDYtcHzLidcvNcP/AH5ZXJeRv9p2JoA4vW9Y+JPjrR76Dwzotp4KjmgdYNS8Ry+bdByh2sttAWVPm/ieXcveI9K1/hDrWlXPhS20GzsZtDvvD8UenXuh3LhriyZEwu5v+WiOF3JKOJBz6geg1xPjb4ff8JFf2ut6Pe/2H4ssFaO11WOPerxltxguE3DzoGPVNwIPzIyNzQBR+M2n3UegWXiXTbeS61Twxdrq0VvCPnnhVWS5hX1Z4HlVR/f2V5B8RbK20X4gW+vafKtx4a8bwR3drdRf6r7akIztb/ptbKjr6m3f+9XsvhP4kf2hrC+HfEdoPDvixVYiweTfDeoPvTWkuB5yeq8On8aLwW4TXvBem6N9q+HuuGS38Ha9P53hvUoTsfSr7f5otlfojCT97bk8ffi/hRXAOKoqhHJqOh65L4a8Sxx2viO3RpQ0S7YdRhX/AJebf/Z/vp1jPB+Xa5vj5mwBuZum2tSBlxcRWtvLPPKsEEaM8kshwiIF3MzN6KvzVb8N6FdTfDn7LNHJa698Ur9IhC3yyWujonO4dsWocn+7Jchay/Bul6b8V9WvTdahZReA9BH2vV55J0235Riwh6/8eqlGaSRvlfZ5Yyvm17N4Im/tjUNS+JuvsNKs5rX7PpMd8/lCz0wNvaaXdgI87KsjZ+6iQqcMrVEmUj06GJIIUjjRY40GFRRgAeleO+NNYvrv4taXc+CLFNe17R7ae112F5xb2yWsirIkLzbWxceYkTomPuM+/YHVjpSeJdf+LK/Z/C0tx4f8JvxL4nki2XV4n92xideFP/Py4x/zzR8h17rwv4V0zwbo8Ol6PZpYWMJLCMEsWJOXd2PzM7Nks7EsxOSTUjOYsfjRocd3Fp/iOC98FapIdiW/iCNYYpW/uxXAZoJT/so5PtXoCsG6HOarahp1rqtnPaXttDeWsy7JIJ4w6OPQqeDXAN8IG8NnzvAuuXXhEg5/szb9r0t+en2Z2/dj/ri8dAHpdFeUfDH4yy+KrxdI16wXSNVkuLqGwu4JPMsdXFvI0Uz2znkEMjnyn+fau4b0+avV6ACiiigAooooAKKKKACiiigAooooAKKKKACiivP/AInfFS38AyaRp0EC6j4i1q6Wy03T2l8pGckDzJpNreXCrMql8H5nRAGd1WgDvJJFjUs5CqoySe1ee3fxq0W8upbHwxa33je/jbY8egRrJBE3pJcuywJ9C+72qvD8JZPFTJdfEHVG8UyMwYaPEjW+kQn0+zhj531nZ/YJ0r0OysoNPs4ra1gjtbeJQkcMKBERR2CjgCgDyf4e6tqH/C1fEDeMbJNE8T6nbQppNmk4nt30+IFisU21d8qyyyGVNo25jxuTDt7HXN+MvBem+ONI+w6isimOQXFrdW7+XcWk6/cmhf8AgdfX3IOVYg8ro/jzU/BupWvh/wAevGk00gg07xJGnl2Wok/dSTtBcH+4fkc/6s9UQA9OopMiloAKKKKACiiuU8aeP9N8EQ263Rmu9QvS0dhpVinm3d7IP4Ik7+7nCIOXZV5oAzPjdHp0nww1/wDtDU10YJGk1vfMjOYbpHV7ZlQcu3nLHhF5c/KOTWXoXxy09LTT4vGen33gHV7iNN9vrkax2xkKKSiXQYwvy2Au8Pxyoqz4c8F6p4g1q08U+NfKk1SAs+m6LA2+00jI253f8tbgqcGbGACyoFBYv311ZwX1vJb3EEc9vICkkUyBkZfQg9RQBPHIsqq6MGVhkEHgipK82m+DNrobNceCNWvPBVxlm+y2OJtOc/7Vm/7tf+2Xln/arLk+MV94D8R2Gg/EGztrRryOSaDX9JZ3sfLR0Qvco3z2ozLENzF48t9+gD12iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACvMPidfXXizWrL4d6XNLbPqULXetXkJw9ppobYVVv4ZJ3zEh6hVmdeUFd5r2uWXhnQ9R1fUZ1tdPsLd7q4mbokaKWZvyFcZ8HNBvodHvfFGt27W/iPxPMuo3cMn3rWLG22tf+2UWAf9syH+KgCn460+38D6/4D8Q2MCWmn2E6+HrmKBVSKOzutkcQx2CXCW2PRWevUV6VznxB8Kx+N/BWtaDI6xf2haSW6TH/AJZyFTsce6vtb/gNRfDPxQ/jbwDoetTIsV1dWqNcxL/yyuB8syf8BkV1/CgDqaK86+PPiHx94e+H8p+GWgWniDxneXMVlZR6jIUtLXefnuZyOfLjUFiAQScAZJAPy78S7X9r/wCAfgjVPiXdfFPwv8RbLQ4G1HVfCLeHorOEWqDdMYbhFWRiign5iOATyRtIB9keKPCOj+NtJbTtasIr613iRA+Q0bj7sqOMMjjs6EMOxrz/AF7wX4q0/RbzRpkg+JXhSePy5NN1iYW+pony8JcfcmI6qX8twVU+Yx5rr/g/8S7D4yfC3wt430yCS1ste0+G+S3mILw71BaNiOCVbK5HBxmuwoA/O7xp4d0/wr8fNK8S+OLfXZtC1K3bTb6/1+3nhvrGOPYkLpNGpjMkZZG8+3lJYA5ALOz9n4nh0TTdQUv48sviJ4Pt43e50S2ka21G4UfNtmmgjdJ0Cq2UxBv/AI2YfK3sX7ZVu0fwrtdSjIWfT9TjmRvQtFInH4uD/wABr0P4yzmL4P8AjOWMlX/sa7w2emYW/wAaAPjn4EfDTxH8Q/GHiLx2vgiGO31e92Rfbr1LbTp7eHYbeGVI97vHbsioI1Ta7QrlwiKtfXFj8JTq15BqXjjVT4tvYZBLBYtD5OmWrjo0dtlt7js8zSOP4WFH7PNmLP4M+FdrZ+0Wxu2/3pneVv1evR6AEXpS1+eH7UX/AAUM+JFj8O/F2r/CX4c6povh3Q7gWN3498T26JD5rTiECygYlZzuOd5LAD7yciv0A0C6lvtB024mbfNNbRyO2AMsVBJwPegC/XHfFnxLdeFfh9rN9p679VaNbXT0/v3kziG3X/v66V2NebeOV/4SL4meB/Dww8FrJceILtc/wwKscCn/ALbXCuP+uNAFq6+EmmXHwz0/wcsskCabbwpYajCNs9rcQgeXcof+egcb/wDayQchjVn4YeMLvxPo9za6wkdr4m0ic6fq1tFu2LOApEiZ/wCWcqMkiez46qa7avLPGy/8ID8SNE8YRfJpmqGLw/rXYDe5+wzt/uTOYc+l1/sUAep0Ui9KWgAooooAKKKKACiiigAooooAKKKKAMTxb4osPBfh3Udc1SbybGxgaaVl5bA/hUd2JwAO5IFeZ23ws1Pxh4F8Sahr4Fn408TW6yBmfd/ZPlt5ljbI3pC+HYj70jSN3GNHxA5+InxYsfDy/vNC8K+Tq2p/3Zr9vms4G/65gG5I/vfZ69V9qAOZ+HnipfHPgnRtc8tYJb23SSeD/njN92WL6o4dP+A109ebfDnd4f8AG3jjwu+REt4mu2SsePIu9xkA+lzHcn/gYr0mgArP1bSLLXtMudP1G0g1CwuUMc9tcxiSKRD1VlPBFaFFAHly+E/Ffw5yfCd3/wAJFoSgY8O6zdMJoB/dtbs7jj0jm3jsHReKt2/x08NW9xHaeImuvBV+x2/Z/EsP2RSf9ifmCT/gEjV6NUE1vHcxPFKiyxuNpRxuBHuKAKllr2m6nbpcWeoWt1buMiaCdHQ/iDXP+Ivi54O8LsYdQ8S6bDc/dFolwstw59EhTLufZVqO4+Cfw9u5jLceBvDc8rcl5NJt2Y/+OVuaB4P0LwrGyaNo2n6QjdV0+1jgB/74UUAcZJ4q8Y+OCYvC+iP4b09+G1zxJAyy49YbHIcn3mMeP7r9K3PBfw50vwfcXGoI1zqmu3oAu9a1JxLdTjOQm7ACRg9I0VEXstdjRQAUUUUAFeXeC7KDxp418deILuFbqwaQeG7WOeMMjwW+77R8p4IeeWZD6iFa7Hx14oj8E+Ddb1+VPNTTbOW58rPMhRCVQe7HA/Gqnwv8LyeC/h/oWj3Lb723tUN3LnPmXL/PM/8AwKR3b8aAOY8DTS/DzxQfh/fTPLpc0L3fhu5mk3N9nTb5lkxPLPDuBQ9WiYdTE5r1KuI+LHhO88UeF/M0cqniTSpl1PR5ZDtC3UedqE/3JFLwv/sStWt4H8WWnjrwppWv2O5bW/t1mWOTh4yfvI/o6NuUj1U0AdDRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUjdKAPLfikP+E08VeF/AK/Pa3Un9tayOP+PK1dGSI/9dbhoV90SavUl6V5d8If+Kp1jxZ47kYOmsXpsNNbdnGn2jPFHj2eb7TN9JVr1KgBG6V5z8Lz/Y/ibx34aYtss9W/tK2Vh0gvE844/wC3j7UP+A16PXnd9/xJfjxpU+/EWuaFPaOvrJazJJF/45c3H/fNAHolfJP7cHx5jvfC+r/An4ewf8Jf8WPGllLpP9kWOJBplpMmye5u2HESiJ2xuwfmDdOa2/8AgoD+0Dq/wE+DOnHw7qFvoniHxTrFv4ftNavAPJ0tZQzS3TZ4+REOM9CQcEAiuZ/Z78f/ALKv7OfhuWy0H4seE7/XL9vO1jxLqWswy6jqs5JZpJpS2SNxJC5wMnuSSAfQvwH+GK/Bf4M+DfAwuhfPoOmQ2Ul0oIEsiqN7gHoC24gdgRXeVz3gX4heGfidoCa54S12w8R6O8jRLfabOs0JdThlDKcZB610NAHhv7YyiT4LXkZ/ju4f03N/Suv+NMm74KeKD/z00p1/76XH9a4X9syR4/hHbCEt5k2tWVp/uiZzCz/RFlLn/ZRu9elfFjT1vPhV4rtN3lr/AGTcgH0KxMQf0oAqfAjH/CnfBwH8Gmwp/wB8riu+rzD9mu+k1P4D+B7yVfKnudMinli3bvKd/mZN38W0krnvivT6APkH/gq9/wAmR+Mf+vzTv/SyKvqrwr/yLGj/APXnD/6AK+Vf+Cr3/JkfjH/r807/ANLIq+qvCv8AyLGj/wDXnD/6AKANSvN/BIGufFDx9rh2Olo9roNuwHRYovPk/wDIl2VP/XKvRXYKuT0rz74EAz/Dax1WRBHNrc9zrL8Yz9qneZP/ABx0H4UAeiVgeNvCtl448K6toGoAra6lbSWsjL95d6kb19GBwwPqBW/RQBxHwf8AFV34s8C2M2qBU12zaTTdURe15A5imP0Zk3j/AGXWu3ry7RGHg/45a7pRPl2HiqyTW7YHAX7Xb7Le6H1MbWbf8Bc16jQAUUUUAFFFFABRRRQAUUUUAFYfjHxRZ+CvDGra/qLMljpttJczbR8zKik7R6segHqa3K8t+J3/ABVnjTwd4JUeZbTXB13VF42/ZbR0aNGH+3cvb8d1iegDX+Dvhi98N+DYp9YRV8R6xM+rauV/5+pvmZPpGuyEf7MS13dIvSloA828ZIND+K3gjWhtSPURdaBcFu5dPtMBP0e2dR/11r0heleefHeN4fhrf6rFHvuNCmt9bj9f9FmSZ/zRHX/gVd/G4kVXRgynkMp4IoAlooooAKKKKAGu6xozuwVVGSzHAA9a4D4N/HzwF+0Bo+p6p8P/ABAniLTtNvG0+6uI7aaFVmCqxUeai7xtZTuXKnPBrxr9sb4i6x4s1HRf2fPh/deX438cxN/at/ESToWiA4ubp8dGcbo0BxkluQdufP8A/glT4bsvBvhj43aBpqumnaV8Qr+xtlkbcwiiSNEBPc7VHNAH3NRRRQAUUUUAecfF/wD4nDeEvDPysNZ1y385G7wW268l/A/Z0T/gdejL0rzm4U618eLNCoaHQfD8k/0ku7gIp+uy0l/77r0egAry/wAB58G/EzxT4Rb5bDUP+Kk0tecKsj7LyIf7s+2X/t7r1CvLvjUB4bbwz44Ubf8AhHdST7a3/Thc4guc+yb45v8At3oA9RopF6UtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABXCfGbxDeeG/h3qb6W2zW77ZpmmYbB+13LiGFv+Au4c+yNXd15j4tz4o+Mng/Qwc2ujQXHiK7Xbx5uPs1op/GW5f6wigDtvCfhy08IeGdK0PT02WOm2sVpAv+xGgRf5VsUUUAFedfFJlsfEHw71Qj5rfxAtu7H+5cW1xDj/AL7eL8q9Frz/AOMkYbQtBc8tH4k0dh+N/Cv8iaAN3xr8N/CXxM06Cw8X+F9F8V2NvL58Ntrenw3kUcmCu9VlVgGwSMjnBNcb/wAMnfBD/ojfw/8A/CXsf/jVeqL0paAMXwj4J8O/D/RU0fwtoGl+GtJR2kWw0izjtYFZjlmEcahck9TjmtqiigDzL4+eC7Dxt4DjttX8QW3hiwstQtdSl1G62iJVhlDlWLOoUMMruJ4znB6Vb0v4kfD74zaXq+h+F/HXh/xG89tLBcLoWrW93LEroVZsRuxB+bvSfGL4B+Cfj5Z6HY+OtJ/t3TNIvv7Rg0+SVkgkmCMimQKQXADn5ScHuD0r4r/4KBfAHwL8CfC3w/8AHPwi0DT/AAN8U7fxTZ2ehx6DH9nbUWkLZgaJCA4yFySOmVJw+KAPu34beCofhz4D0Lwzb3M17DpdolqtzMqh5No++QvAyew9a6qiigDH8WeDdA8eaHNo3ibQ9N8RaPMytLp+rWkd1byFWDKWjkBUkEAjI4IrViiSCJIokWONAFVFGAoHAAHYU+igDlPinqb6H8NPFupRHbNZ6Td3Cf7yQuw/Wr/grRR4d8H6FpIG0WFhb2oX02Rqn9K5b9oSQr8FPGe3vpsin6Hg16IvSgBaKKKAPLvjljQtN8PeMxhX8MatDd3DY/5c5f8ARrr8FimaT/tkK9QXpWT4o8P23izw1q2iXqlrPUrSWymVf7kiFG/Rq5r4I69d+JPhdoFxqOf7WghOn3+7r9qtnaCb/wAiROfxoA7yiiigAooooAKKKKACiiigBD8orzD4Xg+JPF3jbxi3zRXN9/YenN1/0WyZ0cg/7Vy92fdQldL8UfFjeBfh9r2uQost1Z2jtbRN/wAtbg/LCn/ApGRfxqT4c+Ek8B+BtD0BX85tPs47eSXp50gX55D7u+5vxoA6eiiigDL8R6PF4i8P6lpU+DBfWstq+f7roUP865/4M6s+ufCbwdeyPvnm0m181v8ApoIlD/8AjwNdm3SvO/gGvk/C7TYB923ub23T/dS8mRf0UUAei0UUUAFcL8cfiHf/AAo+EvifxZpXh+88VapploZbTRrCNnlupiQqIAoLbdzAsQCQoYgHGK7qigD8xf2W/wBpaD4R/wDCS+MPHfwf+M/ij4s+L7n7Tr2tWvg8eQiKcRWttunDLDGoAAIGcDjCqBe/4JrftFWcfj34k+FT4H8a+b4u8eajqcWp/wBkr9h0wMm/yb2XzP3Mo2YKgNgsozzX6WV89/sh/s9+IvgD/wALT/4SG90u8/4Srxje+IbL+zJZH8u3m27Vl3xpiQY5C7h7mgD6EooooAKKKRvumgDzvwHG158SfiTqJbcI72z0tPZYbOKbH/fd29ei15z8ImM1548lb70nii6z/wAAjhRf/HUWvRqACsrxLoFp4q8O6no1+nm2Go2stpOn96ORGRv0atWigDgPghr95rvw30hdSbdrOnB9J1Ji2S11bO0Erf8AAmj3/RxXf15d4JK+GfjJ460HcqQapHbeJLWNR/E6/ZrlR/wO3ic+89eo0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAI3SvNvheP7c8XePvFD7jHc6muj2jN937PZL5bY/wC3l7uux8XeIYPCPhXWdcuRut9Ns5r2RfVY0Zz/ACrF+EPh6fwr8M/DmnXgIv0s0lvN3U3Mn7yY/jI70AdnRRRQAV5x8Wib688C6PG/76+8R202M/wWyvdOfp+5A/4EK9Hr588QTSeIfjtoutbt8WkeIo/DlltY4XOm3NzeMB/tl4UP/XvQB9BL90UtIvSloAKKKKAOW+KHgeb4keA9X8NW/iLWPCc2oRrGus6Bcm3vrbDq26KQfdJ27foTXwZ8av2efFP7E5T9oDR/GF78Yz4daJNS0/4jf6fex20kqRtJZ3Z+aGQFwOF6Ek5xtP1r+0RrXxv8N3HhvVPg/wCHfD/jCzhF0ut6DrF59kuLnPleQbaUkIrLiYHecfMvB6jwD4heA/2lv2ytFi8C+PPCOifBP4dXNzFJrjW+sR6rqd9FG4kEUJiJjQFlX72MEA8gFWAPtHwn4ktfGXhbRtfsA4sdVsob6DzBhvLlQOuR2OGFatUtF0ez8O6NYaVp0C22n2NvHa28KdI40UKij2AAH4VdoAKKKKAOS+LGhy+Jvhh4t0q3j826vNKuYYV9ZDE2z/x7FavhHXIvFPhXRtagOYdRs4btPpIiv/WrOseb/ZF75BKT+Q/lsvUNtOK8a/ZQulsfAv8AwjykrDY29jfWkbfwW13ZxThR7CY3Kj2WgD3SiiigBG6V5l8NU/4R/wCIvxG8O7dkL3kHiC1G7/lndxbZMf8AbxbXDf8AA69OrzHxQv8AYHxz8F6osf7rW7C90Kds9ZEVbu3/ACWG7/77oA9OooooAKKKKACiiigAooooA81+KX/E88VeAvC4LeVd6odWu1X7pt7JfOXP/bw1pXpK9K828Pj+3Pjh4p1Fg3k6Hp1ro0PPAmmzdXH/AI41p+VelUAFFFFAEFxMlvC8sjhI0G52boAOtcH8AYHj+EPhm4lG2S/t21Er/wBfEjz/APtWofjTM+oaLpnhWK4ltG8T3f8AZtzNbvtkjsxG810UP8LGGN0DdVMikc1sfB66e9+Evgq5l/1s2iWUj+5MCUAdjRRRQAUUUUAFFFFABRRRQAUjdKWigDzn4YMtl4s+I+lk/vY9eW9C/wDTOezt3Df99iUf8Br0avCG1i50P9py8uDcsLPUoLLRJrdjhOYLq5t5Mf3t8Vym7v5oH8Ir3egAooooA8w+JTf8I/8AEj4c+JA/lxve3Hh+62j/AJZ3cW+PP/bxbW6/8Dr05elee/HvTbjUfhJ4iksc/wBo6dAurWm0cme1dbmJR/vPCo/Gu00jVLfXNJs9Rs3821vIUuIpP7yOoZT+RoAv0UUUAFFFFABRRRQAUUUUAFFFFABRRRQB5x8cgNS8J6f4e2szeINXstMdU7wmZZLj/wAgxTV6MvSvOfE//E3+M3grTw/yabaX+syL6PtjtY/0uJv++TXo9ABRRRQAjdK+d/AMkmp3XwrvNm19Z1bW/E8nfKSJcCI/gl1Ev5V698Utck8M/DfxXq0TlJrHSrq4jI67khdhj8cVxfhjRRovxI8C+H9m5fDvg2WLd6M8tpEv6W70Aev0UUUAFFFFABRRRQAUUUUAFFFFACN0r54+ALS6Tr3hi3dzsvfDM2mvu7yaXfvD+eLlvwWvodulfPGht/Y/ivQpZDj+zfHmsaUdo6R3sM1yi/8Afbw0AfRFFFFABXmfx526f4P0/wAQfNnw9rNhqhK9ohOsc/8A5Blmr0yud+IXhz/hL/AviLQjtxqenXNl83rJGyD/ANCoA6FelLXLfDHxG/i74d+GNalOZ9R0y2upPZ3iUsPzzXU0AFFFFABRRRQAUjdKWuQ+LPiKTwp8NPFGrwNtubXTZ3g95thES/i5UUAY3wLxqHhG98QfNv8AEOq3mqhm7wvMyW//AJAihr0isTwb4fj8J+EdE0OE7otNsYbJG9o0VP8A2WtugAooooA8Z+Jmp7PiBqN26Zg8MeDdQ1E+0k77UP8A3xaTf99V33wx006P8N/Cent1tNJtbc/8AhRf6V5F8QJpLrR/jtexyZNwln4ZgOf4mtk4/wC+79hX0DHGscYRFAReAF7CgCSiiigAooooAKKKKACiiigAooooA+dvjLKmj+OvEOpCPdLZaboeuK3otlqU3nf+QZiP+BV9EL0rx74taGmtePLLTeP+Kg8K63o/zDq5+zOn6ebXd/DPX28UfDvwxrEjbpb/AEy2uXP+08Ss365oA6eiiigCGaNJo2jkCujDDKw4I7155+z/ACSw/C/TdIuJN9xoM1zoUjdz9kneBD+KIjf8Cr0mvNvhvjSfiJ8S9GEZRG1G21iL/cubZEb/AMi20x/4FQB6TRRRQAUUUUAFFFFABRRRQAUUUUAFFFI3SgDznwzjVfjV41vdoI07T9O0pG9GPnXMv5iaH/vmvR686+Ekhvr7x/qLf8vXia5QE+kEMNt/7RNei0AFFFFAHnXx4jF98PJNL3YOq6jp+mY9VmvIUf8A8cL03w3MmofG/wAa3ABxZaVpmnhu24tdTt+kqUfFJUvvE3w50wt/rvEH2p1/2ILS5mz/AN9rFS/C1lvvEXxG1EAqJvEJt0/3YLS2h/8AQ0egD0aiiigAooooAKKKKACiiigAooooAK+d/HMx0jUfiPKy/Lpmv6B4kRV7Juto5D+K20tfRFeG/FDSpNR8V/ELSY4wza54DKxherywS3Kj8vtKUAe4r0paxfCOuDxJ4U0bVhjF/ZQ3Qx/txq/9a2qACkbpS0jdKAPOfgPGlj4Fm0pT/wAgjVtS05Vz0SO8m8r/AMhlK9Hrzr4VxrZeIviTYDjyfEZmH0ms7Wb+btXotABRRRQAUUUUAFec/GsfbtF8PaNs3/2x4g0+2ZT3jSYXMo/74t3r0avOfHDSXnxW+HFioBjhk1DU2H/XO28kH87ugD0VelLRRQAUjdKWqmoXsWm6fc3s52w28bTO3+yo3H+VAHgcbLqHgSBhtlPif4ib/wDfhh1Mlf8AyDZivoZfuivn/wAF2rR6D8A9KkUSSyJJrdxx/GLCUsf+/l2tfQNABRRRQAUUUUAFFFFABRRRQAUUUUAec/ExlsfGHw11Jvl8vXXtGb/Zns7lAP8AvsRUnwFjWz+Hq6VvLHSdS1DTMHssN5Mif+ObKf8AHHZa+D7DUWwv9m65pV3u9FF9Cr/+OO9M+GYj07xf8SdKHy+XrqXqDP8ABPZ27k/99iWgD0eiiigArzmSOTTfj/A/Cxax4adD7taXSkfpetXo1eceOQ9r8WPhvdoOJpNS09j/ALL2vnfzthQB6PRRRQAUUUUAFFFFABRRRQAUUUUAFI3SlpG6UAef/BFvO8F3VyRhrnXNYnP46lc4/QCvQa88+AoP/Cs7Et95ry/c/wDAr2c16HQAUUUUAec+IFj1D45eD7c/N9g0jUr4+zO9rCn6PLS/AmRLzwI+ogH/AImWr6nf/N/dkvp2T/xzbVSG7tz8ZvF+qSYKaL4esbfd6M8tzO4/75SGtX4F2Zsfg14Iif8A1jaNayyf77xK7fqxoA7uiiigAooooAKKKKACiiigAooooAK848T7bX42eC3KZW90nVbF89/mtJV/9AevR686+IMZX4i/DGZfvHVLyAn2bTrlv5xrQA74AzSN8IPDNtN/rdPt20xvY20j2/8A7Sr0OvOvg2z2cXjHSZAqtpviW/UL6JO4u0/S5r0WgAooooA818Ehrf4wfEiA/ckGmXa/8CgePP8A5B/SvSq880L918dPGEeMeZoOky/j51+teh0AFFFFABRRRQAV55qMguPj3oUfe18N37/9/LqzH/tI16HXmv3v2iD/ALHhbj8bz/7GgD0qiiigArhfjjqB0v4O+M50JWX+ybmOJl/56PGyJ/48y13VedfHBkuvCen6W3XVdc0uy+qG8id//HEegCpDZxW/xm8M6XFGPI0Twvc7fYyT20af+O2716hXnPh101D45eMp9nNno2lWgb6yXkzf+hpXo1ABRRRQAUUUUAfKf7U37Q3xY8EfHf4ZfCz4SaV4Uv8AW/Ftlf3ck3iyK5MEYt0Mgw8MqlcqknVTklOmTW78I9S/avuPiFpUfxL0r4V23gk+b/aEvhtr834/cv5XlebIU/1vl7sj7u7HOK80/af0P4s+Hv20PAPxO8CfCu++JOkeH/C81k8MOrwafF9onknVl3SBjlUKMcLzuXniu3+C/wC3NbeOPirB8L/iH8P9c+EfxBuojNY6drDie2vgFLEQ3AVQ5wrY+XB2kA7uKAPqOiiigAooooA8/wDj3Z/bPgv41wMyQ6VcXKf78SeYv6oKq+H7mK2+OHiFYyCmr+H9Nvk/2mjmuY3P/fLw11HxCsP7U8CeIrTGfP025i/76hdf615t4SvlXxR8JNTk+9q3hO4s3kb+N9lnOn/jqTH86APa6KKKACvOvixIYNY+HVypwIfE8Ss3/XS0uof5yCvRa85+NkZ/srwtKP8Alj4o0lv++rpE/wDZ6APRV6UtIv3RS0AFFFFABRRRQAUUUUAFFFFABSN0paRulAHn3wHXb8NrVP8Anlf6lH/3zf3C/wBK9Crz34KzIvh7W7JRt+w+I9Xh/wC+r6aUf+OyrXoVABSH5RS1Q1jVIND0m+1G8fyrWzge4mf+6iKWY/kKAPI7ffqXhj406zBEzS3l3f20G0fMVtbJLbC/9tYpfzr0X4b+V/wr3wz5DB7f+zLXymXoV8lMVkfBPTLjTPhT4d+2Arf3ludRu1YdJ7l2uJR/33KwrK+Ft0vgvU9S+Hl64i/stvtWiNI/+v0yR22IuW5MD7oSOyiE/wAYoA9SopM+1N3fX8qAH0U3d9fypd1AC0Um6jdQAtFM3fX8qN31/KgB9FMaQKuSdo96zLzxTo2m/wDH3q1jb/8AXa5RP5tQBrV5z4zmOpfFb4e6VAA8tnJe61Pz9yFLZ7Yf99Pdrj/cb0rTu/jJ4C09tlz418OwSf8APOTVYA35b6wPg/dReN9T8RfEGOVbiz1af+z9JdTuH2C1d0Vx/wBdJjcSf7rJ6UAW9PX/AIR/446rbbGFv4j0iK+jbPym4tX8mb8THNbf98V6PXm3xfxolx4R8V/KBousQx3MjNjFrdf6LL/wFWlikP8A1yr0helAC0UUUAee6f8AL8fPEH+14Z039Lq+/wAa9CrzvSx5nx98Snn934a0sf8AfV1fn/2WvRKACiiigAooooAK82+7+0N/v+FuPwvP/sq9Jrz7VIxb/Hbw9J/z9eHdQi/GO5s2H/obUAeg0UUUAFec/EJjqXxF+HGlbdypf3WrSf7kFq8Y/wDIlzFXo1ecWP8AxO/jvq1wrkw6DokNkPQTXUxmlH/fFvb/APfdAC/D/wCf4mfE5z1S/sYh/uiwhb+btXo1eY+IH/4QP4radrp40fxKkejX7Y+WG8QsbOVvQPvlhJ/vG3Fem54oAWik3D1FG4eooAWik3D1o3D1oA5dvil4Qj8YXvhSXxLpcHiSziSefSp7pI7hYnGVkCMQWU/3hkZ4618Z/tZ+KdB+NH7X/wCzd4M8DXNt4h8WeGfEn9u6xd6ZIJRpmnxSQvLHNIhwu8RH5SeoUEfOoP0d8ZP2O/g1+0Brkes+PfBFprmrpGsIvkubi1mZFztVngkQsBk4znFdF8H/ANnv4bfAOwntPAHhHTfDS3ACzzW6l7iYDoJJnLSOB2DMcZoA9Fopu4eop1ABRRTd31/KgDnviBrkHh3wL4h1S6O23s9PuLh/osbHH1rznX9LuPBPwj+Heo3X7i68IyaVJdjGdkflraXP5RzSt/wCtn4lTxeMvFHhvwNDJHLHcXC6tqyqQdlnaujqjf8AXSfyU290EvpXceKvDtv4s8M6tod0T9l1K0ms5ivXZIhRv/QqANdelLXGfCHxFc+KPhzod9f5/tRYPst8rdRdQsYbgf8Af2N67OgArgPjX8vhHTpMgFPEGisP/BlbV39cB8a23eE9Ni+XdL4h0VBu/wCwlbN/SgDv6KKKACiiigAooooAKKKKACiiigApG6UtFAHnXw3ZLHxp8R9K5DJrEWoIuP4J7OA/+jI5q9Frx3x7q2qfD34paXq+naNJrKeKLRdEa3juI7dUu4DLPAXdzwrRvdDjJyiAKc1t+T8UdaZi9z4X8LQsvCRxXGqSj/gRa3T/AMdNAHo9ea/Gyf8AtbQdP8IwsftPiq+j0xhG3Itf9Zdv9PISVfq6etSL4P8AiHC26P4hWMjf3bnw6jJ/45Mh/Wsn4dWOs618TvFWo+KLuz1HUdAWHRrBtPtnt4EimhhuZpNjyuRI7NEp5+7CmOpoA9ZRQqgAbQP4a8s+LvhHRvFHjb4ZprOlWerQnVby38m+t0mTa+n3Ln5XU94k/KvVq8x+JWpwWvxK+F0NxPDbo2pXsgaV1TLCwmUAZ7/vKALTfs+/Dr+DwdpNt/17QeV/6Bioz+z34D7aNIn/AFy1G6T+UtejKwpc+1AHnC/s/eCl6WGoD/d1u/H/ALWp6/AXwgrZEOrA+2v6h/8AJFei0UAeef8ACh/CX9zWv/Ci1L/5IpsnwD8Hy/eg1Zv9/X9Qb/24r0Wk3UAebH9nvwNn5tLuZP8Arpqt4/8AOanr+z58Pv4/C9pOf+nh5Jf/AENjXo2fam7vr+VAHAxfAD4bQnI8CeH2b/ppp0T/AM1q/D8HfAcGDF4K8OxEf889Jt1/9krrzIFXJ+Uf7VZt94n0fS4y97qtjaoOrT3CIP1NABYeG9K0dQLDTLOzwePs9uiY/IVx3wC/5JjY57Xd+p+ovZ6sah8c/AVjIsS+KLDUrtm2pY6RL9vuXPoIYN7n8qX4L6Ze6P8AD2zi1Cxm024mu767W0ucebHHNeTTRBwrEK+x13DPynigDf8AG3hiDxl4R1nQbhjHDqVpJaM4HKb0K719xnP4VnfCvxRceMPh/omp3q7NSaDyb9MY2XcbGO4T/gMqOK6+vEYdC8SWvxW8V+H/AA74lh0DR7u3tvEBT+zBczJPO80MwRnfYik2yyYKH55XoA9uorzwfD7xd5X/ACU/XPN/vDTdN2fl9nz/AOPVE2g/E3SI82firRNfAP8AqNW0l7Zz/wBtoJcD/v0aADwfIbz40fEG4I+W3tNK0/d/tKk8xH/kwtekV5f8Bbi917w3q/iu/ght7rxJqs9+IYJWlRIUCW0O1yo3BordHztX7/SvUKACiiigAooooAK868fRmx+JXw31HftR7280x/8AttZvKP8Ax62WvRa89+NVjPJ4Fk1Wzt2ur7Qbq31uGGP78n2aVZJEX1Z4lkQf71AHoVFeZ6f+0Z8NdQtYLlfGGm2sMyLLEb5zbF0I3KyrKFOCKnm/aA+HUeBF4x0q/l7QabP9rlb6JFuY/lQB6BLKkMbOzqiKMlmPAHrXnvwTVtU8N3/iqVWEvinUZtXTzFwfsx2x2n/ktFCf+BGuT8fePL/4hf2R4S0/Qdc0jR/E96dKudd1KH7F+48mWaZIYXPnb3ihdA7Iirv3ZO3Fe02lrFY20VvbxrDDEgSOJBhUUDAAHpQBz/xK0G28UfD/AMR6Vep5tvdWE6OrdvkOGHoynBDdQQDXC/D34X6Z4i+H/hnVW1jxVaz3umWt1IsHifUNu94Uc8NMe5r0Tx5djTfA/iK7b7sGnXMp/wCAxOaqfC20On/DPwlatwbfSbOI/hAgoAxD8GkX/VeM/GUP/ccd/wD0NWpv/Cnrofd+IPjNP+4hC384a9H3D1FG4etAHnI+EN8q4HxH8Z/+Bdsf/ben/wDCp9RwAPiP4x/8CLP/AORq9EooA85b4S6iy4PxH8Zf+BFmP/bam/8ACnrtvv8AxC8Zv/2/wr/6DCK9HyKNw9aAPOh8Gkb/AFvjPxlN/wBxx0/9AVaenwW0vOZNf8YS/wC94ov1/wDQZRXoW4eoo3D1FAHns3wM8K3S4uDrl5/18+I9Rl/ncUxf2e/h7/y28MWt9/1/PLc/+jHavRqhknjhjaSRgiLyWfgCgDyLwv4P0Lwf8frm30LRdP0WCTwujPHp9qkAZhePydijNex15Louvab4q+Okt5oN5Hq9pZ6C9neXdk3mwwzfaUdIWlHyb8bzsB3AD5sZXPrVAHmvgH/im/iN438OMBHDczR+IbIZ/guBsuFH0nhdz/13FelV5R8Zn1Dwxqfhjxpo9iuo31jeJpE9i062/wBptr2WOLbvYEApMLeRc/3WHG7NaH/C6rHSVYeJfD/iHws6Y3SXumvcW/8A3/tvNj/NhQB6PXm/xozPH4Ksl4a58U6fgevlu1wf/HYWqb/hfnw48rzf+E40I/w+Wt/GXz6bN27P4Vy//Cd2HxS+LnhHT9HS+k0/RYbnXp7q60+a3hdjG1rCEaVF38zTNlePkoA9pX7opaKKACiiigAooooAKKKKACiiigAooooA88+O1o8nwv1i/twDfaME1q1OOfMtXFwAP97yyv0Y13drcxXlvFPE4eKVRIjDup5FVvEGlLr2hajprnCXlvJbs3s6Ff618wv8KfjnqGk2Om6/faVf2Vnbx2sdjoPiO50u2KIipufZa+dITty26Xb83CUAfVm76/lXAfD3/koHxP8A+wtaf+m20rw2y/Zr8c+YslpbaL4Yn7XVr4n1WSZff935W78Wr3H4QfDXUvhzpOpRaz4ou/F+s6ldi7utSu4EhPywxQpGqp2VIlG5yznqzGgD0OsrXvDuleKLBrLV9Ms9Ws2OTb30CTRk/wC64IrVooA84m/Z6+HUzZTwjp9qf+nNGt1/KNlpY/gD4Ki/1dhew/8AXHWL1P5TV6NRQB58vwM8KL0GuD/d8R6kP/bij/hRvhX18Qf+FPqf/wAkV6DRQB5//wAKN8Kr/Fr/AP4U2pf/ACRTW+BfhNuq60f97xFqR/8AbivQqKAPOW+APgtvv6feyf8AXXWL1/5zUz/hnj4fN9/w5FL/ANdbiZ/5vXpNFAHn0HwB+HMPXwVosv8A13s0l/8AQ81ftfg74DsTm28FeHbZv70Wk26n/wBArsqKAKen6ZaaXbiCztIbOFf+WcEYRfyFXKKKACvPNEdLv46eLZVP/HtoWlWx/wB4zX0n8iteh14l8XP2adO+JXiCTxBaazf6PrEkUcM8LSSzafdqm7YZrYOmXAYrvRlOGwc0Ae17vr+VYHjzXD4Y8D+IdZQ7W0/Trm7H1SJn/pXzPJ+yp4j01ybbw94Ju5FPyXVnfX2mT/72VSUg/wDA61rf4T/Gq8sZfDl1rWmJ4S1LFtqUGqaxNqlxHbMy+b9mlNvFJvKBgBK7r83agD3v4ZaK3hv4d+F9IkXY9jpdrbMvukKKf1rqKQcUtABRRRQAUUUUAFI3SlooA83+Catpug6x4acNs8Oaxc6ZAGbOLbInth/wGGeJP+AV6Kqhegx9K8na/wBY+H/xC8XX0nhXWdY0fWXtbuK80lYZtkqQLDIHjMqyA4ii+6pBrTHxka4O218DeM7mX/nn/ZPk/wDj0zon/j1AEvxHP/FbfDAYHOvzf+my8r0JeleXQ2Pivx14w8M6pqWhQeF9G0K9mvUhur1Lm+uXa2mt1BSPdHGv74tu8xz8uNq9a9SoAp31jb6nZ3FpdQpcWs8bRSwyLuR0IwVI7giuDj+Bvh6wt0h0q98QaHDGMJBpuv3kUKDsqxeaUUewWvSKKAPOF+DbR/6nxz4zT/e1bf8A+ho1SL8KdRX7vxE8YL/28Wh/nbV6HRQB5+Phfq20AfEjxcMf7Vgf/bSj/hV+rf8ARSvF352H/wAiV6BRQB583wt1IsSfiN4u5/h82yH/ALa1H/wqW9f/AFnxB8YN/wBvluv/AKDbivRaKAPNv+FMs3+t8ceM3/7jO3/0FBU0fwXsV/1vibxjcf73iS7T/wBAda9DooA89b4H+GZ93ny6/c7uv2jxJqTg/gbiktf2f/h7byeZL4T06+k/vahGbv8A9HF69DooAp6fYW2l2cVrZ28VpbQrtjggQIiD0CjgVcoooA8++NEw/wCEd0O3xu+0+JNHix9L+Fz/AOOoa77aMfWuU+IHg1vG+m2UcGoy6Vfafex39pdRxJKqTR5270bh0+Y5XIPowIrFbWviToGVvPDmk+KIgcfaNFvzZzEev2e4yg/7/GgD0Xyxu3YG71rz3wXv1D4tfEK/cBltRp+jo2OixwNckfneUr/FLVVfa3w28Xh+m1VsWH/fQu8VP8KdF1LT9N1nUdXtZLDUNb1a51N7SV0d4EO2OFHZCy7xDFFnaSAcjJoA72iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAE2ijaPQUtFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACbR6UtFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAV8v8A7WGuaxD8UfhLotg3jO407Uk1l7zTvA+oiyvLkxQQtExdpYgVQsxxv/i+6a+oK5fWfAeka94w8O+KL2CR9W8PpdJYyLIwCC4RElyvRsqi9elAHhNn8TPEvw71Dwf4T0TQtTmivtK1DxJqlx8Qtalm1HT7S3uYEmT9353mOUmyib8D5ckVSuv2svF3h/wfY+K/EHg7S4NG8S+G9S8QeHorHU3knjNtZNfRwXmYgqtJAud8ZIRlZfm4avoO88B6LqHjaz8VTW5l1e20240mNix8r7NPJFJKpToSWhTn/GvONO/ZG8A2Ntd2UiavfaWdKvNEsLC+1SaaDSbO6TZPFZqT+53J8m7lgqhVIHFAHkfxd/aN+KOl+BfFOntpOieG/E/9i6V4h0270/UZbhI7W6v0tpIZd8I/fL/eRSGDnGGX5vr+wNw1nAbsRi6KL5whJKB8c7SecZ6V5140/Z58HePrfUU1a2us32iReH3kgvHidLaObzotjD7rrJhg/X5RXoel2J07T7S08+e5+zxLF51w++WTC43O2OWPUn1oAvUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAV89/tXfFLWPhvcfDqz0zxK/hK013WprG/1OLRv7UljiSynmVUtwrM254kXIBwCa+hK8v8AjJ8ItR+JF94P1TRfFEnhTWvDGoS6haXkdjHdgtJbS2zoyOQMbJmoA8s+EX7SusXngPxPf38d18Rm0vxK2i6fqGmaemlz3ETW6S+deQzui2YRjInmSbA4VCF+cZ6XRf2s9M8WaZo6eHPCWua54n1K71C0/sC1ls98JsXRLuR7gzeR5atJEqurneZUA74xNb/Y3HiK2utR1bxjJrni+91y21q81DWNGtriwujBavawwS2A2xtGkUjMvO8Ptfdxip/DP7JF94Eis77wx49udN8S2moandxajNpFtJAYb/yWuLZrZNi7BJbo6bCmzaByM7gCv4e/asN78XNU8M3Gm6ncXeqW2jTaB4XazW21KFZ4ZZLyS6V2Xy0h2Au7HaPlCb2dQ30yvSvnVv2QLCPVJNfj8XatP4yh/smSx8T3iJNfQTWSyo7u/HmJcJNKkkZwm1sDGF2/RQ+UUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB/9k=')
INSERT [dbo].[Product_Type] ([Product_Type_ID], [Product_Category_ID], [Template_ID], [Name], [ImageString]) VALUES (25, NULL, NULL, N'Cup', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAFUAw8DASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9U6KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo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')
SET IDENTITY_INSERT [dbo].[Product_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([Province_ID], [Name]) VALUES (1, N'Gauteng                                           ')
INSERT [dbo].[Province] ([Province_ID], [Name]) VALUES (2, N'Limpopo                                           ')
INSERT [dbo].[Province] ([Province_ID], [Name]) VALUES (3, N'Mpumalanga                                        ')
INSERT [dbo].[Province] ([Province_ID], [Name]) VALUES (4, N'North West                                        ')
INSERT [dbo].[Province] ([Province_ID], [Name]) VALUES (5, N'KwaZulu-Natal                                     ')
INSERT [dbo].[Province] ([Province_ID], [Name]) VALUES (6, N'Free State                                        ')
INSERT [dbo].[Province] ([Province_ID], [Name]) VALUES (7, N'Eastern Cape                                      ')
INSERT [dbo].[Province] ([Province_ID], [Name]) VALUES (8, N'Western Cape                                      ')
INSERT [dbo].[Province] ([Province_ID], [Name]) VALUES (9, N'Northern Cape                                     ')
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
SET IDENTITY_INSERT [dbo].[Quotation] ON 

INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (1, NULL, CAST(N'2020-02-10' AS Date), N'Make the thread in grey', NULL, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (2, NULL, CAST(N'2020-03-10' AS Date), N'Make the print red', NULL, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (3, NULL, CAST(N'2020-09-06' AS Date), N'd', NULL, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (4, NULL, CAST(N'2020-09-07' AS Date), N'd', NULL, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (5, 2, CAST(N'2020-09-20' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (6, 1, CAST(N'2020-09-21' AS Date), N'Invoice is currenlty being proccessed', NULL, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (7, 7, CAST(N'2020-09-21' AS Date), N'Invoice is currenlty being proccessed', NULL, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (8, 2, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (9, 2, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (10, 1, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (11, 2, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (12, 2, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (13, 2, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (14, 1, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (15, 1, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (16, 3, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (17, 5, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (18, 7, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (19, 2, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (20, 2, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (21, 6, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (22, 7, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (23, 1, CAST(N'2020-09-22' AS Date), N'Invoice is currenlty being proccessed', 3, NULL)
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (24, 13, NULL, NULL, NULL, CAST(94.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (25, 13, NULL, NULL, NULL, CAST(94.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (26, 13, NULL, NULL, NULL, CAST(94.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation] ([Quotation_ID], [Customer_ID], [Date], [Additional_Notes], [Quotation_Status_ID], [Amount]) VALUES (27, 13, NULL, NULL, NULL, CAST(60.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Quotation] OFF
GO
SET IDENTITY_INSERT [dbo].[Quotation_Line] ON 

INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (1, 1, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (2, 2, NULL, NULL, CAST(1000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (3, 3, N'hdjf', 1, CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (4, 4, N'hdjf', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (5, 5, N'blazer', 5, CAST(1150.00 AS Decimal(18, 2)), CAST(1035.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (6, 5, N'Shoes', 2, CAST(1150.00 AS Decimal(18, 2)), CAST(1150.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (7, 6, N'trial', 5, CAST(57.50 AS Decimal(18, 2)), CAST(51.75 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (8, 6, N'and error', 5, CAST(287.50 AS Decimal(18, 2)), CAST(287.50 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (9, 7, N'Tshirts', 5, CAST(1725.00 AS Decimal(18, 2)), CAST(1552.50 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (10, 7, N'Pants', 5, CAST(1150.00 AS Decimal(18, 2)), CAST(1150.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (11, 10, N'Tshirt', 5, CAST(1150.00 AS Decimal(18, 2)), CAST(1127.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (12, 10, N'Pants', 5, CAST(287.50 AS Decimal(18, 2)), CAST(287.50 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (13, 12, N'tshirt', 5, CAST(575.00 AS Decimal(18, 2)), CAST(546.25 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (14, 12, N'tshirt', 5, CAST(575.00 AS Decimal(18, 2)), CAST(546.25 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (15, 13, N'pants', 100, CAST(17250.00 AS Decimal(18, 2)), CAST(16905.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (16, 13, N'pants', 100, CAST(17250.00 AS Decimal(18, 2)), CAST(16905.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (17, 13, N'pants', 100, CAST(17250.00 AS Decimal(18, 2)), CAST(16905.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (18, 14, N'Jeans', 5, CAST(575.00 AS Decimal(18, 2)), CAST(575.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (19, 15, N'Tshirt', 5, CAST(575.00 AS Decimal(18, 2)), CAST(575.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (20, 26, N'So Breezy Small Blue', 2, CAST(2.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (21, 26, N'Super Bold Large Black', 45, CAST(2.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (22, 27, N'So Easy Small Magenta', 5, CAST(4.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Quotation_Line] ([Quotation_Line_ID], [Quotation_ID], [Description], [Quantity], [Price], [Total]) VALUES (23, 27, N'Black Pack Medium Torquoise', 10, CAST(4.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Quotation_Line] OFF
GO
SET IDENTITY_INSERT [dbo].[Quotation-Status] ON 

INSERT [dbo].[Quotation-Status] ([Quotation_Status_ID], [Description]) VALUES (1, N'Accepted            ')
INSERT [dbo].[Quotation-Status] ([Quotation_Status_ID], [Description]) VALUES (2, N'Expired             ')
INSERT [dbo].[Quotation-Status] ([Quotation_Status_ID], [Description]) VALUES (3, N'Sent                ')
INSERT [dbo].[Quotation-Status] ([Quotation_Status_ID], [Description]) VALUES (4, N'Declined            ')
SET IDENTITY_INSERT [dbo].[Quotation-Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Return_Customer_Order] ON 

INSERT [dbo].[Return_Customer_Order] ([Return_Customer_Order_ID], [Price], [Date], [Reason], [Product]) VALUES (1, CAST(650.00 AS Decimal(12, 2)), CAST(N'2020-02-15' AS Date), N'Shirts are the wrong colour                                                                                                                                                                                                                                     ', N'Basketball Cap')
INSERT [dbo].[Return_Customer_Order] ([Return_Customer_Order_ID], [Price], [Date], [Reason], [Product]) VALUES (2, CAST(500.00 AS Decimal(12, 2)), CAST(N'2020-02-25' AS Date), N'Not good quality                                                                                                                                                                                                                                                ', N'Ladies Golf Shirt')
SET IDENTITY_INSERT [dbo].[Return_Customer_Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Return_Customer_Order_Line] ON 

INSERT [dbo].[Return_Customer_Order_Line] ([Return_Line_ID], [Return_Customer_Order_ID], [Customer_Order_ID]) VALUES (1, 1, 1)
INSERT [dbo].[Return_Customer_Order_Line] ([Return_Line_ID], [Return_Customer_Order_ID], [Customer_Order_ID]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[Return_Customer_Order_Line] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Contact_Number], [Email], [Address], [Web_Link_ID]) VALUES (1, N'BCGShop   ', N'0824518711', N'info@kimo.co.za                                   ', NULL, 1)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Contact_Number], [Email], [Address], [Web_Link_ID]) VALUES (2, N'Proactive ', N'0116082630', N'info@proactive.co.za                              ', NULL, 2)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Contact_Number], [Email], [Address], [Web_Link_ID]) VALUES (3, N'GiftsSA   ', N'0114258956', N'infp@gifts.co.za                                  ', NULL, 3)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Contact_Number], [Email], [Address], [Web_Link_ID]) VALUES (4, N'Rolando   ', N'0116082630', N'info@rolando.co.za                                ', NULL, 4)
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name], [Contact_Number], [Email], [Address], [Web_Link_ID]) VALUES (5, N'Promo     ', N'0106002600', N'info@promoafrica.co.za                            ', NULL, 5)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier_Order] ON 

INSERT [dbo].[Supplier_Order] ([Supplier_Order_ID], [Supplier_ID], [Supplier_Order_Status_ID], [Quotation_ID], [Date], [Amount]) VALUES (1, 1, 1, NULL, CAST(N'2020-02-10' AS Date), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Supplier_Order] ([Supplier_Order_ID], [Supplier_ID], [Supplier_Order_Status_ID], [Quotation_ID], [Date], [Amount]) VALUES (2, 2, 2, NULL, CAST(N'2020-03-10' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Supplier_Order] ([Supplier_Order_ID], [Supplier_ID], [Supplier_Order_Status_ID], [Quotation_ID], [Date], [Amount]) VALUES (3, 1, 1, 1, CAST(N'2020-03-10' AS Date), CAST(300.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Supplier_Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier_Order_Status] ON 

INSERT [dbo].[Supplier_Order_Status] ([Supplier_Order_Status_ID], [Description]) VALUES (1, N'Order Placed                                      ')
INSERT [dbo].[Supplier_Order_Status] ([Supplier_Order_Status_ID], [Description]) VALUES (2, N'Order Received                                    ')
SET IDENTITY_INSERT [dbo].[Supplier_Order_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Template] ON 

INSERT [dbo].[Template] ([Template_ID], [Name], [ImagePath]) VALUES (1, N'Shirt               ', NULL)
INSERT [dbo].[Template] ([Template_ID], [Name], [ImagePath]) VALUES (2, N'BackPack            ', NULL)
INSERT [dbo].[Template] ([Template_ID], [Name], [ImagePath]) VALUES (3, N'bag                 ', N'nhkrhmj')
INSERT [dbo].[Template] ([Template_ID], [Name], [ImagePath]) VALUES (4, N'bag                 ', N'nhkrhmj')
INSERT [dbo].[Template] ([Template_ID], [Name], [ImagePath]) VALUES (5, N'New desin           ', N'new path')
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
SET IDENTITY_INSERT [dbo].[Template_Position] ON 

INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (1, 1, 1)
INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (2, 2, 1)
INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (3, 3, 1)
INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (4, 4, 1)
INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (5, 5, 1)
INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (6, 1, 2)
INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (7, 2, 2)
INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (8, 3, 2)
INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (9, 4, 2)
INSERT [dbo].[Template_Position] ([Template_Position_ID], [Position_ID], [Template_ID]) VALUES (10, 5, 2)
SET IDENTITY_INSERT [dbo].[Template_Position] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (1, 1, N'34430887ad3d7e99c811342e12f40e44b081d49c0f6268cf2fb678b8f4d6be1c', N'Tshidi', 0, NULL)
INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (2, 1, N'2a01ab4d92d218ec7510708462f0315a9b962ef2ba5e0004df5944778d7b0516', N'Yoletha', 0, NULL)
INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (3, 1, N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Portia', 0, NULL)
INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (4, 1, N'39b589926dc935787cdc76f7a91bf72e411c562aa25d83d18d65057e6ce3a66b', N'Lebogang', 0, NULL)
INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (5, 1, N'b277fa27d112b16cde327c721834fe0ad1bda7d183ef4e574225a5e744f78664', N'Rutendo', 0, NULL)
INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (6, 1, N'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', N'test', 0, NULL)
INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (7, 2, N'cf80cd8aed482d5d1527d7dc72fceff84e6326592848447d2dc0b0e87dfc9a90', N'testing', 0, NULL)
INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (8, 1, N'604c3f3b6a400261c5476461a815b1bb4b8927c4ad7dd1b31150e6beff5af9fe', N'testingg', 0, NULL)
INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (9, 1, N'239127e09157cbafb6212123b102aa1103241946b3684c232c44b8367c3a4d47', N'Jenny', 0, NULL)
INSERT [dbo].[User] ([UserID], [UserRoleID], [UserPassword], [UserName], [UserPasswordChangeRequest], [ResetOTP]) VALUES (10, 1, N'285075a02b2679248a6b4636c3328bd3097626607c3e43c0c5498258fbfa9f29', N'Samsung', 0, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Role] ON 

INSERT [dbo].[User_Role] ([UserRoleID], [UserRoleDescription], [UserRoleName]) VALUES (1, N'Admin', N'Admin')
INSERT [dbo].[User_Role] ([UserRoleID], [UserRoleDescription], [UserRoleName]) VALUES (2, N'Customer', N'Customer')
SET IDENTITY_INSERT [dbo].[User_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Web_Link] ON 

INSERT [dbo].[Web_Link] ([Web_Link_ID], [Web_Name], [Web_Address]) VALUES (1, N'BCGShopLink         ', N'https://kimosource.bcgshop.co.za/                 ')
INSERT [dbo].[Web_Link] ([Web_Link_ID], [Web_Name], [Web_Address]) VALUES (2, N'ProactiveLink       ', N'https://www.proactiveclothing.com/                ')
INSERT [dbo].[Web_Link] ([Web_Link_ID], [Web_Name], [Web_Address]) VALUES (3, N'GiftsLink           ', N'https://www.giftssa.co.za/                        ')
INSERT [dbo].[Web_Link] ([Web_Link_ID], [Web_Name], [Web_Address]) VALUES (4, N'RolandoLink         ', N'https://rolando.co.za/                            ')
INSERT [dbo].[Web_Link] ([Web_Link_ID], [Web_Name], [Web_Address]) VALUES (5, N'PromoLink           ', N'https://www.promoafrica.com/                      ')
SET IDENTITY_INSERT [dbo].[Web_Link] OFF
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_User]
GO
ALTER TABLE [dbo].[Customer_Order]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Customer_Order] CHECK CONSTRAINT [FK_Customer_Order_Customer]
GO
ALTER TABLE [dbo].[Customer_Order]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Order_Status] FOREIGN KEY([OrderStatus_ID])
REFERENCES [dbo].[Order_Status] ([OrderStatus_ID])
GO
ALTER TABLE [dbo].[Customer_Order] CHECK CONSTRAINT [FK_Customer_Order_Order_Status]
GO
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Customer_Order] FOREIGN KEY([Customer_Order_ID])
REFERENCES [dbo].[Customer_Order] ([Customer_Order_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Customer_Order]
GO
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Quotation_Line] FOREIGN KEY([Quotation_Line_ID])
REFERENCES [dbo].[Quotation_Line] ([Quotation_Line_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Quotation_Line]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Customer_Order] FOREIGN KEY([Customer_Order_ID])
REFERENCES [dbo].[Customer_Order] ([Customer_Order_ID])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Customer_Order]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Delivery_Address] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[Delivery_Address] ([Address_ID])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Delivery_Address]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Order_Status] FOREIGN KEY([OrderStatus_ID])
REFERENCES [dbo].[Order_Status] ([OrderStatus_ID])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Order_Status]
GO
ALTER TABLE [dbo].[Design]  WITH CHECK ADD  CONSTRAINT [FK_Design_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Design] CHECK CONSTRAINT [FK_Design_Customer]
GO
ALTER TABLE [dbo].[Design]  WITH CHECK ADD  CONSTRAINT [FK_Design_Product_Type] FOREIGN KEY([Product_Type_ID])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[Design] CHECK CONSTRAINT [FK_Design_Product_Type]
GO
ALTER TABLE [dbo].[Design_Line]  WITH CHECK ADD  CONSTRAINT [FK_Design_Line_Design] FOREIGN KEY([Design_ID])
REFERENCES [dbo].[Design] ([Design_ID])
GO
ALTER TABLE [dbo].[Design_Line] CHECK CONSTRAINT [FK_Design_Line_Design]
GO
ALTER TABLE [dbo].[Design_Line]  WITH CHECK ADD  CONSTRAINT [FK_Design_Line_Job_Type] FOREIGN KEY([Job_Type_ID])
REFERENCES [dbo].[Job_Type] ([Job_Type_ID])
GO
ALTER TABLE [dbo].[Design_Line] CHECK CONSTRAINT [FK_Design_Line_Job_Type]
GO
ALTER TABLE [dbo].[Design_Line]  WITH CHECK ADD  CONSTRAINT [FK_Design_Line_Template_Position] FOREIGN KEY([Template_Position_ID])
REFERENCES [dbo].[Template_Position] ([Template_Position_ID])
GO
ALTER TABLE [dbo].[Design_Line] CHECK CONSTRAINT [FK_Design_Line_Template_Position]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User]
GO
ALTER TABLE [dbo].[Permission_Line]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Line_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
GO
ALTER TABLE [dbo].[Permission_Line] CHECK CONSTRAINT [FK_Permission_Line_Permission]
GO
ALTER TABLE [dbo].[Permission_Line]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Line_User_Role] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[User_Role] ([UserRoleID])
GO
ALTER TABLE [dbo].[Permission_Line] CHECK CONSTRAINT [FK_Permission_Line_User_Role]
GO
ALTER TABLE [dbo].[Product_Type]  WITH CHECK ADD  CONSTRAINT [FK_Product_Type._Product_Category] FOREIGN KEY([Product_Category_ID])
REFERENCES [dbo].[Product_Category] ([Product_Category_ID])
GO
ALTER TABLE [dbo].[Product_Type] CHECK CONSTRAINT [FK_Product_Type._Product_Category]
GO
ALTER TABLE [dbo].[Product_Type]  WITH CHECK ADD  CONSTRAINT [FK_Product_Type._Template] FOREIGN KEY([Template_ID])
REFERENCES [dbo].[Template] ([Template_ID])
GO
ALTER TABLE [dbo].[Product_Type] CHECK CONSTRAINT [FK_Product_Type._Template]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Customer]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Quotation-Status] FOREIGN KEY([Quotation_Status_ID])
REFERENCES [dbo].[Quotation-Status] ([Quotation_Status_ID])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Quotation-Status]
GO
ALTER TABLE [dbo].[Quotation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Line_Quotation] FOREIGN KEY([Quotation_ID])
REFERENCES [dbo].[Quotation] ([Quotation_ID])
GO
ALTER TABLE [dbo].[Quotation_Line] CHECK CONSTRAINT [FK_Quotation_Line_Quotation]
GO
ALTER TABLE [dbo].[Quotation_Request]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Request_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Quotation_Request] CHECK CONSTRAINT [FK_Quotation_Request_Customer]
GO
ALTER TABLE [dbo].[Quotation_Request_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Request_Line_Design] FOREIGN KEY([Design_ID])
REFERENCES [dbo].[Design] ([Design_ID])
GO
ALTER TABLE [dbo].[Quotation_Request_Line] CHECK CONSTRAINT [FK_Quotation_Request_Line_Design]
GO
ALTER TABLE [dbo].[Quotation_Request_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Request_Line_Product_Size] FOREIGN KEY([Product_Size_ID])
REFERENCES [dbo].[Product_Size] ([Product_Size_ID])
GO
ALTER TABLE [dbo].[Quotation_Request_Line] CHECK CONSTRAINT [FK_Quotation_Request_Line_Product_Size]
GO
ALTER TABLE [dbo].[Quotation_Request_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Request_Line_Product_Type] FOREIGN KEY([Product_Type_ID])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[Quotation_Request_Line] CHECK CONSTRAINT [FK_Quotation_Request_Line_Product_Type]
GO
ALTER TABLE [dbo].[Quotation_Request_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Request_Line_Quotation_Request] FOREIGN KEY([Request_ID])
REFERENCES [dbo].[Quotation_Request] ([Request_ID])
GO
ALTER TABLE [dbo].[Quotation_Request_Line] CHECK CONSTRAINT [FK_Quotation_Request_Line_Quotation_Request]
GO
ALTER TABLE [dbo].[Quotation_Request_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Request_Line_Web_Link] FOREIGN KEY([Web_Link_ID])
REFERENCES [dbo].[Web_Link] ([Web_Link_ID])
GO
ALTER TABLE [dbo].[Quotation_Request_Line] CHECK CONSTRAINT [FK_Quotation_Request_Line_Web_Link]
GO
ALTER TABLE [dbo].[Return_Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Return_Customer_Order_Line_Customer_Order_Line] FOREIGN KEY([Customer_Order_ID])
REFERENCES [dbo].[Customer_Order_Line] ([Customer_Order_Line_ID])
GO
ALTER TABLE [dbo].[Return_Customer_Order_Line] CHECK CONSTRAINT [FK_Return_Customer_Order_Line_Customer_Order_Line]
GO
ALTER TABLE [dbo].[Return_Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Return_Customer_Order_Line_Return_Customer_Order] FOREIGN KEY([Return_Customer_Order_ID])
REFERENCES [dbo].[Return_Customer_Order] ([Return_Customer_Order_ID])
GO
ALTER TABLE [dbo].[Return_Customer_Order_Line] CHECK CONSTRAINT [FK_Return_Customer_Order_Line_Return_Customer_Order]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Web_Link] FOREIGN KEY([Web_Link_ID])
REFERENCES [dbo].[Web_Link] ([Web_Link_ID])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Web_Link]
GO
ALTER TABLE [dbo].[Supplier_Order]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order_Quotation_Line] FOREIGN KEY([Supplier_Order_ID])
REFERENCES [dbo].[Quotation_Line] ([Quotation_Line_ID])
GO
ALTER TABLE [dbo].[Supplier_Order] CHECK CONSTRAINT [FK_Supplier_Order_Quotation_Line]
GO
ALTER TABLE [dbo].[Supplier_Order]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Supplier_Order] CHECK CONSTRAINT [FK_Supplier_Order_Supplier]
GO
ALTER TABLE [dbo].[Supplier_Order]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order_Supplier_Order_Status] FOREIGN KEY([Supplier_Order_Status_ID])
REFERENCES [dbo].[Supplier_Order_Status] ([Supplier_Order_Status_ID])
GO
ALTER TABLE [dbo].[Supplier_Order] CHECK CONSTRAINT [FK_Supplier_Order_Supplier_Order_Status]
GO
ALTER TABLE [dbo].[Supplier_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order_Line_Product_Type] FOREIGN KEY([Product_Type_ID])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[Supplier_Order_Line] CHECK CONSTRAINT [FK_Supplier_Order_Line_Product_Type]
GO
ALTER TABLE [dbo].[Supplier_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order_Line_Supplier_Order] FOREIGN KEY([Supplier_Order_ID])
REFERENCES [dbo].[Supplier_Order] ([Supplier_Order_ID])
GO
ALTER TABLE [dbo].[Supplier_Order_Line] CHECK CONSTRAINT [FK_Supplier_Order_Line_Supplier_Order]
GO
ALTER TABLE [dbo].[Template_Position]  WITH CHECK ADD  CONSTRAINT [FK_Template_Position_Position] FOREIGN KEY([Position_ID])
REFERENCES [dbo].[Position] ([Position_ID])
GO
ALTER TABLE [dbo].[Template_Position] CHECK CONSTRAINT [FK_Template_Position_Position]
GO
ALTER TABLE [dbo].[Template_Position]  WITH CHECK ADD  CONSTRAINT [FK_Template_Position_Template] FOREIGN KEY([Template_ID])
REFERENCES [dbo].[Template] ([Template_ID])
GO
ALTER TABLE [dbo].[Template_Position] CHECK CONSTRAINT [FK_Template_Position_Template]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User_Role] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[User_Role] ([UserRoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User_Role]
GO
USE [master]
GO
ALTER DATABASE [KIMODB] SET  READ_WRITE 
GO
