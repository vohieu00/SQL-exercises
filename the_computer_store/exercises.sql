--1. Select the names of all the products in the store.
select Name
from Products;
--2. Select the names and the prices of all the products in the store.
select Name, Price
from Products;
--3. Select the name of the products with a price less than or equal to $200.
select Name
from Products
where Price <=200;
--4. Select all the products with a price between $60 and $120.
select *
from Products
where Price between 60 and 120;
--5. Select the name and price in cents (i.e., the price must be multiplied by 100).
select Name, Price*100 as 'Price in cent'
from Products;
--6. Compute the average price of all the products.
select avg(Price) as 'Average Price'
from Products;
--7. Compute the average price of all products with manufacturer code equal to 2.
select avg(Price) as 'Average Price of Code 2'
from Products
where Code =2;
--8. Compute the number of products with a price larger than or equal to $180.
select count(Price) as 'count'
from Products
where Price >=180;
--9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
select Name, Price
from Products
where Price>=180
order by Price desc, Name;
--10. Select all the data from the products, including all the data for each product's manufacturer.
select Products.*, Manufacturers.Name
from Products left join Manufacturers on Products.Code = Manufacturers.Code;
--11. Select the product name, price, and manufacturer name of all the products.
select Products.Name, Products.Price, Manufacturers.Name as 'Manufacturer name'
from Products left join Manufacturers on Products.Manufacturer = Manufacturers.Code;
--12. Select the average price of each manufacturer's products, showing only the manufacturer's code.
select Manufacturer, avg(Price) as 'Average Price'
from Products
group by Manufacturer;
--13. Select the average price of each manufacturer's products, showing the manufacturer's name.
select Manufacturers.Name, avg(Products.Price) as 'Average Price'
from Products inner join Manufacturers on Products.Manufacturer = Manufacturers.Code
group by Manufacturers.Name;
--14. Select the names of manufacturer whose products have an average price larger than or equal to $150.
select Manufacturers.Name, avg(Products.Price) as 'Average Price'
from Manufacturers inner join Products on Manufacturers.Code=Products.Manufacturer
group by Manufacturers.Name
having avg(Products.Price) >=150;
--15. Select the name and price of the cheapest product.
select Name, Price
from Products
where Price = (select min(Price) 
				from Products)
--16. Select the name of each manufacturer along with the name and price of its most expensive product.
select Manufacturers.Name, Products.Name, Products.Price
from Manufacturers inner join Products on Manufacturers.Code = Products.Manufacturer 
and Products.Price = (select max(Products.Price) 
						from Products 
						where Products.Manufacturer = Manufacturers.Code);
--17. Select the name of each manufacturer which have an average price above $145 and contain at least 2 different products.
select Manufacturers.Name, count(Products.Manufacturer) as 'Count', avg(Price) as 'Average Price'
from Manufacturers inner join Products on Manufacturers.Code = Products.Manufacturer
group by Manufacturers.Name
having avg(Price) >145 and count(Products.Manufacturer) >=2
--18. Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Products values(11, 'Loudspeakers',70, 2);
--19. Update the name of product 8 to "Laser Printer".
update Products set Name = 'Laser Printer' where Code = 8;
--20. Apply a 10% discount to all products.
update Products set Price = Price*0.9;
--21. Apply a 10% discount to all products with a price larger than or equal to $120.
update Products set Price=Price*0.9 where Price>=120;