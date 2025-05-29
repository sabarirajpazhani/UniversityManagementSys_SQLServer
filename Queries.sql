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

use UniversityManagementSystem;


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
select t.TeacherName, tr.TeacherRoleID, d.DepartmentName
from Teacher t
inner join TeacherRoles tr
on t.TeacherRoleID = tr.TeacherRoleID
left join Department d
on t.DepartmentID = d.DepartmentID
where tr.TeacherRoleName = 'Teaching Staff';


--Show today's attendance for all students and teachers.
insert into Attendance (PersonID,AttendanceDate,AttendanceStatus)
values
(2,Getdate(),'P'),
(3,Getdate(),'P'),
(4,Getdate(),'P'),
(5,Getdate(),'P'),
(6,Getdate(),'P');
select a.PersonID, s.StudentName, a.AttendanceDate, a.AttendanceStatus
from Attendance a
left join Students s
on a.PersonID = s.StudentID
where a.AttendanceDate = CAST(GETDATE() AS Date);


insert into Attendance (PersonID,AttendanceDate,AttendanceStatus)
values
(1101,Getdate(),'P'),
(3303,Getdate(),'P'),
(4404,Getdate(),'P'),
(5505,Getdate(),'P'),
(6606,Getdate(),'P');
select a.PersonID, t.TeacherName, a.AttendanceDate, a.AttendanceStatus
from Attendance a
right join Teacher t
on a.PersonID = t.TeacherID
where a.AttendanceDate = CAST(GETDATE() AS Date);


--Show subject-wise marks for each student.
select s.StudentName, sub.SubjectName, sm.Mark
from SubjectMark sm
join Students s 
on sm.StudentID = s.StudentID
join Subjects sub
on sm.SubjectID = sub.SubjectID
order by s.StudentName;


--Show full student info including login and department name.
select s.StudentID, s.StudentName,d.DepartmentName, sl.Password
from Students s
join Department d
on s.DepartmentID = d.DepartmentID
join StudentsLogin sl
on s.StudentID = sl.StudentID;

