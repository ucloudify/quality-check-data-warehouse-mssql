
CREATE FUNCTION [dbo].[TEST#00001@stg.fnAccountYtd:Expected]
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
    INSERT INTO @Ouput ([Account], [Amount]) VALUES (1000001, CAST(10 AS Money))
    INSERT INTO @Ouput ([Account], [Amount]) VALUES (1000002, CAST(20 AS Money))
RETURN;
 END