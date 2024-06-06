
CREATE DATABASE API_Vet;
GO

USE API_Vet;

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
