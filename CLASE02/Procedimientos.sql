USE [RH]
GO

create procedure dbo.ver_empleados
as
select * from rh.dbo.empleado;
go

create procedure dbo.ver_departamentos
as
select * from rh.dbo.departamento;
go


CREATE ROLE [rol_ejecutar_procedimiento] 
GO

GRANT EXECUTE ON [dbo].[ver_ambos] TO [rol_ejecutar_procedimiento]
GO

GRANT EXECUTE ON [dbo].[ver_departamentos] TO [rol_ejecutar_procedimiento]
GO

GRANT EXECUTE ON [dbo].[ver_empleados] TO [rol_ejecutar_procedimiento]
GO

USE [master]
GO

CREATE LOGIN [gustavo] WITH PASSWORD=N'12345', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO


USE [RH]
GO
CREATE USER [gustavo] FOR LOGIN [gustavo]
GO


USE [RH]
GO
ALTER ROLE [rol_ejecutar_procedimiento] ADD MEMBER [gustavo]
GO






