USE EcommerceDB;
GO

-- PHASE 3 - INSERT SAMPLE DATA
INSERT INTO Categories(CategoryName)
		VALUES ( 'Electronics'), ('Books'), ('clothing');


INSERT INTO Customers (FullName, Email,phone, Address)
		VALUES('Deuidonne Angoh', 'deuidonneangoh@outlook.com', '678272854', '2nd street new road bonaberi');


INSERT INTO Products(ProductName,Description,Price,Stock,CategoryID)
		VALUES ('smartphone','Andriod phone','50000.00','100',1),
				('Laptop','15-inch laptop', '150000.00','30',1);