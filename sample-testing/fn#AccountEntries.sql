CREATE FUNCTION [ctl].[fn#AccountEntries]
(
    @ExecutionProfile varchar(55) = 'PROD',
    @TestScenario bigint = NULL
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM [dbo].[AccountEntries]
    WHERE @ExecutionProfile = 'PROD'
    --TODO: remote test assets
    UNION ALL
    SELECT *
    FROM [TPLS#QualityCheckDataWarehouseMssql@Test].[dbo].[TEST#00001@stg.fnAccountYtd:Sample/dbo.AccountEntries]()
    WHERE @ExecutionProfile = 'TEST'
    AND @TestScenario = 00001
);