select * from dbo.algo;

-- Transacci�n de confirmaci�n autom�tica
insert into dbo.algo(dato)
values('java');


-- Transacciones Expl�citas
begin tran;

insert into dbo.algo(dato)
values('SCALA');

SELECT @@TRANCOUNT;

COMMIT;


-- Transacciones Impl�citas
SELECT @@TRANCOUNT;

SET IMPLICIT_TRANSACTIONS ON

SELECT @@TRANCOUNT;

insert into dbo.algo(dato)
values('INKA KOLA');

SELECT @@TRANCOUNT;

COMMIT;

---------------

SELECT @@TRANCOUNT;

select * from dbo.algo 
WITH (TABLOCKX);

SELECT @@TRANCOUNT;

ROLLBACK;