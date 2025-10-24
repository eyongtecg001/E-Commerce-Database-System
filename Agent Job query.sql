USE msdb;
GO
SELECT job_id,
name AS JobName,
enabled AS IsEnabled,
date_created,
date_modified
FROM dbo.sysjobs
WHERE name = 'Daily_EcommerceDB_Backup';