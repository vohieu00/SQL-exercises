--1. Select the title of all movies.
select Title
from Movies
select* from MovieTheaters;
--2. Show all the distinct ratings in the database.
select distinct Rating
from Movies;
--3. Show all unrated movies.
select *
from Movies 
where Rating is null;
--4. Select all movie theaters that are not currently showing a movie.
select *
from MovieTheaters 
where Movie is null;
--5. Select all data from all movie theaters and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
select* 
from MovieTheaters left join Movies on MovieTheaters.Movie = Movies.Code;
--6. Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
select* 
from Movies left join MovieTheaters on MovieTheaters.Movie = Movies.Code
where MovieTheaters.Movie is not null;
--7. Show the titles of movies not currently being shown in any theaters.
select Movies.Title
from Movies left join MovieTheaters on MovieTheaters.Movie = Movies.Code
where MovieTheaters.Movie is null;
--8. Add the unrated movie "One, Two, Three".
insert into Movies values (10, 'One, Two, Three', null);
--9. Set the rating of all unrated movies to "G".
update Movies set Rating='G' where Rating is null;
--10. Remove movie theaters projecting movies rated "NC-17".
delete from MovieTheaters where Movie in (select Code 
											from Movies 
											where Rating like 'NC-17');
