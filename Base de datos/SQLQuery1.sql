CREATE DATABASE API_Vet;
GO

USE API_Vet;

CREATE TABLE Veterinario (
    Id_Veterinario INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(30) NOT NULL,
    Apellido NVARCHAR(30) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Animal (
    Id_Animal INT PRIMARY KEY IDENTITY(1,1),
    Especie NVARCHAR(50) NOT NULL,
    --Edad INT NOT NULL, 
	 Edad NVARCHAR(15) NOT NULL,
    Genero NVARCHAR(15) NOT NULL
);
GO

CREATE TABLE ExamenClinico (
    Id_Examen INT PRIMARY KEY IDENTITY(1,1),
    TipoAnalisis NVARCHAR(75) NOT NULL,
    Resultados NVARCHAR(75) NOT NULL,
    Id_Animal INT NOT NULL,
    Id_Veterinario INT NOT NULL,
    FOREIGN KEY (Id_Animal) REFERENCES Animal(Id_Animal),
    FOREIGN KEY (Id_Veterinario) REFERENCES Veterinario(Id_Veterinario)
);
GO

CREATE TABLE TipoAnalisis (
    Id_TipoAnalisis INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(75) NOT NULL,
    Descripcion NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE ParametroAnalisis (
    Id_ParametroAnalisis INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    ValorReferencia NVARCHAR(50) NOT NULL,
    Id_TipoAnalisis INT NOT NULL,
    FOREIGN KEY (Id_TipoAnalisis) REFERENCES TipoAnalisis(Id_TipoAnalisis)
);
GO

CREATE TABLE Anomalia (
    Id_Anomalia INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(75) NOT NULL,
    Descripcion NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE ParametroExamen (
    Id_ParametroExamen INT PRIMARY KEY IDENTITY(1,1),
    Valor NVARCHAR(30) NOT NULL,
    Id_Examen INT NOT NULL,
    Id_ParametroAnalisis INT NOT NULL,
    FOREIGN KEY (Id_Examen) REFERENCES ExamenClinico(Id_Examen),
    FOREIGN KEY (Id_ParametroAnalisis) REFERENCES ParametroAnalisis(Id_ParametroAnalisis)
);
GO

CREATE TABLE AnomaliasExame (
    Id_AnomaliaExamen INT PRIMARY KEY IDENTITY(1,1),
    Id_Anomalia INT NOT NULL,
    Id_Examen INT NOT NULL,
    FOREIGN KEY (Id_Anomalia) REFERENCES Anomalia(Id_Anomalia),
    FOREIGN KEY (Id_Examen) REFERENCES ExamenClinico(Id_Examen)
);
GO

-- ============  STORED PROCEDURES ============== ---

-- ========= Veterinario ========= 

-- Stored Procedure to GetAll
CREATE OR ALTER PROCEDURE spVeterinario_GetAll
AS
BEGIN
	SELECT Id_Veterinario, Nombre, Apellido, Especialidad FROM Veterinario
END
GO

-- Stored Procedure to GetByID
CREATE OR ALTER PROCEDURE spVeterinario_GetById
	@Id_Veterinario INT
AS
BEGIN
	SELECT Id_Veterinario, Nombre, Apellido, Especialidad FROM Veterinario
	WHERE Id_Veterinario = @Id_Veterinario
END
GO

-- Stored Procedure to Insert
CREATE OR ALTER PROCEDURE spVeterinario_Insert
	@Nombre NVARCHAR(30),
	@Apellido NVARCHAR(30),
	@Especialidad NVARCHAR(50)
AS
BEGIN
	INSERT INTO Veterinario (Nombre, Apellido, Especialidad)
	VALUES (@Nombre, @Apellido, @Especialidad)
END
GO

-- Stored Procedure to Delete
CREATE OR ALTER PROCEDURE spVeterinario_Delete
	@Id_Veterinario INT
AS
BEGIN
	DELETE FROM Veterinario WHERE Id_Veterinario = @Id_Veterinario
END
GO

-- Stored Procedure to Update 
CREATE OR ALTER PROCEDURE spVeterinario_Update
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

-- ========= Animal ========= 

-- Stored Procedure to Get All
CREATE OR ALTER PROCEDURE spAnimal_GetAll
AS
BEGIN
	SELECT Id_Animal, Especie, Edad, Genero FROM Animal
END
GO

-- Stored Procedure to Get a by ID
CREATE OR ALTER PROCEDURE spAnimal_GetById
	@Id_Animal INT
AS
BEGIN
	SELECT Id_Animal, Especie, Edad, Genero FROM Animal
	WHERE Id_Animal = @Id_Animal
END
GO

-- Stored Procedure to Insert
CREATE OR ALTER PROCEDURE spAnimal_Insert
	@Especie NVARCHAR(50),
	@Edad NVARCHAR(15),
	@Genero NVARCHAR(15) 
AS
BEGIN
	INSERT INTO Animal (Especie, Edad, Genero)
	VALUES (@Especie, @Edad, @Genero)
END
GO

-- Stored Procedure to Update 
CREATE OR ALTER PROCEDURE spAnimal_Update
	@Id_Animal INT,
	@Especie NVARCHAR(50),
	@Edad NVARCHAR(15),
	@Genero NVARCHAR(15) 
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

-- Stored Procedure to Delete
CREATE OR ALTER PROCEDURE spAnimal_Delete
	@Id_Animal INT
AS
BEGIN
	DELETE FROM Animal WHERE Id_Animal = @Id_Animal
END
GO


-- // ========= Anomalia // ========= 

-- Stored Procedure to Insert
CREATE OR ALTER PROCEDURE spAnomalia_Insert
	@Nombre NVARCHAR(75),
	@Descripcion NVARCHAR(100)
AS
BEGIN
	INSERT INTO Anomalia(Nombre, Descripcion)
	VALUES (@Nombre, @Descripcion)
END
GO

-- Stored Procedure to Get All
CREATE OR ALTER PROCEDURE spAnomalia_GetAll
AS
BEGIN
	SELECT Id_Anomalia, Nombre, Descripcion FROM Anomalia
END
GO

-- Stored Procedure to Get a by ID
CREATE OR ALTER PROCEDURE spAnomalia_GetById
	@Id_Anomalia INT
AS
BEGIN
	SELECT Id_Anomalia, Nombre, Descripcion FROM Anomalia
	WHERE Id_Anomalia = @Id_Anomalia
END
GO

-- Stored Procedure to Delete
CREATE OR ALTER PROCEDURE spAnomalia_Delete
	@Id_Anomalia INT
AS
BEGIN
	DELETE FROM Anomalia WHERE Id_Anomalia = @Id_Anomalia
END
GO

-- Stored Procedure to Update 
CREATE OR ALTER PROCEDURE spAnomalia_Update
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


--// ========= AnomaliasExamen //========= 

-- Stored Procedure to Get All
CREATE OR ALTER PROCEDURE spAnomaliasExamen_GetAll
AS
BEGIN
	SELECT Id_AnomaliaExamen, AE.Id_Anomalia, A.Nombre, AE.Id_Examen, EC.TipoAnalisis FROM AnomaliasExamen AS AE
	INNER JOIN Anomalia AS A ON AE.Id_Anomalia = A.Id_Anomalia 
	INNER JOIN ExamenClinico AS EC ON AE.Id_Examen = EC.Id_Examen
END
GO

-- Stored Procedure to Get a by ID
CREATE OR ALTER PROCEDURE spAnomaliasExamen_GetById
	@Id_AnomaliaExamen INT
AS
BEGIN
	SELECT Id_AnomaliaExamen, AE.Id_Anomalia, A.Nombre, AE.Id_Examen, EC.TipoAnalisis FROM AnomaliasExamen AS AE
	INNER JOIN Anomalia AS A ON AE.Id_Anomalia = A.Id_Anomalia 
	INNER JOIN ExamenClinico AS EC ON AE.Id_Examen = EC.Id_Examen
	WHERE AE.Id_AnomaliaExamen = @Id_AnomaliaExamen
END
GO

-- Stored Procedure to Insert
CREATE OR ALTER PROCEDURE spAnomaliasExamen_Insert
	@Id_Anomalia INT,
	@Id_Examen INT 
AS
BEGIN
	INSERT INTO AnomaliasExamen (Id_Anomalia, Id_Examen)
	VALUES (@Id_Anomalia, @Id_Examen)
END
GO

-- Stored Procedure to Update
CREATE OR ALTER PROCEDURE spAnomaliasExamen_Update
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

-- Stored Procedure to Delete
CREATE OR ALTER PROCEDURE spAnomaliasExamen_Delete
	@Id_AnomaliaExamen INT
AS
BEGIN
	DELETE FROM AnomaliasExamen WHERE Id_AnomaliaExamen = @Id_AnomaliaExamen
END
GO

--------------------------------------------------------------------------------------------------

--Insercion de datos a las tablas

USE API_Vet;

-- Insertar datos en la tabla Veterinario
INSERT INTO Veterinario (Nombre, Apellido, Especialidad) VALUES ('Juan', 'Pérez', 'Cirugía');
INSERT INTO Veterinario (Nombre, Apellido, Especialidad) VALUES ('Ana', 'Gómez', 'Dermatología');

-- Insertar datos en la tabla Animal
INSERT INTO Animal (Especie, Edad, Genero) VALUES ('Perro', 5, 'Macho');
INSERT INTO Animal (Especie, Edad, Genero) VALUES ('Gato', 3, 'Hembra');

-- Insertar datos en la tabla ExamenClinico
INSERT INTO ExamenClinico (TipoAnalisis, Resultados, Id_Animal, Id_Veterinario) 
VALUES ('Hematología', 'Normales', 1, 1);
INSERT INTO ExamenClinico (TipoAnalisis, Resultados, Id_Animal, Id_Veterinario) 
VALUES ('Bioquímica', 'Anormales', 2, 2);

-- Insertar datos en la tabla TipoAnalisis
INSERT INTO TipoAnalisis (Nombre, Descripcion) VALUES ('Hematología', 'Análisis de la sangre');
INSERT INTO TipoAnalisis (Nombre, Descripcion) VALUES ('Bioquímica', 'Análisis químico de fluidos');

-- Insertar datos en la tabla ParametroAnalisis
INSERT INTO ParametroAnalisis (Nombre, ValorReferencia, Id_TipoAnalisis) 
VALUES ('Glucosa', '70-110 mg/dL', 2);
INSERT INTO ParametroAnalisis (Nombre, ValorReferencia, Id_TipoAnalisis) 
VALUES ('Hematocrito', '40-50%', 1);

-- Insertar datos en la tabla Anomalia
INSERT INTO Anomalia (Nombre, Descripcion) VALUES ('Hipoglucemia', 'Bajo nivel de glucosa en la sangre');
INSERT INTO Anomalia (Nombre, Descripcion) VALUES ('Anemia', 'Disminución de glóbulos rojos');

-- Insertar datos en la tabla ParametroExamen
INSERT INTO ParametroExamen (Valor, Id_Examen, Id_ParametroAnalisis) 
VALUES ('85 mg/dL', 1, 1);
INSERT INTO ParametroExamen (Valor, Id_Examen, Id_ParametroAnalisis) 
VALUES ('45%', 2, 2);

-- Insertar datos en la tabla AnomaliasExamen
INSERT INTO AnomaliasExamen (Id_Anomalia, Id_Examen) VALUES (1, 1);
INSERT INTO AnomaliasExamen (Id_Anomalia, Id_Examen) VALUES (2, 2);


----------------------------
--Seleccion de tablas

Select * from TipoAnalisis

Select * from ParametroAnalisis

Select * from ParametroExamen

Select * from ExamenClinico

Select * from Anomalia

Select * from AnomaliasExamen

Select * from Veterinario

Select * from Animal


