-- Eliminar la BD
drop database perudev;

--restaurando el backup completo
USE [master]
RESTORE DATABASE [perudev] FROM  [PD] WITH  FILE = 1,  
NOUNLOAD,  STATS = 5, NORECOVERY
GO

--restaurando el backup diferencial 2
restore database perudev
from pd
with file=3, NOrecovery

--restaurando el backup LOG
restore log perudev
from pd
with file=4, recovery

--VERIFICANDO
USE PERUDEV
GO

SELECT*FROM dbo.TEST
GO
