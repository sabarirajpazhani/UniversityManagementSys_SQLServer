-- creating University management System
create database UniversityManagementSystem;

use UniversityManagementSystem;

-- Creating Student table
create table Students(
	StudentID int primary key,
	StudentName varchar(70),
	DepartmentID int,
	DateOfBirth date,
	foreign key (DepartmentID) references Department(DepartmentID)
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

