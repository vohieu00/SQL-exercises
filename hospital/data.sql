create table Physician (
	EmployeeID integer not null,
	Name text,
	Position text,
	SSN integer,
	primary key(EmployeeID)
	);
create table Department (
	DepartmentID integer not null,
	Name text,
	Head integer,
	primary key (DepartmentID),
	foreign key (Head) references Physician(EmployeeID)
	);
create table Patient (
	SSN integer not null,
	Name text,
	Address text,
	Phone text,
	InsuranceID integer,
	PCP integer,
	primary key (SSN),
	foreign key (PCP) references Physician(EmployeeID)
	);
create table Affiliated_with(
	Physician integer not null,
	Department integer not null,
	PrimaryAffiliation bit,
	primary key (Physician, Department),
	foreign key (Physician) references Physician(EmployeeID),
	foreign key (Department) references Department(DepartmentID)
	);
create table Procedures(
	Code integer not null,
	Name text,
	Cost integer,
	primary key (Code)
	);
create table Trained_In (
	Physician integer not null,
	Treatment integer not null,
	CertificationDate datetime,
	CertificationExpires datetime,
	primary key (Physician, Treatment),
	foreign key (Physician) references Physician(EmployeeID),
	foreign key (Treatment) references Procedures(Code)
	);
create table Nurse (
	EmployeeID integer not null,
	Name text,
	Position text,
	Registered bit,
	SSN integer,
	primary key (EmployeeID)
	);
--alter table Appointment alter column ExamRoom nvarchar(20)
create table Appointment (
	AppointmentID integer not null,
	Patient integer not null,
	PrepNurse integer,
	Physician integer,
	StartDate datetime,
	EndDate datetime,
	ExamRoom nvarchar(20),
	primary key (AppointmentID),
	foreign key (Patient) references Patient(SSN),
	foreign key (PrepNurse) references Nurse(EmployeeID),
	foreign key (Physician) references Physician (EmployeeID)
	);
create table Medication (
	Code integer not null,
	Name text,
	Brand text,
	Description text,
	primary key (Code)
	);

create table Prescribes (
	Physician integer not null,
	Patient integer not null,
	Medication integer not null,
	Date datetime,
	Appointment integer,
	Dose text,
	primary key (Physician, Patient, Medication, Date),
	foreign key (Physician) references Physician(EmployeeID),
	foreign key (Patient) references Patient(SSN),
	foreign key (Medication) references Medication(Code),
	foreign key (Appointment) references Appointment(AppointmentID)
	);
create table Blocks(
	FloorID integer not null,
	Code integer not null,
	primary key(FloorID, Code)
	);
create table On_Call (
	Nurse integer not null,
	BlockFloor integer not null,
	BlockCode integer not null,
	StartDate datetime,
	EndDate datetime,
	primary key (Nurse, BlockCode, BlockFloor, StartDate, EndDate),
	foreign key (Nurse) references Nurse(EmployeeID),
	foreign key (BlockFloor, BlockCode) references Blocks(FloorID, Code)
	);
create table Room (
	Number integer not null,
	Type text,
	BlockFloor integer not null,
	BlockCode integer not null,
	Unavailable bit,
	primary key (Number),
	foreign key (BlockFloor, BlockCode) references Blocks(FloorID, Code)
	);
create table Stay (
	StayID integer not null,
	Patient integer,
	Room integer,
	StartDate datetime,
	EndDate datetime,
	primary key (StayID),
	foreign key (Patient) references Patient(SSN),
	foreign key (Room) references Room(Number)
	);
create table Undergoes (
	Patient integer not null,
	Procedures integer not null,
	Stay integer not null,
	Date datetime not null,
	Physician integer,
	AssistingNurse integer,
	primary key(Patient, Procedures, Stay, Date),
	foreign key(Patient) references Patient(SSN),
	foreign key (Procedures) references Procedures(Code),
	foreign key (Stay) references Stay(StayID),
	foreign key (Physician) references Physician(EmployeeID),
	foreign key(AssistingNurse) references Nurse(EmployeeID)
	);

