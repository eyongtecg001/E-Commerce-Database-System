-- I. CREATING TABLES FOR THE PROJECT
--1.1 CUSTOMERS TABLE
CREATE TABLE Customers(
     CustomerID INT IDENTITY (1,1) PRIMARY KEY,
     FullName NVARCHAR (100),
     Email NVARCHAR (100),
     phone NVARCHAR (20),
     Address NVARCHAR (200),
     createdAT DATETIME DEFAULT GETDATE()
     );
     



--1.2 CREATING TABLE FOR PRODUCT CATEGORIES
CREATE TABLE Categories(
     CategoryID INT IDENTITY (1,1) PRIMARY KEY,
     CategoryName NVARCHAR (100),
     );


--1.3 CREATING PRODUCTS TABLE
CREATE TABLE Products(
     ProductID INT IDENTITY (1,1) PRIMARY KEY,
     ProductName NVARCHAR (150),
     Description NVARCHAR (MAX),
     Price DECIMAL (10,2),
     Stock INT,
     CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
     );

--1.4 CREATING TABLE FOR CUSTOMERS ORDERS
CREATE TABLE Orders(
    OrderID INT IDENTITY (1,1) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR (50)
    );


--1.4 CREATING TABLE FOR CUSTOMER ORDER DETAILs
CREATE TABLE OrderDetails(
     OrderDetailID INT IDENTITY (1,1) PRIMARY KEY,
     OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
     ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
     Quantity INT
     );

SELECT 
        Od.OrderDetailID,
        Od.OrderID,
        Od.ProductID,
        Od.Quantity,
        p.price,
        (od.Quantity * p.price) AS Totalprice
        FROM OrderDetails od
        INNER JOIN Products p ON od.ProductID = p.ProductID;
