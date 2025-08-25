USE prueb;
GO
IF OBJECT_ID('Matriculas','U') IS NOT NULL DROP TABLE Matriculas;
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

CREATE TABLE Matriculas (
    MatriculaID INT PRIMARY KEY IDENTITY(1,1),
    AlumnoID INT NOT NULL,
    CursoID INT NOT NULL,
    Fecha DATE DEFAULT GETDATE(),
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);


INSERT INTO Profesores (Nombre) VALUES ('Rodrigo Ramirez'), ('Juana Flores'), ('José Chávez');
INSERT INTO Alumnos (Nombre)    VALUES ('Romina Quispe'), ('Maria Mamani'), ('Luis Sanchez');
INSERT INTO Cursos (Nombre, ProfesorID) VALUES ('InglesI',2), ('Matemática',1), ('Civica',3);
INSERT INTO Matriculas (AlumnoID, CursoID) VALUES (1,1), (2,2), (3,3);

SELECT * FROM Profesores;
SELECT * FROM Alumnos;
SELECT * FROM Cursos;
SELECT * FROM Matriculas;

SELECT 
    a.Nombre AS Alumno,
    c.Nombre AS Curso,
    p.Nombre AS Profesor,
    m.Fecha AS FechaMatricula
FROM Matriculas m
JOIN Alumnos a ON m.AlumnoID = a.AlumnoID
JOIN Cursos c ON m.CursoID = c.CursoID
JOIN Profesores p ON c.ProfesorID = p.ProfesorID;

