/*select * from Zamówienia where not [ID pracownika]>5 and not [ID klienta]<=8 and RIGHT([id zamówienia],1) in ('1', '2', '3', '4', '5');

select * from Zamówienia where [ID pracownika]<=5 and [ID klienta]>8 and [ID zamówienia] like '%[1-5]';*/

/*select Zamówienia.[ID zamówienia], Spedytorzy.Firma from Zamówienia join Spedytorzy on Zamówienia.[ID spedytora]= Spedytorzy.ID;*/

--select firma from Klienci join Zamówienia on Klienci.ID = Zamówienia.[ID klienta] where [ID zamówienia]=31;
--select P.ID from Produkty as P join [Szczegóły zamówienia zakupu] as S on P.ID = S.[ID produktu];

--Select * from produkty;
--select * from Zamówienia;

--select P.Kategoria, Z.[ID klienta] from Produkty as P join Zamówienia as Z on P.[ID] = Z.[ID zamówienia];

--select P.Kategoria, Z.[ID klienta] from Produkty as P left join Zamówienia as Z on P.ID = Z.[ID zamówienia] order by P.ID asc;

--select [nazwa produktu] from Produkty;
--select P.[nazwa produktu] from Produkty as P join [Szczegóły zamówień] as SZ on P.id=SZ.[ID produktu];
--select distinct P.[nazwa produktu] from Produkty as P join [Szczegóły zamówień] as SZ on P.id=SZ.[ID produktu];

--select count([id produktu]) from [Szczegóły zamówień];
--select count(distinct [id produktu]) from [Szczegóły zamówień];

--select count(distinct [id produktu]), avg ([id produktu]) from [Szczegóły zamówień];

--select min([id produktu]), max([id produktu]) from [Szczegóły zamówień];

--select min(id), max(id), count(*) from [Szczegóły zamówień]; 
--select min(id), max(id), count(*), max(id)-min(id)-count(*) from [Szczegóły zamówień]; 


--select Kategoria, avg([cena katalogowa]) as 'średnia cena'from Produkty group by Kategoria order by Kategoria desc;
--select [kod produktu], sum([ilość]) as suma from Produkty as p join [Szczegóły zamówień]as sz on p.id=sz.[ID produktu] group by [Kod produktu];

--select left(kategoria,1) as kategoria, avg([cena katalogowa]) as 'średnia cena' from produkty group by left(kategoria,1);
-- select kategoria, avg([cena katalogowa]) 'średnia cena' from produkty group by kategoria;

--select count([id zamówienia]) from Zamówienia
--select count([id zamówienia]) from Zamówienia group by ();
--select count([id zamówienia]) from Zamówienia group by [ID pracownika];
--select [id pracownika] from Zamówienia;
--select distinct[id pracownika] from Zamówienia;

--select kategoria, avg([cena katalogowa]) as 'średnia' from produkty where kategoria = 'Makaron' group by Kategoria;
--select kategoria, avg([cena katalogowa]) as 'średnia' from produkty where kategoria like 'k%' group by Kategoria;
--select kategoria, avg([cena katalogowa]) as 'średnia' from produkty where kategoria is not null group by Kategoria;

--select [kod produktu], sum(ilość) from produkty as p join [szczegóły zamówień] as sz on p. id=sz.[ID produktu] where avg(ilość)>10 group by [Kod produktu];
--select [kod produktu], sum(ilość) as suma from produkty as p join [szczegóły zamówień] as sz on p. id=sz.[ID produktu] group by [Kod produktu] having avg(ilość)>10;
--select kategoria, [minimalna ilość do ponownego zamówienia], count(ID) as suma from Produkty group by Kategoria, [Minimalna ilość do ponownego zamówienia] having [Minimalna ilość do ponownego zamówienia] is not null;

--select * from Zamówienia

--select max([opłata za wysyłkę]) as max, [data zamówienia], [ID pracownika]	from Zamówienia group by [Data zamówienia], [ID pracownika]

--select s.Firma from Spedytorzy as s where s.id = (select z.[id spedytora] from Zamówienia as z where z.[id zamówienia]=35); -- podzapytanie

