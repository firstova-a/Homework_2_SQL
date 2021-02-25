use AdventureWorks;
GO
--����� ����������� ������� (� ������� �������)
SELECT TOP (1) (od.ProductID),(pp.Name),SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
left Join Production.Product pp
ON od.ProductID = pp.ProductID
GROUP BY od.ProductID, od.OrderQty, pp.Name
ORDER BY SUM(od.OrderQty) DESC

--�������, ������� ������ ���� ����� ������� (� ������� �����) 
SELECT  TOP (1) (oh.CustomerID),(per.FirstName), (per.MiddleName), (per.LastName), SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Person.Person per
ON oh.CustomerID = per.BusinessEntityID
GROUP BY oh.CustomerID, per.FirstName, per.MiddleName, per.LastName, od.OrderQty
ORDER BY SUM(od.OrderQty) DESC

--��������, ������� ������ ������ ���� ������� (� ������� ������)
SELECT TOP (1) (oh.SalesPersonID), (per.FirstName), (per.MiddleName), (per.LastName), SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Person.Person per
ON oh.SalesPersonID = per.BusinessEntityID
where oh.SalesPersonID is not null
GROUP BY oh.SalesPersonID, per.FirstName, per.MiddleName, per.LastName, od.OrderQty
ORDER BY SUM(od.OrderQty) DESC

--�������, ������� �������� ������ ����� ����� (� ������� ��������)
SELECT TOP (1) (oh.CustomerID), (per.FirstName), (per.MiddleName), (per.LastName), SUM(oh.SubTotal+oh.TaxAmt+oh.Freight) SUMTotal
FROM Sales.SalesOrderHeader oh
left Join Person.Person per
ON oh.CustomerID = per.BusinessEntityID
GROUP BY  oh.CustomerID, per.FirstName, per.MiddleName, per.LastName
ORDER BY SUM(oh.SubTotal) DESC

--������ ����� ������� - ��� �����, �� ��� TOP (1)

--����� ����������� �������� (� ������� �������)
SELECT  (od.ProductID),(pp.Name),SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Production.Product pp
ON od.ProductID = pp.ProductID
GROUP BY od.ProductID, od.OrderQty, pp.Name
ORDER BY SUM(od.OrderQty) DESC

--�������, ������� ������ ���� ������ ������� (� ������� �����) 
SELECT   (oh.CustomerID),(per.FirstName), (per.MiddleName), (per.LastName), SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Person.Person per
ON oh.CustomerID = per.BusinessEntityID
GROUP BY oh.CustomerID, per.FirstName, per.MiddleName, per.LastName, od.OrderQty
ORDER BY SUM(od.OrderQty) DESC

--��������, ������� ������� ������ ���� ������� (� ������� ������)
SELECT  (oh.SalesPersonID), (per.FirstName), (per.MiddleName), (per.LastName), SUM(od.OrderQty) SUMOrderQty
FROM Sales.SalesOrderDetail od
Inner Join Sales.SalesOrderHeader oh
ON od.SalesOrderID = oh.SalesOrderID
Left Join Person.Person per
ON oh.SalesPersonID = per.BusinessEntityID
where oh.SalesPersonID is not null
GROUP BY oh.SalesPersonID, per.FirstName, per.MiddleName, per.LastName, od.OrderQty
ORDER BY SUM(od.OrderQty) DESC

--�������, ������� ��������� ������ ����� ����� (� ������� ���������)
SELECT  (oh.CustomerID), (per.FirstName), (per.MiddleName), (per.LastName), SUM(oh.SubTotal+oh.TaxAmt+oh.Freight) SUMTotal
FROM Sales.SalesOrderHeader oh
left Join Person.Person per
ON oh.CustomerID = per.BusinessEntityID
GROUP BY  oh.CustomerID, per.FirstName, per.MiddleName, per.LastName
ORDER BY SUM(oh.SubTotal) DESC


