USE [master]
GO

-- MODO DE RECUPERACION SIMPLE
ALTER DATABASE [RH] SET RECOVERY SIMPLE WITH NO_WAIT
GO

-- MODO DE RECUPERACION COMPLETA
ALTER DATABASE [RH] SET RECOVERY FULL WITH NO_WAIT
GO

-- MODO DE RECUPERACION DE REGISTRO MASIVO
ALTER DATABASE [RH] SET RECOVERY BULK_LOGGED WITH NO_WAIT
GO
