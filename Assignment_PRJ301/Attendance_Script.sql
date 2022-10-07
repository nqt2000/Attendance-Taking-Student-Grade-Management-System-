USE [master]
GO
/****** Object:  Database [Assignment_PRJ301]    Script Date: 10/08/2022 06:06:02 ******/
CREATE DATABASE [Assignment_PRJ301]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_PRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\Assignment_PRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_PRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\Assignment_PRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment_PRJ301] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_PRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_PRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_PRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_PRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment_PRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_PRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment_PRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_PRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_PRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_PRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment_PRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment_PRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assignment_PRJ301] SET QUERY_STORE = OFF
GO
USE [Assignment_PRJ301]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 10/08/2022 06:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[status] [bit] NOT NULL,
	[ssid] [int] NOT NULL,
	[roll_number] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 10/08/2022 06:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [varchar](10) NOT NULL,
	[ssid] [int] NOT NULL,
	[suid] [int] NOT NULL,
	[lid] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 10/08/2022 06:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[lid] [int] IDENTITY(1,1) NOT NULL,
	[lname] [nvarchar](max) NOT NULL,
	[lcode] [varchar](15) NOT NULL,
	[email] [varchar](max) NOT NULL,
	[phone_number] [char](10) NOT NULL,
 CONSTRAINT [PK_Lecture] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/08/2022 06:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[room] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 10/08/2022 06:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[ssid] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[rid] [int] NOT NULL,
	[tid] [int] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[ssid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/08/2022 06:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[roll_number] [varchar](8) NOT NULL,
	[sname] [nvarchar](max) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[phone_number] [char](10) NOT NULL,
	[email] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[roll_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Group]    Script Date: 10/08/2022 06:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Group](
	[sgid] [int] IDENTITY(1,1) NOT NULL,
	[roll_number] [varchar](8) NOT NULL,
	[gid] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Student_Group] PRIMARY KEY CLUSTERED 
