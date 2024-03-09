use AdventureWorks2014
go
/*Baza: [AdventureWorks2014]
1. Wyświetl wszystkie produkty (tabela Production.Product) koloru czarnego, posortowane malejąco wg ceny (ListPrice)
2. Przesunęła się granica niektórych stanów w USA. Miasto Burbank nie znajduje się już w Ohio, lecz w Pensylwanii. Dokonaj aktualizacji w bazie.
Tabele: Person.Address, Person.StateProvince
3. Oblicz wartość każdego zamówienia. Przedstaw wynik w formie raportu dla zarządu. UWAGA! Jest to zadanie kreatywne (nie ma jednej dobrej odpowiedzi). 
Należy zastanowić się nad tym, jakimi danymi mógłby być zainteresowany zarząd, a następnie przygotować taki raport. 
Jako rozwiązanie można wkleić zdjęcie raportu lub przesłać go w całości w postaci pliku.
Tabele: Sales.SalesOrderHeader, Sales.SalesOrderDetail
4. Wykonaj raport prezentujący ilość zamówień w poszczególnych latach dla sklepu "eCommerce Bikes"
Tabele: Sales.SalesOrderHeader, Sales.Customer, Sales.Store
5. Wykonaj zapytanie, które zwróci dane zaprezentowane w arkuszu Report.csv.
Tabele: Sales.SalesOrderHeader, Sales.Customer, Sales.Store*/

--=========================================================================================================================================================================================

/*1. Wyświetl wszystkie produkty (tabela Production.Product) koloru czarnego, posortowane malejąco wg ceny (ListPrice)*/

-- Wyświetlam całą zawartość tabeli Production.Product w celu zweryfikowania zawartości/rekordów tabeli.
SELECT * FROM Production.Product;

-- Wykorzystuję klauzulę WHERE do wyświetlenia koloru czarnego oraz sortuję wyniki malejąco(desc) wg. ceny dzięki klauzuli ORDER BY.
SELECT * FROM Production.Product 
WHERE Color = 'Black' 
ORDER BY ListPrice DESC;

-- Wyniki wyszukiwania można też wyświetlić, jako dwie interesujące nas kolumny, bez pokazywania innych danych z tabeli.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product 
WHERE Color = 'Black'
ORDER BY ListPrice DESC;

--=========================================================================================================================================================================================

/*2. Przesunęła się granica niektórych stanów w USA. Miasto Burbank nie znajduje się już w Ohio, lecz w Pensylwanii. Dokonaj aktualizacji w bazie.
Tabele: Person.Address, Person.StateProvince*/

-- Wyświetlam całą zawatość tabeli Person.Adress w celu wyszukania adresów z miasta Burbank.
SELECT * FROM Person.Address 
WHERE City = 'Burbank';

-- Wyszukanie dokładnej nazwy stanów Ohio i Pensylwania.
SELECT * FROM Person.StateProvince 
WHERE Name like 'Oh%';

SELECT * FROM Person.StateProvince 
WHERE Name like 'Pe%';

-- Wyświetlam zawatość tabeli Person.StateProvince i wyszukuję wszystkie rekordy, które są zapisane do stanu Ohio i Pensylwanii w celu sprawdzenia i porównania kodów stanu. 
SELECT * FROM Person.StateProvince 
WHERE Name in ('Ohio', 'Pennsylvania');

-- Sprawdzenie znalezionego nieznanego numeru stanu 9. 
-- Tylko dwa rekordy były zapisane pod stan w Ohio, a reszta jako stan California pod numerem 9. Identyfikator stanu Pensylwaniia to 59.
SELECT * FROM Person.StateProvince 
WHERE StateProvinceID = 9;

-- Aktualizacja numerów stanu na 59 (stan Pensylwania) dla miasta Burbank.
UPDATE Person.Address 
SET StateProvinceID = 59 
WHERE City = 'Burbank';

-- Wyświetlenie tabeli Person.Adress w celu sprawdzenia powodzenia aktualizacji.
SELECT *FROM Person.Address 
WHERE City = 'Burbank';

-- Pomyślne zaktualizowanie bazy danych.
--=========================================================================================================================================================================================

