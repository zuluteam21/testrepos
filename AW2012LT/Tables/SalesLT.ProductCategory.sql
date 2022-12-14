/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Tables:  ProductCategory


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [SalesLT].[ProductCategory]
Print 'Create Table [SalesLT].[ProductCategory]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [SalesLT].[ProductCategory] (
		[ProductCategoryID]           [int] IDENTITY(1, 1) NOT NULL,
		[ParentProductCategoryID]     [int] NULL,
		[Name]                        [dbo].[Name] NOT NULL,
		[rowguid]                     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]                [datetime] NOT NULL,
		CONSTRAINT [AK_ProductCategory_Name]
		UNIQUE
		NONCLUSTERED
		([Name])
		ON [PRIMARY],
		CONSTRAINT [AK_ProductCategory_rowguid]
		UNIQUE
		NONCLUSTERED
		([rowguid])
		ON [PRIMARY],
		CONSTRAINT [PK_ProductCategory_ProductCategoryID]
		PRIMARY KEY
		CLUSTERED
		([ProductCategoryID])
	ON [PRIMARY]
) ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[ProductCategory]
	ADD
	CONSTRAINT [DF_ProductCategory_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[ProductCategory]
	ADD
	CONSTRAINT [DF_ProductCategory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[ProductCategory] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[ProductCategory]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]
	FOREIGN KEY ([ParentProductCategoryID]) REFERENCES [SalesLT].[ProductCategory] ([ProductCategoryID])
ALTER TABLE [SalesLT].[ProductCategory]
	CHECK CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

