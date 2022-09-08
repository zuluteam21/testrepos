/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Data types:  OrderNumber


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Type [dbo].[OrderNumber]
Print 'Create Type [dbo].[OrderNumber]'
GO
CREATE TYPE [dbo].[OrderNumber]
	FROM [nvarchar](25)
	NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