/*3. Oblicz wartość każdego zamówienia. 
Przedstaw wynik w formie raportu dla zarządu. 
UWAGA! Jest to zadanie kreatywne (nie ma jednej dobrej odpowiedzi). 
Należy zastanowić się nad tym, jakimi danymi mógłby być zainteresowany zarząd, a następnie przygotować taki raport. 
Jako rozwiązanie można wkleić zdjęcie raportu lub przesłać go w całości w postaci pliku.
Tabele: Sales.SalesOrderHeader, Sales.SalesOrderDetail*/

-- Wyświetlam zawartość tabel Sales.SalesOrderHeader i Sales.SalesOrderDetail, aby zobaczyć ich zawartość/rekordy tabeli.
SELECT * FROM Sales.SalesOrderHeader;
SELECT * FROM Sales.SalesOrderDetail;

-- Wyświetlenie wszystkich zamówień i ich kwot w postaci pojedyńczych rekordów w tabeli, posortowane wg. daty od ostatniego zamówienia.
SELECT SalesOrderID AS NumerZamówienia, CustomerID AS NumerKlienta, TotalDue AS CenaBrutto, SubTotal AS CenaNetto, TaxAmt AS Podatek, Freight AS CenaPrzesyłki, OrderDate AS DataZamówienia
FROM Sales.SalesOrderHeader 
ORDER BY OrderDate DESC;

-- Wybranie najistotniejszych danych do raportu z tabeli Sales.SalesOrderDetail, czyli lista produktów, posortowana od najchętniej kupowanych produktów.
SELECT ProductID AS NumerProduktu, SUM(OrderQty) AS IlośćSprzedanychProduktów
FROM Sales.SalesOrderDetail 
GROUP BY ProductID
ORDER BY SUM(OrderQty) DESC;

-- Znalezienie i wyświetlenie tabeli z nazwami produktów do przedstawienia ich w raporcie.
/*SELECT * FROM Production.Product
SELECT * FROM Sales.SalesOrderDetail;*/

-- Wybranie najistotniejszych danych do raportu z tabel Sales.SalesOrderDetail i Production.Product, czyli listę produktów, posortowaną od najchętniej kupowanych produktów z ich nazwami.
SELECT DISTINCT D.ProductID AS NumerProduktu, P.Name AS NazwaProduktu, SUM(D.OrderQty) AS IlośćSprzedanychProduktów
FROM Sales.SalesOrderDetail AS D JOIN Production.Product AS P 
ON D.ProductID = P.ProductID
GROUP BY D.ProductID, P.Name
ORDER BY SUM(D.OrderQty) DESC;

-- Zapytanie, które wybiera 10 najchętniej kupowanych produktów.
SELECT TOP 10 ProductID AS NumerProduktu, SUM(OrderQty) AS IlośćSprzedanychProduktów
FROM Sales.SalesOrderDetail 
GROUP BY ProductID
ORDER BY SUM(OrderQty) DESC;

-- Zapytanie, które wybiera 10 najchętniej kupowanych produktów z ich nazwami.
SELECT TOP 10 D.ProductID  AS NumerProduktu, P.Name AS NazwaProduktu, SUM(D.OrderQty) AS IlośćSprzedanychProduktów
FROM Sales.SalesOrderDetail AS D JOIN Production.Product AS P 
ON D.ProductID = P.ProductID
GROUP BY D.ProductID, P.Name
ORDER BY SUM(D.OrderQty) DESC;

-- Wyświetenie rekordów z tabeli, który pokazuje klientów, którzy złożyli największe zamówienia wg. ceny netto.
SELECT DISTINCT CustomerID AS NumerKlienta, SUM(TotalDue) AS RazemBrutto, SUM(TaxAmt) AS Podatek, SUM(Freight) AS KosztPrzesyłek, SUM(SubTotal) AS RazemNetto
FROM Sales.SalesOrderHeader 
GROUP BY CustomerID
ORDER BY SUM(SubTotal) DESC;

-- Wyświetlenie tabel z identyfikatorami produktów i ich nazwą
SELECT DISTINCT D.ProductID  AS NumerProduktu, P.Name  AS NazwaProduktu
FROM Sales.SalesOrderDetail AS D JOIN Production.Product AS P 
ON D.ProductID = P.ProductID
ORDER BY D.ProductID DESC;

