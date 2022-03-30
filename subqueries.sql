-- SUB QUERIES
-- ex:1 find all customers whose credit limit above the average
select * from customers where creditLimit > (select avg(creditLimit) from customers);

-- ex:2 find all products that have not been ordered before
select * from products where productCode not in (select distinct(productCode) from orderdetails)

-- ex:3 use a subquery to find all customers with no sales rep employee number
select * from customers where customerNumber NOT IN (
select customerNumber from customers where salesRepEmployeeNumber IS NOT NULL);
   -- but overkill, can actually use 
   SELECT * FROM customers where salesRepEmployeeNumber is null;

-- ex:4 
SELECT employees.employeeNumber, employees.firstName, employees.lastName, SUM(amount) FROM employees JOIN customers
   ON employees.employeeNumber = customers.salesRepEmployeeNumber
 JOIN payments
   ON customers.customerNumber = payments.customerNumber
 GROUP BY employees.employeeNumber, employees.firstName, employees.lastName
 HAVING sum(amount) > (select sum(amount) * 0.1 from payments);

 -- BONUS: find the best selling product for each year and month:
 select year(orderDate) as orderYear, month(orderDate) as orderMonth, productCode, sum(quantityOrdered) from orderdetails 
  join orders on orderdetails.orderNumber = orders.orderNumber
group by productCode, month(orderDate), year(orderDate)
having productCode = ( select productCode from orderdetails 
  join orders on orderdetails.orderNumber = orders.orderNumber
  where year(orderDate)=orderYear and month(orderDate)=orderMonth
  group by productCode
  order by sum(quantityOrdered) desc
  limit 1
 )
 order by year(orderDate), month(orderDate);


-- show all products, and for each product,
-- display the total quantity ordered and
-- and the customer whom ordered the most of that product
SELECT * from
(
  select productCode, sum(quantityOrdered) from orderdetails
	group by productCode
) as t1
JOIN
(
  select productCode as outerProductCode, customerNumber
from orders join orderdetails
 on orders.orderNumber = orderdetails.orderNumber
group by productCode, customerNumber
having (productCode, customerNumber) = (
  
SELECT productCode, customerNumber FROM orders JOIN orderdetails
 on orders.orderNumber = orderdetails.orderNumber
 where productCode=outerProductCode
 group by customerNumber, productCode
 order by sum(quantityOrdered) DESC
 limit 1
 ) 
)
 as t2
 on t1.productCode = t2.outerProductCode
 