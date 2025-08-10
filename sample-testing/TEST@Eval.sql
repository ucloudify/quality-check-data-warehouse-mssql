CREATE PROCEDURE [dbo].[TEST@Eval]
	@TestName varchar(255)
AS
BEGIN
	DECLARE @Sql AS NVARCHAR(MAX)

	SET @Sql = N'SELECT ''' + @TestName + ''' AS  [TestName], ''Missing row'' AS [Evaluation], t1.*
	FROM ( 
		SELECT *
		FROM [dbo].[' + @TestName + ':Expected]()
		EXCEPT
		SELECT *
		FROM [dbo].[' + @TestName + ':Actual]()
	) t1

	UNION ALL

	SELECT ''' + @TestName + ''' AS  [TestName], ''Unexpected row'' as [Evaluation], t2.* 
	FROM (
		SELECT *
		FROM [dbo].[' + @TestName + ':Actual]()
		EXCEPT
		SELECT * 
		FROM [dbo].[' + @TestName + ':Expected]()
	) t2'

	EXEC sp_EXECUTESQL @Sql

END