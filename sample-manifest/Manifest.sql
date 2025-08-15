CREATE TABLE [ctl].[Manifest] (
    [Solution]             NVARCHAR (255) NOT NULL,
    [Description]          NVARCHAR (MAX) NULL,
    [TechStack]            NVARCHAR (100) NULL,
    [Version]              NVARCHAR (28)  NOT NULL,
    [ReleaseDate]          DATE           NOT NULL,
    [IsEnabled]            BIT            NOT NULL,
    [IntegrityCheckSource] NVARCHAR (500) NOT NULL,
    [Publisher]            NVARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Solution] ASC, [Version] ASC)
);


GO

-- UPDATE trigger
CREATE TRIGGER [ctl].[trg_UPDATE_Manifest] ON [ctl].[Manifest]
AFTER UPDATE
AS
BEGIN
    INSERT INTO [ctl].[ManifestAudit] (
        [Solution],
        [Description],
        [TechStack],
        [Version],
        [ReleaseDate],
        [IsEnabled],
        [IntegrityCheckSource],
        [Publisher],
        [ChangeType],
        [ChangedBy],
        [ChangeDate]
    )
    SELECT
        i.[Solution],
        i.[Description],
        i.[TechStack],
        i.[Version],
        i.[ReleaseDate],
        i.[IsEnabled],
        i.[IntegrityCheckSource],
        i.[Publisher],
        'UPDATE',
        SUSER_SNAME(),
        GETDATE()
    FROM INSERTED i;
END;
GO
	CREATE TRIGGER [ctl].[trg_INSERT_Manifest] ON [ctl].[Manifest]
AFTER INSERT
AS
BEGIN
    INSERT INTO [ctl].[ManifestAudit] (
        [Solution],
        [Description],
        [TechStack],
        [Version],
        [ReleaseDate],
        [IsEnabled],
        [IntegrityCheckSource],
        [Publisher],
        [ChangeType],
        [ChangedBy],
        [ChangeDate]
    )
    SELECT
        i.[Solution],
        i.[Description],
        i.[TechStack],
        i.[Version],
        i.[ReleaseDate],
        i.[IsEnabled],
        i.[IntegrityCheckSource],
        i.[Publisher],
        'INSERT',
        SUSER_SNAME(),
        GETDATE()
    FROM INSERTED i;
END;
GO

-- DELETE trigger
CREATE TRIGGER [ctl].[trg_DELETE_Manifest] ON [ctl].[Manifest]
AFTER DELETE
AS
BEGIN
    INSERT INTO [ctl].[ManifestAudit] (
        [Solution],
        [Description],
        [TechStack],
        [Version],
        [ReleaseDate],
        [IsEnabled],
        [IntegrityCheckSource],
        [Publisher],
        [ChangeType],
        [ChangedBy],
        [ChangeDate]
    )
    SELECT
        d.[Solution],
        d.[Description],
        d.[TechStack],
        d.[Version],
        d.[ReleaseDate],
        d.[IsEnabled],
        d.[IntegrityCheckSource],
        d.[Publisher],
        'DELETE',
        SUSER_SNAME(),
        GETDATE()
    FROM DELETED d;
END;