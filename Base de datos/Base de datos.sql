
CREATE DATABASE API_Vet;
GO

USE API_Vet;

----------------------------
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

-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Insertar

CREATE PROCEDURE dbo.spTipoAnalisis_Insert
    @Nombre NVARCHAR(75),
    @Descripcion NVARCHAR(100)
AS
BEGIN
    INSERT INTO TipoAnalisis (Nombre, Descripcion)
    VALUES (@Nombre, @Descripcion);
END

-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Actualizar

CREATE PROCEDURE dbo.spTipoAnalisis_Update
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

-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Eliminar

CREATE PROCEDURE dbo.spTipoAnalisis_Delete
    @Id_TipoAnalisis INT
AS
BEGIN
    DELETE FROM TipoAnalisis
    WHERE Id_TipoAnalisis = @Id_TipoAnalisis;
END

-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Obtener Todos

CREATE PROCEDURE dbo.spTipoAnalisis_GetAll
AS
BEGIN
    SELECT Id_TipoAnalisis, Nombre, Descripcion
    FROM TipoAnalisis;
END

-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Obtener por ID

CREATE PROCEDURE dbo.spTipoAnalisis_GetById
    @Id_TipoAnalisis INT
AS
BEGIN
    SELECT Id_TipoAnalisis, Nombre, Descripcion
    FROM TipoAnalisis
    WHERE Id_TipoAnalisis = @Id_TipoAnalisis;
END


EXEC dbo.spTipoAnalisis_GetById 1



-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
--ParametroAnalisis

-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Insertar

CREATE PROCEDURE dbo.spParametroAnalisis_Insert
    @Nombre NVARCHAR(50),
    @ValorReferencia NVARCHAR(50),
    @Id_TipoAnalisis INT
AS
BEGIN
    INSERT INTO ParametroAnalisis (Nombre, ValorReferencia, Id_TipoAnalisis)
    VALUES (@Nombre, @ValorReferencia, @Id_TipoAnalisis);
END

-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Actualizar	

CREATE PROCEDURE dbo.spParametroAnalisis_Update
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

-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Eliminar

CREATE PROCEDURE dbo.spParametroAnalisis_Delete
    @Id_ParametroAnalisis INT
AS
BEGIN
    DELETE FROM ParametroAnalisis
    WHERE Id_ParametroAnalisis = @Id_ParametroAnalisis;
END

-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Obtener Todos con INNER JOIN

CREATE PROCEDURE dbo.spParametroAnalisis_GetAll
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

exec dbo.spParametroAnalisis_GetAll
-------------------------------------------------
-------------------------------------------------
--Stored Procedure para Obtener por ID con INNER JOIN

CREATE PROCEDURE dbo.spParametroAnalisis_GetById
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

EXEC dbo.spParametroAnalisis_GetById 1


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
--ParametroExamen

-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Insertar

CREATE PROCEDURE dbo.spParametroExamen_Insert
    @Valor NVARCHAR(30),
    @Id_Examen INT,
    @Id_ParametroAnalisis INT
AS
BEGIN
    INSERT INTO ParametroExamen (Valor, Id_Examen, Id_ParametroAnalisis)
    VALUES (@Valor, @Id_Examen, @Id_ParametroAnalisis);
END

-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Actualizar

CREATE PROCEDURE dbo.spParametroExamen_Update
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

-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Eliminar

CREATE PROCEDURE dbo.spParametroExamen_Delete
    @Id_ParametroExamen INT
AS
BEGIN
    DELETE FROM ParametroExamen
    WHERE Id_ParametroExamen = @Id_ParametroExamen;
END

dbo.spParametroExamen_Delete 5

-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Obtener Todos con INNER JOIN

CREATE PROCEDURE dbo.spParametroExamen_GetAll
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

exec dbo.spParametroExamen_GetAll

-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Obtener por ID con INNER JOIN

CREATE PROCEDURE dbo.spParametroExamen_GetById
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

exec dbo.spParametroExamen_GetById 3


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
--SP DE  ExamenClinico


-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Insertar

CREATE PROCEDURE dbo.spExamenClinico_Insert
    @TipoAnalisis NVARCHAR(75),
    @Resultados NVARCHAR(75),
    @Id_Animal INT,
    @Id_Veterinario INT
AS
BEGIN
    INSERT INTO ExamenClinico (TipoAnalisis, Resultados, Id_Animal, Id_Veterinario)
    VALUES (@TipoAnalisis, @Resultados, @Id_Animal, @Id_Veterinario);
END

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Actualizar

CREATE PROCEDURE dbo.spExamenClinico_Update
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

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Eliminar

CREATE PROCEDURE dbo.spExamenClinico_Delete
    @Id_Examen INT
AS
BEGIN
    DELETE FROM ExamenClinico
    WHERE Id_Examen = @Id_Examen;
END

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Obtener Todos con INNER JOIN

CREATE PROCEDURE dbo.spExamenClinico_GetAll
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

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
--Procedimiento Almacenado para Obtener por ID con INNER JOIN

CREATE PROCEDURE dbo.spExamenClinico_GetById
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

EXEC  dbo.spExamenClinico_GetById 1

-- ============  STORED PROCEDURES ============== ---

-- ========= Veterinario ========= 

-- Stored Procedure to GetAll
CREATE OR ALTER PROCEDURE spVeterinario_GetAll
AS
BEGIN
	SELECT Id_Veterinario, Nombre, Apellido, Especialidad FROM Veterinario
END
GO

exec spVeterinario_GetAll

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
    @Edad INT,
    @Genero NVARCHAR(50)
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


