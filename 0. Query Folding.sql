USE AdventureWorksDW2012

--Viewing the data
SELECT TOP 10 * FROM dbo.DimSalesTerritory
SELECT TOP 10 * FROM dbo.FactInternetSales

--Merging SalesTerritory and FactInternetSales
SELECT t.SalesTerritoryRegion, SUM(f.SalesAmount) as SalesAmount FROM dbo.FactInternetSales f
LEFT JOIN dbo.DimSalesTerritory t ON
f.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY t.SalesTerritoryRegion