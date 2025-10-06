USE  AdventureWorksLT2022;
SELECT SCHEMA_NAME(p.schema_id) AS Esquema,
       p.name AS NombreProcedimiento,
       p.object_id
FROM sys.procedures p
WHERE p.name LIKE '%matric%';SELECT SCHEMA_NAME(p.schema_id) AS Esquema,
       p.name AS NombreProcedimiento,
       p.object_id
FROM sys.procedures p
WHERE p.name LIKE '%matric%';
