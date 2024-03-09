use Northwind


--zadanie 1.3 str. 65
-- select [Nazwa produktu], [Cena katalogowa] from Produkty;
--select [Nazwa produktu], [Cena katalogowa] * 1.2 from Produkty; NIE CZAJE TEGO jak oblizy? procent %

-- zadanie 2.3 str. 65
--select * from Produkty
--select [ID zamówienia], DATEDIFF (DAY, [Data zamówienia], [Data wys?ania]) as dni from Zamówienia;  NIE CZAJE TEGO LICZENIA PO DACIE


-- zadanie 3.3 str. 65
--select 'Produkt' + [Nazwa produktu], + 'kosztuje', + [Cena katalogowa] from Produkty order by [Cena katalogowa] desc;
--select top 10 'Produkt' + [Nazwa produktu], + 'kosztuje', + round([Cena katalogowa], 1) from Produkty order by [Cena katalogowa] desc;
--select 'Produkt' + [Nazwa produktu], + 'kosztuje', + Round([Cena katalogowa], 0) from Produkty order by [Cena katalogowa] desc;
--select 'Produkt' + [Nazwa produktu], + 'kosztuje', + [Cena katalogowa] from Produkty order by [Cena katalogowa] desc;

