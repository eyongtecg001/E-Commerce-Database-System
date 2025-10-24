
# 🛍️ Ecommerce Database System (SQL Server)

Welcome to the Ecommerce Database System project, a real-world solution designed and developed using SQL Server and SQL Server Management Studio (SSMS). This system models the backend of an e-commerce platform, covering customer registration, product catalog management, order processing, reporting, security, and automated maintenance. It was built with scalability, reliability, and administrative best practices in mind.

## 🔧 Technologies Used

- **SQL Server Management Studio (SSMS)** – for database design and management  
- **T-SQL (Transact-SQL)** – for stored procedures, triggers, and custom queries  
- **Role-based Access Control** – to manage permissions and restrict sensitive data  
- **Backup & Recovery** – to ensure business continuity and data integrity  
- **SQL Server Agent** – for job scheduling and automation  

## 📁 Features

This ecommerce system includes the following features:

✅ **Customer Registration & Product Catalog**: Structured tables for customer profiles, product listings, and category management  
🛒 **Order Placement & Tracking**: Orders and order details with calculated totals and timestamps  
📊 **Business Intelligence Reports**: Queries to analyze customer activity, product performance, and order volume  
🔐 **User Access Management**: Secure login creation and role assignment for database users  
💾 **Backup & Disaster Recovery**: Full backup and restore procedures with test environment simulation  
⚙️ **Automation via SQL Agent**: Scheduled jobs for daily backups, index rebuilds, and statistics updates  
🚀 **Performance Tuning**: Index creation and query optimization for faster data retrieval  


## 🧱 Database Schema Overview

The system utilizes the following key tables for managing data:

- **Customers**: Stores personal and contact details  
- **Categories**: Defines product categories  
- **Products**: Contains product listings, descriptions, prices, and stock levels  
- **Orders**: Tracks customer orders and statuses  
- **OrderDetails**: Line items for each order, including quantity and calculated total  
- **Payments** *(optional)*: Placeholder for future payment integration  
- **Admins / Users**: For role-based access and control  


## 📜 Sample SQL Queries

### ✅ Create Database

CREATE DATABASE EcommerceDB;
SELECT name AS EcommerceDB, database_id, create_date
FROM sys.databases
WHERE name = 'EcommerceDB';

### ✅ Create Tables

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    phone NVARCHAR(200),
    Address NVARCHAR(200),
    createdAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(150),
    Description NVARCHAR(MAX),
    Price DECIMAL(10,2),
    Stock INT,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT
);


## 📊 Reporting Queries

-- Basic Queries
SELECT * FROM Customers;
SELECT * FROM Products WHERE Price > 50000;
SELECT COUNT(*) AS TotalOrders FROM Orders;

-- Business Report
SELECT C.FullName, COUNT(O.OrderID) AS TotalOrders, SUM(Od.Quantity) AS TotalItems
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
INNER JOIN OrderDetails Od ON O.OrderID = Od.OrderID
GROUP BY C.FullName;


## 🔐 Access Control

-- Create Login and Assign Role
CREATE LOGIN EcommerceUser WITH PASSWORD = 'Strongpass123!';
USE EcommerceDB;
CREATE USER EcommerceUser FOR LOGIN EcommerceUser;
EXEC sp_addrolemember 'db_datareader', 'EcommerceUser';

-- View Users
SELECT name AS UserName,
       Type_desc AS UserType,
       Authentication_type_desc AS AuthenticationType,
       create_date, modify_date
FROM sys.database_principals
WHERE type IN ('A', 'C', 'E', 'G', 'K', 'R', 'S', 'U');


## 💾 Backup & Recovery

-- Full Backup
BACKUP DATABASE EcommerceDB
TO DISK = 'C:\SQLBackups\EcommerceDB\EcommerceDB.bak'
WITH FORMAT, INIT;

-- Restore to Test Environment
RESTORE DATABASE EcommerceDB_Test
FROM DISK = 'C:\SQLBackups\EcommerceDB\EcommerceDB_Full.bak'
WITH MOVE 'EcommerceDB' TO 'C:\SQLData\EcommerceDB\EcommerceDB_Test.mdf',
     MOVE 'EcommerceDB_log' TO 'C:\SQLData\EcommerceDB\EcommerceDB_Test.ldf';


## ⚙️ Automation & Maintenance

- **SQL Agent Jobs Created**:
  - `Daily_EcommerceDB_Backup`
  - `Rebuild_Indexes_EcommerceDB`
  - `Update_Statistics_EcommerceDB`

- **Schedule**: Daily at 01:00 AM


## 🚀 Performance Tuning

-- Create Index
CREATE INDEX IX_orders_CustomerID ON Orders (CustomerID);

## 📂 SQL Script Files

All necessary SQL script files for setting up the database, stored procedures, triggers, views, and other components are included in the repository. 
- `setup.sql`: Initial schema and table creation  
- `insert_data.sql`: Sample data for categories, customers, and products  
- `security.sql`: Login and user management  
- `backup_restore.sql`: Backup and restore scripts  
- `performance.sql`: Index creation and tuning  


## 📸 Screenshots

Screenshots are provided including:

- SSMS connection  
- Table creation  
- Sample data insertion  
- Query results  
- Security setup  
- Backup and restore confirmation  
- SQL Agent job configuration  
- Performance tuning  

Each screenshot includes captions for clarity and documentation.

🧠 Author

Deuidonne Angoh
📧 Email: deuidonneangoh  
🎓 Bachelor of Electrical Engineering (B.ENG)  
🎓 Certified MSSQL Database Administrator  
🎓 Azure Database Engineer Associate (Microsoft Certified) – *In Progress*
