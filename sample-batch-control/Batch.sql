CREATE TABLE [ctl].[Batch] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]      NVARCHAR (255) NULL,
    [ProcessName]      NVARCHAR (255) NULL,
    [ProcessStatus]    VARCHAR (50)   NULL,
    [ProcessStartAt]   DATETIME       DEFAULT (getdate()) NULL,
    [ProcessStartBy]   VARCHAR (50)   DEFAULT (user_name()) NULL,
    [LastUpdateAt]     DATETIME       NULL,
    [LastUpdateBy]     VARCHAR (50)   NULL,
    [ValidationStatus] VARCHAR (50)   NULL,
    [ValidationAt]     DATETIME       NULL,
    [ValidationBy]     VARCHAR (50)   NULL,
    [ApprovalStatus]   VARCHAR (50)   NULL,
    [ApprovalAt]       DATETIME       NULL,
    [ApprovalBy]       VARCHAR (50)   NULL,
    [ParameterApplied] VARCHAR (MAX)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CHK_ApprovalStatus] CHECK ([ApprovalStatus]='PENDING' OR [ApprovalStatus]='APPROVED' OR [ApprovalStatus]='REJECTED' OR [ApprovalStatus]=NULL),
    CONSTRAINT [CHK_ProcessStatus] CHECK ([ProcessStatus]='STARTED' OR [ProcessStatus]='PROCESSING' OR [ProcessStatus]='FINISHED' OR [ProcessStatus]='FAILED' OR [ProcessStatus]='CANCELLED' OR [ProcessStatus]='DRY-RUN' OR [ProcessStatus]=NULL),
    CONSTRAINT [CHK_ValidationStatus] CHECK ([ValidationStatus]='PENDING' OR [ValidationStatus]='PASSED' OR [ValidationStatus]='FAILED' OR [ValidationStatus]='ERROR' OR [ValidationStatus]=NULL)
);

