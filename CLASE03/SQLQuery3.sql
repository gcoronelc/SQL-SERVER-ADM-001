USE MASTER
GO

-- COPIA DE SEGURIDAD COMPLETA DE RH

BACKUP DATABASE [RH] 
TO  DISK = N'G:\EGCC\BAK\RH.bak' 
WITH NOFORMAT, NOINIT,  
	NAME = N'Copia de seguridad completa de RH', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


-- RESTAURANDO LA CS

RESTORE DATABASE [RH] 
FROM  DISK = N'G:\EGCC\BAK\RH.bak' 
WITH  FILE = 1,  NOUNLOAD,  STATS = 5
GO





