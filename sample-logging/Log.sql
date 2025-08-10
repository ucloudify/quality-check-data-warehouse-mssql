CREATE TABLE [ctl].[Log] (
    [Id]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [Timestamp] DATETIME      DEFAULT (sysdatetime()) NOT NULL,
    [Source]    VARCHAR (256) NOT NULL,
    [BatchId]   BIGINT        NULL,
    [User]      VARCHAR (128) DEFAULT (suser_sname()) NULL,
    [Status]    VARCHAR (10)  NULL,
    [Level]     VARCHAR (10)  NOT NULL,
    [Message]   VARCHAR (MAX) NULL,
    CONSTRAINT [CHK_LogLevel] CHECK ([Level]='TRACE' OR [Level]='DEBUG' OR [Level]='INFO' OR [Level]='WARNING' OR [Level]='ERROR' OR [Level]='FATAL'),
    CONSTRAINT [CHK_Stage] CHECK ([Status]='STARTED' OR [Status]='PROCESSING' OR [Status]='FINISHED' OR [Status]='FAILED' OR [Status]='CANCELLED' OR [Status]=NULL)
);

