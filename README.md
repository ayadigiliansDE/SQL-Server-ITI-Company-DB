# SQL-Server-ITI-Company-DB
# 📊 SQL Server Project – ITI & Company Database

## 📌 Overview

This project demonstrates advanced SQL Server concepts using two databases:

* **ITI Database**
* **Company Database**

It includes implementation of:

* Stored Procedures
* Triggers
* Auditing Systems
* Data Integrity Constraints

---

## 🛠️ Technologies Used

* Microsoft SQL Server
* T-SQL
* Relational Database Design

---

## 📂 Project Structure

```
/scripts
    stored_procedures.sql
    triggers.sql
    cleanup.sql
README.md
```

---

## ⚙️ Features

### 🔹 1. Stored Procedures

#### ✔️ Get Students Count Per Department

Returns number of students in each department.

#### ✔️ Check Project Employees

* Checks number of employees in a project
* Displays message based on count

#### ✔️ Replace Employee in Project

* Replaces an old employee with a new one in a project

---

### 🔹 2. Triggers

#### 📌 Budget Audit Trigger

Tracks any updates on project budget:

* Old Value
* New Value
* User
* Date

#### 📌 Prevent Department Insert

Prevents inserting new departments.

#### 📌 Prevent Employee Insert in March

Blocks insert operations during March using transaction rollback.

#### 📌 Student Insert Audit

Logs insert operations with:

* Username
* Date
* Custom message

#### 📌 Student Delete Prevention

Prevents delete and logs attempt.

---

## 🔐 Data Integrity & Auditing

* Prevents unauthorized operations
* Tracks changes for accountability
* Ensures database consistency

---

## 🧪 How to Run

1. Open SQL Server Management Studio (SSMS)
2. Run scripts in order:

   * Create tables (if needed)
   * Run stored procedures
   * Run triggers
3. Execute test queries

---

## 🧹 Cleanup

Use `cleanup.sql` to:

* Drop procedures
* Drop triggers
* Remove audit tables

---

## 💡 Key Learnings

* Writing optimized stored procedures
* Using triggers for auditing
* Handling transactions and rollbacks
* Preventing invalid operations

---

## 👩‍💻 Author

Aya AbdElnasser
Aspiring Data Engineer 🚀
