USE [master]
GO
/****** Object:  Database [API_Vet]    Script Date: 08/06/2024 17:19:11 ******/
CREATE DATABASE [API_Vet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'API_Vet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\API_Vet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'API_Vet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\API_Vet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [API_Vet] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [API_Vet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [API_Vet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [API_Vet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [API_Vet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [API_Vet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [API_Vet] SET ARITHABORT OFF 
GO
ALTER DATABASE [API_Vet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [API_Vet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [API_Vet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [API_Vet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [API_Vet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [API_Vet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [API_Vet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [API_Vet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [API_Vet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [API_Vet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [API_Vet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [API_Vet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [API_Vet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [API_Vet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [API_Vet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [API_Vet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [API_Vet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [API_Vet] SET RECOVERY FULL 
GO
ALTER DATABASE [API_Vet] SET  MULTI_USER 
GO
ALTER DATABASE [API_Vet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [API_Vet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [API_Vet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [API_Vet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [API_Vet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [API_Vet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'API_Vet', N'ON'
GO
ALTER DATABASE [API_Vet] SET QUERY_STORE = ON
GO
ALTER DATABASE [API_Vet] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [API_Vet]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[Id_Animal] [int] IDENTITY(1,1) NOT NULL,
	[Especie] [nvarchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Genero] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Animal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anomalia]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anomalia](
	[Id_Anomalia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](75) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Anomalia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnomaliasExamen]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnomaliasExamen](
	[Id_AnomaliaExamen] [int] IDENTITY(1,1) NOT NULL,
	[Id_Anomalia] [int] NOT NULL,
	[Id_Examen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_AnomaliaExamen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamenClinico]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamenClinico](
	[Id_Examen] [int] IDENTITY(1,1) NOT NULL,
	[TipoAnalisis] [nvarchar](75) NOT NULL,
	[Resultados] [nvarchar](75) NOT NULL,
	[Id_Animal] [int] NOT NULL,
	[Id_Veterinario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Examen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParametroAnalisis]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParametroAnalisis](
	[Id_ParametroAnalisis] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[ValorReferencia] [nvarchar](50) NOT NULL,
	[Id_TipoAnalisis] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_ParametroAnalisis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParametroExamen]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParametroExamen](
	[Id_ParametroExamen] [int] IDENTITY(1,1) NOT NULL,
	[Valor] [nvarchar](30) NOT NULL,
	[Id_Examen] [int] NOT NULL,
	[Id_ParametroAnalisis] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_ParametroExamen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAnalisis]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAnalisis](
	[Id_TipoAnalisis] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](75) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_TipoAnalisis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veterinario]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veterinario](
	[Id_Veterinario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Apellido] [nvarchar](30) NOT NULL,
	[Especialidad] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Veterinario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([Id_Animal], [Especie], [Edad], [Genero]) VALUES (1, N'Perro', 5, N'Macho')
INSERT [dbo].[Animal] ([Id_Animal], [Especie], [Edad], [Genero]) VALUES (2, N'Gato', 3, N'Hembra')
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[Anomalia] ON 

INSERT [dbo].[Anomalia] ([Id_Anomalia], [Nombre], [Descripcion]) VALUES (1, N'Hipoglucemia', N'Bajo nivel de glucosa en la sangre')
INSERT [dbo].[Anomalia] ([Id_Anomalia], [Nombre], [Descripcion]) VALUES (2, N'Anemia', N'Disminución de glóbulos rojos')
SET IDENTITY_INSERT [dbo].[Anomalia] OFF
GO
SET IDENTITY_INSERT [dbo].[AnomaliasExamen] ON 

INSERT [dbo].[AnomaliasExamen] ([Id_AnomaliaExamen], [Id_Anomalia], [Id_Examen]) VALUES (1, 1, 1)
INSERT [dbo].[AnomaliasExamen] ([Id_AnomaliaExamen], [Id_Anomalia], [Id_Examen]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[AnomaliasExamen] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamenClinico] ON 

INSERT [dbo].[ExamenClinico] ([Id_Examen], [TipoAnalisis], [Resultados], [Id_Animal], [Id_Veterinario]) VALUES (1, N'Hematología', N'Normales', 1, 1)
INSERT [dbo].[ExamenClinico] ([Id_Examen], [TipoAnalisis], [Resultados], [Id_Animal], [Id_Veterinario]) VALUES (2, N'Bioquímica', N'Anormales', 2, 2)
SET IDENTITY_INSERT [dbo].[ExamenClinico] OFF
GO
SET IDENTITY_INSERT [dbo].[ParametroAnalisis] ON 

INSERT [dbo].[ParametroAnalisis] ([Id_ParametroAnalisis], [Nombre], [ValorReferencia], [Id_TipoAnalisis]) VALUES (1, N'Glucosa', N'70-110 mg/dL', 2)
INSERT [dbo].[ParametroAnalisis] ([Id_ParametroAnalisis], [Nombre], [ValorReferencia], [Id_TipoAnalisis]) VALUES (2, N'Hematocrito', N'40-50%', 1)
INSERT [dbo].[ParametroAnalisis] ([Id_ParametroAnalisis], [Nombre], [ValorReferencia], [Id_TipoAnalisis]) VALUES (3, N'Prueba leo', N'60tifd', 2)
SET IDENTITY_INSERT [dbo].[ParametroAnalisis] OFF
GO
SET IDENTITY_INSERT [dbo].[ParametroExamen] ON 

INSERT [dbo].[ParametroExamen] ([Id_ParametroExamen], [Valor], [Id_Examen], [Id_ParametroAnalisis]) VALUES (3, N'85 mg/dL', 1, 1)
INSERT [dbo].[ParametroExamen] ([Id_ParametroExamen], [Valor], [Id_Examen], [Id_ParametroAnalisis]) VALUES (4, N'45%', 2, 2)
SET IDENTITY_INSERT [dbo].[ParametroExamen] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoAnalisis] ON 

INSERT [dbo].[TipoAnalisis] ([Id_TipoAnalisis], [Nombre], [Descripcion]) VALUES (1, N'Hematología', N'Análisis de la sangre')
INSERT [dbo].[TipoAnalisis] ([Id_TipoAnalisis], [Nombre], [Descripcion]) VALUES (2, N'Bioquímica', N'Análisis químico de fluidos')
SET IDENTITY_INSERT [dbo].[TipoAnalisis] OFF
GO
SET IDENTITY_INSERT [dbo].[Veterinario] ON 

INSERT [dbo].[Veterinario] ([Id_Veterinario], [Nombre], [Apellido], [Especialidad]) VALUES (1, N'Juan', N'Pérez', N'Cirugía')
INSERT [dbo].[Veterinario] ([Id_Veterinario], [Nombre], [Apellido], [Especialidad]) VALUES (2, N'Ana', N'Gómez', N'Dermatología')
SET IDENTITY_INSERT [dbo].[Veterinario] OFF
GO
ALTER TABLE [dbo].[AnomaliasExamen]  WITH CHECK ADD FOREIGN KEY([Id_Anomalia])
REFERENCES [dbo].[Anomalia] ([Id_Anomalia])
GO
ALTER TABLE [dbo].[AnomaliasExamen]  WITH CHECK ADD FOREIGN KEY([Id_Examen])
REFERENCES [dbo].[ExamenClinico] ([Id_Examen])
GO
ALTER TABLE [dbo].[ExamenClinico]  WITH CHECK ADD FOREIGN KEY([Id_Animal])
REFERENCES [dbo].[Animal] ([Id_Animal])
GO
ALTER TABLE [dbo].[ExamenClinico]  WITH CHECK ADD FOREIGN KEY([Id_Veterinario])
REFERENCES [dbo].[Veterinario] ([Id_Veterinario])
GO
ALTER TABLE [dbo].[ParametroAnalisis]  WITH CHECK ADD FOREIGN KEY([Id_TipoAnalisis])
REFERENCES [dbo].[TipoAnalisis] ([Id_TipoAnalisis])
GO
ALTER TABLE [dbo].[ParametroExamen]  WITH CHECK ADD FOREIGN KEY([Id_Examen])
REFERENCES [dbo].[ExamenClinico] ([Id_Examen])
GO
ALTER TABLE [dbo].[ParametroExamen]  WITH CHECK ADD FOREIGN KEY([Id_ParametroAnalisis])
REFERENCES [dbo].[ParametroAnalisis] ([Id_ParametroAnalisis])
GO
/****** Object:  StoredProcedure [dbo].[spAnimal_Delete]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure to Delete
CREATE   PROCEDURE [dbo].[spAnimal_Delete]
    @Id_Animal INT
AS
BEGIN
    DELETE FROM Animal WHERE Id_Animal = @Id_Animal
END
GO
/****** Object:  StoredProcedure [dbo].[spAnimal_GetAll]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spAnimal_GetAll]
AS
BEGIN
    SELECT Id_Animal, Especie, Edad, Genero FROM Animal
END
GO
/****** Object:  StoredProcedure [dbo].[spAnimal_GetById]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure to Get a by ID
CREATE   PROCEDURE [dbo].[spAnimal_GetById]
    @Id_Animal INT
AS
BEGIN
    SELECT Id_Animal, Especie, Edad, Genero FROM Animal
    WHERE Id_Animal = @Id_Animal
END
GO
/****** Object:  StoredProcedure [dbo].[spAnimal_Insert]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spAnimal_Insert]
    @Especie NVARCHAR(50),
    @Edad INT,
    @Genero NVARCHAR(50)
AS
BEGIN
    INSERT INTO Animal (Especie, Edad, Genero)
    VALUES (@Especie, @Edad, @Genero)
END
GO
/****** Object:  StoredProcedure [dbo].[spAnimal_Update]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure to Update 
CREATE   PROCEDURE [dbo].[spAnimal_Update]
    @Id_Animal INT,
    @Especie NVARCHAR(50),
    @Edad INT,
    @Genero NVARCHAR(50)
AS
BEGIN
    UPDATE Animal
    SET
        Especie = @Especie,
        Edad = @Edad,
        Genero = @Genero
    WHERE Id_Animal = @Id_Animal
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomalia_Delete]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure to Delete
CREATE   PROCEDURE [dbo].[spAnomalia_Delete]
	@Id_Anomalia INT
AS
BEGIN
	DELETE FROM Anomalia WHERE Id_Anomalia = @Id_Anomalia
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomalia_GetAll]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Get All
CREATE   PROCEDURE [dbo].[spAnomalia_GetAll]
AS
BEGIN
	SELECT Id_Anomalia, Nombre, Descripcion FROM Anomalia
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomalia_GetById]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure to Get a by ID
CREATE   PROCEDURE [dbo].[spAnomalia_GetById]
	@Id_Anomalia INT
AS
BEGIN
	SELECT Id_Anomalia, Nombre, Descripcion FROM Anomalia
	WHERE Id_Anomalia = @Id_Anomalia
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomalia_Insert]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure to Insert
CREATE   PROCEDURE [dbo].[spAnomalia_Insert]
	@Nombre NVARCHAR(75),
	@Descripcion NVARCHAR(100)
AS
BEGIN
	INSERT INTO Anomalia(Nombre, Descripcion)
	VALUES (@Nombre, @Descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomalia_Update]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Update 
CREATE   PROCEDURE [dbo].[spAnomalia_Update]
	@Id_Anomalia INT,
	@Nombre NVARCHAR(75),
	@Descripcion NVARCHAR(100)
AS
BEGIN
	UPDATE Anomalia
	SET 
		Nombre = @Nombre,
		Descripcion = @Descripcion
	WHERE Id_Anomalia = @Id_Anomalia
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomaliasExamen_Delete]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spAnomaliasExamen_Delete]
	@Id_AnomaliaExamen INT
AS
BEGIN
	DELETE FROM AnomaliasExamen WHERE Id_AnomaliaExamen = @Id_AnomaliaExamen
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomaliasExamen_GetAll]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to Get All
CREATE   PROCEDURE [dbo].[spAnomaliasExamen_GetAll]
AS
BEGIN
	SELECT Id_AnomaliaExamen, AE.Id_Anomalia, A.Nombre, AE.Id_Examen, EC.TipoAnalisis FROM AnomaliasExamen AS AE
	INNER JOIN Anomalia AS A ON AE.Id_Anomalia = A.Id_Anomalia 
	INNER JOIN ExamenClinico AS EC ON AE.Id_Examen = EC.Id_Examen
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomaliasExamen_GetById]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spAnomaliasExamen_GetById]
	@Id_AnomaliaExamen INT
AS
BEGIN
	SELECT Id_AnomaliaExamen, AE.Id_Anomalia, A.Nombre, AE.Id_Examen, EC.TipoAnalisis FROM AnomaliasExamen AS AE
	INNER JOIN Anomalia AS A ON AE.Id_Anomalia = A.Id_Anomalia 
	INNER JOIN ExamenClinico AS EC ON AE.Id_Examen = EC.Id_Examen
	WHERE AE.Id_AnomaliaExamen = @Id_AnomaliaExamen
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomaliasExamen_Insert]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure to Insert
CREATE   PROCEDURE [dbo].[spAnomaliasExamen_Insert]
	@Id_Anomalia INT,
	@Id_Examen INT 
AS
BEGIN
	INSERT INTO AnomaliasExamen (Id_Anomalia, Id_Examen)
	VALUES (@Id_Anomalia, @Id_Examen)
END
GO
/****** Object:  StoredProcedure [dbo].[spAnomaliasExamen_Update]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure to Update
CREATE   PROCEDURE [dbo].[spAnomaliasExamen_Update]
	@Id_AnomaliaExamen INT,
	@Id_Anomalia INT,
	@Id_Examen INT 
AS
BEGIN
	UPDATE AnomaliasExamen
	SET
		Id_Anomalia = @Id_Anomalia,
		Id_Examen = @Id_Examen
	WHERE Id_AnomaliaExamen = @Id_AnomaliaExamen
END
GO
/****** Object:  StoredProcedure [dbo].[spExamenClinico_Delete]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spExamenClinico_Delete]
    @Id_Examen INT
AS
BEGIN
    DELETE FROM ExamenClinico
    WHERE Id_Examen = @Id_Examen;
END
GO
/****** Object:  StoredProcedure [dbo].[spExamenClinico_GetAll]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spExamenClinico_GetAll]
AS
BEGIN
    SELECT 
        ec.Id_Examen,
        ec.TipoAnalisis,
        ec.Resultados,
        ec.Id_Animal,
        ec.Id_Veterinario,
        a.Especie AS EspecieAnimal,
        v.Nombre AS NombreVeterinario
    FROM 
        ExamenClinico ec
    INNER JOIN 
        Animal a ON ec.Id_Animal = a.Id_Animal
    INNER JOIN 
        Veterinario v ON ec.Id_Veterinario = v.Id_Veterinario;
END
GO
/****** Object:  StoredProcedure [dbo].[spExamenClinico_GetById]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spExamenClinico_GetById]
    @Id_Examen INT
AS
BEGIN
    SELECT 
        ec.Id_Examen,
        ec.TipoAnalisis,
        ec.Resultados,
        ec.Id_Animal,
        ec.Id_Veterinario,
        a.Especie AS EspecieAnimal,
        v.Nombre AS NombreVeterinario
    FROM 
        ExamenClinico ec
    INNER JOIN 
        Animal a ON ec.Id_Animal = a.Id_Animal
    INNER JOIN 
        Veterinario v ON ec.Id_Veterinario = v.Id_Veterinario
    WHERE 
        ec.Id_Examen = @Id_Examen;
END
GO
/****** Object:  StoredProcedure [dbo].[spExamenClinico_Insert]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spExamenClinico_Insert]
    @TipoAnalisis NVARCHAR(75),
    @Resultados NVARCHAR(75),
    @Id_Animal INT,
    @Id_Veterinario INT
AS
BEGIN
    INSERT INTO ExamenClinico (TipoAnalisis, Resultados, Id_Animal, Id_Veterinario)
    VALUES (@TipoAnalisis, @Resultados, @Id_Animal, @Id_Veterinario);
END
GO
/****** Object:  StoredProcedure [dbo].[spExamenClinico_Update]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spExamenClinico_Update]
    @Id_Examen INT,
    @TipoAnalisis NVARCHAR(75),
    @Resultados NVARCHAR(75),
    @Id_Animal INT,
    @Id_Veterinario INT
AS
BEGIN
    UPDATE ExamenClinico
    SET TipoAnalisis = @TipoAnalisis,
        Resultados = @Resultados,
        Id_Animal = @Id_Animal,
        Id_Veterinario = @Id_Veterinario
    WHERE Id_Examen = @Id_Examen;
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroAnalisis_Delete]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spParametroAnalisis_Delete]
    @Id_ParametroAnalisis INT
AS
BEGIN
    DELETE FROM ParametroAnalisis
    WHERE Id_ParametroAnalisis = @Id_ParametroAnalisis;
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroAnalisis_GetAll]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spParametroAnalisis_GetAll]
AS
BEGIN
    SELECT 
        pa.Id_ParametroAnalisis,
        pa.Nombre,
        pa.ValorReferencia,
        pa.Id_TipoAnalisis,
        ta.Nombre AS NombreTipoAnalisis
    FROM 
        ParametroAnalisis pa
    INNER JOIN 
        TipoAnalisis ta ON pa.Id_TipoAnalisis = ta.Id_TipoAnalisis;
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroAnalisis_GetById]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spParametroAnalisis_GetById]
    @Id_ParametroAnalisis INT
AS
BEGIN
    SELECT 
        pa.Id_ParametroAnalisis,
        pa.Nombre,
        pa.ValorReferencia,
        pa.Id_TipoAnalisis,
        ta.Nombre AS NombreTipoAnalisis
    FROM 
        ParametroAnalisis pa
    INNER JOIN 
        TipoAnalisis ta ON pa.Id_TipoAnalisis = ta.Id_TipoAnalisis
    WHERE 
        pa.Id_ParametroAnalisis = @Id_ParametroAnalisis;
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroAnalisis_Insert]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spParametroAnalisis_Insert]
    @Nombre NVARCHAR(50),
    @ValorReferencia NVARCHAR(50),
    @Id_TipoAnalisis INT
AS
BEGIN
    INSERT INTO ParametroAnalisis (Nombre, ValorReferencia, Id_TipoAnalisis)
    VALUES (@Nombre, @ValorReferencia, @Id_TipoAnalisis);
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroAnalisis_Update]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spParametroAnalisis_Update]
    @Id_ParametroAnalisis INT,
    @Nombre NVARCHAR(50),
    @ValorReferencia NVARCHAR(50),
    @Id_TipoAnalisis INT
AS
BEGIN
    UPDATE ParametroAnalisis
    SET Nombre = @Nombre,
        ValorReferencia = @ValorReferencia,
        Id_TipoAnalisis = @Id_TipoAnalisis
    WHERE Id_ParametroAnalisis = @Id_ParametroAnalisis;
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroExamen_Delete]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spParametroExamen_Delete]
    @Id_ParametroExamen INT
AS
BEGIN
    DELETE FROM ParametroExamen
    WHERE Id_ParametroExamen = @Id_ParametroExamen;
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroExamen_GetAll]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spParametroExamen_GetAll]
AS
BEGIN
    SELECT 
        pe.Id_ParametroExamen,
        pe.Valor,
        pe.Id_Examen,
        pe.Id_ParametroAnalisis,
        ec.TipoAnalisis,
        pa.Nombre AS NombreParametroAnalisis
    FROM 
        ParametroExamen pe
    INNER JOIN 
        ExamenClinico ec ON pe.Id_Examen = ec.Id_Examen
    INNER JOIN 
        ParametroAnalisis pa ON pe.Id_ParametroAnalisis = pa.Id_ParametroAnalisis
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroExamen_GetById]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spParametroExamen_GetById]
    @Id_ParametroExamen INT
AS
BEGIN
    SELECT 
        pe.Id_ParametroExamen,
        pe.Valor,
        pe.Id_Examen,
        pe.Id_ParametroAnalisis,
        ec.TipoAnalisis,
        pa.Nombre AS NombreParametroAnalisis
    FROM 
        ParametroExamen pe
    INNER JOIN 
        ExamenClinico ec ON pe.Id_Examen = ec.Id_Examen
    INNER JOIN 
        ParametroAnalisis pa ON pe.Id_ParametroAnalisis = pa.Id_ParametroAnalisis
    WHERE 
        pe.Id_ParametroExamen = @Id_ParametroExamen;
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroExamen_Insert]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spParametroExamen_Insert]
    @Valor NVARCHAR(30),
    @Id_Examen INT,
    @Id_ParametroAnalisis INT
AS
BEGIN
    INSERT INTO ParametroExamen (Valor, Id_Examen, Id_ParametroAnalisis)
    VALUES (@Valor, @Id_Examen, @Id_ParametroAnalisis);
END
GO
/****** Object:  StoredProcedure [dbo].[spParametroExamen_Update]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spParametroExamen_Update]
    @Id_ParametroExamen INT,
    @Valor NVARCHAR(30),
    @Id_Examen INT,
    @Id_ParametroAnalisis INT
AS
BEGIN
    UPDATE ParametroExamen
    SET Valor = @Valor,
        Id_Examen = @Id_Examen,
        Id_ParametroAnalisis = @Id_ParametroAnalisis
    WHERE Id_ParametroExamen = @Id_ParametroExamen;
END
GO
/****** Object:  StoredProcedure [dbo].[spTipoAnalisis_Delete]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTipoAnalisis_Delete]
    @Id_TipoAnalisis INT
AS
BEGIN
    DELETE FROM TipoAnalisis
    WHERE Id_TipoAnalisis = @Id_TipoAnalisis;
END
GO
/****** Object:  StoredProcedure [dbo].[spTipoAnalisis_GetAll]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTipoAnalisis_GetAll]
AS
BEGIN
    SELECT Id_TipoAnalisis, Nombre, Descripcion
    FROM TipoAnalisis;
END
GO
/****** Object:  StoredProcedure [dbo].[spTipoAnalisis_GetById]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTipoAnalisis_GetById]
    @Id_TipoAnalisis INT
AS
BEGIN
    SELECT Id_TipoAnalisis, Nombre, Descripcion
    FROM TipoAnalisis
    WHERE Id_TipoAnalisis = @Id_TipoAnalisis;
END
GO
/****** Object:  StoredProcedure [dbo].[spTipoAnalisis_Insert]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTipoAnalisis_Insert]
    @Nombre NVARCHAR(75),
    @Descripcion NVARCHAR(100)
AS
BEGIN
    INSERT INTO TipoAnalisis (Nombre, Descripcion)
    VALUES (@Nombre, @Descripcion);
END
GO
/****** Object:  StoredProcedure [dbo].[spTipoAnalisis_Update]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTipoAnalisis_Update]
    @Id_TipoAnalisis INT,
    @Nombre NVARCHAR(75),
    @Descripcion NVARCHAR(100)
AS
BEGIN
    UPDATE TipoAnalisis
    SET Nombre = @Nombre,
        Descripcion = @Descripcion
    WHERE Id_TipoAnalisis = @Id_TipoAnalisis;
END
GO
/****** Object:  StoredProcedure [dbo].[spVeterinario_Delete]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spVeterinario_Delete]
	@Id_Veterinario INT
AS
BEGIN
	DELETE FROM Veterinario WHERE Id_Veterinario = @Id_Veterinario
END
GO
/****** Object:  StoredProcedure [dbo].[spVeterinario_GetAll]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spVeterinario_GetAll]
AS
BEGIN
	SELECT Id_Veterinario, Nombre, Apellido, Especialidad FROM Veterinario
END
GO
/****** Object:  StoredProcedure [dbo].[spVeterinario_GetById]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spVeterinario_GetById]
	@Id_Veterinario INT
AS
BEGIN
	SELECT Id_Veterinario, Nombre, Apellido, Especialidad FROM Veterinario
	WHERE Id_Veterinario = @Id_Veterinario
END
GO
/****** Object:  StoredProcedure [dbo].[spVeterinario_Insert]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spVeterinario_Insert]
	@Nombre NVARCHAR(30),
	@Apellido NVARCHAR(30),
	@Especialidad NVARCHAR(50)
AS
BEGIN
	INSERT INTO Veterinario (Nombre, Apellido, Especialidad)
	VALUES (@Nombre, @Apellido, @Especialidad)
END
GO
/****** Object:  StoredProcedure [dbo].[spVeterinario_Update]    Script Date: 08/06/2024 17:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spVeterinario_Update]
    @Id_Veterinario INT,
    @Nombre NVARCHAR(30),
    @Apellido NVARCHAR(30),
    @Especialidad NVARCHAR(50)
AS
BEGIN
    UPDATE Veterinario
    SET
        Nombre = @Nombre,
        Apellido = @Apellido,
        Especialidad = @Especialidad
    WHERE Id_Veterinario = @Id_Veterinario
END
GO
USE [master]
GO
ALTER DATABASE [API_Vet] SET  READ_WRITE 
GO
