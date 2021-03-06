USE [master]
GO
/****** Object:  Database [Prf]    Script Date: 11/11/2020 10:06:00 p. m. ******/
CREATE DATABASE [Prf]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Prf.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prf_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Prf_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Prf] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prf].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prf] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prf] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prf] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prf] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prf] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prf] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prf] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prf] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prf] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prf] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prf] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prf] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prf] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prf] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prf] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prf] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prf] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prf] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prf] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prf] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prf] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prf] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prf] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Prf] SET  MULTI_USER 
GO
ALTER DATABASE [Prf] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prf] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prf] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prf] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prf] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prf] SET QUERY_STORE = OFF
GO
USE [Prf]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/11/2020 10:06:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [nvarchar](60) NOT NULL,
	[Nombre] [nvarchar](60) NOT NULL,
	[Descuento] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 11/11/2020 10:06:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[codRegion] [int] NOT NULL,
	[codPais] [int] NOT NULL,
	[Pais] [varchar](50) NOT NULL,
	[Tarifa] [numeric](16, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 11/11/2020 10:06:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[codRegion] [int] NOT NULL,
	[NombreRegion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[codRegion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pais] ADD  CONSTRAINT [DF_Pais_Tarifa]  DEFAULT ((0)) FOR [Tarifa]
GO
ALTER TABLE [dbo].[Pais]  WITH CHECK ADD  CONSTRAINT [FK_Pais_Region] FOREIGN KEY([codRegion])
REFERENCES [dbo].[Region] ([codRegion])
GO
ALTER TABLE [dbo].[Pais] CHECK CONSTRAINT [FK_Pais_Region]
GO
/****** Object:  StoredProcedure [dbo].[pa_sel_calcula_tarifa]    Script Date: 11/11/2020 10:06:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pa_sel_calcula_tarifa]
@peso numeric(10,2),
@largo numeric(10,2),
@ancho numeric(10,2),
@alto numeric(10,2),
@codPais int,
@idCliente varchar(60)
as

	declare @tarifaPais as numeric(10,2)
	select @tarifaPais = tarifa from pais where codPais = @codPais
	print 'Tarifa Pais: ' + cast(@tarifaPais as varchar)

	declare @descuentoCliente as numeric(10,2)
	select @descuentoCliente = Descuento from cliente where idCliente = @idCliente


	declare @tarifa as numeric(10,2)
	declare @descuento as numeric(10,2)

	set @tarifa = (@tarifaPais * @peso) * @alto * @ancho * @largo
	print 'Tarifa: ' + cast(@tarifa as varchar)
	set @descuento = (@descuentoCliente * @peso) * 0.5 
	print 'Descuento: ' + cast(@descuento as varchar)

	select @tarifa - @descuento as tarifa

GO
USE [master]
GO
ALTER DATABASE [Prf] SET  READ_WRITE 
GO
