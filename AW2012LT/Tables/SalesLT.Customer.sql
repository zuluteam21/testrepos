/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Tables:  Customer


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [SalesLT].[Customer]
Print 'Create Table [SalesLT].[Customer]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [SalesLT].[Customer] (
		[CustomerID]       [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[NameStyle]        [dbo].[NameStyle] NOT NULL,
		[Title]            [nvarchar](8) NULL,
		[FirstName]        [dbo].[Name] NOT NULL,
		[MiddleName]       [dbo].[Name] NULL,
		[LastName]         [dbo].[Name] NOT NULL,
		[Suffix]           [nvarchar](10) NULL,
		[CompanyName]      [nvarchar](128) NULL,
		[SalesPerson]      [nvarchar](256) NULL,
		[EmailAddress]     [nvarchar](50) NULL,
		[Phone]            [dbo].[Phone] NULL,
		[PasswordHash]     [varchar](128) NOT NULL,
		[PasswordSalt]     [varchar](10) NOT NULL,
		[rowguid]          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [AK_Customer_rowguid]
		UNIQUE
		NONCLUSTERED
		([rowguid])
		ON [PRIMARY],
		CONSTRAINT [PK_Customer_CustomerID]
		PRIMARY KEY
		CLUSTERED
		([CustomerID])
	ON [PRIMARY]
) ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Customer]
	ADD
	CONSTRAINT [DF_Customer_NameStyle]
	DEFAULT ((0)) FOR [NameStyle]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Customer]
	ADD
	CONSTRAINT [DF_Customer_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Customer]
	ADD
	CONSTRAINT [DF_Customer_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [IX_Customer_EmailAddress]
	ON [SalesLT].[Customer] ([EmailAddress])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Customer] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

