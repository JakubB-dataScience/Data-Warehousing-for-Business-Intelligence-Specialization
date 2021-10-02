SELECT CalYear, CalQuarter, Name, SUM(ExtCost) AS CUSTSUM, Count(*) AS INVCOUNT
FROM Inventory_fact, date_dim, cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey 
  AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey 
  AND Inventory_fact.TransTypeKey = 5 
  AND (date_dim.CalYear = 2011 OR date_dim.CalYear = 2012)
GROUP BY GROUPING SETS(Name, ROLLUP(CalYear, CalQuarter))
ORDER BY CalYear, CalQuarter, Name;