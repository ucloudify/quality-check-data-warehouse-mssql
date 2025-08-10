
CREATE PROCEDURE [ctl].[spBatchUpdate]
    @BatchId bigint
AS
BEGIN
    UPDATE [ctl].[Batch]
    SET LastUpdateAt = GETDATE(),
        LastUpdateBy = SUSER_SNAME()
    WHERE Id = @BatchId;
    
END