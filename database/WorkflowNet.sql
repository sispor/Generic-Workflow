USE [master]
GO
/****** Object:  Database [workflowNet]    Script Date: 7/17/2018 4:54:48 PM ******/
CREATE DATABASE [workflowNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'workflowNet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\workflowNet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'workflowNet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\workflowNet_log.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [workflowNet] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [workflowNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [workflowNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [workflowNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [workflowNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [workflowNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [workflowNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [workflowNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [workflowNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [workflowNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [workflowNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [workflowNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [workflowNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [workflowNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [workflowNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [workflowNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [workflowNet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [workflowNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [workflowNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [workflowNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [workflowNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [workflowNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [workflowNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [workflowNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [workflowNet] SET RECOVERY FULL 
GO
ALTER DATABASE [workflowNet] SET  MULTI_USER 
GO
ALTER DATABASE [workflowNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [workflowNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [workflowNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [workflowNet] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [workflowNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [workflowNet] SET QUERY_STORE = OFF
GO
USE [workflowNet]
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
USE [workflowNet]
GO
/****** Object:  Table [dbo].[estado_dependencia]    Script Date: 7/17/2018 4:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_dependencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_workflow] [int] NULL,
	[id_estado_desde] [int] NULL,
	[id_estado_hasta] [int] NULL,
	[parametrizable] [bit] NULL,
 CONSTRAINT [PK_estado_dependencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 7/17/2018 4:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_workflow] [int] NULL,
	[nombre] [nvarchar](500) NULL,
	[estado_inicial] [bit] NULL,
	[estado_final] [bit] NULL,
 CONSTRAINT [PK_estados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parametro_secuencia_estado]    Script Date: 7/17/2018 4:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parametro_secuencia_estado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_parametro] [int] NULL,
	[id_estado_siguiente] [int] NOT NULL,
	[valor_parametro] [nvarchar](50) NULL,
 CONSTRAINT [PK_parametro_secuencia_estado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parametros]    Script Date: 7/17/2018 4:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parametros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
 CONSTRAINT [PK_parametros] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parametros_estado_dependencia]    Script Date: 7/17/2018 4:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parametros_estado_dependencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_parametro] [int] NULL,
	[id_estado_dependencia] [int] NULL,
 CONSTRAINT [PK_parametro_estado_dependencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proceso_workflow]    Script Date: 7/17/2018 4:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proceso_workflow](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_estado_actual] [int] NULL,
	[id_workflow] [int] NULL,
 CONSTRAINT [PK_proceso_workflow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tareas_estado]    Script Date: 7/17/2018 4:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tareas_estado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[metodo] [nvarchar](500) NULL,
	[id_estado] [int] NULL,
	[parametros] [nvarchar](500) NULL,
	[ruta_dll] [nvarchar](500) NULL,
	[nombre_libreria] [nvarchar](500) NULL,
	[nombre_clase] [nvarchar](500) NULL,
	[es_asincrona] [bit] NULL,
 CONSTRAINT [PK_tareas_estados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tracks]    Script Date: 7/17/2018 4:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[metodo] [nvarchar](500) NULL,
	[tipo_respuesta] [nvarchar](100) NULL,
	[respuesta] [nvarchar](max) NULL,
	[descripcion] [nvarchar](max) NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_trackeo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workflow]    Script Date: 7/17/2018 4:54:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](500) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_workflow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[estado_dependencia] ON 

INSERT [dbo].[estado_dependencia] ([id], [id_workflow], [id_estado_desde], [id_estado_hasta], [parametrizable]) VALUES (1, 1, 3, NULL, 1)
INSERT [dbo].[estado_dependencia] ([id], [id_workflow], [id_estado_desde], [id_estado_hasta], [parametrizable]) VALUES (2, 1, 2, NULL, 1)
INSERT [dbo].[estado_dependencia] ([id], [id_workflow], [id_estado_desde], [id_estado_hasta], [parametrizable]) VALUES (3, 1, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[estado_dependencia] OFF
SET IDENTITY_INSERT [dbo].[estados] ON 

INSERT [dbo].[estados] ([id], [id_workflow], [nombre], [estado_inicial], [estado_final]) VALUES (1, 1, N'Gerencia General', NULL, NULL)
INSERT [dbo].[estados] ([id], [id_workflow], [nombre], [estado_inicial], [estado_final]) VALUES (2, 1, N'Gerencias', NULL, NULL)
INSERT [dbo].[estados] ([id], [id_workflow], [nombre], [estado_inicial], [estado_final]) VALUES (3, 1, N'Subgerencias', 1, NULL)
INSERT [dbo].[estados] ([id], [id_workflow], [nombre], [estado_inicial], [estado_final]) VALUES (4, 1, N'Aprobado', NULL, 1)
INSERT [dbo].[estados] ([id], [id_workflow], [nombre], [estado_inicial], [estado_final]) VALUES (5, 1, N'Rechazado', NULL, 1)
INSERT [dbo].[estados] ([id], [id_workflow], [nombre], [estado_inicial], [estado_final]) VALUES (6, 2, N'enPrueba', 1, NULL)
SET IDENTITY_INSERT [dbo].[estados] OFF
SET IDENTITY_INSERT [dbo].[parametro_secuencia_estado] ON 

INSERT [dbo].[parametro_secuencia_estado] ([id], [id_parametro], [id_estado_siguiente], [valor_parametro]) VALUES (4, 1, 2, N'SI')
INSERT [dbo].[parametro_secuencia_estado] ([id], [id_parametro], [id_estado_siguiente], [valor_parametro]) VALUES (5, 1, 5, N'NO')
INSERT [dbo].[parametro_secuencia_estado] ([id], [id_parametro], [id_estado_siguiente], [valor_parametro]) VALUES (6, 2, 1, N'SI')
INSERT [dbo].[parametro_secuencia_estado] ([id], [id_parametro], [id_estado_siguiente], [valor_parametro]) VALUES (7, 2, 5, N'NO')
INSERT [dbo].[parametro_secuencia_estado] ([id], [id_parametro], [id_estado_siguiente], [valor_parametro]) VALUES (8, 3, 4, N'SI')
INSERT [dbo].[parametro_secuencia_estado] ([id], [id_parametro], [id_estado_siguiente], [valor_parametro]) VALUES (9, 3, 5, N'NO')
SET IDENTITY_INSERT [dbo].[parametro_secuencia_estado] OFF
SET IDENTITY_INSERT [dbo].[parametros] ON 

INSERT [dbo].[parametros] ([id], [descripcion]) VALUES (1, N'aprobaciónSubgerencia')
INSERT [dbo].[parametros] ([id], [descripcion]) VALUES (2, N'aprobaciónGerencia')
INSERT [dbo].[parametros] ([id], [descripcion]) VALUES (3, N'aprobaciónGerenciaGeneral')
SET IDENTITY_INSERT [dbo].[parametros] OFF
SET IDENTITY_INSERT [dbo].[parametros_estado_dependencia] ON 

INSERT [dbo].[parametros_estado_dependencia] ([id], [id_parametro], [id_estado_dependencia]) VALUES (1, 1, 1)
INSERT [dbo].[parametros_estado_dependencia] ([id], [id_parametro], [id_estado_dependencia]) VALUES (2, 2, 2)
INSERT [dbo].[parametros_estado_dependencia] ([id], [id_parametro], [id_estado_dependencia]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[parametros_estado_dependencia] OFF
SET IDENTITY_INSERT [dbo].[tareas_estado] ON 

INSERT [dbo].[tareas_estado] ([id], [metodo], [id_estado], [parametros], [ruta_dll], [nombre_libreria], [nombre_clase], [es_asincrona]) VALUES (1, N'PruebaTareas', 2, N'1', N'C:/WorkflowNet/WorkflowNet/bin/Debug/WorkflowNet.dll', N'WorkflowNet', N'WorkflowControl', 0)
INSERT [dbo].[tareas_estado] ([id], [metodo], [id_estado], [parametros], [ruta_dll], [nombre_libreria], [nombre_clase], [es_asincrona]) VALUES (2, N'PruebaTareas', 2, N'1', N'C:/WorkflowNet/WorkflowNet/bin/Debug/WorkflowNet.dll', N'WorkflowNet', N'WorkflowControl', 1)
INSERT [dbo].[tareas_estado] ([id], [metodo], [id_estado], [parametros], [ruta_dll], [nombre_libreria], [nombre_clase], [es_asincrona]) VALUES (3, N'PruebaTareas', 2, N'1', N'C:/WorkflowNet/WorkflowNet/bin/Debug/WorkflowNet.dll', N'WorkflowNet', N'WorkflowControl', 1)
INSERT [dbo].[tareas_estado] ([id], [metodo], [id_estado], [parametros], [ruta_dll], [nombre_libreria], [nombre_clase], [es_asincrona]) VALUES (4, N'PruebaTareas', 2, N'1', N'C:/WorkflowNet/WorkflowNet/bin/Debug/WorkflowNet.dll', N'WorkflowNet', N'WorkflowControl', 0)
SET IDENTITY_INSERT [dbo].[tareas_estado] OFF
INSERT [dbo].[workflow] ([id], [nombre], [estado]) VALUES (1, N'inscripcion', 1)
INSERT [dbo].[workflow] ([id], [nombre], [estado]) VALUES (2, N'prueba', 1)
ALTER TABLE [dbo].[tareas_estado] ADD  CONSTRAINT [DF_tareas_estado_es_asincrona]  DEFAULT ((0)) FOR [es_asincrona]
GO
ALTER TABLE [dbo].[estado_dependencia]  WITH CHECK ADD  CONSTRAINT [FK_estado_dependencia_estados] FOREIGN KEY([id_estado_desde])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[estado_dependencia] CHECK CONSTRAINT [FK_estado_dependencia_estados]
GO
ALTER TABLE [dbo].[estado_dependencia]  WITH CHECK ADD  CONSTRAINT [FK_estado_dependencia_estados1] FOREIGN KEY([id_estado_hasta])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[estado_dependencia] CHECK CONSTRAINT [FK_estado_dependencia_estados1]
GO
ALTER TABLE [dbo].[estado_dependencia]  WITH CHECK ADD  CONSTRAINT [FK_estado_dependencia_workflow] FOREIGN KEY([id_workflow])
REFERENCES [dbo].[workflow] ([id])
GO
ALTER TABLE [dbo].[estado_dependencia] CHECK CONSTRAINT [FK_estado_dependencia_workflow]
GO
ALTER TABLE [dbo].[estados]  WITH CHECK ADD  CONSTRAINT [FK_estados_workflow] FOREIGN KEY([id_workflow])
REFERENCES [dbo].[workflow] ([id])
GO
ALTER TABLE [dbo].[estados] CHECK CONSTRAINT [FK_estados_workflow]
GO
ALTER TABLE [dbo].[parametro_secuencia_estado]  WITH CHECK ADD  CONSTRAINT [FK_parametro_secuencia_estado_estados] FOREIGN KEY([id_estado_siguiente])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[parametro_secuencia_estado] CHECK CONSTRAINT [FK_parametro_secuencia_estado_estados]
GO
ALTER TABLE [dbo].[parametro_secuencia_estado]  WITH CHECK ADD  CONSTRAINT [FK_parametro_secuencia_estado_parametros] FOREIGN KEY([id_parametro])
REFERENCES [dbo].[parametros] ([id])
GO
ALTER TABLE [dbo].[parametro_secuencia_estado] CHECK CONSTRAINT [FK_parametro_secuencia_estado_parametros]
GO
ALTER TABLE [dbo].[parametros_estado_dependencia]  WITH CHECK ADD  CONSTRAINT [FK_parametro_estado_dependencia_estado_dependencia] FOREIGN KEY([id_estado_dependencia])
REFERENCES [dbo].[estado_dependencia] ([id])
GO
ALTER TABLE [dbo].[parametros_estado_dependencia] CHECK CONSTRAINT [FK_parametro_estado_dependencia_estado_dependencia]
GO
ALTER TABLE [dbo].[parametros_estado_dependencia]  WITH CHECK ADD  CONSTRAINT [FK_parametro_estado_dependencia_parametros] FOREIGN KEY([id_parametro])
REFERENCES [dbo].[parametros] ([id])
GO
ALTER TABLE [dbo].[parametros_estado_dependencia] CHECK CONSTRAINT [FK_parametro_estado_dependencia_parametros]
GO
ALTER TABLE [dbo].[proceso_workflow]  WITH CHECK ADD  CONSTRAINT [FK_proceso_workflow_estados] FOREIGN KEY([id_estado_actual])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[proceso_workflow] CHECK CONSTRAINT [FK_proceso_workflow_estados]
GO
ALTER TABLE [dbo].[proceso_workflow]  WITH CHECK ADD  CONSTRAINT [FK_proceso_workflow_workflow] FOREIGN KEY([id_workflow])
REFERENCES [dbo].[workflow] ([id])
GO
ALTER TABLE [dbo].[proceso_workflow] CHECK CONSTRAINT [FK_proceso_workflow_workflow]
GO
ALTER TABLE [dbo].[tareas_estado]  WITH CHECK ADD  CONSTRAINT [FK_tareas_estados_estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[tareas_estado] CHECK CONSTRAINT [FK_tareas_estados_estados]
GO
USE [master]
GO
ALTER DATABASE [workflowNet] SET  READ_WRITE 
GO
