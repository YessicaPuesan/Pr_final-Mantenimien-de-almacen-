USE [master]
GO
/****** Object:  Database [Almacen]    Script Date: 4/18/2020 11:42:48 PM ******/
CREATE DATABASE [Almacen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Almacen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Almacen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Almacen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Almacen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Almacen] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Almacen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Almacen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Almacen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Almacen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Almacen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Almacen] SET ARITHABORT OFF 
GO
ALTER DATABASE [Almacen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Almacen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Almacen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Almacen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Almacen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Almacen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Almacen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Almacen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Almacen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Almacen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Almacen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Almacen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Almacen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Almacen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Almacen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Almacen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Almacen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Almacen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Almacen] SET  MULTI_USER 
GO
ALTER DATABASE [Almacen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Almacen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Almacen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Almacen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Almacen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Almacen] SET QUERY_STORE = OFF
GO
USE [Almacen]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 4/18/2020 11:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Apellido] [varchar](30) NULL,
	[Direccion] [varchar](30) NULL,
	[Telefono] [varchar](30) NULL,
	[Correo] [varchar](30) NULL,
	[TipoCliente] [varchar](30) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[despachos]    Script Date: 4/18/2020 11:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[despachos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [varchar](30) NULL,
	[TipoDeAccion] [varchar](30) NULL,
	[Cliente] [varchar](30) NOT NULL,
	[contacto] [varchar](30) NULL,
	[detalles] [varchar](30) NULL,
 CONSTRAINT [PK_despachos] PRIMARY KEY CLUSTERED 
(
	[Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 4/18/2020 11:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [int] NULL,
	[Fecha_creacion] [varchar](30) NULL,
	[Fecha_venci] [varchar](30) NULL,
	[nombre] [varchar](30) NULL,
	[descripcion] [varchar](30) NULL,
	[udm] [varchar](30) NULL,
	[costo] [money] NULL,
	[existencia] [varchar](30) NULL,
	[estado] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 4/18/2020 11:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellido] [varchar](30) NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[rol] [varchar](30) NULL,
	[estado] [varchar](30) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[despachos]  WITH CHECK ADD  CONSTRAINT [FK_despachos_despachos] FOREIGN KEY([Cliente])
REFERENCES [dbo].[despachos] ([Cliente])
GO
ALTER TABLE [dbo].[despachos] CHECK CONSTRAINT [FK_despachos_despachos]
GO
USE [master]
GO
ALTER DATABASE [Almacen] SET  READ_WRITE 
GO
