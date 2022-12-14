/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Tables:  Product


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [SalesLT].[Product]
Print 'Create Table [SalesLT].[Product]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [SalesLT].[Product] (
		[ProductID]                  [int] IDENTITY(1, 1) NOT NULL,
		[Name]                       [dbo].[Name] NOT NULL,
		[ProductNumber]              [nvarchar](25) NOT NULL,
		[Color]                      [nvarchar](15) NULL,
		[StandardCost]               [money] NOT NULL,
		[ListPrice]                  [money] NOT NULL,
		[Size]                       [nvarchar](5) NULL,
		[Weight]                     [decimal](8, 2) NULL,
		[ProductCategoryID]          [int] NULL,
		[ProductModelID]             [int] NULL,
		[SellStartDate]              [datetime] NOT NULL,
		[SellEndDate]                [datetime] NULL,
		[DiscontinuedDate]           [datetime] NULL,
		[ThumbNailPhoto]             [varbinary](max) NULL,
		[ThumbnailPhotoFileName]     [nvarchar](50) NULL,
		[rowguid]                    [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]               [datetime] NOT NULL,
		CONSTRAINT [AK_Product_Name]
		UNIQUE
		NONCLUSTERED
		([Name])
		ON [PRIMARY],
		CONSTRAINT [AK_Product_ProductNumber]
		UNIQUE
		NONCLUSTERED
		([ProductNumber])
		ON [PRIMARY],
		CONSTRAINT [AK_Product_rowguid]
		UNIQUE
		NONCLUSTERED
		([rowguid])
		ON [PRIMARY],
		CONSTRAINT [PK_Product_ProductID]
		PRIMARY KEY
		CLUSTERED
		([ProductID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
	ADD
	CONSTRAINT [CK_Product_ListPrice]
	CHECK
	([ListPrice]>=(0.00))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
CHECK CONSTRAINT [CK_Product_ListPrice]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
	ADD
	CONSTRAINT [CK_Product_SellEndDate]
	CHECK
	([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
CHECK CONSTRAINT [CK_Product_SellEndDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
	ADD
	CONSTRAINT [CK_Product_StandardCost]
	CHECK
	([StandardCost]>=(0.00))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
CHECK CONSTRAINT [CK_Product_StandardCost]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
	ADD
	CONSTRAINT [CK_Product_Weight]
	CHECK
	([Weight]>(0.00))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
CHECK CONSTRAINT [CK_Product_Weight]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
	ADD
	CONSTRAINT [DF_Product_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
	ADD
	CONSTRAINT [DF_Product_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID]
	FOREIGN KEY ([ProductCategoryID]) REFERENCES [SalesLT].[ProductCategory] ([ProductCategoryID])
ALTER TABLE [SalesLT].[Product]
	CHECK CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID]
	FOREIGN KEY ([ProductModelID]) REFERENCES [SalesLT].[ProductModel] ([ProductModelID])
ALTER TABLE [SalesLT].[Product]
	CHECK CONSTRAINT [FK_Product_ProductModel_ProductModelID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

