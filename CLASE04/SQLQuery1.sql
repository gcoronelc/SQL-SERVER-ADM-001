select * from dbo.algo;

-- Transacción de confirmación automática
insert into dbo.algo(dato)
values('java');


-- Transacciones Explícitas
begin tran;

insert into dbo.algo(dato)
values('SCALA');

SELECT @@TRANCOUNT;

COMMIT;


-- Transacciones Implícitas
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