USE [Superstore]
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get all subcategories for lookup
-- EXEC GetSubCategory
-- =============================================
CREATE PROCEDURE [dbo].[GetSubCategory]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT SubCategoryID, SubCategory
        FROM dbo.SubCategory
        ORDER BY SubCategory;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO