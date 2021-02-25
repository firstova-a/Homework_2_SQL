use AdventureWorks;
GO
--самый продаваемый продукт (и сколько продали)
SELECT TOP (1) (od.ProductID),(pp.Name),SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
left Join Production.Product pp
ON od.ProductID = pp.ProductID
GROUP BY od.ProductID, od.OrderQty, pp.Name
ORDER BY SUM(od.OrderQty) DESC

--Клиента, который больше всех купил товаров (и сколько купил) 
SELECT  TOP (1) (oh.CustomerID),(per.FirstName), (per.MiddleName), (per.LastName), SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Person.Person per
ON oh.CustomerID = per.BusinessEntityID
GROUP BY oh.CustomerID, per.FirstName, per.MiddleName, per.LastName, od.OrderQty
ORDER BY SUM(od.OrderQty) DESC

--Продавца, который продал больше всех товаров (и сколько продал)
SELECT TOP (1) (oh.SalesPersonID), (per.FirstName), (per.MiddleName), (per.LastName), SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Person.Person per
ON oh.SalesPersonID = per.BusinessEntityID
where oh.SalesPersonID is not null
GROUP BY oh.SalesPersonID, per.FirstName, per.MiddleName, per.LastName, od.OrderQty
ORDER BY SUM(od.OrderQty) DESC

--Клиента, который потратил больше всего денег (и сколько потратил)
SELECT TOP (1) (oh.CustomerID), (per.FirstName), (per.MiddleName), (per.LastName), SUM(oh.SubTotal+oh.TaxAmt+oh.Freight) SUMTotal
FROM Sales.SalesOrderHeader oh
left Join Person.Person per
ON oh.CustomerID = per.BusinessEntityID
GROUP BY  oh.CustomerID, per.FirstName, per.MiddleName, per.LastName
ORDER BY SUM(oh.SubTotal) DESC

--вторая часть задания - все также, но без TOP (1)

--самые продаваемые продукты (и сколько продали)
SELECT  (od.ProductID),(pp.Name),SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Production.Product pp
ON od.ProductID = pp.ProductID
GROUP BY od.ProductID, od.OrderQty, pp.Name
ORDER BY SUM(od.OrderQty) DESC

--Клиенты, который больше всех купили товаров (и сколько купил) 
SELECT   (oh.CustomerID),(per.FirstName), (per.MiddleName), (per.LastName), SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Person.Person per
ON oh.CustomerID = per.BusinessEntityID
GROUP BY oh.CustomerID, per.FirstName, per.MiddleName, per.LastName, od.OrderQty
ORDER BY SUM(od.OrderQty) DESC

--Продавцы, которые продали больше всех товаров (и сколько продал)
SELECT  (oh.SalesPersonID), (per.FirstName), (per.MiddleName), (per.LastName), SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Person.Person per
ON oh.SalesPersonID = per.BusinessEntityID
where oh.SalesPersonID is not null
GROUP BY oh.SalesPersonID, per.FirstName, per.MiddleName, per.LastName, od.OrderQty
ORDER BY SUM(od.OrderQty) DESC

--Клиенты, которые потратили больше всего денег (и сколько потратили)
SELECT  (oh.CustomerID), (per.FirstName), (per.MiddleName), (per.LastName), SUM(oh.SubTotal+oh.TaxAmt+oh.Freight) SUMTotal
FROM Sales.SalesOrderHeader oh
left Join Person.Person per
ON oh.CustomerID = per.BusinessEntityID
GROUP BY  oh.CustomerID, per.FirstName, per.MiddleName, per.LastName
ORDER BY SUM(oh.SubTotal) DESC


