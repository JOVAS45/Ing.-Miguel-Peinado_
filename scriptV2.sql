USE [master]
GO
/****** Object:  Database [VERSION5]    Script Date: 23/08/2024 03:31:23 p. m. ******/
CREATE DATABASE [VERSION5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VERSION5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VERSION5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VERSION5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VERSION5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VERSION5] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VERSION5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VERSION5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VERSION5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VERSION5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VERSION5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VERSION5] SET ARITHABORT OFF 
GO
ALTER DATABASE [VERSION5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VERSION5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VERSION5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VERSION5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VERSION5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VERSION5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VERSION5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VERSION5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VERSION5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VERSION5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VERSION5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VERSION5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VERSION5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VERSION5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VERSION5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VERSION5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VERSION5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VERSION5] SET RECOVERY FULL 
GO
ALTER DATABASE [VERSION5] SET  MULTI_USER 
GO
ALTER DATABASE [VERSION5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VERSION5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VERSION5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VERSION5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VERSION5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VERSION5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VERSION5', N'ON'
GO
ALTER DATABASE [VERSION5] SET QUERY_STORE = ON
GO
ALTER DATABASE [VERSION5] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VERSION5]
GO
/****** Object:  Table [dbo].[Airplane]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airplane](
	[AirplaneID] [int] NOT NULL,
	[RegistrationNumber] [varchar](50) NOT NULL,
	[BeginOfOperation] [date] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[PlaneModelID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AirplaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CityID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AvailableCoupon]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableCoupon](
	[AvailableCouponID] [int] NOT NULL,
	[CouponID] [int] NOT NULL,
	[AvailableSeatID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AvailableCouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AvailableSeat]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableSeat](
	[AvailableSeatID] [int] NOT NULL,
	[FlightID] [int] NOT NULL,
	[SeatID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AvailableSeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CountryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[CouponID] [int] NOT NULL,
	[DateOfRedemption] [date] NOT NULL,
	[Class] [varchar](50) NOT NULL,
	[Standby] [varchar](50) NOT NULL,
	[MealCode] [varchar](50) NOT NULL,
	[TicketID] [int] NOT NULL,
	[FlightID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IdentificationCard] [varchar](50) NULL,
	[Classification] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightID] [int] NOT NULL,
	[BoardingTime] [datetime] NOT NULL,
	[FlightDate] [date] NOT NULL,
	[Gate] [varchar](50) NOT NULL,
	[CheckInCounter] [varchar](50) NOT NULL,
	[FlightNumberID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightNumber]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightNumber](
	[FlightNumberID] [int] NOT NULL,
	[DepartureTime] [datetime] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Airline] [varchar](50) NOT NULL,
	[StartAirportID] [int] NOT NULL,
	[GoalAirportID] [int] NOT NULL,
	[PlaneModelID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FrequentFlyerCard]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrequentFlyerCard](
	[FFC_Number] [int] NOT NULL,
	[Miles] [int] NOT NULL,
	[Meal_Code] [varchar](10) NOT NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FFC_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passport]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passport](
	[PassportID] [int] NOT NULL,
	[Nationality] [varchar](100) NOT NULL,
	[Sex] [char](1) NOT NULL,
	[IssuedDate] [date] NOT NULL,
	[ExpiredDate] [date] NOT NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PassportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PiecesOfLuggage]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PiecesOfLuggage](
	[LuggageID] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Weight] [decimal](5, 2) NOT NULL,
	[CouponID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LuggageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaneModel]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaneModel](
	[PlaneModelID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Graphic] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaneModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[SeatID] [int] NOT NULL,
	[Size] [varchar](50) NOT NULL,
	[Number] [int] NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[PlaneModelID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 23/08/2024 03:31:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketID] [int] NOT NULL,
	[TicketingCode] [varchar](50) NOT NULL,
	[Classification] [varchar](50) NOT NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Airplane] ([AirplaneID], [RegistrationNumber], [BeginOfOperation], [Status], [PlaneModelID]) VALUES (1, N'N12345', CAST(N'2010-01-01' AS Date), N'Active', 1)
INSERT [dbo].[Airplane] ([AirplaneID], [RegistrationNumber], [BeginOfOperation], [Status], [PlaneModelID]) VALUES (2, N'B54321', CAST(N'2015-05-01' AS Date), N'Active', 2)
INSERT [dbo].[Airplane] ([AirplaneID], [RegistrationNumber], [BeginOfOperation], [Status], [PlaneModelID]) VALUES (3, N'C98765', CAST(N'2012-07-01' AS Date), N'Maintenance', 3)
GO
INSERT [dbo].[Airport] ([AirportID], [Name], [CityID], [CountryID]) VALUES (1, N'JFK Airport', 1, 1)
INSERT [dbo].[Airport] ([AirportID], [Name], [CityID], [CountryID]) VALUES (2, N'Guarulhos Airport', 2, 2)
INSERT [dbo].[Airport] ([AirportID], [Name], [CityID], [CountryID]) VALUES (3, N'Berlin Brandenburg Airport', 3, 3)
GO
INSERT [dbo].[AvailableCoupon] ([AvailableCouponID], [CouponID], [AvailableSeatID]) VALUES (1, 1, 1)
INSERT [dbo].[AvailableCoupon] ([AvailableCouponID], [CouponID], [AvailableSeatID]) VALUES (2, 2, 2)
GO
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (1, 1, 1)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (2, 2, 3)
GO
INSERT [dbo].[City] ([CityID], [Name], [CountryID]) VALUES (1, N'New York', 1)
INSERT [dbo].[City] ([CityID], [Name], [CountryID]) VALUES (2, N'São Paulo', 2)
INSERT [dbo].[City] ([CityID], [Name], [CountryID]) VALUES (3, N'Berlin', 3)
GO
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (1, N'USA')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (2, N'Brazil')
INSERT [dbo].[Country] ([CountryID], [Name]) VALUES (3, N'Germany')
GO
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID]) VALUES (1, CAST(N'2024-08-25' AS Date), N'Economy', N'No', N'VGML', 1, 1)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID]) VALUES (2, CAST(N'2024-08-25' AS Date), N'First', N'Yes', N'HNML', 3, 2)
GO
INSERT [dbo].[Customer] ([CustomerID], [DateOfBirth], [Name], [IdentificationCard], [Classification]) VALUES (1, CAST(N'1980-05-12' AS Date), N'John Doe', N'ID123456', N'Frequent')
INSERT [dbo].[Customer] ([CustomerID], [DateOfBirth], [Name], [IdentificationCard], [Classification]) VALUES (2, CAST(N'1992-07-23' AS Date), N'Maria Silva', N'ID654321', N'Occasional')
INSERT [dbo].[Customer] ([CustomerID], [DateOfBirth], [Name], [IdentificationCard], [Classification]) VALUES (3, CAST(N'1985-03-15' AS Date), N'Hans Müller', N'ID987654', N'Frequent')
GO
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (1, CAST(N'2024-08-25T09:00:00.000' AS DateTime), CAST(N'2024-08-25' AS Date), N'A12', N'C1', 1)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (2, CAST(N'2024-08-25T14:00:00.000' AS DateTime), CAST(N'2024-08-25' AS Date), N'B5', N'C3', 2)
GO
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID], [PlaneModelID]) VALUES (1, CAST(N'2024-08-25T10:00:00.000' AS DateTime), N'NY to SP', N'International', N'American Airlines', 1, 2, 1)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID], [PlaneModelID]) VALUES (2, CAST(N'2024-08-25T15:00:00.000' AS DateTime), N'SP to Berlin', N'International', N'LATAM', 2, 3, 2)
GO
INSERT [dbo].[FrequentFlyerCard] ([FFC_Number], [Miles], [Meal_Code], [CustomerID]) VALUES (1001, 50000, N'VGML', 1)
INSERT [dbo].[FrequentFlyerCard] ([FFC_Number], [Miles], [Meal_Code], [CustomerID]) VALUES (1002, 20000, N'HNML', 3)
GO
INSERT [dbo].[Passport] ([PassportID], [Nationality], [Sex], [IssuedDate], [ExpiredDate], [CustomerID]) VALUES (1, N'American', N'M', CAST(N'2010-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Passport] ([PassportID], [Nationality], [Sex], [IssuedDate], [ExpiredDate], [CustomerID]) VALUES (2, N'Brazilian', N'F', CAST(N'2015-05-15' AS Date), CAST(N'2025-05-15' AS Date), 2)
INSERT [dbo].[Passport] ([PassportID], [Nationality], [Sex], [IssuedDate], [ExpiredDate], [CustomerID]) VALUES (3, N'German', N'M', CAST(N'2012-07-07' AS Date), CAST(N'2022-07-07' AS Date), 3)
GO
INSERT [dbo].[PiecesOfLuggage] ([LuggageID], [Number], [Weight], [CouponID]) VALUES (1, 2, CAST(23.50 AS Decimal(5, 2)), 1)
INSERT [dbo].[PiecesOfLuggage] ([LuggageID], [Number], [Weight], [CouponID]) VALUES (2, 1, CAST(15.00 AS Decimal(5, 2)), 2)
GO
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic]) VALUES (1, N'Boeing 737', NULL)
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic]) VALUES (2, N'Airbus A320', NULL)
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic]) VALUES (3, N'Embraer E190', NULL)
GO
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (1, N'Economy', 12, N'Window', 1)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (2, N'Business', 5, N'Aisle', 1)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (3, N'First Class', 1, N'Window', 2)
GO
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Classification], [CustomerID]) VALUES (1, N'AA123', N'Economy', 1)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Classification], [CustomerID]) VALUES (2, N'LA456', N'Business', 2)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Classification], [CustomerID]) VALUES (3, N'LH789', N'First', 3)
GO
/****** Object:  Index [UQ__Availabl__384AF1DB28F49B9D]    Script Date: 23/08/2024 03:31:23 p. m. ******/
ALTER TABLE [dbo].[AvailableCoupon] ADD UNIQUE NONCLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Availabl__F0B02FD6513B43F2]    Script Date: 23/08/2024 03:31:23 p. m. ******/
ALTER TABLE [dbo].[AvailableCoupon] ADD UNIQUE NONCLUSTERED 
(
	[AvailableSeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Identification]    Script Date: 23/08/2024 03:31:23 p. m. ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UC_Identification] UNIQUE NONCLUSTERED 
