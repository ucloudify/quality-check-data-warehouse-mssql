CREATE PROCEDURE [ctl].[spLogERROR]
( 
	@BatchId INT,
    @Timestamp DATETIME = NULL,
	@Source VARCHAR(256),
    @User VARCHAR(128),
	@Status VARCHAR(10),
    @LogLevelConfig INT = 4, -- default log level configuration (0=trace, 1=debug, 2=info, 3=warning, 4=error, 5=fatal)
	@Message VARCHAR(max)
)
AS
BEGIN 
    
    IF @LogLevelConfig > 4
        RETURN; -- do not log 
    ELSE
	    INSERT INTO [ctl].[Log] ([BatchId],[Timestamp],[Source],[User],[Status],[Level],[Message])
	    VALUES (
		    @BatchId,
		    CASE WHEN @Timestamp IS NULL THEN GETDATE() ELSE @Timestamp END,
		    @Source,
            @User,
		    @Status,
		    'ERROR',
		    @Message
		    );
END