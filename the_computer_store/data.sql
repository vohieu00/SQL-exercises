create table Manufacturers (
	Code integer NOT NULL,
	Name varchar(100) NOT NULL,
	primary key (Code)
	);
create table Products (
	Code integer NOT NULL,
	Name varchar(100) NOT NULL,
	Price real NOT NULL,
	primary key (Code),
	Manufacturer integer NOT NULL,
	foreign key (Manufacturer) references Manufacturers(Code)
	);

insert into Manufacturers(Code, Name) values(1, 'Sony');
insert into Manufacturers(Code, Name) values(2, 'Creative Labs');
insert into Manufacturers(Code, Name) values(3, 'Hewlett-Packard');
insert into Manufacturers(Code, Name) values(4, 'Iomega');
insert into Manufacturers(Code, Name) values(5, 'Jujitsu');
insert into Manufacturers(Code, Name) values(6, 'Winchester');
insert into Manufacturers(Code, Name) values(7, 'Bose');

insert into Products(Code, Name, Price, Manufacturer) values(1, 'Hard drive', 240, 5);
insert into Products(Code, Name, Price, Manufacturer) values(2, 'Memory', 126, 6);
insert into Products(Code, Name, Price, Manufacturer) values(3, 'Zip driver', 150, 4);
insert into Products(Code, Name, Price, Manufacturer) values(4, 'Floppy disk', 5,6);
insert into Products(Code, Name, Price, Manufacturer) values(5, 'Moniter', 240, 1);
insert into Products(Code, Name, Price, Manufacturer) values(6, 'DVD driver', 180,2);
insert into Products(Code, Name, Price, Manufacturer) values(7, 'CD driver', 90, 2);
insert into Products(Code, Name, Price, Manufacturer) values(8, 'Printer', 270, 3);
insert into Products(Code, Name, Price, Manufacturer) values(9, 'Toner cartridge', 66, 3);
insert into Products(Code, Name, Price, Manufacturer) values(10, 'DVD burner', 180, 2);

