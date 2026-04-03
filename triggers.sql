/*4. add column budget in project table and insert any draft values in it then
then Create an Audit table with the following structure
ProjectNo UserName ModifiedDate Budget_Old Budget_New
p2 Dbo 2008-01-31 95000 200000
This table will be used to audit the update trials on the Budget column
(Project table, Company DB)
Example:
If a user updated the budget column then the project number, user name
that made that update, the date of the modification and the value of the
old and the new budget will be inserted into the Audit table
Note: This process will take place only if the user updated the budget
column*/

ALTER TABLE Project
ADD Budget INT

CREATE TABLE Project_Audit
(
    ProjectNo INT,
    UserName VARCHAR(50),
    ModifiedDate DATE,
    Budget_Old INT,
    Budget_New INT
)

CREATE TRIGGER trg_AuditBudget
ON Project
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Budget)
    BEGIN
        INSERT INTO Project_Audit
        SELECT 
            d.Pnumber,
            SYSTEM_USER,
            GETDATE(),
            d.Budget,
            i.Budget
        FROM deleted d
        INNER JOIN inserted i
            ON d.Pnumber = i.Pnumber
    END
END
----------------------------------------------------------------------------
/*5. Create a trigger to prevent anyone from inserting a new record in the
Department table [ITI DB]
“Print a message for user to tell him that he can’t insert a new record in that
table*/

CREATE TRIGGER trg_PreventDeptInsert
ON Department
INSTEAD OF INSERT
AS
BEGIN
    PRINT 'You cannot insert a new record in Department table'
END


---------------------------------------------------------------------------------------
--6. Create a trigger that prevents the insertion Process for Employee table in March [Company DB].


CREATE OR ALTER TRIGGER trg_PreventMarchInsert
ON Employee
AFTER INSERT
AS
BEGIN
    IF MONTH(GETDATE()) = 3
    BEGIN
        PRINT 'You cannot insert in Employee table during March'

        ROLLBACK
    END
END
GO
---------------------------------------------------------------------
/*7. Create a trigger on student table after insert to add Row in Student Audit
table (Server User Name , Date, Note) where note will be “[username]
Insert New Row with Key=[Key Value] in table [table name]”
Server User Name
Dat*/

CREATE TABLE Student_Audit
(
    UserName VARCHAR(50),
    ModifiedDate DATE,
    Note VARCHAR(200)
)

CREATE TRIGGER trg_StudentInsertAudit
ON Student
AFTER INSERT
AS
BEGIN
    INSERT INTO Student_Audit
    SELECT 
        SYSTEM_USER,
        GETDATE(),
        SYSTEM_USER + ' Insert New Row with Key=' + CAST(i.St_Id AS VARCHAR) + ' in table Student'
    FROM inserted i
END

--------------------------------------------------------------------------------------------------------
/*8. Create a trigger on student table instead of delete to add Row in Student
Audit table (Server User Name, Date, Note) where note will be“ try to
delete Row with Key=[Key Value]*/

CREATE TRIGGER trg_StudentDeleteAudit
ON Student
INSTEAD OF DELETE
AS
BEGIN
    INSERT INTO Student_Audit
    SELECT 
        SYSTEM_USER,
        GETDATE(),
        'Try to delete Row with Key=' + CAST(d.St_Id AS VARCHAR)
    FROM deleted d
END
