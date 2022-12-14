/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Tables:  SalesOrderHeader


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [SalesLT].[SalesOrderHeader]
Print 'Create Table [SalesLT].[SalesOrderHeader]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [SalesLT].[SalesOrderHeader] (
		[SalesOrderID]               [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[RevisionNumber]             [tinyint] NOT NULL,
		[OrderDate]                  [datetime] NOT NULL,
		[DueDate]                    [datetime] NOT NULL,
		[ShipDate]                   [datetime] NULL,
		[Status]                     [tinyint] NOT NULL,
		[OnlineOrderFlag]            [dbo].[Flag] NOT NULL,
		[SalesOrderNumber]           AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID],(0)),N'*** ERROR ***')),
		[PurchaseOrderNumber]        [dbo].[OrderNumber] NULL,
		[AccountNumber]              [dbo].[AccountNumber] NULL,
		[CustomerID]                 [int] NOT NULL,
		[ShipToAddressID]            [int] NULL,
		[BillToAddressID]            [int] NULL,
		[ShipMethod]                 [nvarchar](50) NOT NULL,
		[CreditCardApprovalCode]     [varchar](15) NULL,
		[SubTotal]                   [money] NOT NULL,
		[TaxAmt]                     [money] NOT NULL,
		[Freight]                    [money] NOT NULL,
		[TotalDue]                   AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
		[Comment]                    [nvarchar](max) NULL,
		[rowguid]                    [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]               [datetime] NOT NULL,
		CONSTRAINT [AK_SalesOrderHeader_rowguid]
		UNIQUE
		NONCLUSTERED
		([rowguid])
		ON [PRIMARY],
		CONSTRAINT [AK_SalesOrderHeader_SalesOrderNumber]
		UNIQUE
		NONCLUSTERED
		([SalesOrderNumber])
		ON [PRIMARY],
		CONSTRAINT [PK_SalesOrderHeader_SalesOrderID]
		PRIMARY KEY
		CLUSTERED
		([SalesOrderID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_DueDate]
	CHECK
	([DueDate]>=[OrderDate])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_DueDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_Freight]
	CHECK
	([Freight]>=(0.00))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_Freight]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_ShipDate]
	CHECK
	([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_ShipDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_Status]
	CHECK
	([Status]>=(0) AND [Status]<=(8))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_Status]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_SubTotal]
	CHECK
	([SubTotal]>=(0.00))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_SubTotal]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_TaxAmt]
	CHECK
	([TaxAmt]>=(0.00))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_TaxAmt]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_RevisionNumber]
	DEFAULT ((0)) FOR [RevisionNumber]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_OrderDate]
	DEFAULT (getdate()) FOR [OrderDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_Status]
	DEFAULT ((1)) FOR [Status]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_OnlineOrderFlag]
	DEFAULT ((1)) FOR [OnlineOrderFlag]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_SubTotal]
	DEFAULT ((0.00)) FOR [SubTotal]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_TaxAmt]
	DEFAULT ((0.00)) FOR [TaxAmt]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_Freight]
	DEFAULT ((0.00)) FOR [Freight]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID]
	ON [SalesLT].[SalesOrderHeader] ([CustomerID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID]
	FOREIGN KEY ([BillToAddressID]) REFERENCES [SalesLT].[Address] ([AddressID])
ALTER TABLE [SalesLT].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID]
	FOREIGN KEY ([ShipToAddressID]) REFERENCES [SalesLT].[Address] ([AddressID])
ALTER TABLE [SalesLT].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
	FOREIGN KEY ([CustomerID]) REFERENCES [SalesLT].[Customer] ([CustomerID])
ALTER TABLE [SalesLT].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

