
CREATE PROCEDURE [ctl].[spBatchValidate]
    @BatchId bigint,
    @ValidationStatus varchar(50), --PENDING, PASSED, FAILED, ERROR, NULL
	@ValidationBy varchar(50)
AS
BEGIN
    UPDATE [ctl].[Batch]
    SET ValidationStatus = @ValidationStatus,
		ValidationBy = @ValidationBy,
		ValidationAt = GETDATE()
    WHERE Id = @BatchId;
    
END