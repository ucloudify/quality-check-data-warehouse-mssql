CREATE TABLE [ctl].[ManifestAudit] (
    [Solution]             NVARCHAR (255) NOT NULL,
    [Description]          NVARCHAR (MAX) NULL,
    [TechStack]            NVARCHAR (100) NULL,
    [Version]              NVARCHAR (28)  NOT NULL,
    [ReleaseDate]          DATE           NOT NULL,
    [IsEnabled]            BIT            NOT NULL,
    [IntegrityCheckSource] NVARCHAR (500) NOT NULL,
    [Publisher]            NVARCHAR (100) NOT NULL,
    [ChangeType]           VARCHAR (10)   NOT NULL,
    [ChangedBy]            NVARCHAR (128) NOT NULL,
    [ChangeDate]           DATETIME       NOT NULL
);

