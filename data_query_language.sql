-- test link: https://www.mysqltutorial.org/tryit/

-- select entire table
select * from employees;

-- select firstname, lastname, email only
select firstName, lastName, email from employees;

-- select all job titles but remove duplicates
select distinct(jobTitle) from employees;

-- select and rename columns into nicer names 
select 	firstName as 'First Name', 
		lastName as 'Last Name', 
		email as 'Email' from employees;

-- use 'where' to filter rows:
-- eg: select all employees from a specific officeCode 
select * from employees where officeCode = 1;

-- we can use 'like' for string comparisons only
SELECT * FROM employees where jobTitle like 'Sales Rep';

-- % is a wildcard char in mysql
-- search for all employees whose jobtitle begins with 'sales' 
SELECT * FROM employees where jobTitle like 'Sales%';

-- find all employees whoes job title end with 'sales'
select * from employees where jobTitle like '%sales'; 

-- find all employees whose job title has the word 'sales' anywhere
select * from employees where jobTitle like '%sales%';

-- extra examples
-- find all products that includes davidson
select * from products where productName like '%davison%';

-- find all products that includes davidson
select * from products where productName like '%1969%';

-- show all employees from officecode 1 who is a sales rep (AND)
SELECT * FROM employees where officeCode = 1 and jobTitle = 'sales rep'

-- show all employees from officecode 1 or 2 (OR includes)
SELECT * FROM employees where officeCode = 1 or officeCode = 2;

-- show all sales rep from officeode 1 and 2 (order of precedence follows programming - AND before OR) 
SELECT * FROM employees where (officeCode = 1 or officeCode = 2)
			and jobTitle='sales rep';

-- chaining multiple AND 
-- show all customers in state NV, country USA, creditlimit > 1k 
SELECT * FROM customers where state='nv' and country='usa' and creditLimit > 1000; 

-- 
-- JOINS [querying two tables that is related : PK and FK] inner join
-- display a temp version of joined tables
SELECT * FROM employees join offices
	ON employees.officeCode = offices.officeCode;

-- sql will join the two tables first then display whatever u selected
select lastName, firstName, city,  addressLine1, addressLine2 FROM employees join offices
	ON employees.officeCode = offices.officeCode;

-- display the same info as above + officeCode 
-- Note:
-- because there are two officeCode columns in this joined table, need to specify which table officeCode you wamt
select lastName, firstName, city,  addressLine1, addressLine2, employees.officeCode FROM employees join offices
	ON employees.officeCode = offices.officeCode;

-- mysql will do in this order
-- 1) FROM & JOIN the table
-- 2) sort WHERE from joined tables
-- 3) SELECT all info (filter results indicated)
select firstName, lastName, city,  addressLine1, addressLine2,  FROM employees join offices
	ON employees.officeCode = offices.officeCode
    Where country='usa';

-- same as above, but only from USA and order by the first name in ascending order
-- 4) ORDER BY will be number 4
select firstName, lastName city,  addressLine1, addressLine2,  FROM employees join offices
	ON employees.officeCode = offices.officeCode
    Where country='usa'
    ORDER BY firstName;


select * from customers join employees 
    ON customers.salesRepEmployeeNumber = employees.employeeNumber


select count(*) from customers join employees 
	ON customers.salesRepEmployeeNumber = employees.employeeNumber

-- show all customers with their sales rep, even for customers with no sales rep (null)
select * from customers left join employees 
	ON customers.salesRepEmployeeNumber = employees.employeeNumber;
-- LEFT JOIN is useful if u want a comphensive breakdown of your tabes. 
