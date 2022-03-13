---------------------------------------------MUKUL SHARMA------------------------------------------------------------------------------------------------------------------------------------------------------------
use mukul

--EMPLOYEE TABLE----------------------------------------------------------------------------------------------------

create table Employee(
EmployeeId int identity(1,1) primary key,FirstName varchar(50), LastName varchar(50), DOB date, 
Email varchar(50), Phone numeric, StatusId int Foreign key references Status(Id))

--drop table employee

select * from Employee

--INSERT RECORD IN Employee TABLE
insert into Employee(FirstName, LastName , DOB , Email , Phone, StatusId)
values
('Mukul','Sharma','2001-02-10','mukul@gmail.com',9087657890, 1),
('Raju','Dalia','2000-02-12','raju@gmail.com',9087657891, 2),
('Shailesh','Patel','1990-09-20','shailesh@gmail.com',9087657892, 1),
('Shivameese','Reemes','1990-09-20','shailesh@gmail.com',9087657892, 2),
('Shailesh','Patel','1990-09-20','shailesh@gmail.com',9087657892, 1),
('Shivameese','Reemes','1990-09-20','shailesh@gmail.com',9087657892, 2),
('Lee','Lee','1990-09-20','lee@gmail.com',9087657892, 1),
('Tom','Tom','1990-09-20','tom@gmail.com',9087657892, 2)


select * from Employee

-----------------------------------------------------------------------------------------------------------------------------

--Employment TABLE-----------

create table Employment(
EmployeeId int identity(1,1) primary key,JoiningDate date ,ConfirmationDate date ,ReleavingDate date ,DepartmentId int,DesignationId int)

--drop table Employment

--INSERT RECORD IN Employment TABLE
insert into Employment(JoiningDate,ConfirmationDate ,ReleavingDate  ,DepartmentId,DesignationId)
values
('2020-01-10','2020-11-10','2021-01-10',1,1),('2020-02-10','2020-12-10','2021-03-10',2,2),('2021-11-10','2020-11-10','2021-04-10',3,3),
('2021-11-30','2021-07-10','2022-07-10',4,4),('2021-11-30','2022-08-10','2023-07-10',5,5),('2021-11-30','2022-08-10','2021-07-10',6,6),
('2021-11-10','2020-11-10','2021-01-10',1,1),('2021-11-10','2020-12-10','2021-03-10',2,2),('2021-11-10','2020-11-10','2021-04-10',3,3),
('2021-11-10','2021-07-10','2022-07-10',4,4),('2021-11-10','2022-08-10','2023-07-10',5,5),('2021-11-10','2022-08-10','2021-07-10',6,6)


------------------------------------------------------------------------------------------------------------------------------
--DEPARTMENTS TABLE---------------------------------------------------------------

create table Departments(
Id int identity(1,1) primary key, Name varchar(50))
--drop table Departments

--INSERT RECORD IN Departments table

insert into departments(Name)
values('java'),('android'),('android')

--drop table Departments

------------------------------------------------------------------------------------------------------------------------

--Status TABLE--------------------------------------------------------------------------

create table Status(
Id int primary key, Name varchar(20))
--drop table status

--INSERT RECORD IN Status TABLE

insert into Status(Id,Name)
values(1,'confirmed'),(2,'not confirm')

--------------------------------------------------------------------------------------------------------------------------

--Designation TABLE---------------------------------------------------------------------

create table Designation(
Id int identity(1,1) primary key, Name varchar(50))
--drop table Designation
--INSERT RECORD IN Designation Table

insert into Designation (Name)
values('manager'),('hr'),('technician')

-------------------------------------------------------------------------------------------------------------------------

------Salary TABLE-------------------------------------------------------

create table Salary(EmployeeId int,SalaryCreditDate date , Amount money)
--drop table Salary
select * from Salary
--INSERT RECORD IN Salary TABLE

