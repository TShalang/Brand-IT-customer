USE [master]
GO
/****** Object:  Database [TshidiDatabase]    Script Date: 2022/02/09 13:44:14 ******/
CREATE DATABASE [TshidiDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TshidiDatabase_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TshidiDatabase.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TshidiDatabase_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TshidiDatabase.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TshidiDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TshidiDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TshidiDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TshidiDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TshidiDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TshidiDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TshidiDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TshidiDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TshidiDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TshidiDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TshidiDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TshidiDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TshidiDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TshidiDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TshidiDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TshidiDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TshidiDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TshidiDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TshidiDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TshidiDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TshidiDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TshidiDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TshidiDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TshidiDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TshidiDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [TshidiDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [TshidiDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TshidiDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TshidiDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TshidiDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TshidiDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TshidiDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TshidiDatabase', N'ON'
GO
ALTER DATABASE [TshidiDatabase] SET QUERY_STORE = OFF
GO
USE [TshidiDatabase]
GO
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 2022/02/09 13:44:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditTrail](
	[AuditTrailID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[TableName] [varchar](50) NULL,
	[AuditDate] [varchar](50) NULL,
	[OldValue] [varchar](50) NULL,
	[AuditType] [varchar](50) NULL,
	[NewValue] [varchar](50) NULL,
	[AuditDescription] [varbinary](50) NULL,
 CONSTRAINT [PK_AuditTrail] PRIMARY KEY CLUSTERED 
(
	[AuditTrailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capture_Collect]    Script Date: 2022/02/09 13:44:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capture_Collect](
	[Collected_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[ID_Number] [varchar](20) NULL,
	[Contact_Number] [varchar](50) NULL,
	[Customer_Order_ID] [int] NULL,
	[Date_Collected] [date] NULL,
 CONSTRAINT [PK_Capture_Collect] PRIMARY KEY CLUSTERED 
(
	[Collected_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Customer_Order]    Script Date: 2022/02/09 13:44:14 ******/
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
	[TotalVat] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Customer_Order] PRIMARY KEY CLUSTERED 
(
	[Customer_Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Order_Line]    Script Date: 2022/02/09 13:44:14 ******/
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
	[Date] [date] NULL,
	[Design_ID] [int] NULL,
	[Product_Code] [varchar](50) NULL,
	[Web_Link_ID] [int] NULL,
	[Product_Size_ID] [int] NULL,
	[Product_Type_ID] [int] NULL,
	[Supplier_ID] [int] NULL,
 CONSTRAINT [PK_Customer_Order_Line] PRIMARY KEY CLUSTERED 
(
	[Customer_Order_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Delivery_Address]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Design]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Design_Line]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Job_Type]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Order_Status]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Permission_Line]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Position]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Product_Category]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Product_Size]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Product_Type]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Province]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Quotation]    Script Date: 2022/02/09 13:44:14 ******/
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
	[TotalVat] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Quotation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation_Line]    Script Date: 2022/02/09 13:44:14 ******/
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
	[Design_ID] [int] NULL,
	[Product_Code] [varchar](50) NULL,
	[Web_Link_ID] [int] NULL,
	[Product_Size_ID] [int] NULL,
	[Product_Type_ID] [int] NULL,
	[Colour] [varchar](50) NULL,
	[Supplier_ID] [int] NULL,
 CONSTRAINT [PK_Quotation_Line] PRIMARY KEY CLUSTERED 
(
	[Quotation_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation_Request]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Quotation_Request_Line]    Script Date: 2022/02/09 13:44:14 ******/
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
	[Supplier_ID] [int] NULL,
 CONSTRAINT [PK_Quotation_Request_Line] PRIMARY KEY CLUSTERED 
