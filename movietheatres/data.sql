create table Movies (
	Code integer not null,
	Title nvarchar(255) not null,
	Rating varchar(10)
	primary key (Code)
	);
create table MovieTheaters (
	Code integer not null,
	Name nvarchar(255) not null,
	Movie integer,
	primary key (Code),
	foreign key (Movie) references Movies(Code)
	);
insert into Movies(Code,Title,Rating) values(9,'Citizen King','G');
insert into Movies(Code,Title,Rating) values(1,'Citizen Kane','PG');
insert into Movies(Code,Title,Rating) values(2,'Singin'' in the Rain','G');
insert into Movies(Code,Title,Rating) values(3,'The Wizard of Oz','G');
insert into Movies(Code,Title,Rating) values(4,'The Quiet Man',null);
insert into Movies(Code,Title,Rating) values(5,'North by Northwest',null);
insert into Movies(Code,Title,Rating) values(6,'The Last Tango in Paris','NC-17');
insert into Movies(Code,Title,Rating) values(7,'Some Like it Hot','PG-13');
insert into Movies(Code,Title,Rating) values(8,'A Night at the Opera',null);
 
insert into MovieTheaters(Code,Name,Movie) values(1,'Odeon',5);
insert into MovieTheaters(Code,Name,Movie) values(2,'Imperial',1);
insert into MovieTheaters(Code,Name,Movie) values(3,'Majestic',null);
insert into MovieTheaters(Code,Name,Movie) values(4,'Royale',6);
insert into MovieTheaters(Code,Name,Movie) values(5,'Paraiso',3);
insert into MovieTheaters(Code,Name,Movie) values(6,'Nickelodeon',null);