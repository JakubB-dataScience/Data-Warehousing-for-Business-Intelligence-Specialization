SELECT CompanyName, BPName, SUM(ExtCost) AS COSTSUM, SUM(Quantity) AS QuanSum 
FROM Inventory_fact, branch_plant_dim, company_dim
WHERE Inventory_fact.BRANCHPLANTKEY = branch_plant_dim.BRANCHPLANTKEY 
  AND branch_plant_dim.COMPANYKEY = company_dim.COMPANYKEY 
  AND Inventory_fact.TransTypeKey = 2
GROUP BY CompanyName, BPName
UNION
SELECT CompanyName, NULL, SUM(ExtCost) AS COSTSUM, SUM(Quantity) AS QuanSum 
FROM Inventory_fact, branch_plant_dim,company_dim
WHERE Inventory_fact.BRANCHPLANTKEY = branch_plant_dim.BRANCHPLANTKEY 
  AND branch_plant_dim.COMPANYKEY = company_dim.COMPANYKEY 
  AND Inventory_fact.TransTypeKey = 2
GROUP BY CompanyName
UNION
SELECT NULL, NULL, SUM(ExtCost) AS COSTSUM, SUM(Quantity) AS QuanSum 
FROM Inventory_fact, branch_plant_dim, company_dim
WHERE Inventory_fact.BRANCHPLANTKEY = branch_plant_dim.BRANCHPLANTKEY 
  AND branch_plant_dim.COMPANYKEY = company_dim.COMPANYKEY 
  AND Inventory_fact.TransTypeKey = 2
ORDER BY 1,2;