/*=============================================================


Version:   0.00.0000
Server:    (local)

DATABASE:	AdventureWorksLT2012
  Views:  vGetAllCategories


=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create View [SalesLT].[vGetAllCategories]
Print 'Create View [SalesLT].[vGetAllCategories]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

CREATE VIEW [SalesLT].[vGetAllCategories]
WITH SCHEMABINDING 
AS 
-- Returns the CustomerID, first name, and last name for the specified customer.

WITH CategoryCTE([ParentProductCategoryID], [ProductCategoryID], [Name]) AS 
(
	SELECT [ParentProductCategoryID], [ProductCategoryID], [Name]
	FROM SalesLT.ProductCategory
	WHERE ParentProductCategoryID IS NULL

UNION ALL

	SELECT C.[ParentProductCategoryID], C.[ProductCategoryID], C.[Name]
	FROM SalesLT.ProductCategory AS C
	INNER JOIN CategoryCTE AS BC ON BC.ProductCategoryID = C.ParentProductCategoryID
)

SELECT PC.[Name] AS [ParentProductCategoryName], CCTE.[Name] as [ProductCategoryName], CCTE.[ProductCategoryID]  
FROM CategoryCTE AS CCTE
JOIN SalesLT.ProductCategory AS PC 
ON PC.[ProductCategoryID] = CCTE.[ParentProductCategoryID]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

