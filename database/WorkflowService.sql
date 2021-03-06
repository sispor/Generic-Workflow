USE [master]
GO
/****** Object:  Database [workflowService]    Script Date: 7/17/2018 4:55:33 PM ******/
CREATE DATABASE [workflowService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'workflowService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\workflowService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'workflowService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\workflowService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [workflowService] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [workflowService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [workflowService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [workflowService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [workflowService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [workflowService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [workflowService] SET ARITHABORT OFF 
GO
ALTER DATABASE [workflowService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [workflowService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [workflowService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [workflowService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [workflowService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [workflowService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [workflowService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [workflowService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [workflowService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [workflowService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [workflowService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [workflowService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [workflowService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [workflowService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [workflowService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [workflowService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [workflowService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [workflowService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [workflowService] SET  MULTI_USER 
GO
ALTER DATABASE [workflowService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [workflowService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [workflowService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [workflowService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [workflowService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [workflowService] SET QUERY_STORE = OFF
GO
USE [workflowService]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [workflowService]
GO
/****** Object:  Table [dbo].[service_config]    Script Date: 7/17/2018 4:55:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_config](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[intervalo_ms] [int] NOT NULL,
	[mensaje_inicio] [nvarchar](500) NULL,
	[mensaje_detenido] [nvarchar](500) NULL,
	[mensaje_intervalo] [nvarchar](500) NULL,
 CONSTRAINT [PK_service_config] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarea]    Script Date: 7/17/2018 4:55:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[metodo] [nvarchar](500) NULL,
	[nombre_contrato] [nvarchar](500) NULL,
	[url_servicio] [nvarchar](500) NULL,
	[parametros] [nvarchar](500) NULL,
	[tiempo_ejecucion] [time](7) NOT NULL,
	[ultima_ejecucion] [datetime] NOT NULL,
 CONSTRAINT [PK_tareas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tareas_ejecutadas]    Script Date: 7/17/2018 4:55:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tareas_ejecutadas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tarea] [int] NULL,
	[momento_ejecucion] [datetime] NOT NULL,
	[respuesta] [nvarchar](max) NULL,
 CONSTRAINT [PK_tareas_ejecutadas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tracks]    Script Date: 7/17/2018 4:55:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_tracks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[service_config] ON 

INSERT [dbo].[service_config] ([id], [intervalo_ms], [mensaje_inicio], [mensaje_detenido], [mensaje_intervalo]) VALUES (1, 10000, N'ServiceNet W3 Iniciado', N'ServiceNet W3 Detenido', N'Intervalo en:')
SET IDENTITY_INSERT [dbo].[service_config] OFF
SET IDENTITY_INSERT [dbo].[tarea] ON 

INSERT [dbo].[tarea] ([id], [metodo], [nombre_contrato], [url_servicio], [parametros], [tiempo_ejecucion], [ultima_ejecucion]) VALUES (2, N'IniciarWorkflow1', N'Service1', N'http://localhost/WorkflowService/Service1.svc?singleWsdl', N'1', CAST(N'00:03:00' AS Time), CAST(N'2018-07-17T16:22:05.250' AS DateTime))
INSERT [dbo].[tarea] ([id], [metodo], [nombre_contrato], [url_servicio], [parametros], [tiempo_ejecucion], [ultima_ejecucion]) VALUES (13, N'IniciarWorkflow2', N'Service1', N'http://localhost/WorkflowService/Service1.svc?singleWsdl', N'2', CAST(N'00:01:00' AS Time), CAST(N'2018-07-17T16:22:05.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[tarea] OFF
ALTER TABLE [dbo].[tarea] ADD  CONSTRAINT [DF_tarea_ultima_ejecucion]  DEFAULT (getdate()) FOR [ultima_ejecucion]
GO
ALTER TABLE [dbo].[tareas_ejecutadas]  WITH CHECK ADD  CONSTRAINT [FK_tareas_ejecutadas_tareas] FOREIGN KEY([id_tarea])
REFERENCES [dbo].[tarea] ([id])
GO
ALTER TABLE [dbo].[tareas_ejecutadas] CHECK CONSTRAINT [FK_tareas_ejecutadas_tareas]
GO
USE [master]
GO
ALTER DATABASE [workflowService] SET  READ_WRITE 
GO
