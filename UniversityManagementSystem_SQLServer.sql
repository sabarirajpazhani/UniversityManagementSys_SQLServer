-- creating University management System
create database UniversityManagementSystem;

use UniversityManagementSystem;

--create Roll table
create table Roles(
	RoleID int primary key, --student and teacher
	RoleName varchar(50)
);

-- Creating Student table
create table Students(
	StudentID int primary key,
	StudentName varchar(70),
	RoleID int,
	DepartmentID int,
	DateOfBirth date,
	foreign key (DepartmentID) references Department(DepartmentID),
	foreign key (RoleID) references Roles(RoleID)
);

--create StudentLogin table
create table StudentsLogin(
	StudentID int,
	Password varchar(60),
	foreign key (StudentID) references Students(StudentID)
);

-- Creating Department table
create table Department(
	DepartmentID int primary key,
	DepartmentName varchar(60)
);

--Creating Subjects table
create table Subjects(
	SubjectID int Primary key,
	SubjectName varchar(50)
);

-- Creating SubjectMark table
create table SubjectMark(
	StudentID int,
	SubjectID int,
	Mark int,
	primary key(StudentID,SubjectID),
	foreign key(StudentID) references Students(StudentID),
	foreign key(SubjectID) references Subjects(SubjectID)
);

--Create TotalMark Table
create table TotalMark(
	StudentID int,
	TotalMark int,
	foreign key (StudentID) references Students(StudentID)
);

--create Roll table for Teachers
create table TeacherRoles(
	TeacherRoleID int primary key,
	TeacherRoleName varchar(50)
);


--Create Teacher table
create table Teacher(
	TeacherID int primary key,
	RoleID int,
	TeacherName varchar(60),
	TeacherRoleID int,
	DepartmentID int,
	foreign key(DepartmentID) references Department(DepartmentID),
	foreign key(TeacherRoleID) references TeacherRoles(TeacherRoleID),
	foreign key(RoleID) references Roles(RoleID)
);


--create TeacherLogin table
create table TeacherLogin(
	TeacherID int,
	Password varchar(60),
	foreign key(TeacherID) references Teacher(TeacherID)
);


-- Create Attendance table
create table Attendance (
    PersonID INT,
    AttendanceDate DATE,
    AttendanceStatus CHAR(1) NOT NULL CHECK (AttendanceStatus IN ('P', 'A')),
	primary key(PersonID,AttendanceDate),
	foreign key(PersonID) references StudentandTeacher(PersonID)
);


--create stuentandTeacher table
create table StudentandTeacher(
	PersonID int primary key,
	RoleID int,
	
);

--inserting values into the Roles table
insert into Roles (RoleID,RoleName)
values
(1, 'Student'),
(2,'Teacher');

--inserting values into the Department table
insert into Department(DepartmentID,DepartmentName)
values
(1,'CSE'),
(2,'IT'),
(3,'AIDS'),
(4,'ECE'),
(5,'EEE');

--inserting values into the Students Table
insert into Students(StudentID,StudentName,RoleID,DepartmentID,DateOfBirth)
values
(1,'Sabari',1,1,'2004-06-08'),
(2,'Thamizh',1,1,'2003-12-13'),
(3,'Suriya',1,3,'2024-09-12'),
(4,'Vinoth',1,4,'2003-12-09'),
(5,'Dena',1,3,'2004-05-10'),
(6,'Mani',1,5,'2004-12-12');

--inserting values into the StudentsLogin table
insert into StudentsLogin (StudentID,Password)
values
(1,'12345'),
(2,'23545'),
(3,'63567'),
(4,'84674'),
(5,'34754'),
(6,'74678');

--inserting values into the Subjects table
insert into Subjects(SubjectID,SubjectName)
values
(111,'Computer Networks'),
(222,'Machine Learning'),
(333,'Web Technologies'),
(444,'BEEE'),
(555,'Electric communication');

--inserting values into the SubjectsMark table
insert into SubjectMark(StudentID,SubjectID,Mark)
values
(1,111,98),
(2,111,89),
(4,222,87),
(1,222,89),
(1,555,90),
(2,555,95),
(6,333,78),
(3,444,90),
(3,111,89),
(5,444,82),
(5,111,90);

--inserting values into the TotalMark table
insert into TotalMark(StudentID,TotalMark)
select StudentID , SUM(Mark) as TotalMark from SubjectMark
group by StudentID;

--inserting values into the TeacherRoles
insert into TeacherRoles(TeacherRoleID,TeacherRoleName)
values
(1111,'Teaching Staff'),
(2222,'Non-Teaching Staff');

--inserting vallues into the Teacher table
insert into Teacher(TeacherID,RoleID,TeacherName,TeacherRoleID,DepartmentID)
values
(1101, 2, 'Elavarasi',1111,1),
(2202, 2, 'Deepa',1111,3),
(3303, 2, 'Raj',2222,null),
(4404, 2, 'Jothika',1111,2),
(5505, 2, 'PalaniSamy',2222,null),
(6606, 2, 'Banu',1111,4),
(7707, 2, 'Shalini',1111,5);

--inserting values into TeacherLogin
insert into TeacherLogin(TeacherID,Password)
values
(1101, '12334'),
(2202, '32334'),
(3303, '73455'),
(4404, '80238'),
(5505, '80289'),
(6606, '80309'),
(7707, '00893');

--inserting values into the Students and teacher table
insert into StudentandTeacher (PersonID, RoleID)
select StudentID, RoleID from Students
union
select TeacherID, RoleID from Teacher;


--inserting values into the Attendance
insert into Attendance (PersonID,AttendanceDate,AttendanceStatus)
values
(1,GetDate(),'P'),
(2,Getdate(),'A'),
(3,Getdate(),'P'),
(4,Getdate(),'A'),
(5,Getdate(),'P'),
(6,Getdate(),'A'),
(1101,Getdate(),'P'),
(2202,'2025-05-26','P'),
(3303,'2025-05-23','P'),
(4404,Getdate(),'P'),
(5505,Getdate(),'P'),
(6606,Getdate(),'P'),
(7707,'2025-05-27','P');
