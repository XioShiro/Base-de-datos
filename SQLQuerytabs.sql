USE newtab;
GO
IF OBJECT_ID ('Cursos', 'U') IS NOT NULL DROP TABLE Cursos;
IF OBJECT_ID ('Alumnos', 'U') IS NOT NULL DROP TABLE Alumnos;
IF OBJECT_ID ('Profesores', 'U') IS NOT NULL DROP TABLE Profesores;


CREATE TABLE Profesores (
ProfesorID INT PRIMARY KEY IDENTITY (1,1),
Nombre NVARCHAR (100) NOT NULL 
);

CREATE TABLE Alumnos (
AlumnoID INT PRIMARY KEY IDENTITY (1,1), 
Nombre NVARCHAR (100) NOT NULL
);

CREATE TABLE Cursos (
CursoID INT PRIMARY KEY IDENTITY (1,1),
Nombre NVARCHAR(100) NOT NULL, 
ProfesorID INT NOT NULL, 
FOREIGN KEY (ProfesorID) references Profesores(ProfesorID)
);


INSERT INTO Profesores (Nombre) VALUES ('Rodrigo Ramirez');
INSERT INTO Profesores (Nombre) VALUES ('Juana Flores');

INSERT INTO Alumnos (Nombre) VALUES ('Romina Quispe');
INSERT INTO Alumnos (Nombre) VALUES ('Maria Mamani');

INSERT INTO Cursos (Nombre, ProfesorID) VALUES ('InglesI',2);
INSERT INTO Cursos (Nombre, ProfesorID) VALUES ('Matemática',1);


SELECT * FROM Profesores;
SELECT * FROM Alumnos;
SELECT * FROM Cursos;


SELECT 
c.Nombre AS Curso,
p.Nombre AS Profesor
FROM Cursos c
JOIN Profesores p ON c.ProfesorID = p.ProfesorID;