insert into Physician values(1,'John Dorian','Staff Internist',111111111);
insert into Physician values(2,'Elliot Reid','Attending Physician',222222222);
insert into Physician values(3,'Christopher Turk','Surgical Attending Physician',333333333);
insert into Physician values(4,'Percival Cox','Senior Attending Physician',444444444);
insert into Physician values(5,'Bob Kelso','Head Chief of Medicine',555555555);
insert into Physician values(6,'Todd Quinlan','Surgical Attending Physician',666666666);
insert into Physician values(7,'John Wen','Surgical Attending Physician',777777777);
insert into Physician values(8,'Keith Dudemeister','MD Resident',888888888);
insert into Physician values(9,'Molly Clock','Attending Psychiatrist',999999999);

insert into Department values(1,'General Medicine',4);
insert into Department values(2,'Surgery',7);
insert into Department values(3,'Psychiatry',9);

insert into Affiliated_With values(1,1,1);
insert into Affiliated_With values(2,1,1);
insert into Affiliated_With values(3,1,0);
insert into Affiliated_With values(3,2,1);
insert into Affiliated_With values(4,1,1);
insert into Affiliated_With values(5,1,1);
insert into Affiliated_With values(6,2,1);
insert into Affiliated_With values(7,1,0);
insert into Affiliated_With values(7,2,1);
insert into Affiliated_With values(8,1,1);
insert into Affiliated_With values(9,3,1);

insert into Procedures values(1,'Reverse Rhinopodoplasty',1500.0);
insert into Procedures values(2,'Obtuse Pyloric Recombobulation',3750.0);
insert into Procedures values(3,'Folded Demiophtalmectomy',4500.0);
insert into Procedures values(4,'Complete Walletectomy',10000.0);
insert into Procedures values(5,'Obfuscated Dermogastrotomy',4899.0);
insert into Procedures values(6,'Reversible Pancreomyoplasty',5600.0);
insert into Procedures values(7,'Follicular Demiectomy',25.0);

insert into Patient values(100000001,'John Smith','42 Foobar Lane','555-0256',68476213,1);
insert into Patient values(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,2);
insert into Patient values(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,2);
insert into Patient values(100000004,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879,3);

insert into Nurse values(101,'Carla Espinosa','Head Nurse',1,111111110);
insert into Nurse values(102,'Laverne Roberts','Nurse',1,222222220);
insert into Nurse values(103,'Paul Flowers','Nurse',0,333333330);

insert into Appointment values(13216584,100000001,101,1,'2008-04-24 10:00','2008-04-24 11:00','A');
insert into Appointment values(26548913,100000002,101,2,'2008-04-24 10:00','2008-04-24 11:00','B');
insert into Appointment values(36549879,100000001,102,1,'2008-04-25 10:00','2008-04-25 11:00','A');
insert into Appointment values(46846589,100000004,103,4,'2008-04-25 10:00','2008-04-25 11:00','B');
insert into Appointment values(59871321,100000004,null,4,'2008-04-26 10:00','2008-04-26 11:00','C');
insert into Appointment values(69879231,100000003,103,2,'2008-04-26 11:00','2008-04-26 12:00','C');
insert into Appointment values(76983231,100000001,null,3,'2008-04-26 12:00','2008-04-26 13:00','C');
insert into Appointment values(86213939,100000004,102,9,'2008-04-27 10:00','2008-04-21 11:00','A');
insert into Appointment values(93216548,100000002,101,2,'2008-04-27 10:00','2008-04-27 11:00','B');

insert into Medication values(1,'Procrastin-X','X','N/A');
insert into Medication values(2,'Thesisin','Foo Labs','N/A');
insert into Medication values(3,'Awakin','Bar Laboratories','N/A');
insert into Medication values(4,'Crescavitin','Baz Industries','N/A');
insert into Medication values(5,'Melioraurin','Snafu Pharmaceuticals','N/A');

insert into Prescribes values(1,100000001,1,'2008-04-24 10:47',13216584,'5');
insert into Prescribes values(9,100000004,2,'2008-04-27 10:53',86213939,'10');
insert into Prescribes values(9,100000004,2,'2008-04-30 16:53',null,'5');

insert into Blocks values(1,1);
insert into Blocks values(1,2);
insert into Blocks values(1,3);
insert into Blocks values(2,1);
insert into Blocks values(2,2);
insert into Blocks values(2,3);
insert into Blocks values(3,1);
insert into Blocks values(3,2);
insert into Blocks values(3,3);
insert into Blocks values(4,1);
insert into Blocks values(4,2);
insert into Blocks values(4,3);

