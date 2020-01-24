select count(*) from edutec..Matricula;
go

USE EduTec; 
GO 

SELECT * INTO dbo.Curso2 
FROM dbo.Curso WHERE 1=2; 
GO 

SELECT * from dbo.Curso2 ;
go

create view dbo.v_Resumen_2019
as
select c.IdCurso, c.NomCurso,
sum(cp.Matriculados) matriculados,
sum(cp.Matriculados*cp.PreCursoProg) ingresos 
from EduTec.dbo.curso c
join EduTec.dbo.CursoProgramado cp
on c.IdCurso = cp.IdCurso
where cp.IdCiclo like '2019%'
group by c.IdCurso, c.NomCurso;
go



select * from edutec.dbo.Tarifa;
go


USE EduTec; 
go 

SELECT * INTO dbo.Curso3 
FROM dbo.Curso WHERE 1=2; 
GO 


-- Importación Masiva
select * from dbo.Curso3;


-- 3.2
USE EduTec; 
go 

SELECT * INTO dbo.Curso4 
FROM dbo.Curso WHERE 1=2; 
GO 

select * from dbo.Curso4; 
go 

bulk insert EduTec.dbo.Curso4 
from 'g:\bcp\Curso_A.dat' 
with (formatfile='g:\bcp\Curso.xml');
go

select * from dbo.Curso4; 
go 


-- 3.3
select NomProfesor, ApeProfesor 
into dbo.Profesor2 
from dbo.Profesor 
where 1=2;

select * from dbo.Profesor2;

bulk insert dbo.Profesor2 
from 'g:\bcp\Profesores.txt' 
with (fieldterminator='\t',rowterminator='\n'); 
go 

select * from dbo.Profesor2; 
go



-- 3.4

SELECT * INTO dbo.Curso5 
FROM dbo.Curso 
WHERE 1=2; 
GO 

select * from dbo.Curso5; 
go

BULK INSERT dbo.Curso5 
FROM 'g:\bcp\Curso-nat.Dat' 
WITH (DATAFILETYPE='native'); 
GO

select * from dbo.Curso5; 
go

-- 4.2

SELECT * INTO dbo.Curso6 
FROM dbo.Curso 
WHERE 1=2; 
GO

select * from dbo.Curso6 ;

INSERT INTO dbo.Curso6 
SELECT a.* 
FROM OPENROWSET( 
	BULK 'g:\bcp\Curso_A.dat', 
	FORMATFILE = 'g:\bcp\Curso.fmt'
	) AS a;

select * from dbo.Curso6 ;
GO


-- Consultas Distribuidas

sp_configure;
GO

sp_configure 'show advanced options', 1; 
RECONFIGURE; 
go

sp_configure; 
GO

sp_configure 'Ad Hoc Distributed Queries', 1; 
RECONFIGURE; 
GO

sp_configure; 
GO

SELECT a.* 
FROM OPENROWSET('SQLNCLI', 
'Server=192.168.40.30;Trusted_Connection=yes', 
'SELECT * FROM EDUTEC.dbo.curso') AS a;


SELECT a.* 
FROM OPENROWSET('SQLNCLI', 
'Server=192.168.40.26;Trusted_Connection=yes', 
'SELECT * FROM EDUTEC.dbo.curso') AS a;


-- Ejercicio
/*
Hacer un ejercicio quemuestre los cursos
programados de 3 bases de datos, el 
ciclo 2019-12.

SERVIDOR  IDCURSOPROG  NOMBRE-CURSO   NOMBRE-PROFESOR
--------------------------------------------------------

*/


SELECT 'LOCAL',CP.IdCursoProg, C.NomCurso, P.NomProfesor
FROM EDUTEC.DBO.CURSO C
JOIN EDUTEC.DBO.CursoProgramado CP
ON C.IdCurso = CP.IdCurso
LEFT JOIN EDUTEC.DBO.Profesor P
ON CP.IdProfesor = P.IdProfesor
WHERE CP.IdCiclo = '2019-12'
UNION
SELECT 'BRAVO', A.IdCursoProg, A.NomCurso, A.NomProfesor 
FROM OPENROWSET('SQLNCLI', 
'Server=192.168.40.26;Trusted_Connection=yes', 
'SELECT CP.IdCursoProg, C.NomCurso, P.NomProfesor
FROM EDUTEC.DBO.CURSO C
JOIN EDUTEC.DBO.CursoProgramado CP
ON C.IdCurso = CP.IdCurso
LEFT JOIN EDUTEC.DBO.Profesor P
ON CP.IdProfesor = P.IdProfesor
WHERE CP.IdCiclo = ''2019-12''') AS A
GO


 














