USE [master]
GO
/****** Object:  Database [universitymanagement_elegant]    Script Date: 4/28/2019 6:40:13 PM ******/
CREATE DATABASE [universitymanagement_elegant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'universitymanagement_elegant', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\universitymanagement_elegant.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'universitymanagement_elegant_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\universitymanagement_elegant_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [universitymanagement_elegant] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [universitymanagement_elegant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [universitymanagement_elegant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET ARITHABORT OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [universitymanagement_elegant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [universitymanagement_elegant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [universitymanagement_elegant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET  DISABLE_BROKER 
GO
ALTER DATABASE [universitymanagement_elegant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [universitymanagement_elegant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [universitymanagement_elegant] SET  MULTI_USER 
GO
ALTER DATABASE [universitymanagement_elegant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [universitymanagement_elegant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [universitymanagement_elegant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [universitymanagement_elegant] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [universitymanagement_elegant]
GO
/****** Object:  Table [dbo].[ClassRoomAssign]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRoomAssign](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[day_id] [int] NOT NULL,
	[from_time] [time](7) NOT NULL,
	[to_time] [time](7) NOT NULL,
 CONSTRAINT [PK_ClassRoomAssign] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_code] [varchar](50) NOT NULL,
	[course_name] [varchar](100) NOT NULL,
	[course_credit] [decimal](18, 2) NOT NULL,
	[course_description] [varchar](100) NULL,
	[department_id] [int] NOT NULL,
	[semester_id] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignStudent]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignStudent](
	[courseassignstudent_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[courseassignstudentdate] [date] NOT NULL,
 CONSTRAINT [PK_CourseAssignStudent] PRIMARY KEY CLUSTERED 
(
	[courseassignstudent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseAssignTeacher]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignTeacher](
	[courseassignteacher_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignTeacher] PRIMARY KEY CLUSTERED 
(
	[courseassignteacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[day_id] [int] IDENTITY(1,1) NOT NULL,
	[day_name] [varchar](15) NOT NULL,
	[day_shortform] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[day_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](200) NOT NULL,
	[department_code] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[designation_id] [int] IDENTITY(1,1) NOT NULL,
	[designation_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[designation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[grade_name] [varchar](8) NOT NULL,
	[grade_point] [float] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_no] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[semester_id] [int] IDENTITY(1,1) NOT NULL,
	[semester_name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[student_regno] [varchar](50) NOT NULL,
	[student_name] [varchar](50) NOT NULL,
	[student_email] [varchar](50) NOT NULL,
	[student_contact] [varchar](50) NOT NULL,
	[student_joindate] [date] NOT NULL,
	[student_address] [varchar](50) NULL,
	[department_id] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[grade_id] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[teacher_id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_name] [varchar](50) NOT NULL,
	[teacher_address] [varchar](50) NULL,
	[teacher_email] [varchar](50) NOT NULL,
	[teacher_contact] [varchar](50) NOT NULL,
	[teacher_designation] [int] NOT NULL,
	[department_id] [int] NOT NULL,
	[teacher_totalcredit] [int] NOT NULL,
	[teacher_remaincredit] [int] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CourseStaticsView]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseStaticsView]
AS
SELECT        dbo.Course.course_code, dbo.Course.course_name, dbo.Department.department_id, dbo.Semester.semester_name, dbo.CourseAssignTeacher.teacher_id, dbo.Teacher.teacher_name
FROM            dbo.Course INNER JOIN
                         dbo.Department ON dbo.Course.department_id = dbo.Department.department_id INNER JOIN
                         dbo.Semester ON dbo.Course.semester_id = dbo.Semester.semester_id LEFT OUTER JOIN
                         dbo.CourseAssignTeacher ON dbo.Course.course_id = dbo.CourseAssignTeacher.course_id LEFT OUTER JOIN
                         dbo.Teacher ON dbo.CourseAssignTeacher.teacher_id = dbo.Teacher.teacher_id

GO
/****** Object:  View [dbo].[ShowRoomAllocation]    Script Date: 4/28/2019 6:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ShowRoomAllocation] as
SELECT D.department_id, R.room_no, C.course_code, C.course_name, D.department_name, dbo.Day.day_shortform, CONVERT(varchar(15), CA.from_time, 100) AS from_time, CONVERT(varchar(15), CA.to_time, 100) AS to_time
FROM     dbo.Department AS D INNER JOIN
                  dbo.Course AS C ON C.department_id = D.department_id LEFT OUTER JOIN
                  dbo.ClassRoomAssign AS CA ON C.course_id = CA.course_id LEFT OUTER JOIN
                  dbo.Day ON CA.day_id = dbo.Day.day_id LEFT OUTER JOIN
                  dbo.Room AS R ON R.room_id = CA.room_id
GO
SET IDENTITY_INSERT [dbo].[ClassRoomAssign] ON 

INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1004, 12, 1003, 1, 1, CAST(0x070040230E430000 AS Time), CAST(0x0700EC460A4A0000 AS Time))
INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1005, 12, 1004, 2, 1, CAST(0x070040230E430000 AS Time), CAST(0x0700EC460A4A0000 AS Time))
INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1006, 12, 1004, 1, 1, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x0700540B6C520000 AS Time))
INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1007, 12, 1005, 1, 1, CAST(0x0700540B6C520000 AS Time), CAST(0x0700002F68590000 AS Time))
INSERT [dbo].[ClassRoomAssign] ([class_id], [department_id], [course_id], [room_id], [day_id], [from_time], [to_time]) VALUES (1008, 13, 1010, 2, 1, CAST(0x0700EC460A4A0000 AS Time), CAST(0x0700986A06510000 AS Time))
SET IDENTITY_INSERT [dbo].[ClassRoomAssign] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1003, N'CSE101', N'C Programming', CAST(3.00 AS Decimal(18, 2)), N'', 12, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1004, N'CSE102', N'Math-1', CAST(3.00 AS Decimal(18, 2)), N'', 12, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1005, N'CSE103', N'English 1', CAST(3.00 AS Decimal(18, 2)), N'', 12, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1006, N'CSE105', N'Computer Fundamental', CAST(3.00 AS Decimal(18, 2)), N'', 12, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1007, N'CE101', N'Meterial Concept', CAST(3.00 AS Decimal(18, 2)), N'', 14, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1008, N'CE102', N'Basic Structure Design', CAST(2.00 AS Decimal(18, 2)), N'', 14, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1009, N'CE103', N'Engineering Math', CAST(3.00 AS Decimal(18, 2)), N'', 14, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1010, N'EEE101', N'Basic Electronics', CAST(3.00 AS Decimal(18, 2)), N'', 13, 1)
INSERT [dbo].[Course] ([course_id], [course_code], [course_name], [course_credit], [course_description], [department_id], [semester_id]) VALUES (1011, N'EEE102', N'Semiconductor', CAST(2.00 AS Decimal(18, 2)), N'', 13, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignStudent] ON 

INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1006, 10, 1003, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1007, 10, 1004, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1008, 10, 1006, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1009, 11, 1003, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1010, 11, 1006, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1011, 11, 1005, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1012, 13, 1010, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1013, 13, 1011, CAST(0x913F0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1014, 14, 1008, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([courseassignstudent_id], [student_id], [course_id], [courseassignstudentdate]) VALUES (1015, 14, 1009, CAST(0x983F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[CourseAssignStudent] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignTeacher] ON 

INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1005, 12, 3, 1003)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1006, 12, 3, 1006)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1007, 12, 4, 1004)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1008, 12, 4, 1005)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1009, 13, 5, 1010)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1010, 13, 7, 1011)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1011, 14, 8, 1007)
INSERT [dbo].[CourseAssignTeacher] ([courseassignteacher_id], [department_id], [teacher_id], [course_id]) VALUES (1012, 14, 8, 1009)
SET IDENTITY_INSERT [dbo].[CourseAssignTeacher] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (1, N'Saturday', N'Sat')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (2, N'Sunday', N'Sun')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (3, N'Monday', N'Mon')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (4, N'Tuesday', N'Tue')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (5, N'Wednesday', N'Wed')
INSERT [dbo].[Day] ([day_id], [day_name], [day_shortform]) VALUES (6, N'Thursday', N'Thu')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (12, N'Computer Science and Engineering', N'CSE')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (13, N'Electronics & Electrical Engineering', N'EEE')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (14, N'Civil Engineering', N'CE')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (15, N'Architecture', N'ART')
INSERT [dbo].[Department] ([department_id], [department_name], [department_code]) VALUES (16, N'Bachalor of Business Administrator', N'BBA')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([designation_id], [designation_name]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([designation_id], [designation_name]) VALUES (2, N'Associate Professor')
INSERT [dbo].[Designation] ([designation_id], [designation_name]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[Designation] ([designation_id], [designation_name]) VALUES (4, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (1, N'A+', 4)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (2, N'A', 3.75)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (3, N'A-', 3.5)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (4, N'B+', 3.25)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (5, N'B', 3)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (6, N'B-', 2.75)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (7, N'C+', 2.5)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (8, N'C', 2.25)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (9, N'D', 2)
INSERT [dbo].[Grade] ([grade_id], [grade_name], [grade_point]) VALUES (10, N'F', 0)
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (1, N'101')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (2, N'102')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (3, N'201')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (4, N'202')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (5, N'301')
INSERT [dbo].[Room] ([room_id], [room_no]) VALUES (6, N'302')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (10, N'CSE-2019-001', N'Amaz Uddin Tutul', N'amaz@gmail.com', N'017485421456', CAST(0x983F0B00 AS Date), N'Agrabad, Chittagong', 12)
INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (11, N'CSE-2019-002', N'Refat Khan', N'refat93@gmail.com', N'01755001451', CAST(0x983F0B00 AS Date), N'Katghor, Chittagong', 12)
INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (12, N'CSE-2019-003', N'Shusmita Dey', N'panda@gmail.com', N'01887548774', CAST(0x983F0B00 AS Date), N'Laldighi, Chittagong', 12)
INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (13, N'EEE-2019-001', N'Israt Jahan Shorna', N'shorna@gmail.com', N'0148752245865', CAST(0x983F0B00 AS Date), N'Agrabad, Chittagong', 13)
INSERT [dbo].[Student] ([student_id], [student_regno], [student_name], [student_email], [student_contact], [student_joindate], [student_address], [department_id]) VALUES (14, N'CE-2019-001', N'Ehsan Islam', N'ehsan@gmail.com', N'01456987758', CAST(0x983F0B00 AS Date), N'Agrabad, Chittagong', 14)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([result_id], [student_id], [course_id], [grade_id]) VALUES (1003, 10, 1003, 2)
INSERT [dbo].[StudentResult] ([result_id], [student_id], [course_id], [grade_id]) VALUES (1004, 10, 1004, 2)
INSERT [dbo].[StudentResult] ([result_id], [student_id], [course_id], [grade_id]) VALUES (1005, 10, 1006, 1)
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (3, N'Minhaj Hossain', N'Andorkilla,Chittagong', N'minhajcuet@gmail.com', N'01755001451', 2, 12, 15, 9)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (4, N'Linkon Chowdhury', N'Katghor,Patenga', N'linkoncuet@gmail.com', N'01755501455', 2, 12, 15, 9)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (5, N'Rashed Mostofa', N'Bohaddarhat,Chittagong', N'rahedcu@gmail.com', N'012345678912', 3, 13, 20, 17)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (6, N'Niaz Uddin', N'CDA agrabad, Chittagong', N'niazcu@gmail.com', N'01548774526', 4, 14, 15, 15)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (7, N'Ebrahim Abedin', N'Agrabad, Chittagong', N'ebrahimcuet@gmail.com', N'014521544585', 1, 13, 15, 13)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_address], [teacher_email], [teacher_contact], [teacher_designation], [department_id], [teacher_totalcredit], [teacher_remaincredit]) VALUES (8, N'Babul dev', N'Halishohor, Chittagong', N'babuldev@hotmail.com', N'01785421401', 1, 14, 15, 9)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[10] 4[51] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 264
               Bottom = 119
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Semester"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 102
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseAssignTeacher"
            Begin Extent = 
               Top = 102
               Left = 488
               Bottom = 232
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Teacher"
            Begin Extent = 
               Top = 120
               Left = 264
               Bottom = 250
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseStaticsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseStaticsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseStaticsView'
GO
USE [master]
GO
ALTER DATABASE [universitymanagement_elegant] SET  READ_WRITE 
GO
