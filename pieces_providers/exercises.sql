--1. Select the name of all the pieces.
select Name
from Pieces
--2. Select all the providers' data.
select *
from Providers
--3. Obtain the average price of each piece (show only the piece code and the average price).
select Piece, avg(Price) as 'Average Price'
from Provides
group by Piece
--4. Obtain the names of all providers who supply piece 1.
select Name
from Provides join Providers on Provides.Provider=Providers.Code
where Provides.Piece=1
--5. Select the name of pieces provided by provider with code "HAL".
select Name
from Provides join Pieces on Pieces.Code=Provides.Piece
where Provider like'HAL'
--6. For each piece, find the most expensive offering of that piece and include the piece name, 
--provider name, and price (note that there could be two providers who supply the same piece at 
--the most expensive price).
select Pieces.*, Providers.Name, Provides.Price as 'Highest Price'
from Pieces left join Provides on Pieces.Code=Provides.Piece
left join Providers on Providers.Code=Provides.Provider
where Price = (select max(price)
				from Provides 
				where Piece = Pieces.Code);
--7. Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
insert into Provides values(1, 'TNBC', 7);
--8. Increase all prices by one cent.
update Provides set Price = Price+1;
--9. Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
delete from Provides where Provider like 'RBT' and Piece =4;
--10. Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces (the provider should still remain in the database).
delete from Provides where Provider like 'RBT';