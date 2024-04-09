create database Course
use Course
--TASK 1
create table Users
(
Id int primary key identity,
[Name] nvarchar(20),
Surname nvarchar(20),
Age int,
Email nvarchar(20),
IsDeleted bit
)
create table Educations
(
Id int primary key identity,
[Name] nvarchar(20)
)
create table Teachers
(
Id int primary key identity,
FullName nvarchar(20),
Age int,
Email nvarchar(20),
[Address] nvarchar(20),
IsDeleted bit
)
insert into Users ([Name],Surname,Age,Email,IsDeleted) values
('Emil','Musayev',26,'emmilm77@gmail.com',0),
('Anthony','Martial',28,'a.martial@gmail.com',0),
('Marcus','Rashford',25,'m.rashford@gmail.com',0),
('Luke','Shaw',30,'l.shaw@gmail.com',0),
('Raphael','Varane',33,'l.varane@gmail.com',1)

insert into Users ([Name],Surname,Age,Email,IsDeleted) values
('Test','Testov',19,'test@gmail.com',0)

insert into Teachers (FullName,Age,Email,[Address],IsDeleted) values
('Ulvi Majidov',25,'u.majidov@gmail.com','Baki',0),
('Test Testov', 28, 'test@gmail.com','Baki',0)

update Teachers set IsDeleted=1 where Id=2

insert into Teachers (FullName,Age,Email,[Address],IsDeleted) values
('Test1 Test1ov', 35,'test1@gmail.com','Baki',0)

--Query for all users
select * from Users
--Query for users below 20
select * from Users where (Age<20)
--Query for User Count
select COUNT(*) UserCount from Users
--Query for deleted Teachers
select FullName, Age, [Address] from Teachers where Isdeleted=1
--Query for Teachers above 30
select * from Teachers where Age>30

--Task2
create table Employees
(
Id int primary key identity,
Fullname nvarchar(255) not null,
Age int check(age>0) not null,
Email nvarchar(255) unique not null,
Salary decimal(18,2) check(Salary>300 and Salary<2000)
)
insert into Employees (Fullname,Age,Email,Salary) values
('Employee1',30,'employee1@gmail.com',1500),
('Employee2',25,'employee2@gmail.com',1200),
('Employee3',24,'employee3@gmail.com',1700)

select * from Employees

--Task2.7
--One to Many query
create table FruitBasket
(
Id int primary key identity,
[Name] nvarchar(20),
Colour nvarchar(20)
)
insert into FruitBasket ([Name],Colour) values
('Apple','Red'),
('Pear','Green'),
('Eggplant','Purple')
create table Fruits
(
Id int primary key identity,
BasketId int foreign key references FruitBasket(Id),
[Name] nvarchar(20),
Quantity int
)
insert into Fruits (BasketId,[Name],Quantity) values
(1,'Apples',10),
(2,'Pears',15),
(3,'Eggplants',20)
--One to one query
create table Persons
(
Id int primary key identity,
FirstName nvarchar(20),
LastName nvarchar(20)
)
insert into Persons (FirstName,LastName) values
('Emil','Musayev'),
('Test','Testov'),
('Filankes','Filankesov')
create table DriversLicense
(
Id int primary key identity,
ExpirationDate date,
PersonsId int foreign key references Persons(Id)
)
insert into DriversLicense (ExpirationDate, PersonsId) values
('2025-10-10',1),
('2026-10-10',2),
('2027-10-10',3)
--Many to many query
create table Employee
(
Id int primary key identity,
FirstName nvarchar(20),
LastName nvarchar(20)
)
insert into Employee (FirstName,LastName) values
('Emil','Musayev'),
('Test','Testov'),
('Filankes','Filankesov')
create table Projects
(
Id int primary key identity,
ProjectName nvarchar(20)
)
insert into Projects (ProjectName) values
('Project1'),
('Project2'),
('Project3')
create table Assignments
(
Id int primary key identity,
EmployeeId int foreign key references Employee(Id),
ProjectId int foreign key references Projects(Id)
)
insert into Assignments (EmployeeId,ProjectId) values
(1,1),
(2,2),
(3,3)