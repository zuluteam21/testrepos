/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Tables:  CustomerAddress


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [SalesLT].[CustomerAddress]
Print 'Create Table [SalesLT].[CustomerAddress]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [SalesLT].[CustomerAddress] (
		[CustomerID]       [int] NOT NULL,
		[AddressID]        [int] NOT NULL,
		[AddressType]      [dbo].[Name] NOT NULL,
		[rowguid]          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [AK_CustomerAddress_rowguid]
		UNIQUE
		NONCLUSTERED
		([rowguid])
		ON [PRIMARY],
		CONSTRAINT [PK_CustomerAddress_CustomerID_AddressID]
		PRIMARY KEY
		CLUSTERED
		([CustomerID], [AddressID])
	ON [PRIMARY]
) ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[CustomerAddress]
	ADD
	CONSTRAINT [DF_CustomerAddress_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[CustomerAddress]
	ADD
	CONSTRAINT [DF_CustomerAddress_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[CustomerAddress] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[CustomerAddress]
	WITH CHECK
	ADD CONSTRAINT [FK_CustomerAddress_Address_AddressID]
	FOREIGN KEY ([AddressID]) REFERENCES [SalesLT].[Address] ([AddressID])
ALTER TABLE [SalesLT].[CustomerAddress]
	CHECK CONSTRAINT [FK_CustomerAddress_Address_AddressID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [SalesLT].[CustomerAddress]
	WITH CHECK
	ADD CONSTRAINT [FK_CustomerAddress_Customer_CustomerID]
	FOREIGN KEY ([CustomerID]) REFERENCES [SalesLT].[Customer] ([CustomerID])
ALTER TABLE [SalesLT].[CustomerAddress]
	CHECK CONSTRAINT [FK_CustomerAddress_Customer_CustomerID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

