create table Pieces (
	Code integer not null,
	Name nvarchar(255),
	primary key (Code)
	);
create table Providers (
	Code nvarchar(255) not null,
	Name nvarchar(255),
	primary key (Code)
	);
create table Provides (
	Piece integer not null,
	Provider nvarchar(255) not null,
	Price integer,
	primary key (Piece, Provider),
	foreign key (Piece) references Pieces(Code),
	foreign key (Provider) references Providers(Code)
	);

insert into Providers(Code, Name) values('HAL','Clarke Enterprises');
insert into Providers(Code, Name) values('RBT','Susan Calvin Corp.');
insert into Providers(Code, Name) values('TNBC','Skellington Supplies');
 
insert into Pieces(Code, Name) values(1,'Sprocket');
insert into Pieces(Code, Name) values(2,'Screw');
insert into Pieces(Code, Name) values(3,'Nut');
insert into Pieces(Code, Name) values(4,'Bolt');
 
insert into Provides(Piece, Provider, Price) values(1,'HAL',10);
insert into Provides(Piece, Provider, Price) values(1,'RBT',15);
insert into Provides(Piece, Provider, Price) values(2,'HAL',20);
insert into Provides(Piece, Provider, Price) values(2,'RBT',15);
insert into Provides(Piece, Provider, Price) values(2,'TNBC',14);
insert into Provides(Piece, Provider, Price) values(3,'RBT',50);
insert into Provides(Piece, Provider, Price) values(3,'TNBC',45);
insert into Provides(Piece, Provider, Price) values(4,'HAL',5);
insert into Provides(Piece, Provider, Price) values(4,'RBT',7);