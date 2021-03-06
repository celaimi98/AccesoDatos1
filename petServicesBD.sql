USE [master]
GO
/****** Object:  Database [petServices]    Script Date: 3/21/2020 9:38:29 PM ******/
CREATE DATABASE [petServices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'petServices', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.BASE1\MSSQL\DATA\petServices.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'petServices_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.BASE1\MSSQL\DATA\petServices_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [petServices] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [petServices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [petServices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [petServices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [petServices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [petServices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [petServices] SET ARITHABORT OFF 
GO
ALTER DATABASE [petServices] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [petServices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [petServices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [petServices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [petServices] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [petServices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [petServices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [petServices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [petServices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [petServices] SET  DISABLE_BROKER 
GO
ALTER DATABASE [petServices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [petServices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [petServices] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [petServices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [petServices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [petServices] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [petServices] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [petServices] SET RECOVERY FULL 
GO
ALTER DATABASE [petServices] SET  MULTI_USER 
GO
ALTER DATABASE [petServices] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [petServices] SET DB_CHAINING OFF 
GO
ALTER DATABASE [petServices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [petServices] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [petServices] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'petServices', N'ON'
GO
ALTER DATABASE [petServices] SET QUERY_STORE = OFF
GO
USE [petServices]
GO
/****** Object:  Table [dbo].[calificaciones]    Script Date: 3/21/2020 9:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calificaciones](
	[id_calificacion] [int] IDENTITY(1,1) NOT NULL,
	[id_servicio] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[calificacion] [int] NOT NULL,
	[comentario] [nvarchar](max) NULL,
 CONSTRAINT [PK_calificaciones] PRIMARY KEY CLUSTERED 
(
	[id_calificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 3/21/2020 9:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[correo] [varchar](50) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mascotas]    Script Date: 3/21/2020 9:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mascotas](
	[id_dueño] [int] NOT NULL,
	[id_mascota] [int] IDENTITY(1,1) NOT NULL,
	[nombre_mascota] [varchar](50) NOT NULL,
	[raza] [varchar](50) NOT NULL,
	[pdf_canet] [varchar](50) NULL,
 CONSTRAINT [PK_mascotas] PRIMARY KEY CLUSTERED 
(
	[id_mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reserva]    Script Date: 3/21/2020 9:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reserva](
	[id_reservacion] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_reservaservicio] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[total] [int] NOT NULL,
	[estadoreserva] [nchar](2) NOT NULL,
	[tipopago] [nvarchar](50) NOT NULL,
	[factura] [nchar](1) NOT NULL,
 CONSTRAINT [PK_reserva] PRIMARY KEY CLUSTERED 
(
	[id_reservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservaServico]    Script Date: 3/21/2020 9:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservaServico](
	[id_reservaservicio] [int] IDENTITY(1,1) NOT NULL,
	[id_servicio] [int] NOT NULL,
	[id_mascota] [int] NOT NULL,
 CONSTRAINT [PK_reservaServico] PRIMARY KEY CLUSTERED 
(
	[id_reservaservicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicios]    Script Date: 3/21/2020 9:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre_servicio] [nvarchar](50) NOT NULL,
	[descripcion_servicio] [nvarchar](max) NOT NULL,
	[imagen_servicio] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_servicios] PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 3/21/2020 9:38:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id_usuario], [nombre], [contraseña]) VALUES (1, N'AlejandroVelez', N'1234')
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [contraseña]) VALUES (2, N'pedro', N'12345')
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [contraseña]) VALUES (3, N'manuelty', N'8907')
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [contraseña]) VALUES (4, N'ASD', N'ASDF')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
ALTER TABLE [dbo].[calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_calificaciones_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[calificaciones] CHECK CONSTRAINT [FK_calificaciones_cliente]
GO
ALTER TABLE [dbo].[calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_calificaciones_servicios] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[calificaciones] CHECK CONSTRAINT [FK_calificaciones_servicios]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_usuario] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_usuario]
GO
ALTER TABLE [dbo].[mascotas]  WITH CHECK ADD  CONSTRAINT [FK_mascotas_dueñoCL] FOREIGN KEY([id_dueño])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[mascotas] CHECK CONSTRAINT [FK_mascotas_dueñoCL]
GO
ALTER TABLE [dbo].[reserva]  WITH CHECK ADD  CONSTRAINT [FK_reserva_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[reserva] CHECK CONSTRAINT [FK_reserva_cliente]
GO
ALTER TABLE [dbo].[reserva]  WITH CHECK ADD  CONSTRAINT [FK_reserva_reservaServicio] FOREIGN KEY([id_reservaservicio])
REFERENCES [dbo].[reservaServico] ([id_reservaservicio])
GO
ALTER TABLE [dbo].[reserva] CHECK CONSTRAINT [FK_reserva_reservaServicio]
GO
ALTER TABLE [dbo].[reservaServico]  WITH CHECK ADD  CONSTRAINT [FK_reservaServico_mascota] FOREIGN KEY([id_mascota])
REFERENCES [dbo].[mascotas] ([id_mascota])
GO
ALTER TABLE [dbo].[reservaServico] CHECK CONSTRAINT [FK_reservaServico_mascota]
GO
ALTER TABLE [dbo].[reservaServico]  WITH CHECK ADD  CONSTRAINT [FK_reservaServico_servico] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[reservaServico] CHECK CONSTRAINT [FK_reservaServico_servico]
GO
USE [master]
GO
ALTER DATABASE [petServices] SET  READ_WRITE 
GO