insert into Salary(EmployeeId,SalaryCreditDate , Amount)
values('1','2021-01-01','20000'),('1','2021-02-01','20000'),('2','2021-01-01','30000'),('2','2021-02-01','30000'),('3','2021-01-01','15000'),('3','2021-01-01','15000'),
('4','2021-01-01','18000'),('4','2021-02-01','18000'),('5','2021-01-01','25000'),('5','2021-02-01','25000'),('6','2021-01-01','30000'),('6','2021-02-01','30000'),
('7','2021-01-01','20000'),('7','2021-02-01','20000'),('8','2021-01-01','10000'),('8','2021-02-01','10000')

---------------------------------------------------------------------------------------------------------------------------

------------------------------------------------QUERIES----------------------------------------------------------------

--done-1. Write sql query to Retrieve firstname, lastname and join year of employee whose joined in last 3 months 
--and working in android department

select e.firstname,e.lastname,em.JoiningDate ,d.Name
from Employee e
inner join Employment em on e.EmployeeId=em.EmployeeId
inner join Departments d on e.EmployeeId=d.Id and d.Name='android'
where em.JoiningDate > dateadd(month, -3, getdate())

------------------------------------------------------------------------------------------------------------------------

--done-2. Write sql query to Retrieve all employees who has birthdate will come in next week

SELECT FirstName,DOB FROM Employee
WHERE DATEADD (YEAR, DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, DOB), DOB)
BETWEEN CAST(GETDATE() AS DATE) AND CAST(DATEADD(WEEK, 1, GETDATE())-1 AS DATE)
ORDER BY DAY(DOB), FirstName

-------------------------------------------------------------------------------------------------------------------------

--done-3. Explain the difference between the following two queries
--        -- Query 1
--        SELECT empid, COUNT(*) AS numorders
--        FROM Sales.Orders
--        WHERE orderdate < '20190501'
--        GROUP BY empid;
	Output of both the queries will be Same BUT,
	
	-- Query 1 Explanation

	WHERE orderdate < '20190501' , filter the records from the table based on the specified condition.
	

--        -- Query 2
--        SELECT empid, COUNT(*) AS numorders
--        FROM Sales.Orders
--        GROUP BY empid
--        HAVING MAX(orderdate) < '20190501';
	
	Output of both the queries will be Same BUT,
	
	-- Query 2 Explanation

	HAVING MAX(orderdate) < '20190501' filter  record from the group based on the specified condition.

------------------------------------------------------------------------------------------------------------------------

--done-4.  Write sql query to retrieve list of Employees who has joined on last day of month.

select e.FirstName,em.JoiningDate from Employee e
inner join Employment em on em.EmployeeId=e.EmployeeId
where Day(em.JoiningDate) = Day(EOMONTH(em.JoiningDate))

select * from Employee
select * from Employment

------------------------------------------------------------------------------------------------------------------------

--done-5.  Write sql query to retrieve employees with last name containing the letter 'e' twice or more

select EmployeeId,Lastname
from Employee
where len(Lastname) - len(replace(LastName, 'e', '')) >= 2;

-------------------------------------------------------------------------------------------------------------------------

--done-6.  Write sql query that generates a virtual auxiliary table of 10 numbers (in the range 1 through 10)

SELECT 1 AS Numbers
UNION ALL SELECT 2
UNION ALL SELECT 3
UNION ALL SELECT 4
UNION ALL SELECT 5
UNION ALL SELECT 6
UNION ALL SELECT 7
UNION ALL SELECT 8
UNION ALL SELECT 9
UNION ALL SELECT 10

------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------

--done-done-7.  Write sql query to update all employee status to confirmed who are joined before 3 months.

--BEGIN TRAN tr1

Update e
SET 
e.StatusId=1
FROM Employee e
JOIN Employment em ON e.EmployeeId = em.EmployeeId
AND em.JoiningDate >= DATEADD(MONTH, -3, GETDATE());

--Rollback TRAN tr1



select * from status
select * from Employment
select * from employee
------------------------------------------------------------------------------------------------------------------------

