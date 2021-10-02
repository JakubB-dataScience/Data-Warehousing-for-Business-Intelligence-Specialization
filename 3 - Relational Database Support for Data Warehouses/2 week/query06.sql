SELECT CalMonth, AddrCatCode1, SUM(ExtCost) AS CostSum, SUM(Quantity) AS QuanSum
FROM Inventory_fact, date_dim, cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey 
  AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey 
  AND Inventory_fact.TransTypeKey = 5 
  AND date_dim.CalYear = 2011
GROUP BY CalMonth, AddrCatCode1
UNION
SELECT CalMonth, NULL, SUM(ExtCost) AS CostSum, SUM(Quantity) AS QuanSum
FROM Inventory_fact, date_dim, cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey 
  AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey 
  AND Inventory_fact.TransTypeKey = 5 
  AND date_dim.CalYear = 2011
GROUP BY CalMonth
UNION
SELECT NULL, AddrCatCode1, SUM(ExtCost) AS CostSum, SUM(Quantity) AS QuanSum
FROM Inventory_fact, date_dim, cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey 
  AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey 
  AND Inventory_fact.TransTypeKey = 5 
  AND date_dim.CalYear = 2011
GROUP BY AddrCatCode1
UNION
SELECT NULL, NULL, SUM(ExtCost) AS CostSum, SUM(Quantity) AS QuanSum
FROM Inventory_fact, date_dim, cust_vendor_dim
WHERE Inventory_fact.DateKey = date_dim.DateKey 
  AND Inventory_fact.CustVendorKey = cust_vendor_dim.CustVendorKey 
  AND Inventory_fact.TransTypeKey = 5 
  AND date_dim.CalYear = 2011
ORDER BY 1, 2;