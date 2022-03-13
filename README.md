# 13-SQL-Queries-Beginner_to_Advance
1. Write sql query to Retrieve firstname, lastname and join year of employee whose joined in last 3 months and working in android department
2. Write sql query to Retrieve all employees who has birthdate will come in next week
3. Explain the difference between the following two queries
        -- Query 1
        SELECT empid, COUNT(*) AS numorders
        FROM Sales.Orders
        WHERE orderdate < '20190501'
        GROUP BY empid;

        -- Query 2
        SELECT empid, COUNT(*) AS numorders
        FROM Sales.Orders
        GROUP BY empid
        HAVING MAX(orderdate) < '20190501';
       
4.  Write sql query to retrieve list of Employees who has joined on last day of month.
5.  Write sql query to retrieve employees with last name containing the letter 'e' twice or more
6.  Write sql query that generates a virtual auxiliary table of 10 numbers (in the range 1 through 10)
7.  Write sql query to update all employee status to confirmed who are joined before 3 months.
8.  Write sql query to insert Employee with their Designation and Joining details.
9.  Write sql query to retrieve Employees with theirs first salary and last salary and Max salary till now.
10. write sql query to retrieve top 5 employees who Joined earliest but having lowest salary
11. Insert all the data from table1 to table2 in which country column in table2 has US values
12. Write query to retrieve Months of 2021 in which no employee leaved company.
13. Find the minimum and maximum Joining date from Employment Table


Required tables

Employee(FirstName, LastName, DOB, Email, Phone, StatusId)
Employment(EmployeeId,JoiningDate,ConfirmationDate,ReleavingDate,DepartmentId,DesignationId)
Departments(Id, Name)
Status(Id, Name)
Designation(Id, Name)
Salary(EmployeeId, SalaryCreditDate, Amount)
