-- Drop Procedures
IF OBJECT_ID('dbo.GetStudentsCountPerDept') IS NOT NULL DROP PROC dbo.GetStudentsCountPerDept;
IF OBJECT_ID('dbo.CheckProjectEmployees') IS NOT NULL DROP PROC dbo.CheckProjectEmployees;
IF OBJECT_ID('dbo.ReplaceEmployeeInProject') IS NOT NULL DROP PROC dbo.ReplaceEmployeeInProject;

-- Drop Triggers
IF OBJECT_ID('trg_AuditBudget', 'TR') IS NOT NULL DROP TRIGGER trg_AuditBudget;
IF OBJECT_ID('trg_PreventDeptInsert', 'TR') IS NOT NULL DROP TRIGGER trg_PreventDeptInsert;
IF OBJECT_ID('trg_PreventMarchInsert', 'TR') IS NOT NULL DROP TRIGGER trg_PreventMarchInsert;
IF OBJECT_ID('trg_StudentInsertAudit', 'TR') IS NOT NULL DROP TRIGGER trg_StudentInsertAudit;
IF OBJECT_ID('trg_StudentDeleteAudit', 'TR') IS NOT NULL DROP TRIGGER trg_StudentDeleteAudit;

-- Drop Audit Tables
IF OBJECT_ID('Student_Audit', 'U') IS NOT NULL DROP TABLE Student_Audit;
IF OBJECT_ID('Project_Audit', 'U') IS NOT NULL DROP TABLE Project_Audit;

-- Drop columns if exsists
IF EXISTS (SELECT * FROM sys.columns WHERE Name = N'Budget' AND Object_ID = Object_ID(N'Project'))
    ALTER TABLE Project DROP COLUMN Budge