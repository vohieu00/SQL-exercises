--1. Select all warehouses.
select* 
from Warehouses;
--2. Select all boxes with a value larger than $150.
select*
from Boxes
where value > 150;
--3. Select all distinct contents in all the boxes.
--alter table Boxes alter column Contents varchar(255);
select distinct Contents
from Boxes;
--4. Select the average value of all the boxes.
select avg(value) as 'Average value'
from Boxes;
--5. Select the warehouse code and the average value of the boxes in each warehouse.
select Warehouse, avg(value) as 'Average value'
from Boxes
group by Warehouse
--6. Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150
select Warehouse, avg(value) as 'Average value'
from Boxes
group by Warehouse
having avg(value)>150;
--7. Select the code of each box, along with the name of the city the box is located in
select Boxes.Code, Warehouses.Location
from Boxes join Warehouses on Boxes.Warehouse=Warehouses.Code
--8. Select the warehouse codes, along with the number of boxes in each warehouse.
--Optionally, take into account that some warehouses are empty
--(i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
select Warehouse, count(*) as 'Count'
from Boxes
group by Warehouse
--9. Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
select Warehouse, count(*) as 'Count'
from Boxes
group by Warehouse 
having count(*) > (select Capacity 
					from Warehouses 
					where Boxes.Warehouse=Warehouses.Code )

--10. Select the codes of all the boxes located in Chicago.
select Boxes.Code 
from Boxes where Warehouse in (select Code
								from Warehouses 
								where Location like 'Chicago')

select Boxes.Code, Warehouses.Location
from Boxes join Warehouses on Boxes.Warehouse=Warehouses.Code
where Location like 'Chicago'
--11. Create a new warehouse in New York with a capacity for 3 boxes.
insert into Warehouses values(6, 'New York', 3);
--12. Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2
insert into Boxes values('H5TR', 'Papers', 200, 2);
--13. Reduce the value of all boxes by 15%.
update Boxes set Value = Value*0.85;
--14. Apply a 20% value reduction to boxes with a value larger than the average value of all the boxes.
update Boxes set Value = Value*0.8 where Value > (select avg(Value) from Boxes);
--15. Remove all boxes with a value lower than $100.
delete from Boxes where Value <100;
--16. Remove all boxes from saturated warehouses.
delete from Boxes 
where Warehouse in (select Code
					from Warehouses 
					where Capacity < (select count(*) 
										from Boxes 
										where Boxes.Warehouse = Warehouses.Code));
