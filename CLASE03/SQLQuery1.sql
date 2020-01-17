
create table dbo.algo(
id integer identity,
dato varchar(100)
);
go


BEGIN TRANSACTION;
GO

INSERT INTO DBO.ALGO(DATO) VALUES('ABC');

SELECT COUNT(*) FROM DBO.ALGO;
