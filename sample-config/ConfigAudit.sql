CREATE TABLE [ctl].[ConfigAudit] (
    [Id]          INT            NOT NULL,
    [Name]        VARCHAR (100)  NULL,
    [Value]       VARCHAR (100)  NULL,
    [Scope]       VARCHAR (100)  NULL,
    [Description] VARCHAR (100)  NULL,
    [ChangeType]  NVARCHAR (10)  NULL,
    [ChangedBy]   NVARCHAR (128) NULL,
    [ChangeDate]  DATETIME       NULL
);

