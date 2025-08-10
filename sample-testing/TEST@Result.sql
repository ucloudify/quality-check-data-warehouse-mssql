CREATE TABLE [dbo].[TEST@Result] (
    [Timestamp] DATETIME      NULL,
    [User]      VARCHAR (255) NULL,
    [Result]    VARCHAR (55)  NULL,
    [TestId]    BIGINT        NOT NULL,
    [Object]    VARCHAR (255) NOT NULL,
    [Feature]   VARCHAR (255) NOT NULL,
    [Scenario]  VARCHAR (MAX) NOT NULL,
    [Given]     VARCHAR (MAX) NOT NULL,
    [When]      VARCHAR (MAX) NOT NULL,
    [Then]      VARCHAR (MAX) NOT NULL
);

