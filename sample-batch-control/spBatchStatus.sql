
CREATE PROCEDURE [ctl].[spBatchStatus]
    @BatchId bigint,
    @ProcessStatus varchar(50) --STARTED, PROCESSING, FINISHED, FAILED, CANCELED, DRY-RUN, NULL
AS
BEGIN
    UPDATE [ctl].[Batch]
    SET ProcessStatus = @ProcessStatus
    WHERE Id = @BatchId;
END