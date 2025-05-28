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

INSERT INTO StudentandTeacher (PersonID, RoleID)
SELECT StudentID, RoleID FROM Students
UNION
SELECT TeacherID, RoleID FROM Teacher;


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

-
