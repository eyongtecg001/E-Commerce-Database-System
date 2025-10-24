--PHASE 2 - DATABASE DESIGN
CREATE DATABASE EcommerceDB;
SELECT name AS EcommerceDB, database_id,create_date
       FROM sys.databases
       WHERE name = 'EcommerceDB';
