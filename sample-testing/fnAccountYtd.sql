CREATE FUNCTION [stg].[fnAccountYtd]
(
    @ExecutionProfile NVARCHAR(10),
    @TestScenario BIGINT,
    @Date DATE
) 
RETURNS TABLE  
AS  
RETURN  
(
    SELECT [Account]
        ,SUM([Amount]) AS [YtdAmount]
    FROM [ctl].[fn#AccountEntries](@ExecutionProfile, @TestScenario)
    WHERE [Date] <= @Date
    AND YEAR([Date]) = YEAR(@Date)
    GROUP BY [Account]

);