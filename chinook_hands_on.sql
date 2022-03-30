-- 1 - Display all Sales Support Agents with their first name and last name
select FirstName, LastName, Title from Employee where Title = 'Sales Support Agent';

-- 2 - Display all employees hired between 2002 and 2003, and display their first name and last name
select FirstName, LastName, HireDate from Employee where YEAR(HireDate) BETWEEN '2002' AND '2003';

-- 3 - Display all artists that have the word 'Metal' in their name
SELECT * FROM Artist WHERE Name like '%Metal%';

-- 4 - Display all employees who are in sales (sales manager, sales rep etc.)
SELECT * FROM Employee WHERE Title like '%sales%';

-- 5 - Display the titles of all tracks which has the genre "easy listening"
SELECT Track.Name FROM Track JOIN Genre 
ON Track.GenreID = Genre.GenreId
WHERE Genre.Name like '%easy listening%';

-- 6 - Display all the tracks from all albums along with the genre of each track
SELECT Track.Name, Genre.Name, Title from Album join Track on Album.AlbumId = Track.AlbumId join Genre 
on Genre.GenreId = Track.GenreId
limit 10;

-- 7 - Using the Invoice table, show the average payment made for each country
SELECT AVG(Total), BillingCountry FROM Invoice
GROUP BY BillingCountry;

-- 8 - Using the Invoice table, show the average payment made for each country, but only for countries that paid more than $5.50 in total average
SELECT AVG(Total), BillingCountry FROM Invoice
GROUP BY BillingCountry
HAVING AVG(Total) > 5.50;

-- 9 - Using the Invoice table, show the average payment made for each customer, but only for customer reside in Germany and only if that customer has paid more than 10in total
SELECT AVG(Total), SUM(Total), FirstName, LastName, Customer.CustomerId FROM Invoice JOIN Customer 
ON Invoice.CustomerId = Customer.CustomerId 
WHERE Country='Germany'
GROUP BY CustomerId
having sum(Total) > 10;

-- 10 - Display the average length of Jazz song (that is, the genre of the song is Jazz) for each album
select AVG(Milliseconds), Title from Genre JOIN Track
ON Genre.GenreId = Track.GenreId JOIN Album
ON Album.AlbumId = Track.AlbumId
group by Genre.name="jazz", Title;
