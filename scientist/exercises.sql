--List all the scientists' names, their projects' names, and the hours worked by that scientist on each project, 
--in alphabetical order of project name, then scientist name.
select Scientists.Name as 'Authour', Projects.Name as 'Project', Projects.Hours
from Scientists join AssignedTo on Scientists.SSN=AssignedTo.Scientist
join Projects on Projects.Code = AssignedTo.Project
order by Projects.Name, Scientists.Name