--1. Create a stored procedure without parameters to show the number of students per department name.[use ITI DB]
IF OBJECT_ID('dbo.GetStudentsCountPerDept') IS NOT NULL
    DROP PROC dbo.GetStudentsCountPerDept
GO

CREATE PROC dbo.GetStudentsCountPerDept
AS
BEGIN
    SELECT 
        D.Dept_Name,
        COUNT(S.St_Id) AS StudentsCount
    FROM Department D
    LEFT JOIN Student S
        ON D.Dept_Id = S.Dept_Id
    GROUP BY D.Dept_Name
END


EXEC dbo.GetStudentsCountPerDept
--------------------------------------------------------------------
/*2. Create a stored procedure that will check for the # of employees in the
project p1 if they are more than 3 print message to the user “'The number
of employees in the project p1 is 3 or more'” if they are less display a
message to the user “'The following employees work for the project p1'” in
addition to the first name and last name of each one. [Company DB]*/



IF OBJECT_ID('dbo.CheckProjectEmployees') IS NOT NULL
    DROP PROC dbo.CheckProjectEmployees
GO
CREATE PROC dbo.CheckProjectEmployees
    @ProjectNumber INT
AS
BEGIN
    DECLARE @count INT

    SELECT @count = COUNT(*)
    FROM Works_for
    WHERE Pno = @ProjectNumber

    IF @count >= 3
        PRINT 'The number of employees in the project is 3 or more'
    ELSE
    BEGIN
        PRINT 'The following employees work for the project'

        SELECT E.Fname, E.Lname
        FROM Employee E
        INNER JOIN Works_for W
            ON E.SSN = W.ESSn
        WHERE W.Pno = @ProjectNumber
    END
END
GO

EXEC dbo.CheckProjectEmployees @ProjectNumber = 100
------------------------------------------------------
/*3. Create a stored procedure that will be used in case there is an old employee
has left the project and a new one become instead of him. The procedure
should take 3 parameters (old Emp. number, new Emp. number and the
project number) and it will be used to update works_on table. [ Company
DB ]*/

IF OBJECT_ID('dbo.ReplaceEmployeeInProject') IS NOT NULL
    DROP PROC dbo.ReplaceEmployeeInProject
GO

CREATE PROC dbo.ReplaceEmployeeInProject
    @OldEmp INT,
    @NewEmp INT,
    @ProjectNo INT
AS
BEGIN
    UPDATE Works_for
    SET ESSn = @NewEmp
    WHERE ESSn = @OldEmp
      AND Pno = @ProjectNo
END

EXEC dbo.ReplaceEmployeeInProject 
    @OldEmp = 112233, 
    @NewEmp = 669955, 
    @ProjectNo = 100