-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName, c.CategoryName
FROM Product as p
LEFT JOIN Category as c
ON p.id = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id, s.CompanyName
FROM [order] as o
JOIN Shipper as s on o.ShipVia = s.id
WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, p.QuantityPerUnit
FROM product as p
JOIN orderdetail as od
ON p.id = od.productid
WHERE od.orderid = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id as "Oreder Id", c.CompanyName as "Company Name", e.LastName as "Employee Last Name"
FROM [order] as O
JOIN customer as c on o.CustomerId = c.Id 
JOIN employee as e on o.EmployeeId = e.id;