use FNFTraining;

-- Drop old tables if exist (for re-run safety)
DROP TABLE IF EXISTS EmployeeManager;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS Employee4;

-- 1. Create Employee table
CREATE TABLE Employee4 (
    Emp_Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT
);

-- 2. Create Manager table
CREATE TABLE Manager (
    Mgr_Id INT PRIMARY KEY,
    Mgr_Name VARCHAR(50)
);

-- 3. Create Employee-Manager Mapping table
CREATE TABLE EmployeeManager (
    Emp_Id INT,
    Mgr_Id INT NULL,
    PRIMARY KEY (Emp_Id),
    FOREIGN KEY (Emp_Id) REFERENCES Employee4(Emp_Id),
    FOREIGN KEY (Mgr_Id) REFERENCES Manager(Mgr_Id)
);

-- 4. Insert Employees
INSERT INTO Employee4 VALUES (1, 'Rohit', 20000);
INSERT INTO Employee4 VALUES (2, 'Sangeeta', 12000);
INSERT INTO Employee4 VALUES (3, 'Sanjay', 10000);
INSERT INTO Employee4 VALUES (4, 'Arun', 25000);
INSERT INTO Employee4 VALUES (5, 'Zaheer', 30000);

-- 5. Insert Managers (some employees can also be managers)
INSERT INTO Manager VALUES (3, 'Sanjay');
INSERT INTO Manager VALUES (5, 'Zaheer');

-- 6. Map Employees to Managers
INSERT INTO EmployeeManager VALUES (1, 3);   -- Rohit -> Sanjay
INSERT INTO EmployeeManager VALUES (2, 5);   -- Sangeeta -> Zaheer
INSERT INTO EmployeeManager VALUES (3, 5);   -- Sanjay -> Zaheer
INSERT INTO EmployeeManager VALUES (4, 3);   -- Arun -> Sanjay
INSERT INTO EmployeeManager VALUES (5, NULL);-- Zaheer -> No manager

-- 7. Query: Employee & Manager in alphabetical order
SELECT e.Name AS emp_Name, m.Mgr_Name AS mgr_Name
FROM Employee4 e
LEFT JOIN EmployeeManager em ON e.Emp_Id = em.Emp_Id
LEFT JOIN Manager m ON em.Mgr_Id = m.Mgr_Id
ORDER BY e.Name;

