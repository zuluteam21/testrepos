/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Tables:  ProductModel


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [SalesLT].[ProductModel]
Print 'Create Table [SalesLT].[ProductModel]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [SalesLT].[ProductModel] (
		[ProductModelID]         [int] IDENTITY(1, 1) NOT NULL,
		[Name]                   [dbo].[Name] NOT NULL,
		[CatalogDescription]     [xml](CONTENT [SalesLT].[ProductDescriptionSchemaCollection]) NULL,
		[rowguid]                [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]           [datetime] NOT NULL,
		CONSTRAINT [AK_ProductModel_Name]
		UNIQUE
		NONCLUSTERED
		([Name])
		ON [PRIMARY],
		CONSTRAINT [AK_ProductModel_rowguid]
		UNIQUE
		NONCLUSTERED
		([rowguid])
		ON [PRIMARY],
		CONSTRAINT [PK_ProductModel_ProductModelID]
		PRIMARY KEY
		CLUSTERED
		([ProductModelID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[ProductModel]
	ADD
	CONSTRAINT [DF_ProductModel_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[ProductModel]
	ADD
	CONSTRAINT [DF_ProductModel_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [PXML_ProductModel_CatalogDescription]
	ON [SalesLT].[ProductModel] ([CatalogDescription])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[ProductModel] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

