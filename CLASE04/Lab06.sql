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

-- 6.3

create table perudev..test(
	id Int Identity Primary Key,
	dato varchar(30)
)
go

declare @k int
set @k = 0
while (@k < 100)
begin
begin tran
	insert into perudev..test(dato) values('Backup de Base de Datos')
	commit tran
	set @k = @k + 1
end
go

select * from perudev..test;

-- 6.4

backup database perudev
to pd
with
	format,
	name = 'BakBD',
	description = 'Backup de la base de datos completa'
go

restore headeronly from pd
go


-- 6.5

declare @k int
set @k = 0
while (@k < 100)
begin
begin tran
	insert into perudev..test(dato) values('PERU CAMPEON')
	commit tran
	set @k = @k + 1
end
go

backup database perudev
to pd
with
	differential,
	name = 'BakDif01',
	description = 'Primer backup diferencial dela base de datos'
go


restore headeronly from pd
go


