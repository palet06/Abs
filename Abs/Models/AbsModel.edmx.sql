
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/03/2020 13:09:30
-- Generated from EDMX file: C:\Users\Y-M\source\repos\Abs\Abs\Models\AbsModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Abs];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Dash_Car]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Dash] DROP CONSTRAINT [FK_Dash_Car];
GO
IF OBJECT_ID(N'[dbo].[FK_Dash_Driver]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Dash] DROP CONSTRAINT [FK_Dash_Driver];
GO
IF OBJECT_ID(N'[dbo].[FK_Dash_Manager]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Dash] DROP CONSTRAINT [FK_Dash_Manager];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Car]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Car];
GO
IF OBJECT_ID(N'[dbo].[Dash]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Dash];
GO
IF OBJECT_ID(N'[dbo].[Driver]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Driver];
GO
IF OBJECT_ID(N'[dbo].[Manager]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Manager];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Car'
CREATE TABLE [dbo].[Car] (
    [CarId] int IDENTITY(1,1) NOT NULL,
    [Brand] nvarchar(50)  NOT NULL,
    [Model] nvarchar(50)  NOT NULL,
    [Year] int  NOT NULL,
    [LicenseId] nvarchar(max)  NOT NULL,
    [Km] int  NOT NULL,
    [Color] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Dash'
CREATE TABLE [dbo].[Dash] (
    [DashId] int IDENTITY(1,1) NOT NULL,
    [DriverId] int  NOT NULL,
    [ManagerId] int  NOT NULL,
    [CarId] int  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'Driver'
CREATE TABLE [dbo].[Driver] (
    [DriverId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Surname] nvarchar(50)  NOT NULL,
    [Phone] nvarchar(50)  NOT NULL,
    [Age] datetime  NOT NULL,
    [Adress] nvarchar(100)  NOT NULL,
    [Graduate] nvarchar(50)  NOT NULL,
    [isAtPool] int  NOT NULL
);
GO

-- Creating table 'Manager'
CREATE TABLE [dbo].[Manager] (
    [ManagerId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Surname] nvarchar(50)  NOT NULL,
    [Title] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(50)  NOT NULL,
    [Password] nvarchar(50)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Surname] nvarchar(50)  NOT NULL,
    [Phone] nvarchar(50)  NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [Date] datetime  NOT NULL,
    [isAdmin] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CarId] in table 'Car'
ALTER TABLE [dbo].[Car]
ADD CONSTRAINT [PK_Car]
    PRIMARY KEY CLUSTERED ([CarId] ASC);
GO

-- Creating primary key on [DashId] in table 'Dash'
ALTER TABLE [dbo].[Dash]
ADD CONSTRAINT [PK_Dash]
    PRIMARY KEY CLUSTERED ([DashId] ASC);
GO

-- Creating primary key on [DriverId] in table 'Driver'
ALTER TABLE [dbo].[Driver]
ADD CONSTRAINT [PK_Driver]
    PRIMARY KEY CLUSTERED ([DriverId] ASC);
GO

-- Creating primary key on [ManagerId] in table 'Manager'
ALTER TABLE [dbo].[Manager]
ADD CONSTRAINT [PK_Manager]
    PRIMARY KEY CLUSTERED ([ManagerId] ASC);
GO

-- Creating primary key on [UserId] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CarId] in table 'Dash'
ALTER TABLE [dbo].[Dash]
ADD CONSTRAINT [FK_Dash_Car]
    FOREIGN KEY ([CarId])
    REFERENCES [dbo].[Car]
        ([CarId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Dash_Car'
CREATE INDEX [IX_FK_Dash_Car]
ON [dbo].[Dash]
    ([CarId]);
GO

-- Creating foreign key on [DriverId] in table 'Dash'
ALTER TABLE [dbo].[Dash]
ADD CONSTRAINT [FK_Dash_Driver]
    FOREIGN KEY ([DriverId])
    REFERENCES [dbo].[Driver]
        ([DriverId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Dash_Driver'
CREATE INDEX [IX_FK_Dash_Driver]
ON [dbo].[Dash]
    ([DriverId]);
GO

-- Creating foreign key on [ManagerId] in table 'Dash'
ALTER TABLE [dbo].[Dash]
ADD CONSTRAINT [FK_Dash_Manager]
    FOREIGN KEY ([ManagerId])
    REFERENCES [dbo].[Manager]
        ([ManagerId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Dash_Manager'
CREATE INDEX [IX_FK_Dash_Manager]
ON [dbo].[Dash]
    ([ManagerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------