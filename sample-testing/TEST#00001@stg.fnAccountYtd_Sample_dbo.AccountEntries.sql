
CREATE FUNCTION [dbo].[TEST#00001@stg.fnAccountYtd:Sample/dbo.AccountEntries]
(
)
RETURNS 
@Ouput TABLE 
( 
    -- nullable columns to allow for NULL values in the output
    [Id] [int] NULL,
	[Date] [date] NULL,
	[Account] [int] NULL,
	[Amount] [money] NULL,
	[Currency] [nvarchar](3) NULL,
	[Text] [nvarchar](100) NULL
)
AS      
BEGIN 
    -- small randomized sample data for testing purposes, no financial, personal or sensitive data included
    INSERT INTO @Ouput ([Id], [Date], [Account], [Amount], [Currency], [Text]) VALUES (NULL, N'2025-01-17', 1000002, CAST(10 AS Money), N'EUR', N'test entry')
    INSERT INTO @Ouput ([Id], [Date], [Account], [Amount], [Currency], [Text]) VALUES (NULL, N'2025-02-02', 1000001, CAST(10 AS Money), N'EUR', N'test entry')
    INSERT INTO @Ouput ([Id], [Date], [Account], [Amount], [Currency], [Text]) VALUES (NULL, N'2025-02-13', 1000002, CAST(10 AS Money), N'EUR', N'test entry')
    INSERT INTO @Ouput ([Id], [Date], [Account], [Amount], [Currency], [Text]) VALUES (NULL, N'2025-01-01', 1000001, CAST(10 AS Money), N'EUR', N'test entry')
    INSERT INTO @Ouput ([Id], [Date], [Account], [Amount], [Currency], [Text]) VALUES (NULL, N'2025-01-01', 1000002, CAST(10 AS Money), N'EUR', N'test entry')
RETURN;
 END