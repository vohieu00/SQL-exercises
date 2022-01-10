create table Departments (
	Code integer not null,
	Name varchar(50),
	Budget real,
	primary key (Code)
	);
create table Employees (
	SSN integer,
	Name text,
	LastName varchar(50),
	Department integer not null,
	primary key (SSN),
	foreign key (Department) references Departments(Code)
	);


insert into Departments(Code,Name,Budget) values(14,'IT',65000);
insert into Departments(Code,Name,Budget) values(37,'Accounting',15000);
insert into Departments(Code,Name,Budget) values(59,'Human Resources',240000);
insert into Departments(Code,Name,Budget) values(77,'Research',55000);

insert into Employees(SSN,Name,LastName,Department) values('123234877','Michael','Rogers',14);
insert into Employees(SSN,Name,LastName,Department) values('152934485','Anand','Manikutty',14);
insert into Employees(SSN,Name,LastName,Department) values('222364883','Carol','Smith',37);
insert into Employees(SSN,Name,LastName,Department) values('326587417','Joe','Stevens',37);
insert into Employees(SSN,Name,LastName,Department) values('332154719','Mary-Anne','Foster',14);
insert into Employees(SSN,Name,LastName,Department) values('332569843','George','O''Donnell',77);
insert into Employees(SSN,Name,LastName,Department) values('546523478','John','Doe',59);
insert into Employees(SSN,Name,LastName,Department) values('631231482','David','Smith',77);
insert into Employees(SSN,Name,LastName,Department) values('654873219','Zacary','Efron',59);
insert into Employees(SSN,Name,LastName,Department) values('745685214','Eric','Goldsmith',59);
insert into Employees(SSN,Name,LastName,Department) values('845657245','Elizabeth','Doe',14);
insert into Employees(SSN,Name,LastName,Department) values('845657246','Kumar','Swamy',14);