-------------------------------------------------
-------------------------------------------------
--TABLAS API	


CREATE TABLE Veterinario (
    Id_Veterinario INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(30) NOT NULL,
    Apellido NVARCHAR(30) NOT NULL,
    Especialidad NVARCHAR(50) NOT NULL
);

CREATE TABLE Animal (
    Id_Animal INT PRIMARY KEY IDENTITY(1,1),
    Especie NVARCHAR(50) NOT NULL,
    Edad INT NOT NULL,
    Genero NVARCHAR(15) NOT NULL
);

CREATE TABLE ExamenClinico (
    Id_Examen INT PRIMARY KEY IDENTITY(1,1),
    TipoAnalisis NVARCHAR(75) NOT NULL,
    Resultados NVARCHAR(75) NOT NULL,
    Id_Animal INT NOT NULL,
    Id_Veterinario INT NOT NULL,
    FOREIGN KEY (Id_Animal) REFERENCES Animal(Id_Animal),
    FOREIGN KEY (Id_Veterinario) REFERENCES Veterinario(Id_Veterinario)
);

CREATE TABLE TipoAnalisis (
    Id_TipoAnalisis INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(75) NOT NULL,
    Descripcion NVARCHAR(100) NOT NULL
);

CREATE TABLE ParametroAnalisis (
    Id_ParametroAnalisis INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    ValorReferencia NVARCHAR(50) NOT NULL,
    Id_TipoAnalisis INT NOT NULL,
    FOREIGN KEY (Id_TipoAnalisis) REFERENCES TipoAnalisis(Id_TipoAnalisis)
);

CREATE TABLE Anomalia (
    Id_Anomalia INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(75) NOT NULL,
    Descripcion NVARCHAR(100) NOT NULL
);

CREATE TABLE ParametroExamen (
    Id_ParametroExamen INT PRIMARY KEY IDENTITY(1,1),
    Valor NVARCHAR(30) NOT NULL,
    Id_Examen INT NOT NULL,
    Id_ParametroAnalisis INT NOT NULL,
    FOREIGN KEY (Id_Examen) REFERENCES ExamenClinico(Id_Examen),
    FOREIGN KEY (Id_ParametroAnalisis) REFERENCES ParametroAnalisis(Id_ParametroAnalisis)
);

CREATE TABLE AnomaliasExamen (
    Id_AnomaliaExamen INT PRIMARY KEY IDENTITY(1,1),
    Id_Anomalia INT NOT NULL,
    Id_Examen INT NOT NULL,
    FOREIGN KEY (Id_Anomalia) REFERENCES Anomalia(Id_Anomalia),
    FOREIGN KEY (Id_Examen) REFERENCES ExamenClinico(Id_Examen)
);

-------------------------------------------------
-------------------------------------------------
--Insercion de datos a las tablas

USE API_Vet;

-- Insertar datos en la tabla Veterinario
INSERT INTO Veterinario (Nombre, Apellido, Especialidad) VALUES ('Juan', 'P�rez', 'Cirug�a');
INSERT INTO Veterinario (Nombre, Apellido, Especialidad) VALUES ('Ana', 'G�mez', 'Dermatolog�a');

-- Insertar datos en la tabla Animal
INSERT INTO Animal (Especie, Edad, Genero) VALUES ('Perro', 5, 'Macho');
INSERT INTO Animal (Especie, Edad, Genero) VALUES ('Gato', 3, 'Hembra');

-- Insertar datos en la tabla ExamenClinico
INSERT INTO ExamenClinico (TipoAnalisis, Resultados, Id_Animal, Id_Veterinario) 
VALUES ('Hematolog�a', 'Normales', 1, 1);
INSERT INTO ExamenClinico (TipoAnalisis, Resultados, Id_Animal, Id_Veterinario) 
VALUES ('Bioqu�mica', 'Anormales', 2, 2);

-- Insertar datos en la tabla TipoAnalisis
INSERT INTO TipoAnalisis (Nombre, Descripcion) VALUES ('Hematolog�a', 'An�lisis de la sangre');
INSERT INTO TipoAnalisis (Nombre, Descripcion) VALUES ('Bioqu�mica', 'An�lisis qu�mico de fluidos');

-- Insertar datos en la tabla ParametroAnalisis
INSERT INTO ParametroAnalisis (Nombre, ValorReferencia, Id_TipoAnalisis) 
VALUES ('Glucosa', '70-110 mg/dL', 2);
INSERT INTO ParametroAnalisis (Nombre, ValorReferencia, Id_TipoAnalisis) 
VALUES ('Hematocrito', '40-50%', 1);

-- Insertar datos en la tabla Anomalia
INSERT INTO Anomalia (Nombre, Descripcion) VALUES ('Hipoglucemia', 'Bajo nivel de glucosa en la sangre');
INSERT INTO Anomalia (Nombre, Descripcion) VALUES ('Anemia', 'Disminuci�n de gl�bulos rojos');

-- Insertar datos en la tabla ParametroExamen
INSERT INTO ParametroExamen (Valor, Id_Examen, Id_ParametroAnalisis) 
VALUES ('85 mg/dL', 3, 4);
INSERT INTO ParametroExamen (Valor, Id_Examen, Id_ParametroAnalisis) 
VALUES ('45%', 4, 5);

-- Insertar datos en la tabla AnomaliasExamen
INSERT INTO AnomaliasExamen (Id_Anomalia, Id_Examen) VALUES (1, 3);
INSERT INTO AnomaliasExamen (Id_Anomalia, Id_Examen) VALUES (2, 4);




