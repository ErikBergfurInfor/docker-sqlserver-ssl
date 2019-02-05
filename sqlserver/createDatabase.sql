CREATE LOGIN griddbusr WITH PASSWORD = 'DefaultPassword123';
GO
CREATE USER griddbusr FOR LOGIN griddbusr;
GO
sp_addsrvrolemember 'griddbusr', 'sysadmin';
GO
CREATE DATABASE grid;
GO
