SELECT OrderDate, count(OrderDate) Orders_cnt FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
group by OrderDate
having count(OrderDate) < 100
order by Orders_cnt DESC;


SELECT b.OrderDate, b.UnitPrice FROM (
 SELECT fis.OrderDate, 
 ROW_NUMBER() OVER(PARTITION BY fis.OrderDate ORDER BY fis.UnitPrice DESC) AS "RowNumber",
 fis.UnitPrice
 FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] fis 

 ) b where [RowNumber] < 4
 order by OrderDate;