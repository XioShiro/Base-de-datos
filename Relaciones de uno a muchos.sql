Use AdventureWorksLT2022;
GO
-- Devuelve solo pedidos que tienen al menos una línea
SELECT soh.SalesOrderID, soh.OrderDate, 
       sod.SalesOrderDetailID, sod.ProductID, sod.OrderQty
FROM SalesLT.SalesOrderHeader AS soh
INNER JOIN SalesLT.SalesOrderDetail AS sod
  ON soh.SalesOrderID = sod.SalesOrderID
ORDER BY soh.SalesOrderID, sod.SalesOrderDetailID;

--Devuelve todos los pedidos; si un pedido no tiene líneas, las columnas del detalle salen NULL
SELECT soh.SalesOrderID, soh.OrderDate, 
       sod.SalesOrderDetailID, sod.ProductID, sod.OrderQty
FROM SalesLT.SalesOrderHeader AS soh
LEFT JOIN SalesLT.SalesOrderDetail AS sod
  ON soh.SalesOrderID = sod.SalesOrderID
ORDER BY soh.SalesOrderID, sod.SalesOrderDetailID;

--Devuelve todas las filas de SalesOrderDetail; si alguna línea no tuviera pedido, el pedido saldría NULL
SELECT soh.SalesOrderID, soh.OrderDate, 
       sod.SalesOrderDetailID, sod.ProductID, sod.OrderQty
FROM SalesLT.SalesOrderHeader AS soh
RIGHT JOIN SalesLT.SalesOrderDetail AS sod
  ON soh.SalesOrderID = sod.SalesOrderID
ORDER BY sod.SalesOrderID, sod.SalesOrderDetailID;

--Resumen, cuántas líneas y total de cantidad 
SELECT soh.SalesOrderID, soh.OrderDate,
       COUNT(sod.SalesOrderDetailID) AS LinesCount,
       SUM(sod.OrderQty) AS TotalQuantity
FROM SalesLT.SalesOrderHeader soh
LEFT JOIN SalesLT.SalesOrderDetail sod
  ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY soh.SalesOrderID, soh.OrderDate
ORDER BY LinesCount DESC;