CREATE TABLE [ctl].[Config] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (100) NULL,
    [Value]       VARCHAR (100) NULL,
    [Scope]       VARCHAR (100) NULL,
    [Description] VARCHAR (100) NULL,
    CONSTRAINT [PK_Config] UNIQUE NONCLUSTERED ([Name] ASC, [Scope] ASC)
);


GO

CREATE TRIGGER [ctl].[trg_UPDATE_Config] ON [ctl].[Config]
AFTER UPDATE
AS
BEGIN
    INSERT INTO [ctl].[ConfigAudit] ([Id],[Name],[Value],[Scope],[Description],[ChangeType],[ChangedBy],[ChangeDate])
    SELECT i.[Id]
        ,i.[Name]
        ,i.[Value]
        ,i.[Scope]
        ,i.[Description]
        ,'UPDATE'
        ,SUSER_SNAME()
        ,GETDATE()
    FROM INSERTED i;
END;
GO
CREATE TRIGGER [ctl].[trg_INSERT_Config] ON [ctl].[Config]
AFTER INSERT
AS
BEGIN
    INSERT INTO [ctl].[ConfigAudit] ([Id],[Name],[Value],[Scope],[Description],[ChangeType],[ChangedBy],[ChangeDate])
    SELECT i.[Id]
        ,i.[Name]
        ,i.[Value]
        ,i.[Scope]
        ,i.[Description]
        ,'INSERT'
        ,SUSER_SNAME()
        ,GETDATE()
    FROM INSERTED i;
END;
GO
CREATE TRIGGER [ctl].[trg_DELETE_Config] ON [ctl].[Config]
AFTER DELETE
AS
BEGIN
    INSERT INTO [ctl].[ConfigAudit] ([Id],[Name],[Value],[Scope],[Description],[ChangeType],[ChangedBy],[ChangeDate])
    SELECT i.[Id]
        ,i.[Name]
        ,i.[Value]
        ,i.[Scope]
        ,i.[Description]
        ,'DELETE'
        ,SUSER_SNAME()
        ,GETDATE()
    FROM DELETED i;
END;