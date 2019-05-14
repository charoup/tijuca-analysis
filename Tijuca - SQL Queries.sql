--Revenue per quarter for this economic year, grouped by Supplier
SELECT SUM(Amount) AS Revenue, dbo.Customers.Name 
FROM dbo.SalesInvoices 
INNER JOIN dbo.Customers ON dbo.SalesInvoices.Customer = dbo.Customers.CustomerId
WHERE MONTH(Date) >=1 AND MONTH(Date) <=3 AND YEAR(Date) = 2019
GROUP BY dbo.Customers.Name 
ORDER BY Revenue DESC

-- Customers who paid us ranked by highest to lowest sum of Paid Invoices
SELECT SUM(dbo.SalesInvoices.Amount) AS Total_Revenue, dbo.Customers.Name
FROM dbo.SalesInvoices
INNER JOIN dbo.Customers ON dbo.SalesInvoices.Customer = dbo.Customers.CustomerId
WHERE Paid = 1
GROUP BY dbo.Customers.Name
ORDER BY Total_Revenue DESC

--Customers who owe us ranked by highest to lowest sum of Unpaid Invoices
SELECT SUM(dbo.SalesInvoices.Amount) AS Total_Amount_Not_Paid, dbo.Customers.Name
FROM dbo.SalesInvoices
INNER JOIN dbo.Customers ON dbo.SalesInvoices.Customer = dbo.Customers.CustomerId
WHERE Paid = 0
GROUP BY dbo.Customers.Name
ORDER BY Total_Amount_Not_Paid DESC

--Our expenses for this economic year
SELECT SUM(Amount) AS Expenses, Description 
FROM dbo.OperatingExpenses 
WHERE YEAR(PaymentDate) = 2019
GROUP BY Description
ORDER BY Expenses DESC

--Our expenses for previous quarter
SELECT SUM(Amount) AS Expenses, Description 
FROM dbo.OperatingExpenses 
WHERE MONTH(PaymentDate) >=1 AND MONTH(PaymentDate) <=3 AND YEAR(PaymentDate) = 2019
GROUP BY Description
ORDER BY Expenses DESC


--Specific Expenses: Total Rent paid ths economic year 
SELECT SUM(Amount) AS Total_Rent 
FROM dbo.OperatingExpenses 
WHERE Description='Rent' AND YEAR(PaymentDate) = 2019




