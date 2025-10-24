--6.2 RESTORE
RESTORE DATABASE EcommerceDB_Test
FROM DISK = 'c:\SQLBackups\EcommerceDB\EcommerceDB.bak'
WITH MOVE 'EcommerceDB' TO 'c:\SQLData\EcommerceDB\Ecommerce_Test.mdf',
MOVE 'EcommerceDB_log' TO 'c:\SQLData\EcommerceDB\EcommerceDB_Test.ldf';