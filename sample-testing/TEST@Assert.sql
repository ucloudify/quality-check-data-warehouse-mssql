
CREATE PROCEDURE [dbo].[TEST@Assert]
	@TestName varchar(255),
	@Output varchar(55) OUTPUT
AS
BEGIN

	EXEC TEST@Eval @TestName

	IF @@ROWCOUNT = 0 
		SET @Output = 'PASSED'
	ELSE
		SET @Output = 'FAILED'
END