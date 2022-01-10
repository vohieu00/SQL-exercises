--1. Select the last name of all employees.
select LastName 
from Employees;
--2. Select the last name of all employees, without duplicates.
select distinct LastName
from Employees;
--3. Select all the data of employees whose last name is "Smith".
select*
from Employees
where LastName like 'Smith';
--4. Select all the data of employees whose last name is "Smith" or "Doe".
select*
from Employees
where LastName like 'Smith' or LastName like 'Doe';
--5. Select all the data of employees that work in department 14.
select*
from Employees 
where Department = 14;
--6. Select all the data of employees that work in department 37 or department 77.
select*
from Employees 
where Department = 37 or Department = 77;
--7. Select all the data of employees whose last name begins with an "S".
select*
from Employees
where LastName like 'S%';
--8. Select the sum of all the departments' budgets.
select sum(Budget) as 'Sum of Budget'
from Departments
--9. Select the number of employees in each department (you only need to show the department code and the number of employees).
select Department, count(Department) as 'Number'
from Employees
group by Department;
--10. Select all the data of employees, including each employee's department's data.
select Employees.*, Departments.Name, Departments.Budget
from Employees left join Departments on Employees.Department = Departments.Code;
--11. Select the name and last name of each employee, along with the name and budget of the employee's department.
select Employees.LastName, Employees.Name, Departments.Name, Departments.Budget
from Employees left join Departments on Employees.Department = Departments.Code;
--12. Select the name and last name of employees working for departments with a budget greater than $60,000.
select Employees.LastName, Employees.Name, Departments.Budget
from Employees left join Departments on Employees.Department = Departments.Code
where Departments.Budget > 60000;
/*
select Employees.LastName, Employees.Name
from Employees
where Employees.Department in (select Code from Departments where Budget > 60000); */
--13. Select the departments with a budget larger than the average budget of all the departments.
select *
from Departments 
where Budget > (select avg(Budget) 
				from Departments);
--14. Select the names of departments with more than two employees.
select Name
from Departments
where Departments.Code in (select Department
							from Employees 
							group by Department 
							having count(Department) > 2)

--select Employees.Department
--from Departments join Employees on Employees.Department = Departments.Code
--group by Employees.Department
--having count(Employees.Department) > 2


--15. Select the name and last name of employees working for departments with second lowest budget.
select *
from Employees 
where Employees.Department in (select top 1 temp.Code 
								from (select top 2 * from Departments order by Budget) temp
								order by Budget desc);

--16. Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into Departments values(11, 'Quality Assurance', 40000);
insert into Employees values(847219811, 'Mary', 'Moore', 11);
select* from Departments
--17. Reduce the budget of all departments by 10%.
update Departments set Budget = Budget * 0.9;
--18. Reassign all employees from the Research department (code 77) to the IT department (code 14).
update Employees set Department = 14 where Department = 77;
--19. Delete from the table all employees in the IT department (code 14)
delete from Employees where Department=14;
--20. Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from Employees 
where Department in (select Code
						from Departments 
						where Budget >=60000);
--21. Delete from the table all employees.
delete from Employees;