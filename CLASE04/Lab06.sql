-- 6.1

USE MASTER;
GO

create database perudev
go

-- 6.2

exec sp_addumpdevice 'disk', 'PD', 'G:\EGCC\BAK\PDDevice.bak'
go

select * from master.dbo.sysdevices;
go





