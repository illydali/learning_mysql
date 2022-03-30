
-- *** AGGREGATES ***

-- find the average creditLimit among customers
SELECT AVG(creditLimit FROM customers;

-- count how many there are 
select count (*) from customers;

-- finding highest credit limit 
SELECT max(creditLimit) from customers;

-- without the where it will be 0 forever 
select min(creditLimit) from customers 
where creditLimit > 0;

-- *** DATE *** --- 
-- ** for all date columns, data type must be DATE or DATETIME 
-- select by date 
SELECT * FROM payments
where paymentDate > '2004-04-01';

-- select by date range
SELECT * FROM payments
where paymentDate >= '2004-04-01' 
and paymentDate <= '2005-04-01';

-- extract out YEAR, MONTH, DAY into own columns 
SELECT YEAR(paymentDate), MONTH(paymentDate), DAY(paymentDate), amount from payments;

-- find the total amt paid out in month of June - 6, across all years
SELECT sum(amount) from payments where month(paymentDate) = 6;

-- *** GROUP BY *** -- 
-- // always decide which one u want to GROUP BY first then put in your SELECT entries or AGGRE 
-- remember SELECT entry is always last

-- show how many employees in each office code
SELECT officeCode, count(*) from employees
group by officeCode;

SELECT jobTitle, count(*) from employees
GROUP BY jobTitle;

-- can add multiple aggregate but u can only select what u group by
SELECT country, avg(creditLimit), COUNT(*) FROM customers 
GROUP BY country

-- tables joined tog first, then keep only usa, then group by 
-- order of this stuff: from-join, where, group by, select, having 
SELECT employees.officeCode, addressLine1, addressLine2, count(*) as 'EmployeeCount'
 	FROM employees JOIN offices
	ON employees.officeCode = offices.officecode
WHERE country='USA'
GROUP BY officeCode, addressLine1, addressLine2
HAVING EmployeeCount >= 2


-- 1. from/join 2. where. 3. group by. 4. select count (*) 5. having 6. order by 7. limit 
SELECT COUNT(*), products.productCode, productName FROM orderdetails 
join products on products.productCode = orderdetais.productCode
where productLine = 'Classic Cars'
group by productCode, productName
having count(*) >= 28
order by count(*) desc
limit 10;


