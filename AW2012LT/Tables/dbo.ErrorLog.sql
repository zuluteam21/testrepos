/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Tables:  ErrorLog


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[ErrorLog]
Print 'Create Table [dbo].[ErrorLog]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [dbo].[ErrorLog] (
		[ErrorLogID]         [int] IDENTITY(1, 1) NOT NULL,
		[ErrorTime]          [datetime] NOT NULL,
		[UserName]           [sysname] NOT NULL,
		[ErrorNumber]        [int] NOT NULL,
		[ErrorSeverity]      [int] NULL,
		[ErrorState]         [int] NULL,
		[ErrorProcedure]     [nvarchar](126) NULL,
		[ErrorLine]          [int] NULL,
		[ErrorMessage]       [nvarchar](4000) NOT NULL,
		CONSTRAINT [PK_ErrorLog_ErrorLogID]
		PRIMARY KEY
		CLUSTERED
		([ErrorLogID])
	ON [PRIMARY]
) ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[ErrorLog]
	ADD
	CONSTRAINT [DF_ErrorLog_ErrorTime]
	DEFAULT (getdate()) FOR [ErrorTime]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[ErrorLog] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

