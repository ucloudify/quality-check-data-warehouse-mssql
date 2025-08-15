CREATE PROCEDURE [ctl].[spLogEntry]
( 
	@BatchId INT,
    @Timestamp DATETIME = NULL,
	@Source VARCHAR(256),
    @User VARCHAR(128),
	@Status VARCHAR(10),
	@Level VARCHAR(10),
    @LevelConfig INT = 4, -- default log level configuration (0=trace, 1=debug, 2=info, 3=warning, 4=error, 5=fatal)
	@Message VARCHAR(max)
	
)
AS
BEGIN 
    
    IF (@Level = 'TRACE'	AND @LevelConfig > 0)
	OR (@Level = 'DEBUG'	AND @LevelConfig > 1)
	OR (@Level = 'INFO'		AND @LevelConfig > 2)
	OR (@Level = 'WARNING'	AND @LevelConfig > 3)
	OR (@Level = 'ERROR'	AND @LevelConfig > 4)
	OR (@Level = 'FATAL'	AND @LevelConfig > 5)
        RETURN; -- do not log 
    ELSE
	    INSERT INTO [ctl].[Log] ([BatchId],[Timestamp],[Source],[User],[Status],[Level],[Message])
	    VALUES (
		    @BatchId,
		    CASE WHEN @Timestamp IS NULL THEN GETDATE() ELSE @Timestamp END,
		    @Source,
            @User,
		    @Status,
		    @Level,
		    @Message
		    );
END