-- Zapytanie, które wybiera produkty przynoszące największy zysk ze sprzedaży
SELECT ProductID  AS NumerProduktu, SUM(OrderQty) AS IlośćSprzedanychProduktów, SUM(LineTotal) AS ZyskZProduktu
FROM Sales.SalesOrderDetail 
GROUP BY ProductID 
ORDER BY SUM(LineTotal) DESC;

-- Zapytanie pokazujące (produkty, ich nazwy, zysk i sprzedaną ilość) największy zysk ze sprzedaży. Złączenie tabel PK(P) + FK(D).
SELECT DISTINCT D.ProductID  AS NumerProduktu, P.Name AS NazwaProduktu, SUM(D.OrderQty) AS IlośćSprzedanychProduktów, SUM(D.LineTotal) AS ZyskZProduktu
FROM Sales.SalesOrderDetail AS D 
INNER JOIN Production.Product AS P ON D.ProductID = P.ProductID
GROUP BY D.ProductID, P.Name
ORDER BY SUM(D.LineTotal) DESC;

--=========================================================================================================================================================================================

/*4. Wykonaj raport prezentujący ilość zamówień w poszczególnych latach dla sklepu "eCommerce Bikes"
Tabele: Sales.SalesOrderHeader, Sales.Customer, Sales.Store*/

-- Wyświetlam zawartość tabel: Sales.SalesOrderHeader, Sales.Customer, Sales.Store, aby wyświetlić/zobaczyć ich zawartość/rekordy tabeli.
SELECT * FROM Sales.SalesOrderHeader;
SELECT * FROM Sales.Customer;
SELECT * FROM Sales.Store;

-- Wyszukuję w tabeli Sales.Store rekordy związane ze sklepem "eCommerce Bikes" i znajduję jeden rekord z indentyfikatorem BusinessEntityID 340, SalesPersonID 279
SELECT * FROM Sales.Store 
WHERE Name = 'eCommerce Bikes';

-- Wyswietlam połączone tabele Sales.SalesOrderHeader, Sales.Customer, Sales.Store prezentując ilość zamówień w poszczególnych latach dla sklepu "eCommerce Bikes".
SELECT COUNT(H.SalesOrderID) AS LiczbaZamówień, YEAR(H.OrderDate) AS Lata
FROM Sales.SalesOrderHeader AS H 
INNER JOIN Sales.Customer AS C ON H.CustomerID = C.CustomerID
INNER JOIN Sales.Store AS S ON S.BusinessEntityID = C.StoreID
Where S.Name = 'eCommerce Bikes'
GROUP BY YEAR(H.OrderDate)
ORDER BY YEAR(H.OrderDate) DESC;

--=========================================================================================================================================================================================

/*5. Wykonaj zapytanie, które zwróci dane zaprezentowane w arkuszu Report.csv.
Tabele: Sales.SalesOrderHeader, Sales.Customer, Sales.Store*/
SELECT * FROM Sales.Customer;
SELECT * FROM Sales.SalesOrderHeader;
SELECT * FROM Sales.Store Order by Name asc;

/*Wybór interesujących nas kolumn do raportu (Name i Sales.SalesOrderHeader) z dwóch tabel. 
Zmiana nazwy Name dzięki dodaniu aliasa StorName. 
Sprawdzenie wspólnych cech danych z raportu. Wyszukwanie w bazie po otrzymanych danych i sprawdzenie ich istnienia/poprawności i zależnosci.
Połączennie tabel z interesującymi nas danymi. Wybór kolumn, po których będziemy łączyć - (PK i FK)
Sprawdzenie danych w tabelach, po których możemy je łączyć. */

SELECT S.Name AS StorName, H.PurchaseOrderNumber
FROM Sales.Store AS S
INNER JOIN Sales.Customer AS c ON S.BusinessEntityID = C.StoreID
INNER JOIN Sales.SalesOrderHeader AS H ON C.CustomerID = H.CustomerID
ORDER BY H.PurchaseOrderNumber;

-- Porównanie zgodności raportów.
--=========================================================================================================================================================================================