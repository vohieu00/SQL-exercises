--Obtain the names of all physicians that have performed a medical procedure they have never been certified to perform.
select Name
from Physician join Undergoes on Undergoes.Physician = Physician.EmployeeID
where Undergoes.Procedures not in (select Treatment 
							from Trained_in
							where Treatment = Undergoes.Procedures
							and Physician = Undergoes.Physician)

select Name
from Physician join Undergoes on Physician.EmployeeID = Undergoes.Physician 
				left join Trained_In on Trained_In.Physician = Undergoes.Physician 
									and Trained_In.Treatment = Undergoes.Procedures
where Trained_In.Physician is null
--Same as the previous query, but include the following information in the results: Physician name, name of procedure, 
--date when the procedure was carried out, name of the patient the procedure was carried out on.
select Physician.Name, Procedures.Name as 'Procedure', Undergoes.Date, Patient.Name as 'Patient'
from Patient, Physician join Undergoes on Physician.EmployeeID = Undergoes.Physician
			left join Trained_In on Trained_In.Physician = Undergoes.Physician 
									and Trained_In.Treatment = Undergoes.Procedures
			left join Procedures on Procedures.Code=Undergoes.Procedures
where Trained_In.Physician is null and Patient.SSN=Undergoes.Patient

--Obtain the names of all physicians that have performed a medical procedure that they are certified to perform, 
--but such that the procedure was done at a date (Undergoes.Date) after the physician's certification expired (Trained_In.CertificationExpires).
select Physician.Name
from Physician, Trained_In join Undergoes
on Trained_In.Physician = Undergoes.Physician 
			and Trained_In.Treatment = Undergoes.Procedures
where Physician.EmployeeID=Undergoes.Physician and Date > CertificationExpires
--Same as the previous query, but include the following information in the results: Physician name, 
--name of procedure, date when the procedure was carried out, name of the patient the procedure was carried out on, and date when the certification expired.
select Physician.Name, Undergoes.Date, Procedures.Name as 'Procedures', Trained_In.CertificationExpires
from Physician, Procedures, Trained_In, Undergoes
where Physician.EmployeeID=Undergoes.Physician and Date > CertificationExpires and Procedures.Code = Undergoes.Procedures
		and Trained_In.Physician = Undergoes.Physician and Trained_In.Treatment = Undergoes.Procedures

--Obtain the information for appointments where a patient met with a physician other than his/her primary care physician. 
--Show the following information: Patient name, physician name, nurse name (if any), start and end time of appointment, 
--examination room, and the name of the patient's primary care physician.
select Patient.Name as 'Patient', Physician.Name 'Physician', Nurse.Name as 'Nurse', StartDate, EndDate, ExamRoom, PhPCP.Name as 'PCP'
from Appointment left join Nurse on Appointment.PrepNurse=Nurse.EmployeeID, Patient, Physician, Physician as PhPCP 
where Appointment.Patient= Patient.SSN and Physician.EmployeeID = Appointment.Physician
	and Patient.PCP = PhPCP.EmployeeID and Appointment.Physician != Patient.PCP
--The Patient field in Undergoes is redundant, since we can obtain it from the Stay table. There are no constraints in force to prevent inconsistencies between these two tables.
--More specifically, the Undergoes table may include a row where the patient ID does not match the one we would obtain from the Stay table through the Undergoes.Stay foreign key. 
--Select all rows from Undergoes that exhibit this inconsistency.

select *
from Undergoes join Stay on Stay.StayID = Undergoes.Stay
where Undergoes.Patient !=Stay.Patient

--Obtain the names of all the nurses who have ever been on call for room 123.
select *
from Nurse
where EmployeeID in (select Nurse 
						from On_Call join Room on On_Call.BlockCode=Room.BlockCode and On_Call.BlockFloor=Room.BlockFloor
						where Number = 123)
--The hospital has several examination rooms where appointments take place. Obtain the number of appointments that have taken place in each examination room.
select ExamRoom, count(AppointmentID) as 'Number'
from Appointment
group by ExamRoom
--Obtain the names of all patients (also include, for each patient, the name of the patient's primary care physician), such that \emph{all} the following are true:
--The patient has been prescribed some medication by his/her primary care physician.
--The patient has undergone a procedure with a cost larger that $5,000
--The patient has had at least two appointment where the nurse who prepped the appointment was a registered nurse.
--The patient's primary care physician is not the head of any department.
select Patient.Name as 'Patient', Physician.Name as 'Physician'
from Patient, Physician
where Patient.PCP=Physician.EmployeeID
and exists (select * from Prescribes where Prescribes.Patient = Patient.SSN and Prescribes.Physician = Patient.PCP)
and exists (select * from Undergoes join Procedures on Procedures.Code = Undergoes.Procedures where Procedures.Cost >5000)
and 2 <= (select count(AppointmentID) from Appointment left join Nurse on Appointment.PrepNurse = Nurse.EmployeeID where Nurse.Registered = 1)
and Patient.PCP not in (select Head from Department)
