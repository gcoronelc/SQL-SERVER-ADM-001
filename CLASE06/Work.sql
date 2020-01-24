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


go

select * from edutec.dbo.Tarifa;
go