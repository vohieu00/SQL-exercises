create table Warehouses (
	Code integer not null,
	Location text,
	Capacity integer,
	primary key (Code)
	);

create table Boxes (
	Code varchar(10) not null,
	Contents varchar(255),
	Value real,
	Warehouse integer not null,
	primary key (Code),
	foreign key (Warehouse) references Warehouses(Code)
	);


insert into Warehouses(Code,Location,Capacity) values(1,'Chicago',3);
insert into Warehouses(Code,Location,Capacity) values(2,'Chicago',4);
insert into Warehouses(Code,Location,Capacity) values(3,'New York',7);
insert into Warehouses(Code,Location,Capacity) values(4,'Los Angeles',2);
insert into Warehouses(Code,Location,Capacity) values(5,'San Francisco',8);
 
insert into Boxes(Code,Contents,Value,Warehouse) values('0MN7','Rocks',180,3);
insert into Boxes(Code,Contents,Value,Warehouse) values('4H8P','Rocks',250,1);
insert into Boxes(Code,Contents,Value,Warehouse) values('4RT3','Scissors',190,4);
insert into Boxes(Code,Contents,Value,Warehouse) values('7G3H','Rocks',200,1);
insert into Boxes(Code,Contents,Value,Warehouse) values('8JN6','Papers',75,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) values('8Y6U','Papers',50,3);
insert into Boxes(Code,Contents,Value,Warehouse) values('9J6F','Papers',175,2);
insert into Boxes(Code,Contents,Value,Warehouse) values('LL08','Rocks',140,4);
insert into Boxes(Code,Contents,Value,Warehouse) values('P0H6','Scissors',125,1);
insert into Boxes(Code,Contents,Value,Warehouse) values('P2T6','Scissors',150,2);
insert into Boxes(Code,Contents,Value,Warehouse) values('TU55','Papers',90,5);