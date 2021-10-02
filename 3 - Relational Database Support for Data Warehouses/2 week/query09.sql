SELECT CalMonth, AddrCatCode1, SUM(ExtCost) AS CostSum, SUM(Quantity) AS QuanSum, 
  GROUPING(CalMonth, AddrCatCode1) AS GROUP_LEVEL
FROM Inventory_fact, date_dim, cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey 
  AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey 
  AND Inventory_fact.TransTypeKey = 5 
  AND date_dim.CalYear = 2011
GROUP BY CUBE(CalMonth, AddrCatCode1)
ORDER BY CalMonth, AddrCatCode1;