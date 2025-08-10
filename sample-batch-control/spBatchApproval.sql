
CREATE PROCEDURE [ctl].[spBatchApproval]
    @BatchId bigint,
    @ApprovalStatus varchar(50) --PENDING, APPROVED, REJECTED, NULL
AS
BEGIN
    UPDATE [ctl].[Batch]
    SET ApprovalStatus = @ApprovalStatus,
        ApprovalAt = GETDATE(),
        ApprovalBy = SUSER_SNAME()
    WHERE Id = @BatchId;
    
    
END