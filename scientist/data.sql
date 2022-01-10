create table Scientists (
	SSN integer not null,
	Name varchar(255),
	primary key (SSN)
	);
create table Projects (
	Code varchar(255) not null,
	Name varchar(255),
	Hours integer,
	primary key (Code)
	);
--exec sp_rename 'AsignedTo', 'AssignedTo'
create table AssignedTo (
	Scientist integer not null,
	Project varchar(255) not null,
	Primary key (Scientist, Project),
	foreign key (Scientist) references Scientists(SSN),
	foreign key (Project) references Projects(Code)
	);

insert into Scientists(SSN,Name)values(123234877,'Michael Rogers');
insert into Scientists(SSN,Name)values(152934485,'Anand Manikutty');
insert into Scientists(SSN,Name)values(222364883, 'Carol Smith');
insert into Scientists(SSN,Name)values(326587417,'Joe Stevens');
insert into Scientists(SSN,Name)values(332154719,'Mary-Anne Foster');	
insert into Scientists(SSN,Name)values(332569843,'George ODonnell');
insert into Scientists(SSN,Name)values(546523478,'John Doe');
insert into Scientists(SSN,Name)values(631231482,'David Smith');
insert into Scientists(SSN,Name)values(654873219,'Zacary Efron');
insert into Scientists(SSN,Name)values(745685214,'Eric Goldsmith');
insert into Scientists(SSN,Name)values(845657245,'Elizabeth Doe');
insert into Scientists(SSN,Name)values(845657246,'Kumar Swamy');

insert into Projects (Code,Name,Hours) values ('AeH1','Winds: Studying Bernoullis Principle', 156);
insert into Projects ( Code,Name,Hours) values('AeH2','Aerodynamics and Bridge Design',189);
insert into Projects ( Code,Name,Hours) values('AeH3','Aerodynamics and Gas Mileage', 256);
insert into Projects ( Code,Name,Hours) values('AeH4','Aerodynamics and Ice Hockey', 789);
insert into Projects ( Code,Name,Hours) values('AeH5','Aerodynamics of a Football', 98);
insert into Projects ( Code,Name,Hours) values('AeH6','Aerodynamics of Air Hockey',89);
insert into Projects ( Code,Name,Hours) values('Ast1','A Matter of Time',112);
insert into Projects ( Code,Name,Hours) values('Ast2','A Puzzling Parallax', 299);
insert into Projects ( Code,Name,Hours) values('Ast3','Build Your Own Telescope', 6546);
insert into Projects ( Code,Name,Hours) values('Bte1','Juicy: Extracting Apple Juice with Pectinase', 321);
insert into Projects ( Code,Name,Hours) values('Bte2','A Magnetic Primer Designer', 9684);
insert into Projects ( Code,Name,Hours) values('Bte3','Bacterial Transformation Efficiency', 321);
insert into Projects ( Code,Name,Hours) values('Che1','A Silver-Cleaning Battery', 545);
insert into Projects ( Code,Name,Hours) values('Che2','A Soluble Separation Solution', 778);

insert into AssignedTo ( Scientist, Project) values (123234877,'AeH1');
insert into AssignedTo ( Scientist, Project) values (152934485,'AeH3');
insert into AssignedTo ( Scientist, Project)values(222364883,'Ast3');	   
insert into AssignedTo ( Scientist, Project)values(326587417,'Ast3');
insert into AssignedTo ( Scientist, Project)values(332154719,'Bte1');
insert into AssignedTo ( Scientist, Project)values(546523478,'Che1');
insert into AssignedTo ( Scientist, Project)values(631231482,'Ast3');
insert into AssignedTo ( Scientist, Project)values(654873219,'Che1');
insert into AssignedTo ( Scientist, Project)values(745685214,'AeH3');
insert into AssignedTo ( Scientist, Project)values(845657245,'Ast1');
insert into AssignedTo ( Scientist, Project)values(845657246,'Ast2');
insert into AssignedTo ( Scientist, Project)values(332569843,'AeH4');