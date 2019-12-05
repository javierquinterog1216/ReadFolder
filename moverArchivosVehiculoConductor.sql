--2
BEGIN TRAN
INSERT INTO dbo.VehiculoConductorDocumento
(
    --IdVehiculoConductorDocumento - column value is auto-generated
    IdVehiculoConductor,
    IdVehiculoTipoDocumento,
    FechaCarga,
    FechaExpedicion,
    FechaVencimiento,
    DocumentoAdjunto
)
--1  generar archivo de excel y registros de systemLog
SELECT  
       vc.IdVehiculoConductor
      ,vtd.IdVehiculoTipoDocumento
      ,getdate() as [FechaCarga]
      ,FechaExpedicion
      ,FechaVencimiento
	  --,vd.IdVehiculo--comentar
	  --,[DocumentoAdjunto]--comentar
      ,vc.Identificacion+'_'+vtd.Descripcion+'_'+ CONVERT(varchar(12), vd.FechaExpedicion, 120)+ '.'+dbo.RegexReplace(isnull(DocumentoAdjunto,''), '.+\.','') AS [DocumentoAdjunto] 
	  
	  --,' EXEC SP_AddSystemLog ''Javier.Quintero.Soporte'',''VehiculoDocumento'','+cast(vd.IdVehiculoDocumento AS varchar)+',''D'';'--comentar

	  FROM dbo.VehiculoDocumento vd 
	  INNER JOIN dbo.VehiculoConductor vc ON vd.IdVehiculo = vc.IdVehiculo
	  INNER JOIN dbo.VehiculoTipoDocumento vtd ON vd.idVehiculoTipoDocumento = vtd.IdVehiculoTipoDocumento
	  WHERE vd.idVehiculoTipoDocumento IN (13,16,17,19,20,21,22,23)
	  --para PRO
	  --AND vd.IdVehiculo NOT IN (197,280,313,349,354,367,373,385,410,447,515,597,620,790,792,816,820,824,1052,1090,1098,1105,1120,1136,1142,1149,1167,1198,1357,1619,1626,1697,1704,1706,1707,1710,1712,1722,1827,1964,1993,2003,2006,2012,2014,2094,2096,2118,22227,22342,52687,52763,52999,53161,73168,253171)
	  --para IMP
	  AND vd.IdVehiculo NOT IN (1458,1853,1859)
	  AND vc.IdVehiculoConductor IS not NULL

----------------------------------------------------------------------------------------
	  --3
	  SELECT [IdVehiculoConductorDocumento]
      ,[IdVehiculoConductor]
      ,[IdVehiculoTipoDocumento]
      ,[FechaCarga]
      ,[FechaExpedicion]
      ,[FechaVencimiento]
      ,[DocumentoAdjunto]
	  ,' EXEC SP_AddSystemLog ''Javier.Quintero.Soporte'',''VehiculoConductorDocumento'','+cast(IdVehiculoConductorDocumento AS varchar)+',''I'';'
  FROM [dbo].[VehiculoConductorDocumento]
  WHERE dbo.VehiculoConductorDocumento.IdVehiculoConductorDocumento > 5
  -------------------------------------------------------------------------------------------------------
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',11,'I';
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',12,'I';
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',13,'I';
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',14,'I';
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',15,'I';

  EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',11,'I';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',12,'I';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',13,'I';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',14,'I';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',15,'I';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',16,'I';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',17,'I';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',18,'I';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoConductorDocumento',19,'I';
-----------------------------------------------------------------------------------------------------
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoDocumento',3017,'D';
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoDocumento',3507,'D';
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoDocumento',4554,'D';
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoDocumento',6344,'D';
 --EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoDocumento',17382,'D';

  EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoDocumento',1541,'D';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoDocumento',17398,'D';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoDocumento',79802,'D';
 EXEC SP_AddSystemLog 'Javier.Quintero.Soporte','VehiculoDocumento',79803,'D';
---------------------------------------------------------------------------------------------------------
 --4
 DELETE vd
FROM dbo.VehiculoDocumento vd 
	  LEFT JOIN dbo.VehiculoConductor vc ON vd.IdVehiculo = vc.IdVehiculo
	  INNER JOIN dbo.VehiculoTipoDocumento vtd ON vd.idVehiculoTipoDocumento = vtd.IdVehiculoTipoDocumento
	  WHERE vd.idVehiculoTipoDocumento IN (13,16,17,19,20,21,22,23) 
	  --para PRO
	  --AND vd.IdVehiculo NOT IN (197,280,313,349,354,367,373,385,410,447,515,597,620,790,792,816,820,824,1052,1090,1098,1105,1120,1136,1142,1149,1167,1198,1357,1619,1626,1697,1704,1706,1707,1710,1712,1722,1827,1964,1993,2003,2006,2012,2014,2094,2096,2118,22227,22342,52687,52763,52999,53161,73168,253171)
	  --para IMP
	  AND vd.IdVehiculo NOT IN (1458,1853,1859)
	  AND vc.IdVehiculoConductor IS not NULL


--SELECT * FROM dbo.VehiculoConductorDocumento vcd
--5
COMMIT TRAN

--SELECT * FROM dbo.VehiculoConductorDocumento vcd

--ROLLBACK TRAN




