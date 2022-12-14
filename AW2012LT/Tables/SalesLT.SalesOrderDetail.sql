/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Tables:  SalesOrderDetail


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [SalesLT].[SalesOrderDetail]
Print 'Create Table [SalesLT].[SalesOrderDetail]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [SalesLT].[SalesOrderDetail] (
		[SalesOrderID]           [int] NOT NULL,
		[SalesOrderDetailID]     [int] IDENTITY(1, 1) NOT NULL,
		[OrderQty]               [smallint] NOT NULL,
		[ProductID]              [int] NOT NULL,
		[UnitPrice]              [money] NOT NULL,
		[UnitPriceDiscount]      [money] NOT NULL,
		[LineTotal]              AS (isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0))),
		[rowguid]                [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]           [datetime] NOT NULL,
		CONSTRAINT [AK_SalesOrderDetail_rowguid]
		UNIQUE
		NONCLUSTERED
		([rowguid])
		ON [PRIMARY],
		CONSTRAINT [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID]
		PRIMARY KEY
		CLUSTERED
		([SalesOrderID], [SalesOrderDetailID])
	ON [PRIMARY]
) ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
	ADD
	CONSTRAINT [CK_SalesOrderDetail_OrderQty]
	CHECK
	([OrderQty]>(0))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
CHECK CONSTRAINT [CK_SalesOrderDetail_OrderQty]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
	ADD
	CONSTRAINT [CK_SalesOrderDetail_UnitPrice]
	CHECK
	([UnitPrice]>=(0.00))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
CHECK CONSTRAINT [CK_SalesOrderDetail_UnitPrice]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
	ADD
	CONSTRAINT [CK_SalesOrderDetail_UnitPriceDiscount]
	CHECK
	([UnitPriceDiscount]>=(0.00))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
CHECK CONSTRAINT [CK_SalesOrderDetail_UnitPriceDiscount]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
	ADD
	CONSTRAINT [DF_SalesOrderDetail_UnitPriceDiscount]
	DEFAULT ((0.0)) FOR [UnitPriceDiscount]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
	ADD
	CONSTRAINT [DF_SalesOrderDetail_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
	ADD
	CONSTRAINT [DF_SalesOrderDetail_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_ProductID]
	ON [SalesLT].[SalesOrderDetail] ([ProductID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderDetail_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
ALTER TABLE [SalesLT].[SalesOrderDetail]
	CHECK CONSTRAINT [FK_SalesOrderDetail_Product_ProductID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderDetail]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
	FOREIGN KEY ([SalesOrderID]) REFERENCES [SalesLT].[SalesOrderHeader] ([SalesOrderID])
	ON DELETE CASCADE
ALTER TABLE [SalesLT].[SalesOrderDetail]
	CHECK CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