(
	[IdentificationCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airplane]  WITH CHECK ADD FOREIGN KEY([PlaneModelID])
REFERENCES [dbo].[PlaneModel] ([PlaneModelID])
GO
ALTER TABLE [dbo].[Airport]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Airport]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[AvailableCoupon]  WITH CHECK ADD FOREIGN KEY([AvailableSeatID])
REFERENCES [dbo].[AvailableSeat] ([AvailableSeatID])
GO
ALTER TABLE [dbo].[AvailableCoupon]  WITH CHECK ADD FOREIGN KEY([CouponID])
REFERENCES [dbo].[Coupon] ([CouponID])
GO
ALTER TABLE [dbo].[AvailableSeat]  WITH CHECK ADD FOREIGN KEY([FlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[AvailableSeat]  WITH CHECK ADD FOREIGN KEY([SeatID])
REFERENCES [dbo].[Seat] ([SeatID])
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD FOREIGN KEY([FlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD FOREIGN KEY([TicketID])
REFERENCES [dbo].[Ticket] ([TicketID])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD FOREIGN KEY([FlightNumberID])
REFERENCES [dbo].[FlightNumber] ([FlightNumberID])
GO
ALTER TABLE [dbo].[FlightNumber]  WITH CHECK ADD FOREIGN KEY([GoalAirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[FlightNumber]  WITH CHECK ADD FOREIGN KEY([PlaneModelID])
REFERENCES [dbo].[PlaneModel] ([PlaneModelID])
GO
ALTER TABLE [dbo].[FlightNumber]  WITH CHECK ADD FOREIGN KEY([StartAirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[FrequentFlyerCard]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Passport]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[PiecesOfLuggage]  WITH CHECK ADD FOREIGN KEY([CouponID])
REFERENCES [dbo].[Coupon] ([CouponID])
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD FOREIGN KEY([PlaneModelID])
REFERENCES [dbo].[PlaneModel] ([PlaneModelID])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD CHECK  (([Class]='First' OR [Class]='Business' OR [Class]='Economy'))
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([Classification]='Occasional' OR [Classification]='Frequent'))
GO
ALTER TABLE [dbo].[FrequentFlyerCard]  WITH CHECK ADD CHECK  (([Miles]>=(0)))
GO
ALTER TABLE [dbo].[Passport]  WITH CHECK ADD CHECK  (([Sex]='F' OR [Sex]='M'))
GO
ALTER TABLE [dbo].[PiecesOfLuggage]  WITH CHECK ADD CHECK  (([Number]>(0)))
GO
ALTER TABLE [dbo].[PiecesOfLuggage]  WITH CHECK ADD CHECK  (([Weight]>(0)))
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD CHECK  (([Classification]='First' OR [Classification]='Business' OR [Classification]='Economy'))
GO
USE [master]
GO
ALTER DATABASE [VERSION5] SET  READ_WRITE 
GO