insert into Room values(101,'Single',1,1,0);
insert into Room values(102,'Single',1,1,0);
insert into Room values(103,'Single',1,1,0);
insert into Room values(111,'Single',1,2,0);
insert into Room values(112,'Single',1,2,1);
insert into Room values(113,'Single',1,2,0);
insert into Room values(121,'Single',1,3,0);
insert into Room values(122,'Single',1,3,0);
insert into Room values(123,'Single',1,3,0);
insert into Room values(201,'Single',2,1,1);
insert into Room values(202,'Single',2,1,0);
insert into Room values(203,'Single',2,1,0);
insert into Room values(211,'Single',2,2,0);
insert into Room values(212,'Single',2,2,0);
insert into Room values(213,'Single',2,2,1);
insert into Room values(221,'Single',2,3,0);
insert into Room values(222,'Single',2,3,0);
insert into Room values(223,'Single',2,3,0);
insert into Room values(301,'Single',3,1,0);
insert into Room values(302,'Single',3,1,1);
insert into Room values(303,'Single',3,1,0);
insert into Room values(311,'Single',3,2,0);
insert into Room values(312,'Single',3,2,0);
insert into Room values(313,'Single',3,2,0);
insert into Room values(321,'Single',3,3,1);
insert into Room values(322,'Single',3,3,0);
insert into Room values(323,'Single',3,3,0);
insert into Room values(401,'Single',4,1,0);
insert into Room values(402,'Single',4,1,1);
insert into Room values(403,'Single',4,1,0);
insert into Room values(411,'Single',4,2,0);
insert into Room values(412,'Single',4,2,0);
insert into Room values(413,'Single',4,2,0);
insert into Room values(421,'Single',4,3,1);
insert into Room values(422,'Single',4,3,0);
insert into Room values(423,'Single',4,3,0);

insert into On_Call values(101,1,1,'2008-11-04 11:00','2008-11-04 19:00');
insert into On_Call values(101,1,2,'2008-11-04 11:00','2008-11-04 19:00');
insert into On_Call values(102,1,3,'2008-11-04 11:00','2008-11-04 19:00');
insert into On_Call values(103,1,1,'2008-11-04 19:00','2008-11-05 03:00');
insert into On_Call values(103,1,2,'2008-11-04 19:00','2008-11-05 03:00');
insert into On_Call values(103,1,3,'2008-11-04 19:00','2008-11-05 03:00');

insert into Stay values(3215,100000001,111,'2008-05-01','2008-05-04');
insert into Stay values(3216,100000003,123,'2008-05-03','2008-05-14');
insert into Stay values(3217,100000004,112,'2008-05-02','2008-05-03');

insert into Undergoes values(100000001,6,3215,'2008-05-02',3,101);
insert into Undergoes values(100000001,2,3215,'2008-05-03',7,101);
insert into Undergoes values(100000004,1,3217,'2008-05-07',3,102);
insert into Undergoes values(100000004,5,3217,'2008-05-09',6,null);
insert into Undergoes values(100000001,7,3217,'2008-05-10',7,101);
insert into Undergoes values(100000004,4,3217,'2008-05-13',3,103);

insert into Trained_In values(3,1,'2008-01-01','2008-12-31');
insert into Trained_In values(3,2,'2008-01-01','2008-12-31');
insert into Trained_In values(3,5,'2008-01-01','2008-12-31');
insert into Trained_In values(3,6,'2008-01-01','2008-12-31');
insert into Trained_In values(3,7,'2008-01-01','2008-12-31');
insert into Trained_In values(6,2,'2008-01-01','2008-12-31');
insert into Trained_In values(6,5,'2007-01-01','2007-12-31');
insert into Trained_In values(6,6,'2008-01-01','2008-12-31');
insert into Trained_In values(7,1,'2008-01-01','2008-12-31');
insert into Trained_In values(7,2,'2008-01-01','2008-12-31');
insert into Trained_In values(7,3,'2008-01-01','2008-12-31');
insert into Trained_In values(7,4,'2008-01-01','2008-12-31');
insert into Trained_In values(7,5,'2008-01-01','2008-12-31');
insert into Trained_In values(7,6,'2008-01-01','2008-12-31');
insert into Trained_In values(7,7,'2008-01-01','2008-12-31');