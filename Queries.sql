select * from Roles;    --- roles

select * from Department;   -- department

select * from Students;  --Students

select * from StudentsLogin;  -- Students Login

select * from Subjects -- Subjects

select * from SubjectMark --Subject Mark

select * from TotalMark  -- Total Mark

select * from TeacherRoles  -- Teachers roles'

select * from Teacher -- teacher

select * from TeacherLogin -- TeacherLogin

select * from StudentandTeacher; --Student and Teacher

select * from Attendance -- Attendance;



--Display all students and their total marks in descending order of marks.
select Stud.StudentID as StudentID, Stud.StudentName as StudentName, total.TotalMark as TotalMark
from Students Stud
join TotalMark total
on Stud.StudentID = total.StudentID
order by total.StudentID desc;

/*insert into Students(StudentID,StudentName,RoleID,DepartmentID,DateOfBirth)
values
(7,'Ganesh',1,5,'2004-09-15');*/



--How many students are in each department?
SELECT d.DepartmentName, COUNT(*) AS StudentCount
FROM Students s
JOIN Department d ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

--List all "Teaching Staff" teachers along with their department names.