(
	[sgid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/08/2022 06:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[suid] [int] IDENTITY(1,1) NOT NULL,
	[suname] [varchar](max) NOT NULL,
	[sucode] [varchar](56) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[suid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 10/08/2022 06:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[from] [time](0) NOT NULL,
	[to] [time](0) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lecture] ON 

INSERT [dbo].[Lecture] ([lid], [lname], [lcode], [email], [phone_number]) VALUES (1, N'Ngô Tùng Sơn', N'SonNT5', N'sonnt69@fe.edu.vn', N'0123456789')
INSERT [dbo].[Lecture] ([lid], [lname], [lcode], [email], [phone_number]) VALUES (2, N'Lại Hiền Phương', N'PhuongLH17', N'PhuongLH17@fe.edu.vn', N'1111111111')
INSERT [dbo].[Lecture] ([lid], [lname], [lcode], [email], [phone_number]) VALUES (3, N'Kiều Văn Nam', N'Namkv', N'NamKV@fe.edu.vn
', N'2222222222')
INSERT [dbo].[Lecture] ([lid], [lname], [lcode], [email], [phone_number]) VALUES (6, N'Bùi Thị Loan', N'LoanBT7', N'LoanBT7@fe.edu.vn', N'3333333333')
INSERT [dbo].[Lecture] ([lid], [lname], [lcode], [email], [phone_number]) VALUES (8, N'Đào Quang Khải', N'KhaiDQ6', N'khaidq6@fe.edu.vn', N'4444444444')
SET IDENTITY_INSERT [dbo].[Lecture] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([rid], [room]) VALUES (1, N'AL-101L')
INSERT [dbo].[Room] ([rid], [room]) VALUES (2, N'AL-102L')
INSERT [dbo].[Room] ([rid], [room]) VALUES (3, N'AL-103L')
INSERT [dbo].[Room] ([rid], [room]) VALUES (4, N'AL-104L')
INSERT [dbo].[Room] ([rid], [room]) VALUES (5, N'AL-101R')
INSERT [dbo].[Room] ([rid], [room]) VALUES (6, N'AL-102R')
INSERT [dbo].[Room] ([rid], [room]) VALUES (7, N'AL-103R')
INSERT [dbo].[Room] ([rid], [room]) VALUES (8, N'AL-104R')
INSERT [dbo].[Room] ([rid], [room]) VALUES (9, N'AL-105R')
INSERT [dbo].[Room] ([rid], [room]) VALUES (10, N'AL-106R')
INSERT [dbo].[Room] ([rid], [room]) VALUES (11, N'BE-101')
INSERT [dbo].[Room] ([rid], [room]) VALUES (12, N'BE-102')
INSERT [dbo].[Room] ([rid], [room]) VALUES (13, N'BE-103')
INSERT [dbo].[Room] ([rid], [room]) VALUES (14, N'BE-104')
INSERT [dbo].[Room] ([rid], [room]) VALUES (15, N'BE-105')
INSERT [dbo].[Room] ([rid], [room]) VALUES (16, N'BE-106')
INSERT [dbo].[Room] ([rid], [room]) VALUES (17, N'DE-101')
INSERT [dbo].[Room] ([rid], [room]) VALUES (18, N'DE-102')
INSERT [dbo].[Room] ([rid], [room]) VALUES (19, N'DE-103')
INSERT [dbo].[Room] ([rid], [room]) VALUES (20, N'DE-104')
INSERT [dbo].[Room] ([rid], [room]) VALUES (21, N'DE-105')
INSERT [dbo].[Room] ([rid], [room]) VALUES (22, N'DE-106')
INSERT [dbo].[Room] ([rid], [room]) VALUES (23, N'DE-107')
INSERT [dbo].[Room] ([rid], [room]) VALUES (24, N'DE-108')
INSERT [dbo].[Room] ([rid], [room]) VALUES (25, N'DE-109')
INSERT [dbo].[Room] ([rid], [room]) VALUES (26, N'DE-110')
INSERT [dbo].[Room] ([rid], [room]) VALUES (27, N'AL-201')
INSERT [dbo].[Room] ([rid], [room]) VALUES (28, N'AL-202')
INSERT [dbo].[Room] ([rid], [room]) VALUES (29, N'AL-203')
INSERT [dbo].[Room] ([rid], [room]) VALUES (30, N'AL-204')
INSERT [dbo].[Room] ([rid], [room]) VALUES (31, N'AL-205')
INSERT [dbo].[Room] ([rid], [room]) VALUES (32, N'AL-206')
INSERT [dbo].[Room] ([rid], [room]) VALUES (33, N'BE-201')
INSERT [dbo].[Room] ([rid], [room]) VALUES (34, N'BE-202')
INSERT [dbo].[Room] ([rid], [room]) VALUES (35, N'BE-203')
INSERT [dbo].[Room] ([rid], [room]) VALUES (36, N'BE-204')
INSERT [dbo].[Room] ([rid], [room]) VALUES (37, N'BE-205')
INSERT [dbo].[Room] ([rid], [room]) VALUES (38, N'BE-206')
INSERT [dbo].[Room] ([rid], [room]) VALUES (39, N'DE-201')
INSERT [dbo].[Room] ([rid], [room]) VALUES (40, N'DE-202')
INSERT [dbo].[Room] ([rid], [room]) VALUES (41, N'DE-203')
INSERT [dbo].[Room] ([rid], [room]) VALUES (42, N'DE-204C')
INSERT [dbo].[Room] ([rid], [room]) VALUES (43, N'DE-205C')
INSERT [dbo].[Room] ([rid], [room]) VALUES (44, N'DE-206C')
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([suid], [suname], [sucode]) VALUES (1, N'	Java Web Application Development', N'PRJ301')
INSERT [dbo].[Subject] ([suid], [suname], [sucode]) VALUES (2, N'Data warehouse', N'DBW301')
INSERT [dbo].[Subject] ([suid], [suname], [sucode]) VALUES (3, N'	Principles of Marxism - Leninism', N'MLN101')
INSERT [dbo].[Subject] ([suid], [suname], [sucode]) VALUES (4, N'Web Development (XML)', N'PRX301')
INSERT [dbo].[Subject] ([suid], [suname], [sucode]) VALUES (5, N'	Statistics and Probability', N'MAS291')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSlot] ON 

INSERT [dbo].[TimeSlot] ([tid], [from], [to]) VALUES (1, CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([tid], [from], [to]) VALUES (2, CAST(N'09:10:00' AS Time), CAST(N'10:40:00' AS Time))
INSERT [dbo].[TimeSlot] ([tid], [from], [to]) VALUES (3, CAST(N'10:50:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([tid], [from], [to]) VALUES (4, CAST(N'12:50:00' AS Time), CAST(N'14:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([tid], [from], [to]) VALUES (5, CAST(N'14:30:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([tid], [from], [to]) VALUES (6, CAST(N'16:10:00' AS Time), CAST(N'17:40:00' AS Time))
INSERT [dbo].[TimeSlot] ([tid], [from], [to]) VALUES (7, CAST(N'17:50:00' AS Time), CAST(N'19:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([tid], [from], [to]) VALUES (8, CAST(N'19:30:00' AS Time), CAST(N'21:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Session] FOREIGN KEY([ssid])
REFERENCES [dbo].[Session] ([ssid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Session]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([roll_number])
REFERENCES [dbo].[Student] ([roll_number])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecture] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecture] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecture]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Session] FOREIGN KEY([ssid])
REFERENCES [dbo].[Session] ([ssid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Session]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([suid])
REFERENCES [dbo].[Subject] ([suid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Group]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Student] FOREIGN KEY([roll_number])
REFERENCES [dbo].[Student] ([roll_number])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Student]
GO
USE [master]
GO
ALTER DATABASE [Assignment_PRJ301] SET  READ_WRITE 
GO
