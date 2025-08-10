
CREATE FUNCTION [dbo].[TEST#00001@stg.fnAccountYtd:Actual]
(
)
RETURNS 
@Ouput TABLE 
( 
	[Account] [int] NULL,
	[Amount] [money] NULL
)
AS      
BEGIN 
    INSERT INTO @Ouput 
    SELECT *
    FROM [TPLS#QualityCheckDataWarehouseMssql@Dev].[stg].[fnAccountYtd]('TEST',00001,'2025-01-31')
RETURN;
 END