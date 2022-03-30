-- 1 - Find all the offices and display only their city, phone and country
SELECT city,phone,country FROM offices;

-- 2 - Find all rows in the orders table that mentions FedEx in the comments.
SELECT * FROM orders where comments like '%fedex%';

-- 3 - Show the contact first name and contact last name of all customers in descending order by the customer's name
SELECT customerName, contactLastName, contactFirstName FROM customers 
order by customerName desc;

-- 4 - Find all sales rep who are in office code 1, 2 or 3 and their first name or last name contains the substring 'son'
SELECT * FROM employees 
where (officeCode = 1 or officeCode =2 or officeCode =3) 
and (firstName like '%son%' or lastName like '%son%');

-- 5 - Display all the orders bought by the customer with the customer number 124, along with the customer name, the contact's first name and contact's last name.
SELECT customerName, contactLastName, contactFirstName, orders.customerNumber FROM customers join orders
	on customers.customerNumber = orders.customerNumber
	where orders.customerNumber = 124;
		-- shortcut to select all the columns from the orders table 
SELECT orders.*  
-- 6 - Show the name of the product, together with the order details,  for each order line from the orderdetails table
SELECT productName, orderNumber, orderdetails.productCode, quantityOrdered, priceEach, orderLineNumber 
FROM orderdetails join products
ON orderdetails.productCode = products.productCode;

-- 7 - Display all the payments made by each company from the USA. 
SELECT amount, customerName, country FROM customers JOIN payments 
ON customers.customerNumber = payments.customerNumber
WHERE country='USA';

-- 8 - Show how many employees are there for each state in the USA		
SELECT employees.officeCode, addressLine1, state, count(*) as 'EmployeeCount'
 	FROM employees JOIN offices
	ON employees.officeCode = offices.officecode
WHERE country='USA'
GROUP BY officeCode, state;

-- 9 - From the payments table, display the average amount spent by each customer. Display the name of the customer as well.
SELECT AVG(amount), customerName as 'Company Name' FROM payments JOIN customers
ON customers.customerNumber = payments.customerNumber
GROUP BY customerName

-- 10 - From the payments table, display the average amount spent by each customer but only if the customer has spent a minimum of 10,000 dollars.
SELECT 	AVG(amount) as 'Average',
        customerName AS 'Company Name'
FROM payments
JOIN customers
    ON customers.customerNumber = payments.customerNumber
HAVING SUM( amount ) > 10000
GROUP BY customerName
ORDER BY AVG(amount);

-- Having is to sort on each group after you have grouped by
-- Where is to sort after the join before the group by

-- 11  - For each product, display how many times it was ordered, and display the results with the most orders first and only show the top ten.
SELECT COUNT(*),
         products.productCode,
         productName
FROM orderdetails
JOIN products
    ON products.productCode = orderdetails.productCode
GROUP BY  productCode, productName
ORDER BY  count(*) DESC limit 10;

-- correct answer 
select sum(quantityOrdered), orderdetails.productCode, productName from orderdetails join products
 on orderdetails.productCode = products.productCode
 group by orderdetails.productCode, productName
 order by sum(quantityOrdered) DESC
 limit 10

-- 12 - Display all orders made between Jan 2003 and Dec 2003
SELECT * FROM orders
where orderDate >= '2003-01-01' 
and orderDate <= '2003-12-31';

-- another way
SELECT * FROM orders
WHERE YEAR(orderDate) = '2003';

-- 13 - Display all the number of orders made, per month, between Jan 2003 and Dec 2003
SELECT count(*) ,month(orderDate) FROM orders
where orderDate >= '2003-01-01' 
and orderDate <= '2003-12-01'
group by month(orderDate);

-- correct answer
select MONTH(orderDate), COUNT(*) from orders join orderdetails
 ON orders.orderNumber = orderdetails.orderNumber
 WHERE YEAR(orderDate) = 2003
 GROUP BY MONTH(orderDate)

-- correct answer part 2 - Paul's 
select YEAR(orderDate), MONTH(orderDate), COUNT(*) from orders join orderdetails
 ON orders.orderNumber = orderdetails.orderNumber
 WHERE YEAR(orderDate) >= 2003 AND YEAR(orderDate) <=2004
 GROUP BY YEAR(orderDate), MONTH(orderDate)
