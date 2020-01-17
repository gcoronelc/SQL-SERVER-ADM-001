use rh;
go

create table dbo.algo(
  id integer identity,
  dato varchar(100)
);
go

begin transaction
go

INSERT INTO DBO.ALGO(DATO) VALUES('uni');
INSERT INTO DBO.ALGO(DATO) VALUES('es');
INSERT INTO DBO.ALGO(DATO) VALUES('uni');
go

SELECT * FROM DBO.ALGO;
go

commit transaction;
go


SELECT COUNT(*) FROM DBO.ALGO;
go

BEGIN TRANSACTION;
GO

INSERT INTO DBO.ALGO(DATO) VALUES('ABC');

SELECT COUNT(*) FROM DBO.ALGO;

select * from dbo.algo;
