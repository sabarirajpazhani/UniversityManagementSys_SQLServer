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

