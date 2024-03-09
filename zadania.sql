use AdventureWorks2014
go

--1 
select * from Production.Product
where Color = 'Black'
order by ListPrice desc

--2
select * from Production.Product
where Color in ('Red', 'Blue') AND name like 'L%' 
Order by size desc, ListPrice asc

--3
select * from Sales.SalesTerritory
where [Group] = 'Europe'
order by Name

--4
select * from Sales.SalesTerritory
order by [Group] desc, name asc

--5
select * from Sales.SalesOrderHeader
where TerritoryID = 7 or TerritoryID = 8 or TerritoryID = 9
order by OrderDate

select * from Sales.SalesOrderHeader
where TerritoryID in (7, 8, 9)

--6
select * from sales.SalesOrderHeader
where TerritoryID in (7, 8, 9) and SubTotal < 100
order by OrderDate

--7
select top 10 * from sales.SalesOrderHeader
where TerritoryID in (7)
order by SubTotal asc

--8
select * from sales.SalesOrderHeader
where TerritoryID in (7) and CreditCardID is  NULL

--9
select * from sales.SalesOrderHeader
where TerritoryID in (7) and CreditCardID is not null

--10
select * from sales.SalesOrderHeader
where OrderDate >= '20110101' and OrderDate <='20111231'
order by OrderDate

select * from sales.SalesOrderHeader
where OrderDate between '20110101' and '20111231'
order by orderdate
