
CREATE PROCEDURE [ctl].[spBatchStart]
    @BatchDescription NVARCHAR(255),
	@ProcessDescription NVARCHAR(255),
	@Parameter varchar(max),
    @NewBatchId INT OUTPUT
AS
BEGIN
    INSERT INTO t_BatchControl (BatchDescription, ProcessDescription, ProcessStatus, Parameter)
    VALUES (@BatchDescription, @ProcessDescription, 'STARTED', @Parameter);

    SET @NewBatchId = SCOPE_IDENTITY();
END