--done-8.  Write sql query to insert Employee with their Designation and Joining details.
BEGIN TRAN tr1

INSERT INTO Employee(FirstName, LastName , DOB , Email , Phone, StatusId)
values
('Himanshu','Rathod','2001-02-10','himanshu@gmail.com',9087657899, 3)

go
insert into Designation (Name)
values('Developer')

GO
insert into Employment(JoiningDate,ConfirmationDate ,ReleavingDate  ,DepartmentId,DesignationId)
values
('2022-11-10','2022-07-10','2023-07-10',7,7)

select * from Employee
select * from Designation
select * from Employment

Rollback TRAN tr1

------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------

--9.  Write sql query to retrieve Employees with theirs first salary and last salary and Max salary till now.


--query for first salary


SELECT e.EmployeeId, e.FirstName, FirstSalary, LastSalary, MaxSalary FROM Employee e
OUTER APPLY(SELECT TOP 1 s.Amount AS FirstSalary FROM Salary s WHERE e.EmployeeId = s.EmployeeId
ORDER BY s.SalaryCreditDate)OuterFirst
OUTER APPLY(SELECT TOP 1 s.Amount AS LastSalary FROM Salary s WHERE e.EmployeeId = s.EmployeeId
ORDER BY s.SalaryCreditDate DESC)OuterLast
OUTER APPLY(SELECT MAX(s.Amount) AS MaxSalary FROM Salary s WHERE e.EmployeeId = s.EmployeeId)OuterMax

select * from Salary
select * from Employee
--select * from Salary
------------------------------------------------------------------------------------------------------------------------

--done -10. write sql query to retrieve top 5 employees who Joined earliest but having lowest salary

select top 5 e.FirstName,em.JoiningDate,s.Amount from Employee e
inner join employment em on em.EmployeeId=e.EmployeeId
inner join Salary s on s.EmployeeId=e.EmployeeId
group by e.FirstName,em.JoiningDate,s.Amount
order by em.JoiningDate,s.Amount


select * from Employee

select * from Salary

------------------------------------------------------------------------------------------------------------------------

--done--11. Insert all the data from table1 to table2 in which country column in table2 has US values

create table Customers(Id int primary key identity(1,1),Name varchar(50),City varchar(50),Country varchar(50))
insert into Customers(Name, City, Country)
values('Mukul Sharma','Ahmedabad','India'),('Raam Sharma','Delhi','India')

--table 2
create table Suplier(Id int primary key identity(1,1),Name varchar(50),City varchar(50),Country varchar(50))
insert into Suplier(Name, City, Country)
values('Lee','Los Angeles','US'),('Ravi Kumar','Agra','India'),('Lee','Berlin','Germany')

-----Query-----
INSERT INTO Customers  (Name, City, Country)
SELECT Name, City, Country FROM Suplier
WHERE Country='US';
-------------
GO
select * from Customers
Select * from Suplier

------------------------------------------------------------------------------------------------------------------------

--12. Write query to retrieve Months of 2021 in which no employee leaved company.

--NEW TABLE ReturnMonth
create table ReturnMonth(Id int primary key identity(1,1) , MonthOfYear varchar(50))

--INSERT VALUES IN ReturnMonth
insert into ReturnMonth(MonthOfYear)
values('January'),('February'),('March'),('April'),('May'),('June'),('July'),('August'),('September'),('October'),('November'),('December')

--QUERY
select rm.Id as Months,rm.MonthOfYear from ReturnMonth rm 
left join Employment em on rm.Id=month(em.ReleavingDate)
where (month(em.ReleavingDate) is null) 


------------------------------------------------------------------------------------------------------------------------

--done-13. Find the minimum and maximum Joining date from Employment Table

select min(JoiningDate) as MINIMUM_JOINING_DATE, max(JoiningDate) as MAXIMUM_JOINING_DATE from Employment

-----------------------------------------------------------------------------------------------------------THANK YOU--------------------------------------------------------------------------------------------------------------------------------





