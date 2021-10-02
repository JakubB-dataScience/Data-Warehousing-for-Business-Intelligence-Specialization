SELECT TransDescription, CompanyName, BPName, 
  SUM(ExtCost) AS COSTSUM, Count(*) AS INVCOUNT
FROM Inventory_fact, trans_type_dim, branch_plant_dim, company_dim
WHERE Inventory_fact.BRANCHPLANTKEY = branch_plant_dim.BRANCHPLANTKEY 
  AND branch_plant_dim.COMPANYKEY = company_dim.COMPANYKEY
  AND Inventory_fact.TRANSTYPEKEY = trans_type_dim.TRANSTYPEKEY
GROUP BY GROUPING SETS ((TransDescription, CompanyName,BPName),
  (TransDescription, CompanyName), TransDescription,())
ORDER BY TransDescription, CompanyName,BPName;