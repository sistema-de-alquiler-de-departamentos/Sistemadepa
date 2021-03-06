USE [master]
GO
/****** Object:  Database [DB_A64E59_SALQUEZ]    Script Date: 27/07/2020 17:05:59 ******/
CREATE DATABASE [DB_A64E59_SALQUEZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_A64E59_SALQUEZ_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_A64E59_SALQUEZ_DATA.mdf' , SIZE = 8192KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'DB_A64E59_SALQUEZ_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_A64E59_SALQUEZ_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A64E59_SALQUEZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_A64E59_SALQUEZ]
GO
/****** Object:  Table [dbo].[Alerta]    Script Date: 27/07/2020 17:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alerta](
	[IDAlerta] [int] IDENTITY(1,1) NOT NULL,
	[IDInmueble] [int] NULL,
	[IDUsuario] [int] NULL,
	[IDUsuarioDestino] [int] NULL,
	[TipoAlerta] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Mensaje] [nvarchar](max) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Alerta] PRIMARY KEY CLUSTERED 
(
	[IDAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favoritos]    Script Date: 27/07/2020 17:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoritos](
	[IDFavoritos] [int] IDENTITY(1,1) NOT NULL,
	[IDInmueble] [int] NULL,
	[IDUsuario] [int] NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Favoritos] PRIMARY KEY CLUSTERED 
(
	[IDFavoritos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inmueble]    Script Date: 27/07/2020 17:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inmueble](
	[IDInmueble] [int] IDENTITY(1,1) NOT NULL,
	[IDUsuario] [int] NULL,
	[TipoInmueble] [nvarchar](50) NULL,
	[TipoOperacion] [nvarchar](50) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Ubicacion] [nvarchar](50) NULL,
	[IDDepartamento] [int] NULL,
	[IDProvincia] [int] NULL,
	[IDDistrito] [int] NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Precio] [int] NULL,
	[Dormitorios] [int] NULL,
	[Baños] [int] NULL,
	[Superficie] [int] NULL,
	[FechaPublicacion] [datetime] NULL,
	[Imagen] [nvarchar](max) NULL,
	[Imagen2] [nvarchar](max) NULL,
	[Imagen3] [nvarchar](max) NULL,
	[Latitud] [nvarchar](max) NULL,
	[Longitud] [nvarchar](max) NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[IDInmueble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UbigeoDepartamento]    Script Date: 27/07/2020 17:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbigeoDepartamento](
	[IDDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[Departamento] [nvarchar](50) NULL,
 CONSTRAINT [PK_UbigeoDepartamento] PRIMARY KEY CLUSTERED 
(
	[IDDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UbigeoDistritos]    Script Date: 27/07/2020 17:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbigeoDistritos](
	[IDDistrito] [int] IDENTITY(1,1) NOT NULL,
	[IDProvincia] [int] NULL,
	[Distrito] [nvarchar](50) NULL,
 CONSTRAINT [PK_UbigeoDistritos] PRIMARY KEY CLUSTERED 
(
	[IDDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UbigeoProvincia]    Script Date: 27/07/2020 17:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbigeoProvincia](
	[IDProvincia] [int] IDENTITY(1,1) NOT NULL,
	[IDDepartamento] [int] NULL,
	[Provincia] [nvarchar](50) NULL,
 CONSTRAINT [PK_UbigeoCiudad] PRIMARY KEY CLUSTERED 
(
	[IDProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/07/2020 17:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](200) NULL,
	[DNI] [int] NULL,
	[Tipo] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](max) NULL,
	[Telefono] [int] NULL,
	[Direccion] [nvarchar](max) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Alerta] ON 

INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (1, 2, 4, 3, N'Quiero que me llamen', N'71932372@continental.edu.pe', N'Vidal', N'924775964', N'', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (2, 2, 4, 3, N'Consulta', N'71932372@continental.edu.pe', N'Vidal Hugo', N'924775964', N'Quisera tener mas detalles', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (3, 2, 0, 3, N'Consulta', N'miemail@gmail.com', N'Maaria del pilar', N'834323', N'Tiene balcon?', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (4, 7, 4, 6, N'Consulta', N'71932372@continental.edu.pe', N'Vidal Hugo', N'924775964', N'Quisera tener mas detalles', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (5, 2, 8, 3, N'Consulta', N'71065219@continental.edu.pe', N'Najelly', N'955986325', N'si un terreno porque la imagen es de un departamen', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (6, 8, 8, 7, N'Consulta', N'71065219@continental.edu.pe', N'Najelly', N'955986325', N'reunion', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (7, 1, 4, 1, N'Consulta', N'71932372@continental.edu.pe', N'Vidal Hugo', N'924775964', N'Quisera tener mas detalles', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (8, 6, 4, 6, N'Quiero que me llamen', N'', N'Vidal', N'924775964', N'', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (9, 1, 0, 1, N'Quiero que me llamen', N'71932372@continental.edu.pe', N'Vidal', N'924775964', N'', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (10, 7, 4, 6, N'Quiero que me llamen', N'71932372@continental.edu.pe', N'Vidal', N'924775964', N'', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (11, 7, 4, 6, N'Consulta', N'71932372@continental.edu.pe', N'Vidal Hugo', N'924775964', N'Podemos negociar?', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (12, 10, 4, 3, N'Consulta', N'71932372@continental.edu.pe', N'Vidal Hugo', N'924775964', N'Quisera tener mas detalles', N'Pendiente')
INSERT [dbo].[Alerta] ([IDAlerta], [IDInmueble], [IDUsuario], [IDUsuarioDestino], [TipoAlerta], [Email], [Nombre], [Telefono], [Mensaje], [Estado]) VALUES (13, 10, 4, 3, N'Quiero que me llamen', N'71932372@continental.edu.pe', N'Vidal', N'924775964', N'', N'Pendiente')
SET IDENTITY_INSERT [dbo].[Alerta] OFF
SET IDENTITY_INSERT [dbo].[Favoritos] ON 

INSERT [dbo].[Favoritos] ([IDFavoritos], [IDInmueble], [IDUsuario], [Estado]) VALUES (2, 2, 4, N'Favorito')
INSERT [dbo].[Favoritos] ([IDFavoritos], [IDInmueble], [IDUsuario], [Estado]) VALUES (3, 7, 4, N'Favorito')
INSERT [dbo].[Favoritos] ([IDFavoritos], [IDInmueble], [IDUsuario], [Estado]) VALUES (4, 1, 4, N'Favorito')
INSERT [dbo].[Favoritos] ([IDFavoritos], [IDInmueble], [IDUsuario], [Estado]) VALUES (5, 10, 4, N'Favorito')
SET IDENTITY_INSERT [dbo].[Favoritos] OFF
SET IDENTITY_INSERT [dbo].[Inmueble] ON 

INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (1, 1, N'Departamento', N'Alquiler', N'Las 2 torres', N'jr.Tacna 245', 1, 1, 9, N'Alquilo bonito departamento', 650, 2, 1, 80, CAST(N'2020-07-24 11:52:08.000' AS DateTime), N'Img/Inmuebles/feature3.jpg', N'Img/Inmuebles/feature4.jpg', N'Img/Inmuebles/feature5.jpg', N'-12.061678986438736', N'-75.21356115875243')
INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (2, 3, N'Casa', N'Compra', N'Espinoza Casa', N'Jr huancavelica 2323 el tambo', 1, 1, 9, N'Gran terreno a la venta', 25000000, 5, 8, 500, CAST(N'2020-07-24 12:44:25.000' AS DateTime), N'Img/Inmuebles/Dep1.jpg', N'Img/Inmuebles/DEP7.png', N'Img/Inmuebles/Dep4.jpg', N'-12.06809999999998', N'-75.21008501586913')
INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (3, 3, N'Departamento', N'Alquiler', N'Espinoza Departamento', N'Jiron Libertad 939', 1, 1, 4, N'Departamento comodo para ustedes (Prohibido perros o gatos)', 1500, 5, 7, 150, CAST(N'2020-07-24 12:54:41.000' AS DateTime), N'Img/Inmuebles/Dep5.jpg', N'Img/Inmuebles/Dep2.webp', N'Img/Inmuebles/Dep3.jpg', N'-12.06809999999998', N'-75.21008501586913')
INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (4, 3, N'Departamento', N'Compra', N'Salva Departamento', N'Jr Salsedo 809 San Carlos', 1, 1, 7, N'Departamento a la venta', 150000, 8, 5, 190, CAST(N'2020-07-24 13:01:03.000' AS DateTime), N'Img/Inmuebles/DEP9.jpg', N'Img/Inmuebles/DEP9.jpg', N'Img/Inmuebles/Dep5.jpg', N'-12.06809999999998', N'-75.21008501586913')
INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (5, 3, N'Casa', N'Alquiler', N'Salva Casa', N'Jr Ayuntamiento 160 ', 1, 1, 12, N'Prohibido los niños', 850, 15, 8, 500, CAST(N'2020-07-24 13:05:38.000' AS DateTime), N'Img/Inmuebles/DEP8.jpg', N'Img/Inmuebles/Dep4.jpg', N'Img/Inmuebles/DEP9.jpg', N'-12.06809999999998', N'-75.21008501586913')
INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (6, 6, N'Departamento', N'Alquiler', N'Quispe departamento', N'Jr junin 315 y 2 de mayo', 1, 1, 18, N'Si daña algo lo paga , están permitido mascotas', 850, 7, 4, 150, CAST(N'2020-07-24 13:17:21.000' AS DateTime), N'Img/Inmuebles/DEP9.jpg', N'Img/Inmuebles/Dep2.webp', N'Img/Inmuebles/Dep1.jpg', N'-12.06809999999998', N'-75.21008501586913')
INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (7, 6, N'Casa', N'Alquiler', N'Quispe Casa', N'13 Noviembre y Junin', 1, 1, 18, N'Gran terreno en alquiler , no esta a la venta', 850, 15, 8, 500, CAST(N'2020-07-24 13:19:23.000' AS DateTime), N'Img/Inmuebles/casa.jpg', N'Img/Inmuebles/baños.jpg', N'Img/Inmuebles/interior.jfif', N'-12.06809999999998', N'-75.21008501586913')
INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (8, 7, N'Casa', N'Alquiler', N'Z.C.V. - casa', N'Av. Independencia 666', 1, 1, 9, N'Casa de dos pisos ubicación segura, tranquilidad y seguridad asegurada.', 1500, 4, 3, 100, CAST(N'2020-07-24 13:48:07.000' AS DateTime), N'Img/Inmuebles/casa 1.jfif', N'Img/Inmuebles/casa 2.jfif', N'Img/Inmuebles/casa 3.jfif', N'-12.06809999999998', N'-75.21008501586913')
INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (9, 3, N'Departamento', N'Alquiler', N'Espinoza Departamento', N'Jr libertad 245 el tambo', 1, 1, 6, N'Departamento comodo para ustedes (Prohibido perros o gatos)', 25000000, 15, 8, 500, CAST(N'2020-07-24 16:24:36.000' AS DateTime), N'Img/Inmuebles/fondodorado.jpg', N'Img/Inmuebles/Dep1.jpg', N'Img/Inmuebles/casa.jpg', N'-12.06809999999998', N'-75.21008501586913')
INSERT [dbo].[Inmueble] ([IDInmueble], [IDUsuario], [TipoInmueble], [TipoOperacion], [Nombre], [Ubicacion], [IDDepartamento], [IDProvincia], [IDDistrito], [Descripcion], [Precio], [Dormitorios], [Baños], [Superficie], [FechaPublicacion], [Imagen], [Imagen2], [Imagen3], [Latitud], [Longitud]) VALUES (10, 3, N'Departamento', N'Alquiler', N'Espinoza Departamento', N'Jr huancavelica 2323 el tambo', 1, 1, 12, N'Departamento comodo para ustedes (Prohibido perros o gatos)', 850, 15, 8, 150, CAST(N'2020-07-24 18:40:21.000' AS DateTime), N'Img/Inmuebles/DEPARTAMENTO 2.jfif', N'Img/Inmuebles/Dep6.jpg', N'Img/Inmuebles/Dep3.jpg', N'-12.06809999999998', N'-75.21008501586913')
SET IDENTITY_INSERT [dbo].[Inmueble] OFF
SET IDENTITY_INSERT [dbo].[UbigeoDepartamento] ON 

INSERT [dbo].[UbigeoDepartamento] ([IDDepartamento], [Departamento]) VALUES (1, N'Junin')
SET IDENTITY_INSERT [dbo].[UbigeoDepartamento] OFF
SET IDENTITY_INSERT [dbo].[UbigeoDistritos] ON 

INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (1, 1, N'Carhuacallanga')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (2, 1, N'Chacapampa')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (3, 1, N'Chicche')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (4, 1, N'Chilca')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (5, 1, N'Chongos Alto')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (6, 1, N'Chupuro')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (7, 1, N'Colca')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (8, 1, N'Cullhuas')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (9, 1, N'El Tambo')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (10, 1, N'Huacrapuquio')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (11, 1, N'Hualhuas')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (12, 1, N'Huancán')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (13, 1, N'Huancayo')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (14, 1, N'Ingenio')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (15, 1, N'Pilcomayo')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (16, 1, N'San Agustín de Cajas')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (17, 1, N'Sapallanga')
INSERT [dbo].[UbigeoDistritos] ([IDDistrito], [IDProvincia], [Distrito]) VALUES (18, 1, N'Sicaya')
SET IDENTITY_INSERT [dbo].[UbigeoDistritos] OFF
SET IDENTITY_INSERT [dbo].[UbigeoProvincia] ON 

INSERT [dbo].[UbigeoProvincia] ([IDProvincia], [IDDepartamento], [Provincia]) VALUES (1, 1, N'Huancayo')
INSERT [dbo].[UbigeoProvincia] ([IDProvincia], [IDDepartamento], [Provincia]) VALUES (2, 1, N'Concepción')
INSERT [dbo].[UbigeoProvincia] ([IDProvincia], [IDDepartamento], [Provincia]) VALUES (3, 1, N'Chanchamayo')
INSERT [dbo].[UbigeoProvincia] ([IDProvincia], [IDDepartamento], [Provincia]) VALUES (4, 1, N'Jauja')
INSERT [dbo].[UbigeoProvincia] ([IDProvincia], [IDDepartamento], [Provincia]) VALUES (5, 1, N'Junín')
INSERT [dbo].[UbigeoProvincia] ([IDProvincia], [IDDepartamento], [Provincia]) VALUES (6, 1, N'Satipo')
INSERT [dbo].[UbigeoProvincia] ([IDProvincia], [IDDepartamento], [Provincia]) VALUES (7, 1, N'Tarma')
INSERT [dbo].[UbigeoProvincia] ([IDProvincia], [IDDepartamento], [Provincia]) VALUES (8, 1, N'Yauli')
INSERT [dbo].[UbigeoProvincia] ([IDProvincia], [IDDepartamento], [Provincia]) VALUES (9, 1, N'Chupaca')
SET IDENTITY_INSERT [dbo].[UbigeoProvincia] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [DNI], [Tipo], [Email], [Password], [Telefono], [Direccion]) VALUES (1, N'matias', N'tomas tomas', 123456789, N'Arrendatario', N'matias@gmail.com', N'b03ddf3ca2e714a6548e7495e2a03f5e824eaac9837cd7f159c67b90fb4b7342', 987654321, N'jr.lima 3432')
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [DNI], [Tipo], [Email], [Password], [Telefono], [Direccion]) VALUES (2, N'Vidal Hugo', N'Espinoza Gallardo', 71932372, N'Arrendatario', N'71932372@continental.edu.pe', N'cf5834d23c8724a1fab7dd4a9ba79671fae2940c9813ef0cc8f006747ebec96e', 924775964, N'Jr Aguirre Morales 809')
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [DNI], [Tipo], [Email], [Password], [Telefono], [Direccion]) VALUES (3, N'Vidal Hugo', N'Espinoza Gallardo', 71932372, N'Arrendatario', N'71932372@continental.edu.pe', N'cf5834d23c8724a1fab7dd4a9ba79671fae2940c9813ef0cc8f006747ebec96e', 924775964, N'Jr Aguirre Morales 809')
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [DNI], [Tipo], [Email], [Password], [Telefono], [Direccion]) VALUES (4, N'Francisca', N'Gallardo Aira', 19931314, N'Cliente', N'vi71932372@hotmail.com', N'cf5834d23c8724a1fab7dd4a9ba79671fae2940c9813ef0cc8f006747ebec96e', 955976245, N'Jr Aguirre Morales 809')
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [DNI], [Tipo], [Email], [Password], [Telefono], [Direccion]) VALUES (5, N'alan', N'garcia garcia', 79453, N'Cliente', N'garcia@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 993453, N'jr.lima 3432')
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [DNI], [Tipo], [Email], [Password], [Telefono], [Direccion]) VALUES (6, N'Kevin', N'Santiago Sedano', 20082245, N'Arrendatario', N'askeimavidal@outlook.es', N'cf5834d23c8724a1fab7dd4a9ba79671fae2940c9813ef0cc8f006747ebec96e', 939292878, N'Jr Junin y 2 de mayo')
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [DNI], [Tipo], [Email], [Password], [Telefono], [Direccion]) VALUES (7, N'Zochil', N'Castillón Vilchez', 71065219, N'Arrendatario', N'Zochil_04@hotmail.com', N'a444947a0bfbf50775a6df4088dcd57abb6648c2bd04601d747742556ba1642a', 955976245, N'Av. Independencia #666')
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [DNI], [Tipo], [Email], [Password], [Telefono], [Direccion]) VALUES (8, N'Najelly', N'Castillo Castillon', 71065217, N'Cliente', N'71065219@continental.edu.pe', N'99e73a61489cba827828d8d01481cb624fef167f52131b7c1388e739f20792c6', 955936475, N'Jr. Isabel Flores de Oliva #666')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  StoredProcedure [dbo].[agregarfavorido]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[agregarfavorido]
@IDInmueble int,
@IDUsuario int,
@Estado nvarchar(50)
as
insert into Favoritos(IDInmueble, IDUsuario, Estado)
values(@IDInmueble, @IDUsuario, @Estado)

GO
/****** Object:  StoredProcedure [dbo].[cargardatosalerta]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[cargardatosalerta]
@IDInmueble int
as
select IDInmueble, IDUsuario,IDUsuarioDestino, TipoAlerta, Email, Nombre, Telefono, Mensaje, Estado from Alerta
where IDInmueble=@IDInmueble and TipoAlerta='Quiero que me llamen'

GO
/****** Object:  StoredProcedure [dbo].[cargardatosalertaconsulta]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[cargardatosalertaconsulta]
@IDInmueble int
as
select IDInmueble, IDUsuario,IDUsuarioDestino, TipoAlerta, Email, Nombre, Telefono, Mensaje, Estado from Alerta
where IDInmueble=@IDInmueble and TipoAlerta='Consulta'

GO
/****** Object:  StoredProcedure [dbo].[detalleinmueble]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[detalleinmueble]
@IDInmueble int
as
select IDInmueble, usu.IDUsuario,usu.Email,usu.Telefono, TipoInmueble, TipoOperacion, Nombre, Ubicacion, ubidepa.Departamento, ubiprovi.Provincia, ubidist.Distrito, Descripcion, Precio, Dormitorios, Baños, Superficie, FechaPublicacion, Imagen,Latitud,Longitud  from Inmueble inmu
inner join UbigeoDepartamento ubidepa
on
inmu.IDDepartamento=ubidepa.IDDepartamento
inner join UbigeoProvincia ubiprovi
on
inmu.IDProvincia=ubiprovi.IDProvincia
inner join UbigeoDistritos ubidist
on
inmu.IDDistrito=ubidist.IDDistrito

inner join Usuarios usu
on
inmu.IDUsuario=usu.IDUsuario
where
IDInmueble=@IDInmueble

GO
/****** Object:  StoredProcedure [dbo].[editarinmueble]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[editarinmueble]
@IDInmueble int, 
@IDUsuario int, 
@TipoInmueble nvarchar(50), 
@TipoOperacion nvarchar(50), 
@Nombre nvarchar(50), 
@Ubicacion nvarchar(50), 
@IDDepartamento int, 
@IDProvincia int, 
@IDDistrito int, 
@Descripcion nvarchar(MAX), 
@Precio int, 
@Dormitorios int, 
@Baños int, 
@Superficie int, 
@FechaPublicacion datetime, 
@Imagen nvarchar(max)

as
update Inmueble
set 
	IDUsuario=@IDUsuario, 
	TipoInmueble=@TipoInmueble, 
	TipoOperacion=@TipoOperacion, 
	Nombre=@Nombre, 
	Ubicacion=@Ubicacion, 
	IDDepartamento=@IDDepartamento, 
	IDProvincia=@IDProvincia, 
	IDDistrito=@IDDistrito, 
	Descripcion=@Descripcion, 
	Precio=@Precio, 
	Dormitorios=@Dormitorios, 
	Baños=@Baños, 
	Superficie=@Superficie, 
	FechaPublicacion=@FechaPublicacion, 
	Imagen=@Imagen
	
where IDInmueble=@IDInmueble 

GO
/****** Object:  StoredProcedure [dbo].[insertarconsulta]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertarconsulta]
@IDInmueble int, 
@IDUsuario int, 
@IDUsuarioDestino int,
@TipoAlerta nvarchar(50), 
@Email nvarchar(50), 
@Nombre nvarchar(50), 
@Telefono int, 
@Mensaje nvarchar(50), 
@Estado nvarchar(50)
as
insert into Alerta(IDInmueble, IDUsuario,IDUsuarioDestino, TipoAlerta, Email, Nombre, Telefono, Mensaje, Estado)
values(@IDInmueble,@IDUsuario,@IDUsuarioDestino,@TipoAlerta,@Email,@Nombre,@Telefono,@Mensaje,@Estado)

GO
/****** Object:  StoredProcedure [dbo].[inspublicarinmueble]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[inspublicarinmueble]
@IDUsuario int,
@TipoInmueble nvarchar(50),
@TipoOperacion nvarchar(50),
@Nombre nvarchar(50),
@Ubicacion nvarchar(50),
@IDDepartamento int,
@IDProvincia int,
@IDDistrito int,
@Descripcion nvarchar(50),
@Precio int,
@Dormitorios int,
@Baños int,
@Superficie int,
@FechaPublicacion datetime,
@Imagen nvarchar(MAX)
as
insert into Inmueble(IDUsuario,TipoInmueble,TipoOperacion,Nombre, Ubicacion, IDDepartamento, IDProvincia, IDDistrito, Descripcion, Precio, Dormitorios, Baños, Superficie, FechaPublicacion, Imagen)
values(@IDUsuario,@TipoInmueble,@TipoOperacion,@Nombre,@Ubicacion,@IDDepartamento,@IDProvincia,@IDDistrito,@Descripcion,@Precio,@Dormitorios,@Baños,@Superficie,@FechaPublicacion, @Imagen)

GO
/****** Object:  StoredProcedure [dbo].[listardepartamentos]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[listardepartamentos]
as
select IDDepartamento, Departamento from UbigeoDepartamento

GO
/****** Object:  StoredProcedure [dbo].[listardistrito]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listardistrito]
@IDProvincia int
as
select IDDistrito, IDProvincia, Distrito from UbigeoDistritos
where (IDProvincia = @IDProvincia)

GO
/****** Object:  StoredProcedure [dbo].[listarmipublicacion]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listarmipublicacion]
@IDInmueble int,
@IDUsuario int
as
select IDInmueble,IDUsuario,TipoInmueble,TipoOperacion, Nombre, Ubicacion, ubidepa.IDDepartamento, ubiprovi.IDProvincia, ubidist.IDDistrito, Descripcion, Precio, Dormitorios, Baños, Superficie,FechaPublicacion, Imagen from Inmueble inmueble
inner join UbigeoDepartamento ubidepa
on
inmueble.IDDepartamento=ubidepa.IDDepartamento
inner join UbigeoProvincia ubiprovi
on
inmueble.IDProvincia=ubiprovi.IDProvincia
inner join UbigeoDistritos ubidist
on
inmueble.IDDistrito=ubidist.IDDistrito
where inmueble.IDInmueble=@IDInmueble and inmueble.IDUsuario=@IDUsuario
order by inmueble.Precio

GO
/****** Object:  StoredProcedure [dbo].[listarprovincia]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listarprovincia]
@IDDepartamento int
as
select IDProvincia, IDDepartamento,Provincia from UbigeoProvincia
where (IDDepartamento = @IDDepartamento)

GO
/****** Object:  StoredProcedure [dbo].[publicarinmueble]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[publicarinmueble] 
@IDUsuario int, 
@TipoInmueble nvarchar(50), 
@TipoOperacion nvarchar(50),
@Nombre nvarchar(50),
@Ubicacion nvarchar(50),
@IDDepartamento nvarchar(50),
@IDProvincia nvarchar(50), 
@IDDistrito nvarchar(50),
@Descripcion nvarchar(max), 
@Precio nvarchar(50), 
@Dormitorios nvarchar(50),
@Baños nvarchar(50), 
@Superficie nvarchar(50), 
@FechaPublicacion datetime, 
@Imagen nvarchar(max),
@Imagen2 nvarchar(max),
@Imagen3 nvarchar(max),
@Latitud nvarchar(max),
@Longitud nvarchar(max)
as insert into Inmueble(IDUsuario, TipoInmueble, TipoOperacion, Nombre, Ubicacion, IDDepartamento, IDProvincia, IDDistrito, Descripcion, Precio, Dormitorios, Baños, Superficie, FechaPublicacion, Imagen,Imagen2,Imagen3,Latitud,Longitud)
values
(@IDUsuario, @TipoInmueble, @TipoOperacion, @Nombre, @Ubicacion, @IDDepartamento, @IDProvincia, @IDDistrito, @Descripcion, @Precio, @Dormitorios, @Baños, @Superficie, @FechaPublicacion, @Imagen,@Imagen2,@Imagen3,@Latitud,@Longitud)

GO
/****** Object:  StoredProcedure [dbo].[registrarusuarios]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registrarusuarios]
@Nombres nvarchar(50),
@Apellidos nvarchar(200),
@DNI int,
@Tipo nvarchar(50),
@Email nvarchar(200),
@Password nvarchar(max),
@Telefono int,
@Direccion nvarchar(max)
as
insert into Usuarios(Nombres, Apellidos, DNI, Tipo, Email, Password, Telefono, Direccion)
values(@Nombres, @Apellidos, @DNI, @Tipo, @Email, @Password, @Telefono, @Direccion)

GO
/****** Object:  StoredProcedure [dbo].[sesionusuario]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sesionusuario]
@Email nvarchar(200),
@Password nvarchar(MAX)
as
select IDUsuario, Nombres, Apellidos, DNI, Tipo, Email, Password, Telefono, Direccion  from Usuarios
where
Email=@Email and Password=@Password

GO
/****** Object:  StoredProcedure [dbo].[SP_BindAlertas]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BindAlertas]
@IDUsuario int,
@TipoAlerta nvarchar(50)
as
select IDInmueble, IDUsuario, TipoAlerta, Email, Nombre, Telefono, Mensaje, Estado from Alerta
where IDUsuarioDestino=@IDUsuario and TipoAlerta=@TipoAlerta


GO
/****** Object:  StoredProcedure [dbo].[SP_BindAlertas2]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_BindAlertas2]
@IDUsuario int,
@TipoAlerta nvarchar(50)
as
select IDInmueble, IDUsuario, TipoAlerta, Email, Nombre, Telefono, Mensaje, Estado from Alerta
where IDUsuarioDestino=@IDUsuario and TipoAlerta=@TipoAlerta

GO
/****** Object:  StoredProcedure [dbo].[SP_BindCasa]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_BindCasa]
as
select IDUsuario,TipoInmueble,TipoOperacion, Nombre, Ubicacion, ubidepa.Departamento, ubiprovi.Provincia, ubidist.Distrito, Descripcion, Precio, Dormitorios, Baños, Superficie, Imagen,IDInmueble from Inmueble inmueble
inner join UbigeoDepartamento ubidepa
on
inmueble.IDDepartamento=ubidepa.IDDepartamento
inner join UbigeoProvincia ubiprovi
on
inmueble.IDProvincia=ubiprovi.IDProvincia
inner join UbigeoDistritos ubidist
on
inmueble.IDDistrito=ubidist.IDDistrito
where inmueble.TipoInmueble='Casa'
order by inmueble.Precio

GO
/****** Object:  StoredProcedure [dbo].[SP_BindDepartamento]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_BindDepartamento]
as
select IDUsuario,TipoInmueble,TipoOperacion, Nombre, Ubicacion, ubidepa.Departamento, ubiprovi.Provincia, ubidist.Distrito, Descripcion, Precio, Dormitorios, Baños, Superficie, Imagen,IDInmueble from Inmueble inmueble
inner join UbigeoDepartamento ubidepa
on
inmueble.IDDepartamento=ubidepa.IDDepartamento
inner join UbigeoProvincia ubiprovi
on
inmueble.IDProvincia=ubiprovi.IDProvincia
inner join UbigeoDistritos ubidist
on
inmueble.IDDistrito=ubidist.IDDistrito
where inmueble.TipoInmueble='Departamento'
order by inmueble.Precio

GO
/****** Object:  StoredProcedure [dbo].[SP_BindDetalleInmueble]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BindDetalleInmueble]
@IDInmueble int
as
select IDUsuario,TipoInmueble,TipoOperacion, Nombre, Ubicacion, ubidepa.Departamento, ubiprovi.Provincia, ubidist.Distrito, Descripcion, Precio, Dormitorios, Baños, Superficie, Imagen,Imagen2,Imagen3,Latitud,Longitud,IDInmueble from Inmueble inmueble
inner join UbigeoDepartamento ubidepa
on
inmueble.IDDepartamento=ubidepa.IDDepartamento
inner join UbigeoProvincia ubiprovi
on
inmueble.IDProvincia=ubiprovi.IDProvincia
inner join UbigeoDistritos ubidist
on
inmueble.IDDistrito=ubidist.IDDistrito
where inmueble.IDInmueble=@IDInmueble


GO
/****** Object:  StoredProcedure [dbo].[SP_BindInmueble]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BindInmueble]
as
select IDUsuario,TipoInmueble,TipoOperacion, Nombre, Ubicacion, ubidepa.Departamento, ubiprovi.Provincia, ubidist.Distrito, Descripcion, Precio, Dormitorios, Baños, Superficie, Imagen,IDInmueble from Inmueble inmueble
inner join UbigeoDepartamento ubidepa
on
inmueble.IDDepartamento=ubidepa.IDDepartamento
inner join UbigeoProvincia ubiprovi
on
inmueble.IDProvincia=ubiprovi.IDProvincia
inner join UbigeoDistritos ubidist
on
inmueble.IDDistrito=ubidist.IDDistrito
order by inmueble.Precio

GO
/****** Object:  StoredProcedure [dbo].[SP_BindInmuebleBuscar]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BindInmuebleBuscar]
@Ubicacion nvarchar(50),
@IDDepartamento int,
@IDProvincia int,
@IDDistrito int,
@Dormitorios int,
@Baños int,
@TipoInmueble nvarchar(50),
@TipoOperacion nvarchar(50)
as
select IDUsuario,TipoInmueble,TipoOperacion, Nombre, Ubicacion, ubidepa.Departamento, ubiprovi.Provincia, ubidist.Distrito, Descripcion, Precio, Dormitorios, Baños, Superficie, Imagen,IDInmueble from Inmueble inmueble
inner join UbigeoDepartamento ubidepa
on
inmueble.IDDepartamento=ubidepa.IDDepartamento
inner join UbigeoProvincia ubiprovi
on
inmueble.IDProvincia=ubiprovi.IDProvincia
inner join UbigeoDistritos ubidist
on
inmueble.IDDistrito=ubidist.IDDistrito
where ((@Ubicacion is null) or (inmueble.Ubicacion like '%' + @Ubicacion + '%'))
and ((@IDDepartamento is null) or (inmueble.IDDepartamento=@IDDepartamento))
and ((@IDProvincia is null) or (inmueble.IDProvincia=@IDProvincia))
and ((@IDDistrito is null) or (inmueble.IDDistrito=@IDDistrito))
and ((@Dormitorios is null) or (inmueble.Dormitorios=@Dormitorios))
and ((@Baños is null) or (inmueble.Baños=@Baños))
and ((@TipoInmueble is null) or (inmueble.TipoInmueble=@TipoInmueble))
and ((@TipoOperacion is null) or (inmueble.TipoOperacion=@TipoOperacion))

GO
/****** Object:  StoredProcedure [dbo].[SP_BindInmuebleFavoritos]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_BindInmuebleFavoritos]
@IDUsuario int
as
select IDFavoritos,fav.IDInmueble, fav.IDUsuario,inmueble.TipoInmueble,inmueble.TipoOperacion,inmueble.Nombre,inmueble.Ubicacion,ubidepa.Departamento,ubiprovi.Provincia,ubidist.Distrito,inmueble.Descripcion,inmueble.Precio,inmueble.Dormitorios,inmueble.Baños,inmueble.Superficie,inmueble.FechaPublicacion,inmueble.Imagen, Estado from Favoritos fav
inner join Inmueble inmueble
on
fav.IDInmueble=inmueble.IDInmueble
inner join UbigeoDepartamento ubidepa
on
inmueble.IDDepartamento=ubidepa.IDDepartamento
inner join UbigeoProvincia ubiprovi
on
inmueble.IDProvincia=ubiprovi.IDProvincia
inner join UbigeoDistritos ubidist
on
inmueble.IDDistrito=ubidist.IDDistrito
where fav.IDUsuario=@IDUsuario
order by inmueble.Precio

GO
/****** Object:  StoredProcedure [dbo].[SP_BindMisPublicaciones]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_BindMisPublicaciones]
@IDUsuario int
as
select IDUsuario,TipoInmueble,TipoOperacion, Nombre, Ubicacion, ubidepa.Departamento, ubiprovi.Provincia, ubidist.Distrito, Descripcion, Precio, Dormitorios, Baños, Superficie, Imagen,IDInmueble from Inmueble inmueble
inner join UbigeoDepartamento ubidepa
on
inmueble.IDDepartamento=ubidepa.IDDepartamento
inner join UbigeoProvincia ubiprovi
on
inmueble.IDProvincia=ubiprovi.IDProvincia
inner join UbigeoDistritos ubidist
on
inmueble.IDDistrito=ubidist.IDDistrito
where inmueble.IDUsuario=@IDUsuario
order by inmueble.Precio


GO
/****** Object:  StoredProcedure [dbo].[spBuscarSiTieneFavoritos]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spBuscarSiTieneFavoritos]
@IDInmueble int,
@IDUsuario int
as
select IDFavoritos, IDInmueble, IDUsuario, Estado from Favoritos
where IDInmueble=@IDInmueble and IDUsuario=@IDUsuario


GO
/****** Object:  StoredProcedure [dbo].[speliminarfavoritos]    Script Date: 27/07/2020 17:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[speliminarfavoritos]
@IDFavoritos int,
@IDInmueble int,
@IDUsuario int
as
delete from Favoritos where IDFavoritos=@IDFavoritos and IDInmueble=@IDInmueble and IDUsuario=@IDUsuario


GO
USE [master]
GO
ALTER DATABASE [DB_A64E59_SALQUEZ] SET  READ_WRITE 
GO
