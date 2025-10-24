-- PHASE 5 - SECURITY AND USER MANAGEMENT
--5.1 Creating Login and Users
CREATE LOGIN EcommerceUser WITH PASSWORD = 'Strongpass123!';
	USE EcommerceDB;

CREATE USER EcommerceUser FOR LOGIN EcommerceUser;
	EXEC sp_addrolemember 'db_datareader', 'EcommerceUser';


SELECT name AS UserName,
	Type_desc AS UserType, 
	Authentication_type_desc AS AuthenticationType, 
	create_date, modify_date
	FROM sys.database_principals
	WHERE Type NOT IN ('A', 'G', 'R','X')
	ORDER BY name;
