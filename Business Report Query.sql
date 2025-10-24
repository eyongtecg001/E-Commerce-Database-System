SELECT c.FullName, COUNT(o.OrderID) AS TotalOrders, SUM(od.Quantity) AS TotalItems
	FROM Customers c
	INNER JOIN Orders O ON C.CustomerID = O.CustomerID
	INNER JOIN OrderDetails Od ON O.OrderID = Od.OrderID
	GROUP BY C.FullName;