



CREATE PROCEDURE[dbo].[TEST@Run]

AS
BEGIN
	
	DECLARE @UserNameHelper AS VARCHAR(255) = SUSER_NAME();
	DECLARE @ResultHelper VARCHAR(10)
	DECLARE @TimestampHelper AS DATETIME = GETDATE()

	/*00001*/
	EXEC TEST@Assert 'TEST#00001@stg.fnAccountYtd', @ResultHelper OUTPUT

	INSERT INTO [dbo].[TEST@Result] ([Timestamp],[User],[Result],[TestId],[Object],[Feature],[Scenario],[Given],[When],[Then])
	SELECT @TimestampHelper AS [Timestamp]
		,@UserNameHelper AS [User]
		,@ResultHelper AS [Result]
		,00001 AS [TestId]
		,'stg.fnAccountYtd' AS [Object]
		,'Aggregate accounts report' AS [Feature]
		,'Report is created to a previous ' AS [Scenario]
		,'Account entries are synced' AS [Given]
		,'YTD-balance is calcualted to a previous date' AS [When]
		,'only entries up to the report date are considered' AS [Then]
	RETURN;
 END