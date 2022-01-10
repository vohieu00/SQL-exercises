create table Employee (
	EmployeeID integer not null,
	Name nvarchar(255),
	Position nvarchar(255),
	Salary real,
	Remarks text,
	primary key (EmployeeID)
	);
create table Planet (
	PlanetID integer not null,
	Name nvarchar(255),
	Coordinates real,
	primary key (PlanetID),
	);
create table Shipment (
	ShipmentID integer not null,
	Date text,
	Manager integer,
	Planet integer,
	primary key (ShipmentID),
	foreign key (Manager) references Employee(EmployeeID),
	foreign key (Planet) references Planet(PlanetID)
	);
create table Has_Clearance (
	Employee integer not null,
	Planet integer not null,
	Level integer,
	primary key (Employee, Planet),
	foreign key (Employee) references Employee(EmployeeID),
	foreign key (Planet) references Planet(PlanetID)
	);

create table Client (
	AccountNumber integer not null,
	Name nvarchar(255),
	primary key(AccountNumber)
	);
create table Package (
	Shipment integer not null,
	PackageNumber integer not null,
	Contents text,
	Weight real,
	Sender integer,
	Recipient integer,
	primary key (Shipment, PackageNumber),
	foreign key (Sender) references Client(AccountNumber),
	foreign key (Shipment) references Shipment(ShipmentID),
	foreign key(Recipient) references Client(AccountNumber)
	);

insert into Client values(1, 'Zapp Brannigan');
insert into Client values(2, 'Al Gore''s Head');
insert into Client values(3, 'Barbados Slim');
insert into Client values(4, 'Ogden Wernstrom');
insert into Client values(5, 'Leo Wong');
insert into Client values(6, 'Lrrr');
insert into Client values(7, 'John Zoidberg');
insert into Client values(8, 'John Zoidfarb');
insert into Client values(9, 'Morbo');
insert into Client values(10, 'Judge John Whitey');
insert into Client values(11, 'Calculon');

insert into Employee values(1, 'Phillip J. Fry', 'Delivery boy', 7500.0, 'Not to be confused with the Philip J. Fry from Hovering Squid World 97a');
insert into Employee values(2, 'Turanga Leela', 'Captain', 10000.0, null);
insert into Employee values(3, 'Bender Bending Rodriguez', 'Robot', 7500.0, null);
insert into Employee values(4, 'Hubert J. Farnsworth', 'CEO', 20000.0, null);
insert into Employee values(5, 'John A. Zoidberg', 'Physician', 25.0, null);
insert into Employee values(6, 'Amy Wong', 'Intern', 5000.0, null);
insert into Employee values(7, 'Hermes Conrad', 'Bureaucrat', 10000.0, null);
insert into Employee values(8, 'Scruffy Scruffington', 'Janitor', 5000.0, null);

insert into Planet values(1, 'Omicron Persei 8', 89475345.3545);
insert into Planet values(2, 'Decapod X', 65498463216.3466);
insert into Planet values(3, 'Mars', 32435021.65468);
insert into Planet values(4, 'Omega III', 98432121.5464);
insert into Planet values(5, 'Tarantulon VI', 849842198.354654);
insert into Planet values(6, 'Cannibalon', 654321987.21654);
insert into Planet values(7, 'DogDoo VII', 65498721354.688);
insert into Planet values(8, 'Nintenduu 64', 6543219894.1654);
insert into Planet values(9, 'Amazonia', 65432135979.6547);

insert into Has_Clearance values(1, 1, 2);
insert into Has_Clearance values(1, 2, 3);
insert into Has_Clearance values(2, 3, 2);
insert into Has_Clearance values(2, 4, 4);
insert into Has_Clearance values(3, 5, 2);
insert into Has_Clearance values(3, 6, 4);
insert into Has_Clearance values(4, 7, 1);

insert into Shipment values(1, '3004/05/11', 1, 1);
insert into Shipment values(2, '3004/05/11', 1, 2);
insert into Shipment values(3, null, 2, 3);
insert into Shipment values(4, null, 2, 4);
insert into Shipment values(5, null, 7, 5);

insert into Package values(1, 1, 'Undeclared', 1.5, 1, 2);
insert into Package values(2, 1, 'Undeclared', 10.0, 2, 3);
insert into Package values(2, 2, 'A bucket of krill', 2.0, 8, 7);
insert into Package values(3, 1, 'Undeclared', 15.0, 3, 4);
insert into Package values(3, 2, 'Undeclared', 3.0, 5, 1);
insert into Package values(3, 3, 'Undeclared', 7.0, 2, 3);
insert into Package values(4, 1, 'Undeclared', 5.0, 4, 5);
insert into Package values(4, 2, 'Undeclared', 27.0, 1, 2);
insert into Package values(5, 1, 'Undeclared', 100.0, 5, 1);