(
	[Request_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation-Status]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Return_Customer_Order]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Return_Customer_Order_Line]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Supplier_Order]    Script Date: 2022/02/09 13:44:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Order](
	[Supplier_Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[OrderStatus_ID] [int] NULL,
 CONSTRAINT [PK_Supplier_Order] PRIMARY KEY CLUSTERED 
(
	[Supplier_Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Order_Line]    Script Date: 2022/02/09 13:44:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Order_Line](
	[Supplier_Order_Line_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Type_ID] [int] NULL,
	[Description] [varchar](50) NULL,
	[Supplier_Order_ID] [int] NULL,
	[Customer_Order_Line_ID] [int] NULL,
	[Quantity] [int] NULL,
	[Supplier_ID] [int] NULL,
 CONSTRAINT [PK_Supplier_Order_Line] PRIMARY KEY CLUSTERED 
(
	[Supplier_Order_Line_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Order_Status]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Template]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Template_Position]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[User_Role]    Script Date: 2022/02/09 13:44:14 ******/
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
/****** Object:  Table [dbo].[Web_Link]    Script Date: 2022/02/09 13:44:14 ******/
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
ALTER TABLE [dbo].[AuditTrail]  WITH CHECK ADD  CONSTRAINT [FK_AuditTrail_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[AuditTrail] CHECK CONSTRAINT [FK_AuditTrail_User]
GO
ALTER TABLE [dbo].[Capture_Collect]  WITH CHECK ADD  CONSTRAINT [FK_Capture_Collect_Customer_Order] FOREIGN KEY([Customer_Order_ID])
REFERENCES [dbo].[Customer_Order] ([Customer_Order_ID])
GO
ALTER TABLE [dbo].[Capture_Collect] CHECK CONSTRAINT [FK_Capture_Collect_Customer_Order]
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
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Design] FOREIGN KEY([Design_ID])
REFERENCES [dbo].[Design] ([Design_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Design]
GO
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Design1] FOREIGN KEY([Design_ID])
REFERENCES [dbo].[Design] ([Design_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Design1]
GO
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Product_Size] FOREIGN KEY([Web_Link_ID])
REFERENCES [dbo].[Product_Size] ([Product_Size_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Product_Size]
GO
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Product_Type] FOREIGN KEY([Product_Type_ID])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Product_Type]
GO
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Quotation_Line] FOREIGN KEY([Quotation_Line_ID])
REFERENCES [dbo].[Quotation_Line] ([Quotation_Line_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Quotation_Line]
GO
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Supplier]
GO
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Web_Link] FOREIGN KEY([Web_Link_ID])
REFERENCES [dbo].[Web_Link] ([Web_Link_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Web_Link]
GO
ALTER TABLE [dbo].[Customer_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order_Line_Web_Link1] FOREIGN KEY([Web_Link_ID])
REFERENCES [dbo].[Web_Link] ([Web_Link_ID])
GO
ALTER TABLE [dbo].[Customer_Order_Line] CHECK CONSTRAINT [FK_Customer_Order_Line_Web_Link1]
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
ALTER TABLE [dbo].[Quotation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Line_Design] FOREIGN KEY([Design_ID])
REFERENCES [dbo].[Design] ([Design_ID])
GO
ALTER TABLE [dbo].[Quotation_Line] CHECK CONSTRAINT [FK_Quotation_Line_Design]
GO
ALTER TABLE [dbo].[Quotation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Line_Design1] FOREIGN KEY([Design_ID])
REFERENCES [dbo].[Design] ([Design_ID])
GO
ALTER TABLE [dbo].[Quotation_Line] CHECK CONSTRAINT [FK_Quotation_Line_Design1]
GO
ALTER TABLE [dbo].[Quotation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Line_Product_Size] FOREIGN KEY([Product_Size_ID])
REFERENCES [dbo].[Product_Size] ([Product_Size_ID])
GO
ALTER TABLE [dbo].[Quotation_Line] CHECK CONSTRAINT [FK_Quotation_Line_Product_Size]
GO
ALTER TABLE [dbo].[Quotation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Line_Product_Type] FOREIGN KEY([Product_Type_ID])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[Quotation_Line] CHECK CONSTRAINT [FK_Quotation_Line_Product_Type]
GO
ALTER TABLE [dbo].[Quotation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Line_Quotation] FOREIGN KEY([Quotation_ID])
REFERENCES [dbo].[Quotation] ([Quotation_ID])
GO
ALTER TABLE [dbo].[Quotation_Line] CHECK CONSTRAINT [FK_Quotation_Line_Quotation]
GO
ALTER TABLE [dbo].[Quotation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Line_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Quotation_Line] CHECK CONSTRAINT [FK_Quotation_Line_Supplier]
GO
ALTER TABLE [dbo].[Quotation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Line_Web_Link] FOREIGN KEY([Web_Link_ID])
REFERENCES [dbo].[Web_Link] ([Web_Link_ID])
GO
ALTER TABLE [dbo].[Quotation_Line] CHECK CONSTRAINT [FK_Quotation_Line_Web_Link]
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
ALTER TABLE [dbo].[Quotation_Request_Line]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Request_Line_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Quotation_Request_Line] CHECK CONSTRAINT [FK_Quotation_Request_Line_Supplier]
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
ALTER TABLE [dbo].[Supplier_Order]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order_Order_Status] FOREIGN KEY([OrderStatus_ID])
REFERENCES [dbo].[Order_Status] ([OrderStatus_ID])
GO
ALTER TABLE [dbo].[Supplier_Order] CHECK CONSTRAINT [FK_Supplier_Order_Order_Status]
GO
ALTER TABLE [dbo].[Supplier_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order_Line_Customer_Order_Line] FOREIGN KEY([Customer_Order_Line_ID])
REFERENCES [dbo].[Customer_Order_Line] ([Customer_Order_Line_ID])
GO
ALTER TABLE [dbo].[Supplier_Order_Line] CHECK CONSTRAINT [FK_Supplier_Order_Line_Customer_Order_Line]
GO
ALTER TABLE [dbo].[Supplier_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order_Line_Product_Type] FOREIGN KEY([Product_Type_ID])
REFERENCES [dbo].[Product_Type] ([Product_Type_ID])
GO
ALTER TABLE [dbo].[Supplier_Order_Line] CHECK CONSTRAINT [FK_Supplier_Order_Line_Product_Type]
GO
ALTER TABLE [dbo].[Supplier_Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Order_Line_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Supplier_Order_Line] CHECK CONSTRAINT [FK_Supplier_Order_Line_Supplier]
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
ALTER DATABASE [TshidiDatabase] SET  READ_WRITE 
GO
