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


INSERT INTO Profesores (Nombre) VALUES ('Rodrigo Ramirez'), ('Juana Flores'), ('José Chávez'), ('Carlos Torres'), ('David Gonzales');
INSERT INTO Alumnos (Nombre)    VALUES ('Romina Quispe'), ('Brenda Mamani'), ('Luis Sanchez'), ('Miranda Lopez'), ('Jorge Salazar');
INSERT INTO Cursos (Nombre, ProfesorID) VALUES ('InglesI',2), ('Matemática',1), ('Civica',3),  ('Historia', 4), ('Calculo I', 5);
INSERT INTO Matriculas (AlumnoID, CursoID) VALUES (1,1), (2,2), (3,3); 


SELECT * FROM Profesores;
SELECT * FROM Alumnos;
SELECT * FROM Cursos;
SELECT * FROM Matriculas ORDER BY Fecha;


 --INNER JOIN solo alumnos con matricula ordenados por Curso de A-Z
SELECT 
    a.Nombre AS Alumno,
    c.Nombre AS Curso,
    p.Nombre AS Profesor,
    m.Fecha AS FechaMatricula
FROM Matriculas m
JOIN Alumnos a ON m.AlumnoID = a.AlumnoID
JOIN Cursos c ON m.CursoID = c.CursoID
JOIN Profesores p ON c.ProfesorID = p.ProfesorID
ORDER BY c.Nombre ASC;

--INNER JOIN solo alumnos con matricula ordenados por Curso de Z-A
SELECT 
    a.Nombre AS Alumno,
    c.Nombre AS Curso,
    p.Nombre AS Profesor,
    m.Fecha AS FechaMatricula
FROM Matriculas m
JOIN Alumnos a ON m.AlumnoID = a.AlumnoID
JOIN Cursos c ON m.CursoID = c.CursoID
JOIN Profesores p ON c.ProfesorID = p.ProfesorID
ORDER BY c.Nombre DESC;

--LEFT JOIN todos los alumnos con matricula y sin matricula ordenados por ID
SELECT a.AlumnoID, a.Nombre AS Alumno, c.CursoID, c.Nombre AS Curso, p.Nombre AS Profesor, m.Fecha
FROM Alumnos a
LEFT JOIN Matriculas m ON a.AlumnoID = m.AlumnoID
LEFT JOIN Cursos c ON m.CursoID = c.CursoID
LEFT JOIN Profesores p ON c.ProfesorID = p.ProfesorID
ORDER BY a.AlumnoID;

--Solo alumnos SIN matrícula ordenados de A-Z
SELECT a.AlumnoID, a.Nombre
FROM Alumnos a
LEFT JOIN Matriculas m ON a.AlumnoID = m.AlumnoID
WHERE m.MatriculaID IS NULL
ORDER BY a.Nombre ASC;

--Solo alumnos SIN matrícula ordenados de A-Z
SELECT a.AlumnoID, a.Nombre
FROM Alumnos a
LEFT JOIN Matriculas m ON a.AlumnoID = m.AlumnoID
WHERE m.MatriculaID IS NULL
ORDER BY a.Nombre DESC;

--Profesores Ordenados de A-Z
SELECT p.ProfesorID, p.Nombre
FROM Profesores p
ORDER BY p.Nombre ASC;
--Profesores ordenados de Z-A
SELECT p.ProfesorID, p.Nombre
FROM Profesores p
ORDER BY p.Nombre DESC;


